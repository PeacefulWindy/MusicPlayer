local UIBaseObject=require "oT.UI.UI.UIBaseObject"
local String=require "oT.Base.String"
local Color=require "oT.UI.Color.Color"

local _M=UIBaseObject.new()

_M.new=function(parent)
    local p={}
    setmetatable(p,_M)
    
    _M.__index=_M
    p.mContext=oTText_Create(parent or 0)
    
    return p
end

_M.destory=function(t)
    if t and t.mContext then
        oTText_Destory(t.mContext)
        t.mContext=nil
        t=nil
    end
end

_M.__gc=function(t)
    _M.destory(t)
end

_M.getText=function(t)
    return String.newFromCPointer(oTText_GetText(t.mContext))
end

_M.setText=function(t,value)
    if type(value)=="number" then
        local str=String.new(value)
        oTText_SetText(t.mContext,str.mContext)
        str:destory()
    elseif type(value)=="string" then
        local str=String.new(value)
        oTText_SetText(t.mContext,str)
        str:destory()
    elseif type(value)=="table" then
        oTText_SetText(t.mContext,value.mContext)
    end
end

_M.getTextColor=function(t)
    return Color.newFromCPointer(oTText_GetText(t.mContext))
end

_M.setTextColor=function(t,r,g,b,a)
    if type(r)=="number" then
        oTText_SetTextColor(t.mContext,r.mContext)
    else
        local value=Color.new(r or 0,g or 0,b or 0,a or 1)
        oTText_SetTextColor(t.mContext,value)
        str:destory()
    end
end

-- _M.getFont=function(t)
--     return Font.newFromCPointer(oTText_GetFont(t.mContext))
-- end

-- _M.setFont=function(t,value)
--     oTText_SetFont(t.mContext,value.mContext)
-- end

_M.getFontSize=function(t)
    return oTText_GetFontSize(t.mContext)
end

_M.setFontSize=function(t,value)
    oTText_SetFontSize(t.mContext,value)
end

return _M