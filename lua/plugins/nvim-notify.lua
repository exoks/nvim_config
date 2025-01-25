--  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣦⣴⣶⣾⣿⣶⣶⣶⣶⣦⣤⣄⠀⠀⠀⠀⠀⠀⠀                                              --
--  ⠀⠀⠀⠀⠀⠀⠀⢠⡶⠻⠛⠟⠋⠉⠀⠈⠤⠴⠶⠶⢾⣿⣿⣿⣷⣦⠄⠀⠀⠀         𓐓  nvim-notify.lua 𓐔           --
--  ⠀⠀⠀⠀⠀⢀⠔⠋⠀⠀⠤⠒⠒⢲⠀⠀⠀⢀⣠⣤⣤⣬⣽⣿⣿⣿⣷⣄⠀⠀                                              --
--  ⠀⠀⠀⣀⣎⢤⣶⣾⠅⠀⠀⢀⡤⠏⠀⠀⠀⠠⣄⣈⡙⠻⢿⣿⣿⣿⣿⣿⣦⠀   Student: oezzaou <oezzaou@student.1337.ma> --
--  ⢀⠔⠉⠀⠊⠿⠿⣿⠂⠠⠢⣤⠤⣤⣼⣿⣶⣶⣤⣝⣻⣷⣦⣍⡻⣿⣿⣿⣿⡀                                              --
--  ⢾⣾⣆⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠉⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇                                              --
--  ⠀⠈⢋⢹⠋⠉⠙⢦⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇       Created: 2024/12/17 10:12:44 by oezzaou--
--  ⠀⠀⠀⠑⠀⠀⠀⠈⡇⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇       Updated: 2024/12/23 12:02:59 by oezzaou--
--  ⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⢀⣾⣿⣿⠿⠟⠛⠋⠛⢿⣿⣿⠻⣿⣿⣿⣿⡿⠀                                              --
--  ⠀⠀⠀⠀⠀⠀⠀⢀⠇⠀⢠⣿⣟⣭⣤⣶⣦⣄⡀⠀⠀⠈⠻⠀⠘⣿⣿⣿⠇⠀                                              --
--  ⠀⠀⠀⠀⠀⠱⠤⠊⠀⢀⣿⡿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠘⣿⠏⠀⠀                             𓆩♕𓆪      --
--  ⠀⠀⠀⠀⠀⡄⠀⠀⠀⠘⢧⡀⠀⠀⠸⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠐⠋⠀⠀⠀                     𓄂 oussama ezzaou𓆃  --
--  ⠀⠀⠀⠀⠀⠘⠄⣀⡀⠸⠓⠀⠀⠀⠠⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                                              --

-- ====<[ nvim-notify: config ]>================================================
return {
  'rcarriga/nvim-notify',
  config = function()
    require("notify").setup({
      max_width = 42, -- Set the maximum width of the notification window
      max_height = 5, -- Set the maximum height of the notification window
      background_color = "none", -- Set the background color
      stages = "fade_in_slide_out", -- Animation stage (fade, slide, static, fade_in_slide_out)
      timeout = 1000, -- How long to show the notification (in ms)
      render = "default", -- How to render the notification (compact, minimal, simple, default)
      icons = {
        ERROR = " ", -- Error icon
        WARN = " ", -- Warning icon
        INFO = " ", -- Info icon
        DEBUG = " ", -- Debug icon
        TRACE = "✎ ", -- Trace icon
      },
      level = vim.log.levels.INFO, -- Minimum level of notifications to show
    })
    -- Set nvim-notify as the default notification provider
    vim.notify = require("notify")
  end
}
-- =============================================================================

-- local notify = require("notify")
--
-- local spinner_frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
--
-- local function spinner(title, message, timeout)
--     local frame = 1
--     local notification
--
--     local timer = vim.loop.new_timer()
--     timer:start(0, 100, vim.schedule_wrap(function()
--         if frame > #spinner_frames then frame = 1 end
--
--         if notification then
--             notification = notify(
--                 spinner_frames[frame] .. " " .. message,
--                 "info",
--                 { replace = notification }
--             )
--         else
--             notification = notify(
--                 spinner_frames[frame] .. " " .. message,
--                 "info",
--                 { title = title, timeout = timeout }
--             )
--         end
--
--         frame = frame + 1
--     end))
--
--     return function()
--         timer:stop()
--         timer:close()
--         if notification then
--             notify("Loading complete!", "info", { replace = notification })
--         end
--     end
-- end
--
-- -- Example usage
-- local stop_spinner = spinner("Loading", "Please wait...", nil)
-- vim.defer_fn(function() stop_spinner() end, 5000)
