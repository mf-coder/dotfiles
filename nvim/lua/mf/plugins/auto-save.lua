-- Auto-save
--
-- Save buffers automatically
return {
	"okuuva/auto-save.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("auto-save").setup({
			debounce_delay = 1500,

			trigger_events = {
				immediate_save = { "FocusLost", "BufLeave" },
				defer_save = { "InsertLeave", "TextChanged" },
				cancel_defered_save = { "InsertEnter" },
			},

			execution_message = {
				message = function()
					local filename = vim.fn.expand("%:t")
					local now = vim.fn.strftime("%H:%M:%S")

					return ('Saved "' .. filename .. '" at ' .. now)
				end,
			},
		})
	end,
}
