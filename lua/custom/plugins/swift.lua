return {
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require 'lspconfig'
    local util = require 'lspconfig.util'

    lspconfig.sourcekit.setup {
      cmd = { 'xcrun', 'sourcekit-lsp' },
      root_dir = function(fname)
        return util.root_pattern('Package.swift', '.git')(fname)
          or util.search_ancestors(fname, function(path)
            local name = vim.fs.basename(path)
            if name:match '%.xcodeproj$' or name:match '%.xcworkspace$' then
              return path
            end
          end)
          or vim.fs.dirname(fname)
      end,
    }
  end,
}
