local M = {}
local map = vim.keymap.set

M.on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  -- go to declaration
  map("n", "gD", vim.lsp.buf.declaration)
  -- go to definition
  map("n", "gd", vim.lsp.buf.definition)
  -- expand diagnostic error
  map("n", "E", vim.diagnostic.open_float)
  -- signature help
  map("n", "<C-k>", vim.lsp.buf.signature_help)
  -- code actions
  map("n", "<leader>a", vim.lsp.buf.code_action)

  -- toggle inlay hints
  map("n", "<leader>i", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end)

  -- go to previous and next diagnostic errors
  map("n", "]e", function()
    vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }
  end)
  map("n", "[e", function()
    vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }
  end)
end

capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

M.capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

M.defaults = function()
  dofile(vim.g.base46_cache .. "lsp")
  dofile(vim.g.base46_cache .. "semantic_tokens")

  -- require("nvchad.lsp").diagnostic_config()

  local x = vim.diagnostic.severity

  vim.diagnostic.config {
    virtual_text = { prefix = "|" },
    signs = {
      text = { [x.ERROR] = "●", [x.WARN] = "●", [x.INFO] = "●", [x.HINT] = "●" },
    },
    underline = true,
    float = { border = "single" },
  }

  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      M.on_attach(_, args.buf)
    end,
  })

  local rust_lsp_settings = {
    ["rust-analyzer"] = {
      inlayHints = {
        chainingHints = { enable = true },
      },
      -- semanticHighlighting = {
      --   punctuation = { enable = true },
      -- },
      imports = {
        group = { enable = false },
      },
      completion = {
        postfix = { enable = false },
      },
      cargo = { features = "all" },
      checkOnSave = { enable = true },
      check = { command = "clippy" },
    },
  }
  vim.lsp.config("*", { capabilities = M.capabilities, on_init = M.on_init })
  vim.lsp.config("rust_analyzer", { settings = rust_lsp_settings })
  local servers = { "rust_analyzer", "lua_ls" }
  vim.lsp.enable(servers)
end

return M
