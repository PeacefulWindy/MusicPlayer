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

_M.destory=function(t)
    if t and t.mContext then
        oTUILoader_Destory(t.mContext)
        t.mContext=nil
        t=nil
    end
end

_M.__gc=function(t)
    _M.destory(t)
end

_M.openFromFile=function(t,value)
    return oTUILoader_OpenFromFile(t.mContext,value)
end

_M.openFromResources=function(t,value)
    return oTUILoader_OpenFromResources(t.mContext,value)
end

_M.close=function(t,value)
    return oTUILoader_Close(t.mContext,value)
end

return _M