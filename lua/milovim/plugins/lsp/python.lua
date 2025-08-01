-- * Locals of this area * --
--the local variable for using lspconfig(for configuring env and lsp)
local lspconfig = require("lspconfig")
local globals = require("milovim.config.lsp")
local util = lspconfig.util

-- * Detectives * --
--decting the python env
local function get_python_path()
	-- 00*  Detectives work in 2 ways *00 --
	-- 1. Use activated virtualenv
	if vim.env.VIRTUAL_ENV then
		return vim.env.VIRTUAL_ENV .. "/bin/python"
	end

	-- 2.checking for the env in the current directory
	local cwd = vim.fn.getcwd()
	for _, venv in ipairs({ ".venv", "venv" }) do
		local py_path = cwd .. "/" .. venv .. "/bin/python"
		if vim.fn.filereadable(py_path) == 1 then
			return py_path
		end
	end

	return vim.fn.exepath("python3") or "python"
end

return {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_dir = util.root_pattern({ "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" }),
	settings = {
		python = {
			-- 00 * Calling the Detectives * 00 --
			-- Detect venv or fallback to system Python
			pythonPath = get_python_path(),

			analysis = {
				-- The Levels Choose your mode --
				-- Choose level: "off", "basic", or "strict"
				typeCheckingMode = "basic",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
			},
		},
	},
	-- * Calling the globals helpers --
	-- * the Police department help --
	on_attach = globals.on_attach,
	capabilities = globals.capabilities,
}
