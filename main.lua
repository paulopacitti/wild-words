local Gamestate = require "libs.gamestate"
local Menu = require("src.levels.Menu")
local SoundSystem = require("src.systems.SoundSystem")

function love.load()
  love.keyboard.setKeyRepeat(true)

  music = SoundSystem:new()
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