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
        oTPlayer_Destory(t.mContext)
        t.mContext=nil
        t=nil
    end
end

_M.__gc=function(t)
    _M.destory(t)
end

_M.openFromFile=function(t,value)
    return oTPlayer_OpenFromFile(t.mContext,value)
end

_M.openFromResources=function(t,value)
    return oTPlayer_OpenFromResources(t.mContext,value)
end

_M.close=function(t)
    return oTPlayer_Close(t.mContext)
end

_M.play=function(t)
    oTPlayer_Play(t.mContext)
end

_M.pause=function(t)
    oTPlayer_Pause(t.mContext)
end

_M.stop=function(t)
    oTPlayer_Stop(t.mContext)
end

return _M