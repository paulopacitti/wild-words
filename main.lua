-- https://love2d.org/wiki/love.textinput

local Gamestate = require "libs.gamestate"
local Menu = require("src.levels.Menu")

function love.load()
  Gamestate.registerEvents()
  Gamestate.switch(Menu)
end
 
function love.draw()
  

end

function love.update(dt)
end


function love.textinput(t)
end