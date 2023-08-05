local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "tabs",
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },

  highlights = {
    separator = {
      fg = '#6e6a86',
      bg = '#191724',
    },
    separator_selected = {
      fg = '#6e6a86',
      bg = '#191724'
    },
    background = {
      fg = '#6e6a86',
      bg = '#191724'
    },
    buffer_selected = {
      fg = '#e0def4',
      bold = true,
    },
    fill = {
      bg = '#26233a'
    }
  },
})

vim.api.nvim_set_keymap('n', '<', '<Cmd>BufferLineCyclePrev<CR>', {})
vim.api.nvim_set_keymap('n', '>', '<Cmd>BufferLineCycleNext<CR>', {})

