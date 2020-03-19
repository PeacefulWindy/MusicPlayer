local String = require "oT.Base.String"

local _M=
{
    mContext=nil,
}

_M.new=function(path)
    local p={}
    setmetatable(p,_M)
    _M.__index=_M
    p.mContext=oTFileSystem_Create(path or "")
    return p
end

_M.destory=function(t)
    if t and t.mContext then
        oTFileSystem_Destory(t.mContext)
        t.mContext=nil
        t=nil
    end
end

_M.__gc=function(t)
    _M.destory(t)
end

_M.getPath=function(t,isBlackSlash)
    if not isBlackSlash then
        isBlackSlash=0
    else
        isBlackSlash=1
    end

    return oTFileSystem_GetPath(t.mContext,isBlackSlash)
end

_M.setPath=function(t,value,isBlackSlash)
    if not isBlackSlash then
        isBlackSlash=0
    else
        isBlackSlash=1
    end

    oTFileSystem_SetPath(t.mContext,value,isBlackSlash)
end

_M.isFile=function(t)
    return oTFileSystem_IsFile(t.mContext)
end

_M.isDirectory=function(t)
    return oTFileSystem_IsDirectory(t.mContext)
end

_M.isExist=function(t)
    return oTFileSystem_IsExist(t.mContext)
end

_M.createDirectory=function(t)
    return oTFileSystem_CreateDirectory(t.mContext)
end

_M.isRelativePath=function(t)
    return oTFileSystem_IsRelativePath(t.mContext)
end

_M.getRelativePath=function(t,isBlackSlash)
    if not isBlackSlash then
        isBlackSlash=0
    else
        isBlackSlash=1
    end

    return oTFileSystem_GetRelativePath(t.mContext,isBlackSlash)
end

_M.isAbsolutePath=function(t)
    return oTFileSystem_IsAbsolutePath(t.mContext)
end

_M.getAbsolutePath=function(t,isBlackSlash)
    if not isBlackSlash then
        isBlackSlash=0
    else
        isBlackSlash=1
    end

    return oTFileSystem_GetAbsolutePath(t.mContext,isBlackSlash)
end

_M.getParentPath=function(t,isBlackSlash)
    if not isBlackSlash then
        isBlackSlash=0
    else
        isBlackSlash=1
    end

    return oTFileSystem_GetParentPath(t.mContext,isBlackSlash)
end

_M.getFileName=function(t,value)
    return oTFileSystem_GetFileName(t.mContext,value)
end

_M.hasStem=function(t)
    return oTFileSystem_HasStem(t.mContext)
end

_M.getStem=function(t)
    return oTFileSystem_GetStem(t.mContext)
end

_M.hasExtension=function(t)
    return oTFileSystem_HasExtension(t.mContext)
end

_M.getExtension=function(t)
    return oTFileSystem_GetExtension(t.mContext)
end

_M.getFiles=function(t,value)
    return oTFileSystem_GetFiles(t.mContext,value or "")
end

_M.getDirs=function(t)
    return oTFileSystem_GetDirs(t.mContext,value or "")
end

return _M