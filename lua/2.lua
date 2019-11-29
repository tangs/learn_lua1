local function values(t)
    local i = 0
    local len = #t
    return function()
        i = i + 1
        if i <= len then
            return t[i]
        end
    end
end

local function values_co(t)
    local co = coroutine.create(function()
        local len = #t
        for i = 1, len do
            coroutine.yield(i, t[i])
        end
    end)
    return function()
        return table.unpack({coroutine.resume(co)}, 2)
    end
end

for k, v in values_co({10, 20, 30}) do
    print(k, v)
end

print()

local t = {
    1,
    2,
    3,
    a = "a",
    b = "b",
    [5] = 4
}

print()

for k, v in ipairs(t) do
    print(k, v)
end

print()

for k, v in pairs(t) do
    print(k, v)
end
