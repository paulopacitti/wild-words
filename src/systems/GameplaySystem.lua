local class = require("libs.middleclass")
local GameplaySystem = class("GameplaySystem")

function GameplaySystem:initialize()
  self.words = require("src.utils.words")
  self.phrase = " "
  self:selectPhrase()
end

function GameplaySystem:calculateTime()
  return #self.phrase * 0.4
end

function GameplaySystem:check(typed)
  if typed == self.phrase then
    return true
  else
    return false
  end
end

function GameplaySystem:getPhrase()
  return self.phrase
end

function GameplaySystem:selectPhrase()
  math.randomseed(os.time()) -- you have to initiate random seed in Lua
  local index = math.random(1, #self.words - 1)
  self.phrase = self.words[index]
end

return GameplaySystem