local Text = {}

function Text:new(position, type, alignment, text)
  local o = {
    font = self:selectFont(type),
    alignment = alignment,
    position = position, -- {x, y}
    text = text,
  }
  setmetatable(o, self)
  self.__index = self
  return o
end

function Text:selectFont(type)
  local font
  local size

  if type == "title" then
    font = "UpheavalPro"
    size = 100
  elseif type == "footer" then
    font = "VGATypewriterSf"
    size = 15
  elseif type == "phrase" then
    font = "VGATypewriterSf"
    size = 30
  elseif type == "credits_title" then
    font = "UpheavalPro"
    size = 40
  elseif type == "credits_label" then
    font = "VGATypewriterSf"
    size = 30
  end

  return love.graphics.newFont("assets/fonts/" .. font .. ".ttf", size)
end

function Text:draw()
  love.graphics.setFont(self.font)
  love.graphics.printf(self.text, self.position.x, self.position.y, 800, self.alignment)
end

return Text
