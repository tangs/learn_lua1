local Set = {}
local mt = {}

function Set.new(l)
    local set = {}
    setmetatable(set, mt)
    for _, v in ipairs(l) do
        set[v] = true
    end
    return set
end

function Set.union(a, b)
    local ret = Set.new{}
    for k in pairs(a) do ret[k] = true end
    for k in pairs(b) do ret[k] = true end
    return ret
end

function Set.intersection(a, b)
    local ret = Set.new{}
    for k in pairs(a) do ret[k] = b[k] end
    return ret
end

function Set.tostring(set)
    local l = {}
    for k in pairs(set) do
        l[#l + 1] = k
    end
    return "{" .. table.concat(l, ", ") .. "}"
end

mt.__add = Set.union
mt.__tostring = Set.tostring

local a = Set.new{1, 2, 4, 5}
local b = Set.new{2, 4, 5, 8}

-- print(Set.tostring(Set.union(a, b)))
-- print(Set.tostring(Set.intersection(a, b)))

print(a + b)
