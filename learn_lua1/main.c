#include <stdio.h>
#include <string.h>

#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

int loadLuaFile(lua_State* L, const char* fileName) {
    char data[2048];
    int len = 0;
    FILE *file = fopen(fileName, "r");
    if (file) {
        char c;
        while ((c = getc(file)) != EOF)
            data[len++] = c;
        fclose(file);
    }
    
    int result = luaL_loadbufferx(L, data, len, "main", NULL);
    if (result)
    {
        return 1;
    }

    result = lua_pcall(L, 0, 0, 0);
    return result;
}

int main() {
    lua_State *L = luaL_newstate();
    luaL_openlibs(L);
//    setLuaPath(L, "/Users/tangs/Documents/learn_lua1/lua/");
    
//    while (fgets(buff, sizeof(buff), stdin) != NULL) {
//        error = luaL_loadbufferx(L, buff, strlen(buff), "line", lua_pcall(L, 0, 0, 0));
//        if (error) {
//            fprintf(stderr, "%s", lua_tostring(L, -1));
//            lua_pop(L, 1);
//        }
//    }
    
    loadLuaFile(L, "lua/main.lua");
    
    lua_getglobal(L, "main");
    int ret = lua_pcall(L, 0, 1, 0);
    if (!ret && lua_isnumber(L, -1))
    {
        int ret = lua_tonumber(L, -1);
        if (ret)
        {
            printf("call main() return: %d\n", ret);
        }
    }
    lua_pop(L, 1);
    
    lua_close(L);
    return 0;
}
