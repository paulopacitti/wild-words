local class = require("libs.middlecass")
local Typewriter = class("Typewriter")

function Typewriter:initialize(words)
  self.words = words
end



-- check if the typed words are equal to the selected phrase
function Typewriter.checkWords(typed, correct)
  if typed == correct then
    return true
  else
    return false
  end
end

-- function that random selects the phrase that has to be typed
function Typewriter.selectPhrase()
  math.randomseed(os.time()) -- you have to initiate random seed in Lua
  local index = math.random(1, #self.words - 1)
  return self.words[index]
end