local UIBaseObject=require "oT.UI.UI.UIBaseObject"

local _M=UIBaseObject.new()

_M.new=function(parent)
    local p={}
    setmetatable(p,_M)
    
    _M.__index=_M
    p.mContext=oTSprite_Create(parent or 0)
    
    return p
end

_M.destory=function(t)
    if t and t.mContext then
        oTSprite_Destory(t.mContext)
        t.mContext=nil
        t=nil
    end
end

_M.__gc=function(t)
    _M.destory(t)
end

_M.openFromFile=function(t,path)
    return oTSprite_OpenFromFile(t.mContext,path)
end

_M.openFromResources=function(t,path)
    return oTSprite_OpenFromResources(t.mContext,path)
end

return _M