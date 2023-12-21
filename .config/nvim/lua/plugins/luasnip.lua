return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
    config = function()
        local ls = require("luasnip")

        ls.config.set_config {
            history = true,
            updateevents = "TextChanged,TextChangedI"
        }

        ls.add_snippets("all",{
            ls.parser.parse_snippet("expand", "--expand this")
          }
        )
    end
}
