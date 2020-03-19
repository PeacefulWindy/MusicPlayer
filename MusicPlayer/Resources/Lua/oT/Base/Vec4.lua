local _M=
{
    mContext=nil,
}

_M.new=function(x,y,z,w)
    local p=ptr or {}
    setmetatable(p,_M)
    _M.__index=_M
    p.mContext=oTVec4_Create(x or 0,y or 0,z or 0,w or 0)
    return p
end

_M.newFromCPointer=function(value)
    local p={}
    setmetatable(p,_M)
    _M.__index=_M
    p.mContext=value
    return p
end

_M.destory=function(t)
    if t and t.mContext then
        oTVec4_Destory(t.mContext)
        t.mContext=nil
        t=nil
    end
end

_M.__gc=function(t)
    _M.destory(t)
end

_M.getX=function(t)
    return oTVec4_GetX(t.mContext)
end

_M.setX=function(value)
    oTVec4_SetX(_M.mContext,value)
end

_M.getY=function()
    return oTVec4_GetY(_M.mContext)
end

_M.setY=function(value)
    oTVec4_SetY(_M.mContext,value)
end

_M.getZ=function()
    return oTVec4_GetZ(_M.mContext)
end

_M.setZ=function(value)
    oTVec4_SetZ(_M.mContext,value)
end

_M.getW=function()
    return oTVec4_GetW(_M.mContext)
end

_M.setW=function(value)
    oTVec4_SetW(_M.mContext,value)
end

return _M