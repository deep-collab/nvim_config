-- State holders
local floating_term_buf = nil
local floating_term_win = nil

-- Create or reuse a terminal buffer
function OpenFloatingTerminal(opts)
  opts = opts or {}
  local width = opts.width or 100
  local height = opts.height or 30

  local ui = vim.api.nvim_list_uis()[1]
  local row = math.floor((ui.height - height) / 2)
  local col = math.floor((ui.width - width) / 2)

  -- Reuse buffer or create new
  if not floating_term_buf or not vim.api.nvim_buf_is_valid(floating_term_buf) then
    floating_term_buf = vim.api.nvim_create_buf(false, true)
  end

  -- Open only if not already open
  if floating_term_win and vim.api.nvim_win_is_valid(floating_term_win) then
    vim.api.nvim_set_current_win(floating_term_win)
    return
  end

  floating_term_win = vim.api.nvim_open_win(floating_term_buf, true, {
    relative = 'editor',
    row = row,
    col = col,
    width = width,
    height = height,
    style = 'minimal',
    border = 'rounded',
  })

  -- Start terminal if not already running
  if vim.fn.bufname(floating_term_buf) == '' then
    vim.fn.termopen(vim.o.shell)
  end

  -- Buffer settings
  vim.api.nvim_buf_set_option(floating_term_buf, "filetype", "terminal")
  vim.cmd("startinsert")

  -- Close mappings
  vim.api.nvim_buf_set_keymap(floating_term_buf, 't', '<Esc>', [[<C-\><C-n>:close<CR>]], { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(floating_term_buf, 't', 'q', [[<C-\><C-n>:close<CR>]], { noremap = true, silent = true })

end

-- 🔁 Clear the buffer and start a fresh terminal
function RestartFloatingTerminal()
  -- Kill old buffer if it exists
  if floating_term_buf and vim.api.nvim_buf_is_valid(floating_term_buf) then
    vim.api.nvim_buf_delete(floating_term_buf, { force = true })
  end

  floating_term_buf = vim.api.nvim_create_buf(false, true)

  -- Start a fresh terminal window
  OpenFloatingTerminal()
end

-- 🧠 Commands
vim.api.nvim_create_user_command('FloatingTerm', function()
  OpenFloatingTerminal()
end, {})

vim.api.nvim_create_user_command('RestartFloatingTerm', function()
  RestartFloatingTerminal()
end, {})

-- 🧠 Keybindings
vim.keymap.set('n', '<leader>tt', function() OpenFloatingTerminal() end, { desc = 'Open Floating Terminal' })
vim.keymap.set('n', '<leader>tr', function() RestartFloatingTerminal() end, { desc = 'Restart Floating Terminal' })

