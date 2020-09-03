local class = require("libs.middleclass")
local Text = class("Text")

function Text:initialize(position, type, text)
  self.font = self:selectFont(type, size)
  print(self.font)
  self.position = position -- {x, y}
  self.text = text
end

function Text:selectFont(type)
  print(type)
  local font
  local size
  if type == "title" then
    font = "pixel-bit-advanced"
    size = 60
  elseif type == "label" then
    font = "m41"
    size = 30
  end
  return love.graphics.newFont("assets/fonts/" .. font .. ".ttf", size)
end

function Text:onClick()
end

function Text:draw()
  love.graphics.setFont(self.font)
  love.graphics.printf("Wild Words", 0, ((600 / 2) - (self.font:getHeight() / 2)) - 100, 800, "center")

end

return Text