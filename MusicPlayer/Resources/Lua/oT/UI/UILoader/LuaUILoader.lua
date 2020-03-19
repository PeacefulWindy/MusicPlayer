local UILoader=require "oT.UI.UILoader.UILoader"

local _M=UILoader.new()

_M.new=function(ptr)
    local p={}
    setmetatable(p,_M)
    _M.__index=_M
    p.mContext=oTLuaUILoader_Create()
    return p
end

_M.destory=function(t)
    if t and t.mContext then
        oTLuaUILoader_Destory(t.mContext)
        t.mContext=nil
        t=nil
    end
end

_M.__gc=function(t)
    _M.destory(t)
end

return _M