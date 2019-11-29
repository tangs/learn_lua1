-- class A
if A then return A end

A = {}

function A.new()
    local mt = {}
    mt.__index = {
        fun = function ()
            print("call fun().")
        end
    }
    local obj = {}
    setmetatable(obj, mt)
    -- print("call A.new()")
    return obj
end

return A
