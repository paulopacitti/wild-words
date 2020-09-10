local Duel = {}
local Gamestate = require("libs.gamestate")
local Text = require("src.objects.Text")
local TextInput = require("src.objects.TextInput")
local GameplaySystem = require("src.systems.GameplaySystem")
local SoundSystem = require("src.systems.SoundSystem")

function Duel:init()
  gameplaySystem = GameplaySystem:new()
  sfx = SoundSystem:new()
  sfx:add("shot2", "assets/sfx/shot2.wav")

  phrase = Text:new({x = 0, y = 50}, "phrase", "center", gameplaySystem:getPhrase())
  typewriter = TextInput:new({x = 0, y = 450})

  state = "reloading"
  seconds = 0
  timer = gameplaySystem:calculateTime()
end

function Duel:draw()
  if timer > 0 and state == "reloading" then 
    love.graphics.setColor(10/255, 46/255, 68/255, 0.5)
    love.graphics.setBackgroundColor(252/255, 255/255, 204/255, 1)
    phrase:draw()

    love.graphics.printf(string.format("%.2f", timer), 0, 400, 800, "center")

    love.graphics.setColor(10/255, 46/255, 68/255)
    typewriter:draw()
  elseif state == "win" then
    love.graphics.printf("YOU WIN", 0, 400, 800, "center")
  elseif state == "lost" then
    love.graphics.printf("GAME OVER", 0, 400, 800, "center")
  end

end

function Duel:update(dt)
  seconds = seconds + dt
  timer = timer - dt
  if seconds >= 0.5 then
    typewriter:updateCursor()
    seconds = 0
  end
end

function Duel:keypressed(key)
  if state == "reloading" then
    if key == "backspace" then
      typewriter:delete()
    end
    if key == "return" then
      sfx:play("shot2")
      if gameplaySystem:check(typewriter:getText()) then
        state = "win"
      else
        state = "lost"
      end
    end
  elseif state == "win" or "lost" then
    if key == "return" then
      restart()
    end
  end 
end

function restart()
  phrase = Text:new({x = 0, y = 50}, "phrase", "center", gameplaySystem:getPhrase())
  typewriter = TextInput:new({x = 0, y = 450})

  state = "reloading"
  seconds = 0
  timer = gameplaySystem:calculateTime()
end

function Duel:textinput(t)
  typewriter:append(t)
end

return Duel