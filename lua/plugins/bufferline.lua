return {
	{
		"akinsho/bufferline.nvim",
		version = "*",

		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					diagnostics = "nvim_lsp",
					offsets = {
						{
							filetype = "NvimTree",
							text = "just because i want",
							highlight = "Directory",
							separator = false,
						},
					},
				},
			})
		end,
	},
}
