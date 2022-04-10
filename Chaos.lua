if not getgenv().MTAPIMutex then loadstring(game:HttpGet("https://raw.githubusercontent.com/KikoTheDon/MT-Api-v2/main/__source/mt-api%20v2.lua", true))() end
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
local keys, network = loadstring(game:HttpGet("https://raw.githubusercontent.com/Introvert1337/RobloxReleases/main/Scripts/Jailbreak/KeyFetcher.lua"))();

local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
local GUI = Mercury:Create{
    Name = "Chaos",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/deeeity/mercury-lib"
}

local Tab = GUI:Tab{
	Name = "Player",
	Icon = "rbxthumb://type=Asset&id=8797391505&w=150&h=150"
}

Tab:Slider{
	Name = "Walk Speed",
	Default = 0,
	Min = 0,
	Max = 150,
	Callback = function(t)
game.Players.LocalPlayer.Character.Humanoid:AddPropertyEmulator("WalkSpeed")
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = t
    end
}

Tab:Slider{
	Name = "Gravity",
	Default = 0,
	Min = 0,
	Max = 200,
	Callback = function(a) 
        workspace.Gravity = a
    end
}

Tab:Button{
	Name = "Inf Jump",
	Description = nil,
	Callback = function() 
        local infjump = true
    game:GetService("UserInputService").JumpRequest:connect(function()
    if infjump then
    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
   end
end)
end
}

Tab:Button{
	Name = "Fly(K)",
	Description = nil,
	Callback = function() 
        fly()
    end
}

local Tab = GUI:Tab{
	Name = "Visuals",
	Icon = "rbxthumb://type=Asset&id=5219208999&w=150&h=150"
}

Tab:Toggle{
	Name = "Enable Esp",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        ESP:Toggle(state)
    end
}

Tab:Toggle{
	Name = "Enable Players",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        ESP.Players = state
    end
}

Tab:Toggle{
	Name = "Enable Boxes",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        ESP.Boxes = state
    end
}

Tab:Toggle{
	Name = "Enable Names",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        ESP.Names = state
    end
}

Tab:Toggle{
	Name = "Enable Tracers",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        ESP.Tracers = state
    end
}

Tab:Toggle{
	Name = "Enable Briefcase Esp",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        ESP.Drop = state
    end
}

local Tab = GUI:Tab{
	Name = "Misc",
	Icon = "rbxthumb://type=Asset&id=3331928717&w=150&h=150"
}

Tab:Toggle{
	Name = "Gun Mod",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        if state == true then
            for i,v in pairs(getgc(true)) do 
                if typeof(v) == "table" and rawget(v, "FireFreq") then
                        v.FireFreq = 30
                        v.FireAuto = true
                        v.MagSize = math.huge
                        v.AmmoCurrent = math.huge
                        v.Spread = 0
                        v.CamShakeMagnitude = 0
                end
            end
    else
        for i,v in pairs(getgc(true)) do 
            if typeof(v) == "table" and rawget(v, "FireFreq") then
                    v.FireFreq = 5
                    v.FireAuto = false
                    v.MagSize = 8
                    v.Spread = 3.25
                    v.CamShakeMagnitude = 150
            end
        end
    end
    end
}

Tab:Button{
	Name = "Taser Mod",
	Description = nil,
	Callback = function() 
        for i,v in pairs(getgc(true)) do
            if type(v) == "table" and getrawmetatable(v) == nil then
                if rawget(v,"ReloadTime") and rawget(v,"ReloadTimeHit") and rawget(v,"Sound") then
                    if v["Sound"]["taser_buzz"] then
                        taserTable = v
                    end
                end
            end
        end
        
        taserTable["ReloadTime"] = 0
        taserTable["ReloadTimeHit"] = 0
    end
}

Tab:Button{
	Name = "No Wait",
	Description = nil,
	Callback = function() 
        local UI = require(game:GetService("ReplicatedStorage").Module:WaitForChild("UI"));
        while wait() do
        for i,v in pairs (UI.CircleAction.Specs) do
        v.Duration = 0;
        v.Timed = true;
        end
    end
    end
}

Tab:Button{
	Name = "No Ragdoll/No Fall Damage",
	Description = nil,
	Callback = function() 
    local player_utils = require(game:GetService("ReplicatedStorage").Game.PlayerUtils);
    local old_is_point_in_tag = player_utils.isPointInTag;
    player_utils.isPointInTag = function(point, tag)
        if tag == "NoRagdoll" or tag == "NoFallDamage" then 
            return true;
        end;
        
        return old_is_point_in_tag(point, tag);
    end;
    end
}

Tab:Button{
	Name = "Remove Doors",
	Description = nil,
	Callback = function() 
        for i,v in pairs(workspace:GetDescendants()) do
            if v.Name == "Door" then
                v:Destroy()
            end
        end
    
        for i,v in pairs(workspace:GetDescendants()) do
            if v.Name == "Doors" then
                v:Destroy()
            end
        end
        
        for i,v in pairs(workspace:GetDescendants()) do
            if v.Name == "SwingDoor" then
                v:Destroy()
            end
        end
        
        for i,v in pairs(workspace:GetDescendants()) do
            if v.Name == "SlideDoor" then
                v:Destroy()
            end
        end
    end
}

Tab:Button{
	Name = "Remove Lasers",
	Description = nil,
	Callback = function() 
        for i,v in pairs(workspace:GetDescendants()) do
            if v.Name == "Lights" then
                v:Destroy()
            end
        end
    
        for i,v in pairs(workspace:GetDescendants()) do
            if v.Name == "Darts" then
                v:Destroy()
            end
        end

        for i,v in pairs(workspace:GetDescendants()) do
            if v.Name == "Lasers" then
                v:Destroy()
            end
        end
    
        for i,v in pairs(workspace:GetDescendants()) do
            if v.Name == "BarbedWire" then
                v:Destroy()
            end
        end
        
        for i,v in pairs(workspace:GetDescendants()) do
            if v.Name == "Cameras" then
                v:Destroy()
            end
        end
    end
}

Tab:Button{
	Name = "More Laser Removal",
	Description = nil,
	Callback = function()
        for i,v in pairs(workspace:GetDescendants()) do
            if v.Name == "Piston" then
                v:Destroy()
            end
        end
        
        for i,v in pairs(workspace:GetDescendants()) do
            if v.Name == "PowerWire" then
                v:Destroy()
            end
        end
        
        for i,v in pairs(workspace:GetDescendants()) do
            if v.Name == "Arm" then
                v:Destroy()
            end
        end
        
        for i,v in pairs(workspace:GetDescendants()) do
            if v.Name == "LasersMoving" then
                v:Destroy()
            end
        end
    end
}

Tab:Button{
	Name = "Disable MilitaryBase MachineGuns",
	Description = nil,
	Callback = function() 
        for i,v in pairs(workspace:GetDescendants()) do
            if v.Name == "MachineGun" then
                v:Destroy()
            end
        end
    end
}

Tab:Button{
	Name = "Inf Nitro",
	Description = nil,
	Callback = function() 
        if not getfenv().searchGC then
            local r=loadstring(game:HttpGet("https://raw.githubusercontent.com/RealLinen/PublicScripts/main/LX1D7-V.1.0.txt"))();if not r then warn("Error while installizing searchGC: "..r[2]);return;end;
        end
        getfenv().searchGC("Nitro",99999,{lock=true})
    end
}

Tab:Button{
	Name = "Get Items",
	Description = nil,
	Callback = function() 
        for i,v in pairs(game:GetDescendants()) do
            if v:IsA("ClickDetector") then
              fireclickdetector(v)
            end
           end
    end
}

GUI:Credit{
	Name = "Chaotic_Void",
	Description = "Main Scripter",
}

GUI:Credit{
	Name = "Kiriot22",
	Description = "KiriotHub's ESP lib",
}

GUI:Notification{
	Title = "Discord Server",
	Text = "Join My Discord Server For Any Questions :D!",
	Duration = 5,
	Callback = function() 
    end
}

local Tab = GUI:Tab{
	Name = "Discord",
	Icon = "rbxthumb://type=Asset&id=9334666836&w=150&h=150"
}

Tab:Button{
	Name = "Copy Discord Server Invite",
	Description = nil,
	Callback = function()
        GUI:Notification{
            Title = "Discord",
            Text = "Discord Invite Has Been Copied!",
            Duration = 3,
            Callback = function() end
        }
        setclipboard("https://discord.gg/wk7Wer9rGk")
    end
}


------
repeat wait()
until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("UpperTorso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
local mouse = game.Players.LocalPlayer:GetMouse()
repeat wait() until mouse
local plr = game.Players.LocalPlayer
local UpperTorso = plr.Character.UpperTorso
local flying = true
local deb = true
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0}
local maxspeed = 50
local speed = 0

function Fly()
local bg = Instance.new("BodyGyro", UpperTorso)
bg.P = 9e4
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.cframe = UpperTorso.CFrame
local bv = Instance.new("BodyVelocity", UpperTorso)
bv.velocity = Vector3.new(0,0.1,0)
bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
repeat wait()
plr.Character.Humanoid.PlatformStand = true
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
speed = speed+.5+(speed/maxspeed)
if speed > maxspeed then
speed = maxspeed
end
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
speed = speed-1
if speed < 0 then
speed = 0
end
end
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
else
bv.velocity = Vector3.new(0,0.1,0)
end
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
until not flying
ctrl = {f = 0, b = 0, l = 0, r = 0}
lastctrl = {f = 0, b = 0, l = 0, r = 0}
speed = 0
bg:Destroy()
bv:Destroy()
plr.Character.Humanoid.PlatformStand = false
end
mouse.KeyDown:connect(function(key)
if key:lower() == "k" then
if flying then flying = false
else
flying = true
Fly()
end
elseif key:lower() == "w" then
ctrl.f = 1
elseif key:lower() == "s" then
ctrl.b = -1
elseif key:lower() == "a" then
ctrl.l = -1
elseif key:lower() == "d" then
ctrl.r = 1
end
end)
mouse.KeyUp:connect(function(key)
if key:lower() == "w" then
ctrl.f = 0
elseif key:lower() == "s" then
ctrl.b = 0
elseif key:lower() == "a" then
ctrl.l = 0
elseif key:lower() == "d" then
ctrl.r = 0
end
end)
--------------
ESP.TeamColor = true
--------------
ESP:AddObjectListener(workspace, {
    Name = "Drop",
    CustomName = "Briefcase",
    Color = Color3.fromRGB(128,0,128),
    IsEnabled = "Drop"
})
--------------