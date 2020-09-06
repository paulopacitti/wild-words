local Menu = {}
local SoundSystem = require("src.systems.SoundSystem")
local TextInput = require("src.objects.TextInput")
local Text = require("src.objects.Text")

function Menu:init()
  seconds = 0
  title = Text:new({x = 0, y = 100}, "title", "center", "Wild\nWords")
  footer = Text:new({x = 0, y = 550}, "label", "center", "made by paulopacitti")
  option = TextInput:new({x = 330, y = 330})
  sfx = SoundSystem:new()
  sfx:add("shot2", "assets/sfx/shot2.wav")
end

function Menu:draw()
  love.graphics.setColor(10/255, 46/255, 68/255)
  love.graphics.setBackgroundColor(252/255, 255/255, 204/255, 1)
  title:draw()
  option:draw()
  footer:draw()
end

function Menu:update(dt)
  seconds = seconds + dt
  if seconds >= 0.5 then
    option:updateCursor()
    seconds = 0
  end
end

function Menu:keypressed(key)
  if key == "backspace" then
    option:delete()
  elseif key == "return" then
    sfx:play("shot2")
  end
end

function Menu:textinput(t)
  option:append(t)
end

return Menu