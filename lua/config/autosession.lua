local auto_session = require "auto-session"

auto_session.setup {
  enabled = true,
  root_dir = vim.fn.stdpath "data" .. "/sessions/",
  auto_save = true,
  auto_restore = true,
  auto_create = true,
  suppressed_dirs = nil,
  allowed_dirs = nil,
  auto_restore_last_session = false,
  use_git_branch = false,
  lazy_support = true,
  bypass_save_filetypes = nil,
  close_unsupported_windows = true,
  args_allow_single_directory = true,
  args_allow_files_auto_save = false,
  continue_restore_on_error = true,
  cwd_change_handling = false,
  log_level = "error",

  -- The session_lens table has been removed as it is now deprecated.
}

local keymap = vim.keymap

keymap.set("n", "<leader>ssr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
keymap.set("n", "<leader>sss", "<cmd>SessionSave<CR>", { desc = "Save session for auto session" })

keymap.set(
  "n",
  "<leader>ssp",
  "<cmd>SessionPurgeOrphaned<CR>",
  { desc = "Session purge orphaned, removes session with no working dir" }
)
keymap.set("n", "<leader>ssd", "<cmd>Autosession delete<CR>", { desc = "Session delete" })

-- Use the new native command to search sessions
keymap.set("n", "<leader>ssl", "<cmd>Telescope sessions<CR>", { desc = "Sessions List", noremap = true })
