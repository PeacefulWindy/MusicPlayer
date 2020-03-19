local UIObject=require "oT.UI.UI.UIObject"
local Vec2=require "oT.Base.Vec2"
local Vec3=require "oT.Base.Vec3"

local _M=UIObject.new()

_M.new=function()
    local p={}
    setmetatable(p,_M)
    _M.__index=_M

    return p
end

_M.getPosition=function(t)
    return Vec3.newFromCPointer(oTUIBaseObject_GetPosition(t.mContext))
end

_M.setPosition=function(t,x,y,z)
    if type(x)=="table" then
        oTUIBaseObject_SetPosition(t.mContext,x.mContext)
    else
        local value=Vec3.new(x or 1,y or 1,z or 1)
        oTUIBaseObject_SetPosition(t.mContext,value.mContext)
        value:destory()
    end
end

_M.getEndPosition=function(t)
    return Vec3.newFromCPointer(oTUIBaseObject_GetEndPosition(t.mContext))
end

_M.setEndPosition=function(t,x,y,z)
    if type(x)=="table" then
        oTUIBaseObject_SetEndPosition(t.mContext,x.mContext)
    else
        local value=Vec3.new(x or 1,y or 1,z or 1)
        oTUIBaseObject_SetEndPosition(t.mContext,value.mContext)
        value:destory()
    end
end

_M.getPositionTime=function(t)
    return oTUIBaseObject_GetPositionTime(t.mContext)
end

_M.setPositionTime=function(t)
    return oTUIBaseObject_SetPositionTime(t.mContext)
end

_M.getPositionEndTime=function(t)
    return oTUIBaseObject_GetPositionEndTime(t.mContext)
end

_M.setPositionEndTime=function(t)
    return oTUIBaseObject_SetPositionEndTime(t.mContext)
end

_M.getRotate=function(t)
    return Vec3.newFromCPointer(oTUIBaseObject_GetRotate(t.mContext))
end

_M.setRotate=function(t,x,y,z)
    if type(x)=="table" then
        oTUIBaseObject_SetRotate(t.mContext,x.mContext)
    else
        local value=Vec3.new(x or 1,y or 1,z or 1)
        oTUIBaseObject_SetRotate(t.mContext,value.mContext)
        value:destory()
    end
end

_M.getEndRotate=function(t)
    return Vec3.newFromCPointer(oTUIBaseObject_GetEndRotate(t.mContext))
end

_M.setEndRotate=function(t,x,y,z)
    if type(x)=="table" then
        oTUIBaseObject_SetEndRotate(t.mContext,x.mContext)
    else
        local value=Vec3.new(x or 1,y or 1,z or 1)
        oTUIBaseObject_SetEndRotate(t.mContext,value.mContext)
        value:destory()
    end
end

_M.getRotateTime=function(t)
    return oTUIBaseObject_GetRotateTime(t.mContext)
end

_M.setRotateTime=function(t)
    return oTUIBaseObject_SetRotateTime(t.mContext)
end

_M.getRotateEndTime=function(t)
    return oTUIBaseObject_GetRotateEndTime(t.mContext)
end

_M.setRotateEndTime=function(t)
    return oTUIBaseObject_SetRotateEndTime(t.mContext)
end

_M.getScaled=function(t)
    return Vec3.newFromCPointer(oTUIBaseObject_GetScaled(t.mContext))
end

_M.setScaled=function(t,x,y,z)
    if type(x)=="table" then
        oTUIBaseObject_SetScaled(t.mContext,x.mContext)
    else
        local value=Vec3.new(x or 1,y or 1,z or 1)
        oTUIBaseObject_SetScaled(t.mContext,value.mContext)
        value:destory()
    end
end

_M.getEndScaled=function(t)
    return Vec3.newFromCPointer(oTUIBaseObject_GetEndScaled(t.mContext))
end

_M.setEndScaled=function(t,x,y,z)
    if type(x)=="table" then
        oTUIBaseObject_SetEndScaled(t.mContext,x.mContext)
    else
        local value=Vec3.new(x or 1,y or 1,z or 1)
        oTUIBaseObject_SetEndScaled(t.mContext,value.mContext)
        value:destory()
    end
end

_M.getScaledTime=function(t)
    return oTUIBaseObject_GetScaledTime(t.mContext)
end

_M.setScaledTime=function(t)
    return oTUIBaseObject_SetScaledTime(t.mContext)
end

_M.getScaledEndTime=function(t)
    return oTUIBaseObject_GetScaledEndTime(t.mContext)
end

_M.setScaledEndTime=function(t)
    return oTUIBaseObject_SetScaledEndTime(t.mContext)
end

_M.getTime=function(t)
    return oTUIBaseObject_GetTime(t.mContext)
end

_M.getAnchors=function(t)
    return Vec2.newFromCPointer(oTUIBaseObject_GetAnchors(t.mContext))
end

_M.setAnchors=function(t,x,y)
    if type(x)=="table" then
        oTUIBaseObject_SetAnchors(t.mContext,x.mContext)
    else
        local value=Vec2.new(x or 1,y or 1)
        oTUIBaseObject_SetAnchors(t.mContext,value.mContext)
        value:destory()
    end
end

_M.isPlaying=function(t,value)
    return oTUIBaseObject_IsPlaying(t.mContext)
end

_M.play=function(t,value)
    oTUIBaseObject_Play(t.mContext,value)
end

_M.pause=function(t)
    oTUIBaseObject_Pause(t.mContext)
end

_M.stop=function(t)
    oTUIBaseObject_Stop(t.mContext)
end

return _M