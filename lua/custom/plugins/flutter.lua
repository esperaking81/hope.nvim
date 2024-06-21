return {
  'akinsho/flutter-tools.nvim',
  lazy = false,
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
        open_cmd = '20new',
      },
    }

    vim.keymap.set('n', '<leader>m', require('telescope').extensions.flutter.commands, { desc = 'Open command Flutter' })
    vim.keymap.set('n', '<leader>br', function()
      vim.cmd '20new'
      vim.cmd 'te fvm flutter packages pub run build_runner build --delete-conflicting-outputs'
      vim.cmd '2sleep | normal G'
    end)
  end,
}
