local load = function(mod)
	package.loaded[mod] = nil
	require(mod)
end

load('config.lazy')
load('config.options')
load('config.autocmds')
load('config.keymaps')
load('config.lsp')
