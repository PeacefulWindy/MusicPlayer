local String = require "oT.Base.String"

local _M=
{
    mContext=nil,
    
    --File Mode
    Text=1,
    Bytes=2,
    Read=4,
    ReadText=5,
    ReadBytes=6,
    Write=8,
    WriteText=9,
    WriteBytes=10,
    Append=12,
    AppendText=13,
    AppendBytes=14,

    SeekPosMode=
    {
        Begin=0,
        Current=1,
        End=2
    }
}

function _M.new()
    local p={}
    setmetatable(p,_M)
    _M.__index=_M
    p.mContext=oTFile_Create()
    return p
end

_M.destory=function(t)
    if t and t.mContext then
        oTFile_Destory(t.mContext)
        t.mContext=nil
        t=nil
    end
end

_M.__gc=function(t)
    _M.destory(t)
end

_M.openFromFile=function(t,path,mode)
    return oTFile_OpenFromFile(t.mContext,path,mode)
end

_M.openFromResources=function(t,path,mode)
    return oTFile_OpenFromResources(t.mContext,path,mode)
end

_M.isOpen=function(t,path,mode)
    return oTFile_IsOpen(t.mContext)
end

_M.close=function(t)
    return oTFile_Close(t.mContext)
end

_M.read=function(t,len)
    local p,rlen=oTFile_Read(t.mContext,len)
    local str=String.new(p)
    local lstr=string.sub(str:c_str(),0,rlen)
    str:destory()
    str=nil
    p=nil
    return lstr,rlen
end

_M.write=function(t,data,len)
    return oTFile_Write(t.mContext,data,len)
end

_M.length=function(t)
    return oTFile_Length(t.mContext)
end

_M.seek=function(t,pos,mode)
    return oTFile_Seek(t.mContext,pos or 0,mode or _M.SeekPosMode.Current)
end

return _M