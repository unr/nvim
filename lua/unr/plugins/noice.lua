-- start pretty ui
-- https://github.com/folke/noice.nvim#%EF%B8%8F-configuration
require("noice").setup({
    cmdline = {
        format = {
            cmdline = { icon = "" },
            search_down = { icon = " " },
            search_up = { icon = " " },
            help = { icon = "" },
        },
    },
    messages = {
        -- show messages on bottom right like LSP
        view = 'mini',
        -- important messages pop up as alerts still
        view_error = "notify", -- view for errors
        view_warn = "notify", -- view for warnings
        view_history = "messages", -- view for :messages
    },
    -- trying to hide the scanning tags alert
    routes = {
        {
            filter = {
                event = "msg_show",
                kind = "",
                find = "Scanning tags.",
            },
            opts = { skip = true },
        },
        -- {
        --     filter = {
        --         event = "msg_show",
        --         kind = "search_count",
        --     },
        --     opts = { skip = true },
        -- },
        -- {
        --     filter = {
        --         event = "msg_show",
        --         kind = "",
        --     },
        --     opts = { skip = true },
        -- },
    },
})
