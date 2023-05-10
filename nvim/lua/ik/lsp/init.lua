local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "ik.lsp.mason"
require("ik.lsp.handlers").setup()
require "ik.lsp.null-ls"
require "ik.lsp.lspconfig"
require "ik.lsp.lspsaga"
