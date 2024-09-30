return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.ai").setup()
		require("mini.surround").setup()
		local statusline = require("mini.statusline")

		statusline.setup({ use_icons = true })

		statusline.section_location = function()
			return "%2l:%-2v"
		end
	end,
}
