return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                require("none-ls.diagnostics.eslint_d"),
                null_ls.builtins.diagnostics.pylint,
                null_ls.builtins.diagnostics.golangci_lint,
                null_ls.builtins.formatting.stylua,
            },
        })
        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
    end,
}
