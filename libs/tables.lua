local lib = {}

-- check if element is on table
function lib.contains(t, k)
    for index, value in ipairs(t) do
        if value == k then
            return true
        end
    end
    return false
end

return lib
