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
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.shfmt,
                null_ls.builtins.formatting.blade_formatter,
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.formatting.pint,
            },
        })
        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
    end,
}
