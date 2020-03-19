local Table=require "oT.Exception.Table"

local _M=
{
    mContext=nil,
    npos=oTString_GetNPos(),
}

_M.new=function(value)
    local p={}
    setmetatable(p,_M)
    _M.__index=_M

    p.mContext=oTString_Create(value or "")

    return p
end

_M.newFromCPointer=function(value)
    local p={}
    setmetatable(p,_M)
    _M.__index=_M
    p.mContext=ptr
    return p
end

_M.destory=function(t)
    if t and t.mContext then
        oTString_Destory(t.mContext)
        t.mContext=nil
        t=nil
    end
end

_M.__gc=function(t)
    _M.destory(t)
end

_M.substr=function(t,start,e)
    if not start then
        start=0
    end

    if not e then
        e=-1
    end

    local p=oTString_SubStr(t.mContext,start,e)

    return _M.newFromCPointer(p)
end

_M.at=function(t,index)
    return string.char(oTString_At(t.mContext,index))
end

_M.append=function(t,str)
    oTString_Append(t.mContext,str)
end

_M.data=function(t,str)
    return oTString_Data(t.mContext)
end

_M.length=function(t)
    return oTString_Length(t.mContext)
end

_M.string=function(t)
    return oTString_c_str(t.mContext)
end

_M.c_str=function(t)
    return oTString_c_str(t.mContext)
end

_M.__tostring=function(t)
    return _M.c_str(t)
end

_M.indexOf=function(t,str,ignoreNum)
    if not ignoreNum then
        ignoreNum=0
    end

    return oTString_IndexOf(t.mContext,str,ignoreNum)
end

_M.substr=function(t,start,e)
    if not start then
        start=0
    end

    if not e then
        e=-1
    end

    local p=oTString_SubStr(t.mContext,start,e)

    return _M.newFromCPointer(p)
end

_M.replaceAll=function(t,from,to)
    local p=oTString_ReplaceAll(t.mContext,from,to)
    return _M.newFromCPointer(p)
end

_M.split=function(t,delim)
    return oTString_Split(t.mContext,delim)
end

return _M
