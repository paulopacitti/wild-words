local fun = require("libs.fun")
local wave = require("libs.wave")
local SoundSystem = {}

function SoundSystem:new()
  local o = {
    sounds = {}
  }
  setmetatable(o, self)
  self.__index = self
  return o
end

function SoundSystem:add(tag, file, loop)
  self.sounds[tag] = wave:newSource(file, "stream")
  self.sounds[tag]:setLooping(loop)
end

function SoundSystem:play(tag)
  self.sounds[tag]:play()
end

-- tags: a table containing the sounds to play randomly
function SoundSystem:playRandom(tags)
  math.randomseed(os.time())
  local keys = {}
  for k, v in pairs(self.sounds) do
    if tags ~= nil then
      if fun.index(k, tags) ~= nil then -- check if key is in "tags"
        table.insert(keys, k)
      end
    else
      table.insert(keys, k)
    end
  end
  local index = keys[math.random(#keys)]
  self.sounds[index]:play()
end

return SoundSystem
