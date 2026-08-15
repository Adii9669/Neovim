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
vim.keymap.set("n", "<leader>/", "<cmd>normal! gcc<cr>")

--For Changing buffer present
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true })
-- keymap("n", "<C-i>", "<cmd>bprev<cr>")
-- keymap("n", "<C-o>", "<cmd>bnext<cr>")

--For lazy
keymap("n", "<leader>l", "<cmd>Lazy<cr>") --Lazy

--remove the searched
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")

--source
keymap("n", "<leader>so", ":w<CR>:so %<CR>") --soucre File

-- Window Navigation
keymap("n", "<C-h>", "<C-w>h", opt)
keymap("n", "<C-l>", "<C-w>l", opt)
keymap("n", "<C-k>", "<C-w>k", opt)
keymap("n", "<C-j>", "<C-w>j", opt)

-- Resize Windows
keymap("n", "<C-Right>", "<C-w><", opt)
keymap("n", "<C-left>", "<C-w>>", opt)
keymap("n", "<C-Up>", "<C-w>+", opt)
keymap("n", "<C-Down>", "<C-w>-", opt)

-- New Windows
keymap("n", "<leader>vs", "<CMD>vsplit<CR>", opt)
keymap("n", "<leader>hs", "<CMD>split<CR>", opt)

-- Go to specific tab
keymap("n", "<leader>1", "1gt", opt) -- Go to first tab
keymap("n", "<leader>2", "2gt", opt) -- Go to second tab
keymap("n", "<leader>3", "3gt", opt) -- Go to third tab

-- Open and close tabs
-- keymap("n", "<C-n>", ":tabnew<CR>", opt) -- Open a new tab
keymap("n", "<C-n>", "<cmd>:bnext<CR>", { desc = "Next buffer" })
keymap("n", "<C-p>", "<cmd>:bprev<CR>", { desc = "Prev buffer" })
-- Switch between tabs
-- keymap("n", "<C-i>", ":tabnext<CR>", opt) -- Next tab
-- keymap("n", "<C-p>", ":tabprevious<CR>", opt) -- Previous tab

--Mason
keymap("n", "<leader>ms", "<cmd>:Mason<cr>")

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

---Diagonostics -----
keymap("n", "<leader>,", function()
	-- Get all diagnostics for the current line. It returns a table.
	local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })

	if vim.tbl_isempty(diagnostics) then
		print("No diagnostic error on this line.")
		return
	end

	-- We only copy the first diagnostic message if there are multiple
	local error_message = diagnostics[1].message

	-- Set the clipboard register '+' with the error message
	vim.fn.setreg("+", error_message)

	-- Let the user know the copy was successful
	print("Copied error: " .. error_message)
end, { desc = "Copy diagnostic error message" })

--compile and run --
vim.keymap.set("n", "<leader>'", function()
	local file = vim.fn.expand("%:p") -- full path
	local out = vim.fn.expand("%:p:r") -- path without .cpp

	vim.cmd("write") -- save file

	local cmd = string.format('g++ -std=c++17 "%s" -o "%s" && "%s"', file, out, out)

	require("toggleterm").exec(cmd, 1)
end, { desc = "Run C++ file" })
