local class = require("libs.middleclass")
local Button = class("Button")

function Button:initialize(position, text)
  self.position = position -- {x, y}
  self.text = text
  self.font = love.graphics.newFont("assets/fonts/OwreKynge.ttf", 40)
end

function Button:onClick()
end

function Button:draw()
  love.graphics.setFont(self.font)
  love.graphics.print(self.text, self.position.x, self.position.y)
end

return Button