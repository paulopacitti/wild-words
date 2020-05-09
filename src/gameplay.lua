local gameplay = {}
gameplay.words = require("src.words")

function gameplay.selectPhrase()
  math.randomseed(os.time()) -- you have to initiate random seed in Lua
  local index = math.random(1, #gameplay.words - 1)
  return gameplay.words[index]
end

function gameplay.checkWords(typed, correct)
  if typed == correct then
    return true
  else
    return false
  end
end

return gameplay