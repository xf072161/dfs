return {
	'nvim-mini/mini.surround',
	version = '*',
	config = function()
		require("mini.surround").setup({
			n_lines = 100,
		})
	end
}
