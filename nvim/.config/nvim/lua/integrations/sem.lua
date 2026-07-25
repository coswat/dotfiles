local tokens = require "base46.integrations.semantic_tokens"
local theme = require("base46").get_theme_tb "base_16"
local mix = require("base46.colors").mix
local mix_val = 50
local background = theme.base00

local injected = {}

for name, spec in pairs(tokens) do
  local type_name = name:match "^@lsp%.type%.(.+)$"
  if type_name and spec.fg then
    injected["@lsp.typemod." .. type_name .. ".injected"] = {
      fg = mix(spec.fg, background, mix_val),
    }
  end
end

-- append injected highlights
for k, v in pairs(injected) do
  tokens[k] = v
end

return tokens
