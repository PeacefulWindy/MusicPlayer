local _M=
{
    mContext=nil,
}

_M.new=function()
    local p={}
    setmetatable(p,_M)
    _M.__index=_M
    p.mContext=oTRandom_Create()

    return p
end

_M.destory=function(t)
    if t and t.mContext then
        oTRandom_Destory(t.mContext)
        t.mContext=nil
        t=nil
    end
end

_M.__gc=function(t)
    _M.destory(t)
end

_M.rand=function(t,index)
    return oTRandom_Rand(t.mContext)
end

return _M
