local Menu = {}
local Button = require("src.objects.Button")
local Text = require("src.objects.Text")


function Menu:init()
  title = Text:new({x = 200, y = 100}, "title", "Wild Words")
  sampleButton = Button:new({x = 400, y = 300 }, "Play!")
end

function Menu.draw()
  love.graphics.setColor(10/255, 46/255, 68/255)
  love.graphics.setBackgroundColor(252/255, 255/255, 204/255, 1)
  title:draw()
  sampleButton:draw()
end

function Menu:keyreleased(key, code)
end

return Menu