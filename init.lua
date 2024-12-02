vim.g.mapleader = " "

-- Set a specific localleader key for .norg files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "norg",
    callback = function()
        vim.g.maplocalleader = "," -- Set localleader to ","
    end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")
