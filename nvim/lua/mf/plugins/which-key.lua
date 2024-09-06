-- Which-key
--
-- Shortcut description plugin
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		delay = function(ctx)
			return ctx.plugin and 0 or 1500
		end,
		triggers = {
			{ "<auto>", mode = "nxso" },
		},
	},
}
