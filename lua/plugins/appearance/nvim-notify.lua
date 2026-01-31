return {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
        local notify = require("notify")
        
        notify.setup({
            background_colour = "#000000",
            fps = 60,
            icons = {
                ERROR = "",
                WARN  = "",
                INFO  = "",
                DEBUG = "",
                TRACE = "✎",
            },
            level = 0, -- Hiện TẤT CẢ từ Trace, Debug cho đến Error
            minimum_width = 50,
            render = "default",
            stages = "fade_in_slide_out",
            timeout = 7000,
            top_down = true,
        })

        vim.notify = notify
    end
}
