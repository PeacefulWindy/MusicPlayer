local String = require "oT.Base.String"
local UIObject=require "oT.UI.UI.UIObject"

local _M=UIObject.new()

_M.new=function()
    local p={}
    setmetatable(p,_M)
    _M.__index=_M
    p.mContext=oTWindow_Create()
    return p
end

_M.destory=function(t)
    if t and t.mContext then
        oTWindow_Destory(t.mContext)
        t.mContext=nil
        t=nil
    end
end

_M.__gc=function(t)
    _M.destory(t)
end

_M.initialize=function(t)
    return oTWindow_Initialize(t.mContext)
end

_M.show=function(t)
    oTWindow_Show(t.mContext)
end

_M.eventLoop=function(t)
    return oTWindow_EventLoop(t.mContext)
end

_M.setupUI=function(t,value)
    return oTWindow_SetupUI(t.mContext,value.mContext)
end

_M.getWindowBackgroundColor=function(t)
    return oTWindow_GetBackgroundColor(t.mContext)
end

_M.setWindowBackgroundColor=function(t,value)
    return oTWindow_SetBackgroundColor(t.mContext,value.mContext)
end


return _M