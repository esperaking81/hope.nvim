return {
  'akinsho/flutter-tools.nvim',
  lazy = false,
  ft = 'dart',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim',
  },
  config = function()
    local flutterConfig = require 'flutter-tools'

    flutterConfig.setup {
      ui = {
        border = 'rounded',
        notification_style = 'native',
      },
      decorations = {
        statusline = {
          app_version = true,
          device = true,
          project_config = true,
        },
      },
      root_patterns = { '.git', 'pubspec.yaml' },
      widget_guides = {
        enabled = false,
      },
      dev_log = {
        enabled = true,
        notify_errors = false,
        open_cmd = '10new',
      },
      outline = {
        open_cmd = '30vnew', -- command to use to open the outline buffer
        auto_open = true, -- if true this will open the outline automatically when it is first populated
      },
    }

    vim.keymap.set('n', '<leader>m', require('telescope').extensions.flutter.commands, { desc = 'Open command Flutter' })
    vim.keymap.set('n', '<leader>br', function()
      vim.cmd '10new'
      vim.cmd 'te dart run build_runner build --delete-conflicting-outputs'
      vim.cmd '2sleep | normal G'
    end, { desc = 'Run build_runner' })
  end,
}
