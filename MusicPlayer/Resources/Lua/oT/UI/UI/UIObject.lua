local _M=
{
    mContext=nil,
}

_M.new=function()
    local p={}
    setmetatable(p,_M)
    _M.__index=_M

    return p
end

_M.show=function(t)
    oTUIObject_Show(t.mContext)
end

_M.getVisible=function(t)
    return oTUIObject_GetVisible(t.mContext)
end

_M.setVisible=function(t,value)
    oTUIObject_SetVisible(t.mContext,value)
end

_M.show=function(t)
    _M.setVisible(t,true)
end

_M.hide=function(t)
    _M.setVisible(t,false)
end

_M.isEnable=function(t)
    return oTUIObject_IsEnable(t.mContext)
end

_M.setEnable=function(t)
    oTUIObject_SetEnable(t.mContext)
end

_M.getObjectName=function(t)
    oTUIObject_GetObjectName(t.mContext)
end

_M.setObjectName=function(t,value)
    oTUIObject_SetObjectName(t.mContext,value)
end

_M.setParent=function(t,value)
    if type(value)~="number"then
        value=value.mContext
    end
    
    oTUIObject_SetParent(t.mContext,value)
end

return _M