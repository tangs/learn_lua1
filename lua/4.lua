local function dumptable(t, tab)
    if not tab then tab = 0 end
    local prefix = string.rep(" ", 4 * tab)
    for k, v in pairs(t) do
        print(prefix..k, v)
        if type(v) == "table" then
            dumptable(v, tab + 1)
        end
    end
end

local t = {}
print(getmetatable(t))

local t1 = {}
setmetatable(t1, t)
print(getmetatable(t1) == t)

local txt = "txt"
local meta = getmetatable("txt")
dumptable(meta)
print(meta.__index.find(txt, "t"))
