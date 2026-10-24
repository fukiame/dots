swayimg.enable_decoration(false)           -- window title/buttons/borders
swayimg.enable_overlay(false)             -- window overlay mode

swayimg.text.set_font("Monospace")        -- font name
swayimg.text.set_size(16)                 -- font size in pixels
swayimg.text.set_timeout(2)               -- layer hide timeout
swayimg.text.set_status_timeout(2)        -- status message hide timeout

swayimg.viewer.on_key("l", function()
  swayimg.viewer.switch_image("next")
end)
swayimg.viewer.on_key("h", function()
  swayimg.viewer.switch_image("prev")
end)
swayimg.viewer.on_key("k", function()
  swayimg.viewer.switch_image("next")
end)
swayimg.viewer.on_key("j", function()
  swayimg.viewer.switch_image("prev")
end)
