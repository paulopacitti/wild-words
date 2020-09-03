local class = require("libs.middleclass")
local TextInput = class("TextInput")
local utf8 = require("utf8")

function TextInput:initialize(position)
  self.position = position
  self.text = ""
  self.font = love.graphics.newFont("assets/fonts/m41.ttf", 20)
end

function TextInput:getText()
  return self.text
end

function TextInput:setText(t)
  self.text = t
end

function TextInput:append(char)
  self.text = self.text .. char
end

function TextInput:delete()
    -- get the byte offset to the last UTF-8 character in the string.
    local byteoffset = utf8.offset(self.text, -1)
    if byteoffset then
      -- remove the last UTF-8 character.
      -- string.sub operates on bytes rather than UTF-8 characters, so we couldn't do string.sub(text, 1, -2).
      self.text = string.sub(self.text, 1, byteoffset - 1)
    end
end

function TextInput:draw()
  love.graphics.setFont(self.font)
  love.graphics.printf(self.text, self.position.x, self.position.y, 800, "center")

end

return TextInput