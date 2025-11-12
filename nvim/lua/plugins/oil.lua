return {
    "stevearc/oil.nvim",
    opts         = {
        watch_for_changes = true,
        view_options      = { show_hidden = true }
    },
    dependencies = { "nvim-mini/mini.icons", opts = {} },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy         = false,
}
