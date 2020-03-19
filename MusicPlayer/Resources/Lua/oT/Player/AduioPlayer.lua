local Player=require "oT.Player.Player"

local _M=Player.new()

_M.new=function()
    local p={}
    setmetatable(p,Player)
    Player.__index=Player

    p.mContext=oTAudioPlayer_Create()

    return p
end

_M.destory=function(t)
    if t and t.mContext then
        oTAudioPlayer_Destory(t.mContext)
        t.mContext=nil
        t=nil
    end
end

_M.__gc=function(t)
    _M.destory(t)
end

return _M