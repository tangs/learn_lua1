#!/usr/local/bin/lua

local fun1 = function()
    print(2.1)
    coroutine.yield(100)
end

local co = coroutine.create(function(value)
    -- print(coroutine.status(co))
    print("value: "..value)
    print(2)
    -- print(coroutine.yield(10))
    fun1()
    print(4)
end)

print(1)
print(coroutine.resume(co, 10))
print(3)
print(coroutine.resume(co, 20))
print(5)
