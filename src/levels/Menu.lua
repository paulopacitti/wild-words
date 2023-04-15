local Gamestate = require("libs.gamestate")
local Shack = require("libs.shack")

local Credits = require("src.levels.Credits")
local Duel = require("src.levels.Duel")
local Help = require("src.levels.Help")

local Audio = require("src.components.Audio")
local TextInput = require("src.components.TextInput")
local Text = require("src.components.Text")

local Menu = {}
function Menu:init()
  self.seconds = 0

  self.title = Text:new({ x = 0, y = 100 }, "title", "center", "Wild\nWords")
  self.footer = Text:new({ x = 0, y = 550 }, "footer", "center", "type \"help\" to show the available commands")
  self.option = TextInput:new({ x = 0, y = 330 })

  self.sfx = Audio:new()
  self.sfx:add("shot2", "assets/sfx/shot2.wav", false)
  self.sfx:add("ui_wrong", "assets/sfx/ui_wrong.wav", false)
  Shack:setDimensions(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
end

-- when re-entering the level, start from scratch
function Menu:resume()
  Menu:init()
end

function Menu:draw()
  Shack:apply()

  love.graphics.setColor(10 / 255, 46 / 255, 68 / 255)
  love.graphics.setBackgroundColor(252 / 255, 255 / 255, 204 / 255, 1)
  self.title:draw()
  self.option:draw()
  self.footer:draw()
end

function Menu:update(dt)
  Shack:update(dt)
  self.seconds = self.seconds + dt
  if self.seconds >= 0.5 then
    self.option:updateCursor()
    self.seconds = 0
  end
end

function Menu:keypressed(key)
  if key == "backspace" then
    self.option:delete()
  elseif key == "return" then
    if self.option:getText() == "play" then
      self.sfx:play("shot2")
      Gamestate.push(Duel)
    elseif self.option:getText() == "credits" then
      self.sfx:play("shot2")
      Gamestate.push(Credits)
    elseif self.option:getText() == "help" then
      self.sfx:play("shot2")
      Gamestate.push(Help)
    else
      self.sfx:play("ui_wrong")
      Shack:setShake(20)
    end
  end
end

function Menu:textinput(t)
  self.option:append(t)
end

return Menu
