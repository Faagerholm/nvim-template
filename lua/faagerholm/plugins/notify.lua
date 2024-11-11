local status, notify = pcall(require, "notify")
if not status then
  print("notify not found")
  return
end

notify.setup({
  -- Animation style
  stages = "fade_in_slide_out",

  -- Timeout for notifications
  timeout = 3000,

  -- minimal style
  render = "wrapped-compact",

  -- render at bottom
  -- top_down = false,

  -- For stages that change opacity this is treated as the highlight behind the window
  background_colour = "#000000",

  -- Icons for the different levels
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
})
