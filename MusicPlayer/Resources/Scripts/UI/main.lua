local Factory=require "oT.UI.UIFactory.UIFactory"
local Sprite= require "oT.UI.UI.Sprite"

local data=
{
    {type="Sprite",position={x=0,y=0},scaled={x=1280,y=720},anchors={x=0,y=0},src="logo.webp",visible=true,name="sprite"},
    {type="Text",position={x=0,y=0},scaled={x=1280,y=720},anchors={x=0,y=0},text="Hello World!",visible=true,name="text"}
}

local sprite=nil
local factory=nil

function initialize()
    factory=Factory.new()
    if not factory:build(data) then
        return false
    end

    return true
end

function onPause()

end

function onResume()
    
end

function onEnter(parent)
    factory.onEnter(parent)
end

function update(time)
    
end

function onExit()
    
end

function onDestory()
    factory:destory()
end