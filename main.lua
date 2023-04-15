local Gamestate = require("libs.gamestate")
local Menu = require("src.levels.Menu")
local Audio = require("src.components.Audio")

function love.load()
  love.keyboard.setKeyRepeat(true)

  local music = Audio:new()
  music:add("theme", "assets/music/theme.wav", true)
  music:play("theme")

  Gamestate.registerEvents()
  Gamestate.switch(Menu)
end

function love.draw()
end

function love.update(dt)
end

function love.textinput(t)
end
