return {
	"wellle/targets.vim",
	"famiu/bufdelete.nvim",
	"romainl/vim-cool",
	"tpope/vim-fugitive",
	{
		"m4xshen/autoclose.nvim",
		config = function()
			require("autoclose").setup()
		end
	},
}
