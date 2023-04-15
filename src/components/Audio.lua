local contains = require("libs.tables").contains
local wave = require("libs.wave")
local Audio = {}

function Audio:new()
  local o = {
    sounds = {}
  }
  setmetatable(o, self)
  self.__index = self
  return o
end

function Audio:add(tag, file, loop)
  self.sounds[tag] = wave:newSource(file, "stream")
  self.sounds[tag]:setLooping(loop)
end

function Audio:play(tag)
  self.sounds[tag]:play()
end

-- tags: a table containing the sounds to play randomly
function Audio:playRandom(tags)
  math.randomseed(os.time())
  local keys = {}
  for k, v in pairs(self.sounds) do
    if tags ~= nil then
      if not contains(tags, k) then -- check if key is in "tags"
        table.insert(keys, k)
      end
    else
      table.insert(keys, k)
    end
  end
  local index = keys[math.random(#keys)]
  self.sounds[index]:play()
end

return Audio
