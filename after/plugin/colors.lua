function ColorMeDaddy(color)
    color = color or "catppuccin-mocha"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Nromal", {bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none" })

end

ColorMeDaddy()
