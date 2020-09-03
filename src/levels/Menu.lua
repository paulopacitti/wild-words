local Menu = {}
local TextInput = require("src.objects.TextInput")
local Text = require("src.objects.Text")

function Menu:init()
  title = Text:new({x = 200, y = 100}, "title", "Wild Words")
  option = TextInput:new({x = 0, y = (600 / 2) + 20 })
end

function Menu:draw()
  love.graphics.setColor(10/255, 46/255, 68/255)
  love.graphics.setBackgroundColor(252/255, 255/255, 204/255, 1)
  title:draw()
  option:draw()
end

function Menu:keypressed(key)
  if key == "backspace" then
    option:delete()
  end
end

function Menu:textinput(t)
  option:append(t)
end

return Menu