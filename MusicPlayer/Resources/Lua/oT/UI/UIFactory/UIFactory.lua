local Table=require "oT.Exception.Table"
local Sprite=require "oT.UI.UI.Sprite"
local Text=require "oT.UI.UI.Text"
local Vec2=require "oT.Base.Vec2"
local Vec3=require "oT.Base.Vec3"
local String=require "oT.Base.String"

local UIType=
{
    {type="Sprite",class=Sprite},
    {type="Text",class=Text},
}

local _M=
{
    data={},
    ui={},
}

_M.new=function()
    local p={}
    setmetatable(p,_M)
    _M.__index=_M
    return p
end

_M.destory=function(t)
    t.data=nil
end

_M.__gc=function(t)

end

local setPosition=function(ptr,value)
    if value then
        local p=Vec3.new()
        if value.x and p.setX then
            p:setX(value.x)
        end
        if value.y and p.setY then
            p:setY(value.y)
        end
        if value.z and p.setZ then
            p:setZ(value.z)
        end
        ptr:setPosition(p)
        p:destory()
    end
end

local setRotate=function(ptr,value)
    if value then
        local p=Vec3.new()
        if value.x and p.setX then
            p:setX(value.x)
        end
        if value.y and p.setY then
            p:setY(value.y)
        end
        if value.z and p.setZ then
            p:setZ(value.z)
        end
        ptr:setRotate(p)
        p:destory()
    end
end

local setScaled=function(ptr,value)
    if value then
        local p=Vec3.new()
        if value.x and p.setX then
            p:setX(value.x)
        end
        if value.y and p.setY then
            p:setY(value.y)
        end
        if value.z and p.setZ then
            p:setZ(value.z)
        end
        ptr:setScaled(p)
        p:destory()
    end
end

local setEndPosition=function(ptr,value)
    if value then
        local p=Vec3.new()
        if value.x and p.setX then
            p:setX(value.x)
        end
        if value.y and p.setY then
            p:setY(value.y)
        end
        if value.z and p.setZ then
            p:setZ(value.z)
        end
        ptr:setPosition(p)
        p:destory()
    end
end

local setEndRotate=function(ptr,value)
    if value then
        local p=Vec3.new()
        if value.x and p.setX then
            p:setX(value.x)
        end
        if value.y and p.setY then
            p:setY(value.y)
        end
        if value.z and p.setZ then
            p:setZ(value.z)
        end
        ptr:setRotate(p)
        p:destory()
    end
end

local setEndScaled=function(ptr,value)
    if value then
        local p=Vec3.new()
        if value.x and p.setX then
            p:setX(value.x)
        end
        if value.y and p.setY then
            p:setY(value.y)
        end
        if value.z and p.setZ then
            p:setZ(value.z)
        end
        ptr:setScaled(p)
        p:destory()
    end
end

local setVisible=function(ptr,value)
    if value then
        ptr:setVisible(value)
    end
end

local setText=function(ptr,value)
    if value and ptr.setText then
        local str=String.new(value)
        ptr:setText(str)
        str:destory()
    end
end

local openFromResources=function(ptr,value)
    if value and ptr.openFromResources then
        ptr:openFromResources(value)
    end
end

local setAnchors=function(ptr,value)
    if value then
        local p=Vec2.new(0.5,0.5)
        if value.x and p.setX then
            p:setX(value.x)
        end
        if value.y and p.setY then
            p:setY(value.y)
        end
        ptr:setAnchors(p)
    end
end

local setObjectName=function(ptr,value)
    if value and ptr.setObjectName then
        ptr:setObjectName(value)
    end
end

_M.build=function(t,data)
    if not t then
        return false
    end

    _M.data=Table.copy(data)

    for _,dat in pairs(_M.data) do
        local class=nil
        if dat.type then
            for _,v in pairs(UIType) do
                if v.type==dat.type then
                    class=v.class
                end
            end
        end

        if class then
            local ptr=class.new()
            setPosition(ptr,dat.position)
            setRotate(ptr,dat.rotate)
            setScaled(ptr,dat.scaled)
            setEndPosition(ptr,dat.endPosition)
            setEndRotate(ptr,dat.endRotate)
            setEndScaled(ptr,dat.endScaled)
            openFromResources(ptr,dat.src)
            setText(ptr,dat.text)
            setVisible(ptr,dat.visible)
            setAnchors(ptr,dat.anchors)
            setObjectName(ptr,dat.name)
            table.insert(_M.ui,ptr)
        end
    end

    return true
end

_M.onEnter=function(parent)
    for _,data in pairs(_M.ui) do
        data:setParent(parent)
    end
end

_M.onExit=function(parent)
    for _,data in pairs(_M.ui) do
        data:setParent(0)
    end
end

_M.destory=function()
    for _,data in pairs(_M.ui) do
        data:destory()
    end
end

return _M