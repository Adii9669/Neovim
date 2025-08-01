local opt = { noremap = true, silent = true }
local keymap = vim.keymap.set

--for loacating directories
keymap("n", "<leader>pv", vim.cmd.Ex, opt)

--Exit insert mode
keymap("i", "jj", "<ESC>", { noremap = true })

--For quit and save the files
keymap("n", "<leader>w", "<cmd>w<cr>")
keymap("n", "<leader>q", "<cmd>q<cr>")
keymap("n", "<leader>jj", "<cmd>wq<cr>")

--For Changing buffer present
-- keymap("n", "<C-i>", "<cmd>bprev<cr>")
-- keymap("n", "<C-o>", "<cmd>bnext<cr>")

--For lazy
keymap("n", "<leader>l", "<cmd>Lazy<cr>") --Lazy

--source
keymap("n", "<leader>so", ":w<CR>:so %<CR>") --soucre File

-- Window Navigation
keymap("n", "<C-h>", "<C-w>h", opt)
keymap("n", "<C-l>", "<C-w>l", opt)
keymap("n", "<C-k>", "<C-w>k", opt)
keymap("n", "<C-j>", "<C-w>j", opt)

-- Resize Windows
keymap("n", "<C-left>", "<C-w><", opt)
keymap("n", "<C-Right>", "<C-w>>", opt)
keymap("n", "<C-Down>", "<C-w>+", opt)
keymap("n", "<C-Up>", "<C-w>-", opt)

-- New Windows
keymap("n", "<leader>vs", "<CMD>vsplit<CR>", opt)
keymap("n", "<leader>hs", "<CMD>split<CR>", opt)

-- Go to specific tab
keymap("n", "<leader>1", "1gt", opt) -- Go to first tab
keymap("n", "<leader>2", "2gt", opt) -- Go to second tab
keymap("n", "<leader>3", "3gt", opt) -- Go to third tab

-- Open and close tabs
keymap("n", "<C-n>", ":tabnew<CR>", opt) -- Open a new tab
-- keymap("n", "<C-o>", ":tabclose<CR>", opt) -- Close the current tab
-- Switch between tabs
-- keymap("n", "<C-i>", ":tabnext<CR>", opt) -- Next tab
-- keymap("n", "<C-p>", ":tabprevious<CR>", opt) -- Previous tab

--Mason
keymap("n", "<leader>ms", "<cmd>:Mason<cr>")

--digonostic--
vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Show Diagnostics" })
vim.keymap.set("n", "<leader>dj", vim.diagnostic.setqflist, { desc = "List Diagnostics" })

--ChangeTheme----
keymap("n", "<Space>th", function()
	require("telescope.builtin").colorscheme({
		enable_preview = true,
		attach_mappings = function(_, map)
			map("i", "<CR>", function(prompt_bufnr)
				local entry = require("telescope.actions.state").get_selected_entry()
				require("telescope.actions").close(prompt_bufnr)
				if entry then
					vim.cmd.colorscheme(entry.value)

					-- Save theme to config
					local path = vim.fn.stdpath("config") .. "/lua/milovim/config/theme.lua"
					local contents = string.format('return { colorscheme = "%s" }', entry.value)
					vim.fn.writefile(vim.split(contents, "\n"), path)
				end
			end)
			return true
		end,
	})
end, { desc = "Theme Picker (Persistent)" })
