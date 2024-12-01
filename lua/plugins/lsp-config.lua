return {
	{
		"williamboman/mason.nvim",
		lazy = true,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
			ensure_installed = { "lua_ls", "ts_ls", "html", "tailwindcss", "cssls", "powershell_es", "bashls" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local os_name = vim.loop.os_uname().sysname

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			if os_name == "Windows_NT" then
				lspconfig.powershell_es.setup({
					capabilities = capabilities,
					bundle_path = "C:\\Users\\GabeCorsini\\Documents\\PowerShellEditorServices\\PowerShellEditorServices",
					filetypes = { "ps1" },
					on_new_config = function(new_config, _)
						local bundle_path = new_config.bundle_path
						new_config.cmd = make_cmd(bundle_path)
					end,
					root_dir = function(fname)
						return util.find_git_ancestor(fname) or vim.fn.getcwd()
					end,
				})
			else
				lspconfig.bashls.setup({
					capabilities = capabilities,
				})
			end

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "go", vim.lsp.buf.type_definition, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, {})
		end,
	},
}
