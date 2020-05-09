-- https://love2d.org/wiki/love.textinput

local utf8 = require("utf8")
local gamestate = {}

function love.load()
  gameplay = require("src.gameplay")
  gamestate.phrase = gameplay.selectPhrase()
  gamestate.typed = ""
end
 
function love.draw()
  love.graphics.printf(gamestate.phrase, 0, 0, love.graphics.getWidth())
  love.graphics.printf(gamestate.typed, 0, 50, love.graphics.getWidth())
  if gamestate.state == 'score' then
    if gamestate.result then
      love.graphics.printf("Alright!", 0, 100, love.graphics.getWidth())
    else
      love.graphics.printf("Too late, boy!", 0, 100, love.graphics.getWidth())
    end
  end
end

function love.keypressed(key)
  if key == "backspace" then
    -- get the byte offset to the last UTF-8 character in the string.
    local byteoffset = utf8.offset(gamestate.typed, -1)

    if byteoffset then
      -- remove the last UTF-8 character.
      -- string.sub operates on bytes rather than UTF-8 characters, so we couldn't do string.sub(text, 1, -2).
      gamestate.typed = string.sub(gamestate.typed, 1, byteoffset - 1)
    end
  end
  if key == "return" then
    gamestate.result = gameplay.checkWords(gamestate.typed, gamestate.phrase)
    gamestate.state = 'score'
  end
end

function love.textinput(t)
  gamestate.typed = gamestate.typed .. t
end