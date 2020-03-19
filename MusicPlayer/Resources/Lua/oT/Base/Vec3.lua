local _M=
{
    mContext=nil,
}

_M.new=function(x,y,z)
    local p={}
    setmetatable(p,_M)
    _M.__index=_M
    p.mContext=oTVec3_Create(x or 0,y or 0,z or 0)
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
        oTVec3_Destory(t.mContext)
        t.mContext=nil
        t=nil
    end
end

_M.__gc=function(t)
    _M.destory(t)
end

_M.getX=function(t)
    return oTVec3_GetX(t.mContext)
end

_M.setX=function(t,value)
    oTVec3_SetX(t.mContext,value)
end

_M.getY=function(t)
    return oTVec3_GetY(t.mContext)
end

_M.setY=function(t,value)
    oTVec3_SetY(t.mContext,value)
end

_M.getZ=function(t)
    return oTVec3_GetZ(t.mContext)
end

_M.setZ=function(t,value)
    oTVec3_SetZ(t.mContext,value)
end

return _M