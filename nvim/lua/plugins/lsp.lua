return {
  'neovim/nvim-lspconfig',
  dependencies = { 'saghen/blink.cmp' },
  config = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities()

		vim.lsp.config("zls", {
			capabilities = capabilities,
		})
		vim.lsp.enable("zls")

		vim.lsp.config("gopls", {
			capabilities = capabilities,
			settings = {
				gopls = {
					semanticTokens = true,
					staticcheck = true,
					usePlaceholders = true,
					buildFlags = {
						"-tags=acceptance,functional"
					},
					analyses = {
						unusedparams = true,
						ST1000 = false,
					},
					-- hints = {
					--          functionTypeParameters = true,
					--          parameterNames = true,
					--      },
				}
			}
		})
		vim.lsp.enable("gopls")
		-- vim.lsp.inlay_hint.enable()

		vim.diagnostic.config({ underline = true, virtual_text = true, virtual_lines = true, signs = false })
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { max_width = 50, max_height = 20 })
  end
}
