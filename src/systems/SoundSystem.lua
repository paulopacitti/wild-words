local wave = require("libs.wave")
local class = require("libs.middleclass")
local SoundSystem = class("SoundSystem")

function SoundSystem:initialize()
  self.sounds = {}
end

function SoundSystem:add(tag, file)
  self.sounds[tag] = wave:newSource(file, "stream")
end

function SoundSystem:play(tag)
  self.sounds[tag]:play()
end

function SoundSystem:playRandom()
  math.randomseed(os.time())
  local keys = {}
  for k in pairs(self.sounds) do table.insert(keys, k) end
  local index = keys[math.random(#keys)]
  self.sounds[index]:play()
end

return SoundSystem