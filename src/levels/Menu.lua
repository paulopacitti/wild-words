local Menu = {}
local Gamestate = require("libs.gamestate")
local Shack = require("libs.shack")

local TextInput = require("src.objects.TextInput")
local Text = require("src.objects.Text")

local SoundSystem = require("src.systems.SoundSystem")

local Credits = require("src.levels.Credits")
local Duel = require("src.levels.Duel")
local Help = require("src.levels.Help")

function Menu:init()
  seconds = 0

  title = Text:new({x = 0, y = 100}, "title", "center", "Wild\nWords")
  footer = Text:new({x = 0, y = 550}, "footer", "center", "type \"help\" to show the available commands")
  option = TextInput:new({x = 0, y = 330})
  
  sfx = SoundSystem:new()
  sfx:add("shot2", "assets/sfx/shot2.wav", false)
  sfx:add("ui_wrong", "assets/sfx/ui_wrong.wav", false)
  Shack:setDimensions(love.graphics.getWidth()/2, love.graphics.getHeight()/2)
end

-- when re-entering the level, start from scratch
function Menu:resume()
  Menu:init()
end

function Menu:draw()
  Shack:apply()

  love.graphics.setColor(10/255, 46/255, 68/255)
  love.graphics.setBackgroundColor(252/255, 255/255, 204/255, 1)
  title:draw()
  option:draw()
  footer:draw()

end

function Menu:update(dt)
  Shack:update(dt)
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
    if option:getText() == "play" then
      sfx:play("shot2")
      Gamestate.push(Duel)
    elseif option:getText() == "credits" then
      sfx:play("shot2")
      Gamestate.push(Credits)
    elseif option:getText() == "help" then
      sfx:play("shot2")
      Gamestate.push(Help)
    else
      sfx:play("ui_wrong")
      Shack:setShake(20)
    end
  end
end

function Menu:textinput(t)
  option:append(t)
end

return Menu