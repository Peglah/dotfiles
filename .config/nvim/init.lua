local load = function(mod)
	local success, loadedModule = pcall(require, mod)
	if success then return loadedModule end
	vim.cmd.echo ("Error loading " .. mod)
end

load('config.lazy')
load('config.options')
load('config.autocmds')
load('config.keymaps')

-- Add ChatGPT API key to environment variable OPENAI_API_KEY
-- Add and point environment variable HOME to %USERPROFILE%
-- Login to GitHub with :Copilot auth
