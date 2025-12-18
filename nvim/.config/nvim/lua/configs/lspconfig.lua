local M = {}
local map = vim.keymap.set

M.on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

  map("n", "K", vim.lsp.buf.hover, opts "LSP hover")
  map("n", "<C-k>", vim.lsp.buf.signature_help, opts "LSP signature help")
  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")
  map("n", "<leader>a", vim.lsp.buf.code_action, opts "LSP code actions")

  map("n", "<leader>i", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end, opts "LSP Toggle inlay hints")

  map("n", "<leader>r", require "nvchad.lsp.renamer", opts "NvRenamer")
end

M.on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
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
  require("nvchad.lsp").diagnostic_config()

  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      M.on_attach(_, args.buf)
    end,
  })

  local rust_lsp_settings = {
    ["rust-analyzer"] = {
      cargo = {
        features = "all",
      },
      checkOnSave = {
        enable = true,
      },
      check = {
        command = "clippy",
      },
      imports = {
        group = {
          enable = false,
        },
      },
      completion = {
        postfix = {
          enable = false,
        },
      },
    },
  }
  vim.lsp.config("*", { capabilities = M.capabilities, on_init = M.on_init })
  vim.lsp.config("rust_analyzer", { settings = rust_lsp_settings })
  -- local servers = { "rust_analyzer" }
  vim.lsp.enable "rust_analyzer"
end

return M
