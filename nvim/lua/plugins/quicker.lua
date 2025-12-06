return {
  'stevearc/quicker.nvim',
  config = function()
		require("quicker").setup({
			keys = {
				{
					"zz",
					function()
						require("quicker").toggle_expand({ before = 4, after = 4, add_to_existing = true })
					end
				},
				{
					"za",
					function()
						require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
					end
				},
			},
		})
  end
}
