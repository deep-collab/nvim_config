return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup({}) -- optional setup if you want to configure defaults

    local keymap = vim.keymap.set
    keymap("n", "<leader>pf", builtin.find_files, { desc = "Find Files" })
    keymap("n", "<C-p>", builtin.git_files, {desc = "Git Files"})
    keymap("n", "<leader>ps", function()
	    builtin.live_grep({ search = vim.fn.input("Grep > ") })
    end)
  end,
}

