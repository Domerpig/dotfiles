return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
    dependencies = {
        "rafamadriz/friendly-snippets"
    },
	version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
    config = function()
        local ls = require("luasnip")

        ls.setup({
            update_events = {"TextChanged", "TextChangedI"}
        })

        require("luasnip.loaders.from_vscode").lazy_load()
    end
}

