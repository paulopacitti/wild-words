local Gamestate = require "libs.gamestate"
local Menu = require("src.levels.Menu")

function love.load()
  love.keyboard.setKeyRepeat(true)
  Gamestate.registerEvents()
  Gamestate.switch(Menu)
end
 
function love.draw()
end

function love.update(dt)
end

function love.textinput(t)
end