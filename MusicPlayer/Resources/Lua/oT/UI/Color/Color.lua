local _M=
{
    mContext=nil
}

_M.new=function(r,g,b,a)
    local p={}
    setmetatable(p,_M)
    _M.__index=_M
    p.mContext=oTColor_Create(r or 0,g or 0,b or 0,a or 1)
    return p
end

_M.newFromCPointer=function(ptr)
    local p={}
    setmetatable(p,_M)
    _M.__index=_M
    p.mContext=ptr
    return p
end

_M.destory=function(t)
    if t and t.mContext then
        oTColor_Destory(t.mContext)
        t.mContext=nil
        t=nil
    end
end

_M.__gc=function(t)
    _M.destory(t)
end

_M.getX=function(t)
    return oTColor_GetX(t.mContext)
end

_M.setX=function(value)
    oTColor_SetX(_M.mContext,value)
end

_M.getY=function()
    return oTColor_GetY(_M.mContext)
end

_M.setY=function(value)
    oTColor_SetY(_M.mContext,value)
end

_M.getZ=function()
    return oTColor_GetZ(_M.mContext)
end

_M.setZ=function(value)
    oTColor_SetZ(_M.mContext,value)
end

_M.getW=function()
    return oTColor_GetW(_M.mContext)
end

_M.setW=function(value)
    oTColor_SetW(_M.mContext,value)
end

return _M