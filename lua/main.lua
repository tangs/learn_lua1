local A = require("lua.A")

function main()
    -- print("Hello lua.")
    local a = A.new()
    a.fun()
    return 1024
end

-- local int64 = require("int64")

-- print(111, type(int64))

local obj = {}
local function dump(t, deep)
    local prefix = string.rep(" ", deep * 4)
    obj[t] = true
    for k, v in pairs(t) do
        -- print(string.rep(" ", deep * 4))
        -- print(k, v)
        print(prefix .. k .. ": ", v)
        if type(v) == "table" and not obj[v] then
            dump(v, deep + 1)
        end
    end
end

local function fun1()
    -- dump(_G, 0)
    local int64 = require "int64"
    local num1 = int64.new_signed("123456")
    local num2 = int64.new_signed(2000000)
    print(num2 * num1)
    print(cFunc())
end


local status , err, ret = xpcall(fun1, debug.traceback)
print(status)
print(err)

-- main()
