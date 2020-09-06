local utf8 = require("utf8")
local SoundSystem = require("src.systems.SoundSystem")
local class = require("libs.middleclass")
local TextInput = class("TextInput")

function TextInput:initialize(position)
  self.position = position
  self.text = ""
  self.font = love.graphics.newFont("assets/fonts/VGATypewriterSf.ttf", 45)
  self.cursor = " "
  self.sfx = SoundSystem:new()
  self.sfx:add("typing1", "assets/sfx/typing1.wav")
  self.sfx:add("typing2", "assets/sfx/typing2.wav")
  self.sfx:add("typing3", "assets/sfx/typing3.wav")
end

function TextInput:getText()
  return self.text
end

function TextInput:setText(t)
  self.text = t
end

function TextInput:setSFX()
  return { wave:newSource("typing1.wav"), }
end

function TextInput:append(char)
  self.text = self.text .. string.lower(char)
  self.sfx:playRandom({"typing2", "typing3"})
end

function TextInput:delete()
    -- get the byte offset to the last UTF-8 character in the string.
    local byteoffset = utf8.offset(self.text, -1)
    if byteoffset then
      -- remove the last UTF-8 character.
      -- string.sub operates on bytes rather than UTF-8 characters, so we couldn't do string.sub(text, 1, -2).
      self.text = string.sub(self.text, 1, byteoffset - 1)
      self.sfx:play("typing1") -- "delete" sound
    end
end

-- function that makes the cursor blink
function TextInput:updateCursor()
  if self.cursor == " " then
    self.cursor = "_"
  else
    self.cursor = " "
  end
end

function TextInput:draw()
  love.graphics.setFont(self.font)
  love.graphics.printf(">" .. self.text .. self.cursor, self.position.x, self.position.y, 800)
end

return TextInput