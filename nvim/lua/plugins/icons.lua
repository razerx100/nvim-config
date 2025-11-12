return {
	{
		"nvim-tree/nvim-web-devicons",
        lazy = true,
		opts = {
			override = {
				zsh = {
					icon        = "",
					color       = "#428850",
					cterm_color = "65",
					name        = "Zsh"
				}
			},
			color_icons = true,
			default     = true,
			strict      = true,
			variant     = "light|dark",
			blend       = 0,
			override_by_filename = {
				[".gitignore"] = {
					icon  = "",
					color = "#f1502f",
					name  = "Gitignore"
				}
			},
			override_by_extension = {
				["log"] = {
					icon  = "",
					color = "#81e043",
					name  = "Log"
				}
			},
			override_by_operating_system = {
				["apple"] = {
					icon        = "",
					color       = "#A2AAAD",
					cterm_color = "248",
					name        = "Apple"
				}
			},
		}
	},
    {
        "nvim-mini/mini.icons",
        lazy = true,
        opts = {
            file = {
                [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
                ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
            },
            filetype = {
                dotenv = { glyph = "", hl = "MiniIconsYellow" },
            },
        },
        init = function()
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
    }
}
