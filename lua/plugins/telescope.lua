return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local themes = require("telescope.themes")

    local builtin = require("telescope.builtin")
    vim.g.telescope = builtin

    vim.keymap.set("n", "<leader>p", function()
      builtin.find_files(themes.get_dropdown())
    end, {})

    vim.keymap.set("n", "<leader>/", function()
      builtin.live_grep(themes.get_dropdown())
    end, {})

    vim.keymap.set("n", "<C-f>", function()
      builtin.resume()
    end, {})

    vim.keymap.set("n", "<leader><leader>", function()
      builtin.buffers(themes.get_dropdown())
    end, {})

  end
}

