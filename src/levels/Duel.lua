local GameplaySystem = require("src.systems.GameplaySystem")
local Text = require("src.components.Text")
local TextInput = require("src.components.TextInput")
local Audio = require("src.components.Audio")

local Duel = {}
function Duel:init()
  self.sfx = Audio:new()
  self.sfx:add("shot2", "assets/sfx/shot2.wav", false)

  self.phrase = Text:new({ x = 0, y = 50 }, "phrase", "center", GameplaySystem:getPhrase())
  self.typewriter = TextInput:new({ x = 0, y = 450 })

  self.state = "reloading"
  self.seconds = 0
  self.timer = GameplaySystem:calculateTime()
end

function Duel:restart()
  self.seconds = 0
  GameplaySystem:selectPhrase()
  self.timer = GameplaySystem:calculateTime()
  self.phrase = Text:new({ x = 0, y = 50 }, "phrase", "center", GameplaySystem:getPhrase())
  self.typewriter = TextInput:new({ x = 0, y = 450 })
  self.state = "reloading"
end

function Duel:draw()
  if self.timer > 0 and self.state == "reloading" then
    love.graphics.setColor(10 / 255, 46 / 255, 68 / 255, 0.5)
    love.graphics.setBackgroundColor(252 / 255, 255 / 255, 204 / 255, 1)
    self.phrase:draw()

    love.graphics.printf(string.format("%.2f", self.timer), 0, 400, 800, "center")

    love.graphics.setColor(10 / 255, 46 / 255, 68 / 255)
    self.typewriter:draw()
  elseif self.state == "win" then
    love.graphics.printf("YOU WIN", 0, 400, 800, "center")
  elseif self.state == "lost" then
    love.graphics.printf("GAME OVER", 0, 400, 800, "center")
  end
end

function Duel:update(dt)
  if self.state == "reloading" then
    self.seconds = self.seconds + dt
    self.timer = self.timer - dt
    if self.seconds >= 0.5 then
      self.typewriter:updateCursor()
      self.seconds = 0
    end
    if self.timer <= 0 then
      self.state = "lost"
    end
  end
end

function Duel:keypressed(key)
  if self.state == "reloading" then
    if key == "backspace" then
      self.typewriter:delete()
    end
    if key == "return" then
      self.sfx:play("shot2")
      if GameplaySystem:check(self.typewriter:getText()) then
        self.state = "win"
      else
        self.state = "lost"
      end
    end
  elseif self.state == "win" or "lost" then
    if key == "return" then
      Duel:restart()
    end
  end
end

function Duel:textinput(t)
  self.typewriter:append(t)
end

return Duel
