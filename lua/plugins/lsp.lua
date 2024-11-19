return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
    'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/nvim-cmp',
    },
    config = function()
      -- Enable sign column
      vim.opt.signcolumn = 'yes'

      -- Extend capabilities with cmp-nvim-lsp
      local lspconfig_defaults = require('lspconfig').util.default_config
      lspconfig_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lspconfig_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
      )

      -- Define on_attach for key mappings
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr }

        -- Key mappings for LSP functions
        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        vim.keymap.set('n', '<leader>vca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      end

      -- Configure language servers
      local lspconfig = require('lspconfig')

      -- Example for a specific language server (replace with the ones you use)
      lspconfig['ts_ls'].setup({
        on_attach = on_attach,
        capabilities = lspconfig_defaults.capabilities,
      })
    end,
  },
}

