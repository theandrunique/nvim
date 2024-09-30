return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "j-hui/fidget.nvim", opts = {} },
	},

	config = function()
		local lspconfig = require("lspconfig")

		local mason_lspconfig = require("mason-lspconfig")

		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local telescope = require("telescope.builtin")

				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc, silent = true })
				end

				map("gd", telescope.lsp_definitions, "[G]oto [D]efinition")

				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

				map("gR", telescope.lsp_references, "[G]oto [R]eferences")

				map("gr", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<F2>", vim.lsp.buf.rename, "[R]e[n]ame")

				map("gi", telescope.lsp_implementations, "[G]oto [I]mplementation")

				map("gt", telescope.lsp_type_definitions, "Type [D]efinition")

				-- map('<leader>ds', telescope.lsp_document_symbols, '[D]ocument [S]ymbols')

				-- map('<leader>ws', telescope.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

				map("gh", vim.lsp.buf.hover, "Hover")
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
			["omnisharp"] = function()
				local pid = vim.fn.getpid()
				local path = require("mason-registry").get_package("omnisharp"):get_install_path() .. "/omnisharp"
				lspconfig["omnisharp"].setup({
					capabilities = capabilities,
					cmd = { path, "--languageserver", "--hostPID", tostring(pid) },
				})
			end,
		})
	end,
}
