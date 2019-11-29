local A = {}

function A.new()
    local mt = {}
    local prototype = {
        func = function()
            print("call mt.prototype.func().")
        end
    }
    
    mt.__index = function(table, key)
        print("call __index.key:" .. key)
        return prototype[key] 
    end

    mt.__newindex = function(table, key, value)
        print("call __newindex.key:" .. key .. ", value:" .. value)
        prototype[key] = value + 10
        -- table[key] = value + 10
        -- rawset(t, key, value + 10)
    end

    local obj = {}
    setmetatable(obj, mt)
    return obj
end

local t = A.new()
local t1 = A.new()

setmetatable(t1, mt)

t.func()
t.a = 30
print(t.a)

print(t1.a)
