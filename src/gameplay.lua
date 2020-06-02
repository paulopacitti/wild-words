-- description: stores the core gameplay functions

local gameplay = {}
gameplay.words = require("src.words")

-- check if the typed words are equal to the selected phrase
function gameplay.checkWords(typed, correct)
  if typed == correct then
    return true
  else
    return false
  end
end

-- function that random selects the phrase that has to be typed
function gameplay.selectPhrase()
  math.randomseed(os.time()) -- you have to initiate random seed in Lua
  local index = math.random(1, #gameplay.words - 1)
  return gameplay.words[index]
end

-- calculate time limit to type the phrase
function gameplay.calculateTime(phrase)
  return #phrase * 0.3
end

return gameplay