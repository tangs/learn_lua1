#include <stdio.h>
#include <string.h>

#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

#include "int64.h"

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
    
    int result = luaL_loadbuffer(L, data, len, "main");
    if (result) {
        return 1;
    }

    result = lua_pcall(L, 0, 0, 0);
    return result;
}

static int cFunc(lua_State *L) {
    lua_pushstring(L, "call c function.");
    return 1;
}

int main() {
    lua_State *L = luaL_newstate();
    luaopen_int64(L);
    
    luaL_openlibs(L);
    
    lua_pushcfunction(L, cFunc);
    lua_setglobal(L, "cFunc");
    
    loadLuaFile(L, "lua/main.lua");
    
//    lua_getglobal(L, "main");
//    int ret = lua_pcall(L, 0, 1, 0);
//    if (!ret) {
////        if (lua_isnumber(L, -1)) {
//        if (lua_type(L, -1) == LUA_TNUMBER) {
//            int ret = lua_tonumber(L, -1);
//            if (ret) {
//                printf("call main() return: %d\n", ret);
//            }
//        }
//        lua_pop(L, 1);
//    }
    lua_close(L);
    return 0;
}
