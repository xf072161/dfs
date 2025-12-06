local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd('FileType', {
	pattern = 'html,css,scss,lua,yaml,json,proto',
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end
})

autocmd('BufWritePre', {
	group = augroup('trailing', {}),
	pattern = '*',
	command = [[%s/\s\+$//e]],
})

autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		local params = vim.lsp.util.make_range_params()
		params.context = { only = { "source.organizeImports" } }

		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
		for cid, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
					vim.lsp.util.apply_workspace_edit(r.edit, enc)
				end
			end
		end

		vim.lsp.buf.format({ async = false })
	end
})

autocmd('LspAttach', {
	group = augroup('UserLspConfig', {}),

	callback = function(ev)
		vim.diagnostic.config({ underline = true, virtual_text = true, virtual_lines = true, signs = false })
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		vim.keymap.set('n', '<C-o>', vim.lsp.buf.definition, { buffer = ev.buf })
		vim.keymap.set('n', '<C-t>', vim.lsp.buf.type_definition, { buffer = ev.buf })
		vim.keymap.set('n', '<C-r>', vim.lsp.buf.references, { buffer = ev.buf })
		vim.keymap.set('n', '<C-i>', vim.lsp.buf.implementation, { buffer = ev.buf })
		vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, { buffer = ev.buf })
		vim.keymap.set('n', 'gca', vim.lsp.buf.code_action, { buffer = ev.buf })
	end
})
