local class = require("libs.middleclass")
local Text = class("Text")

function Text:initialize(position, type, alignment, text)
  self.font = self:selectFont(type, size)
  self.alignment = alignment
  self.position = position -- {x, y}
  self.text = text
end

function Text:selectFont(type)
  local font
  local size
  if type == "title" then
    font = "pixel-bit-advanced"
    size = 60
  elseif type == "label" then
    font = "VGATypewriterSf"
    size = 15
  elseif type == "phrase" then
    font = "VGATypewriterSf"
    size = 30
  end
  return love.graphics.newFont("assets/fonts/" .. font .. ".ttf", size)
end

function Text:onClick()
end

function Text:draw()
  love.graphics.setFont(self.font)
  love.graphics.printf(self.text, self.position.x, self.position.y, 800, self.alignment)
end

return Text