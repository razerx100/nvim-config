return {
    "stevearc/conform.nvim",
    cmd  = "ConformInfo",
    opts = {
        formatters_by_ft = {
            cpp    = { lsp_format = "first" },
            lua    = { "stylua" },
        }
    }
}
