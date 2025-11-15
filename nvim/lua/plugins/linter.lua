return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts  = {
        events        = { "BufEnter", "BufReadPost", "BufWritePost", "InsertLeave" },
        linters_by_ft = {
--            cpp = { "clangtidy" } -- clangd already has clangtidy embedded.
            python = { "pylint" }
        }
    },
    config = function(_, opts)
        local lint = require("lint")

        lint.linters_by_ft = opts.linters_by_ft

        function Delay(ms, fn)
            local timer = vim.uv.new_timer()

            return function(...)
                if timer then
                    local argv = { ... }

                    timer:start(ms, 0, function()
                        timer:stop()
                        vim.schedule_wrap(fn)(unpack(argv))
                    end)
                end
            end
        end

        function Lint()
            local names = lint._resolve_linter_by_ft(vim.bo.filetype)

            if #names > 0 then
                lint.try_lint(names)
            end
        end

        vim.api.nvim_create_autocmd(opts.events, {
            callback = Delay(100, Lint)
        })
    end
}
