-- ~/.config/nvim/lua/plugins/swift.lua
return {
  'neovim/nvim-lspconfig',
  config = function()
    require('lspconfig').sourcekit.setup {
      cmd = { '/usr/bin/xcrun', 'sourcekit-lsp' },
      root_dir = function(fname)
        return require('lspconfig.util').root_pattern('Package.swift', '.git', '*.xcodeproj', '*.xcworkspace')(fname) or vim.fs.dirname(fname)
      end,
    }
  end,
}
