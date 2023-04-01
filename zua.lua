game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Zua has injected", -- Required
	Text = "Catch them lockers", -- Required
	Icon = "rbxthumb://type=Asset&id=11176073582&w=150&h=150" -- Optional
})


getgenv().Sky = true 
getgenv().SkyAmount = 700

function Notify(message, duration, icon)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Zua Anti Lock",
        Text = message,
        Duration = duration or 5,
        Icon = icon or "rbxassetid://4384402054",
    })
end

game:GetService("RunService").heartbeat:Connect(function()
    if getgenv().Sky ~= true then 
    local vel = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,      getgenv().SkyAmount,0) 
    game:GetService("RunService").RenderStepped:Wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = vel
    end 
end)

game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KeyPressed)
    if KeyPressed == "z" then
 if getgenv().Sky == false then
getgenv().Sky = true
 
Notify('Sky AA enabled', nil, "rbxthumb://type=Asset&id=11176073582&w=150&h=150")
else
getgenv().Sky = false

Notify('Sky AA disabled', nil, "rbxthumb://type=Asset&id=11176073582&w=150&h=150")
end
end
end)


-- aim viewer

game.StarterGui:SetCore("SendNotification", {
    Title = "Zua's Aim Viewer";
    Text = "Toggles: P = Enabled Aim Viewer | - | T = Aim View the target | - | Z = Anti Lock";
    Icon = "rbxthumb://type=Asset&id=11176073582&w=150&h=150";
 
})
 
_G.enable = false
_G.color = Color3.fromRGB(255,48,48)
_G.toggle_keybind = "p" -- enable tracer and disable
_G.swith_nigga = 't' -- press t and u will see a noti on the user ur tracer is on 
_G.method = "MousePos" --had a stroke
 
if game.PlaceId == 9633073067 then
    _G.method = "MousePos"
end
 
 
 
 
---------------------------------------------------------------
local rs = game:GetService("RunService")
local localPlayer = game.Players.LocalPlayer
local mouse = localPlayer:GetMouse()
local target;
 
 
 
function getgun()
    for i,v in pairs(target.Character:GetChildren()) do
        if v and (v:FindFirstChild('Default') or v:FindFirstChild('Handle') )then
            return v
        end
    end
end
 
function sendnotifi(message)
 
 
    game.StarterGui:SetCore("SendNotification", {
        Title = "Aim Viewer";
        Text = message;
        Icon = "rbxthumb://type=Asset&id=11176073582&w=150&h=150";
        Duration = "1";
    })
 
    end
 
 
function get_closet()
    local a = math.huge
    local b;
 
 
 
    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Head") and  v.Character:FindFirstChild("HumanoidRootPart")  then
            local c = game.Workspace.CurrentCamera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local d = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(c.X, c.Y)).Magnitude
 
            if a > d then
                b = v
                a = d
            end
        end
    end
 
    return b
end
 
--- 
mouse.KeyDown:Connect(function(z)
    if z == _G.toggle_keybind then
        if _G.enable == false then
            _G.enable = true
            sendnotifi("Enabled")
        elseif _G.enable == true then
            _G.enable = false 
            sendnotifi("Disabled")
        end
    end
end) -- .gg/zua
 
mouse.KeyDown:Connect(function(z)
    if z == _G.swith_nigga then
        target = get_closet()
        sendnotifi("targeting: "..tostring(target.Name))
    end
end)
---
 
-- minified it 
local a=Instance.new("Beam")a.Segments=1;a.Width0=0.2;a.Width1=0.2;a.Color=ColorSequence.new(_G.color)a.FaceCamera=true;local b=Instance.new("Attachment")local c=Instance.new("Attachment")a.Attachment0=b;a.Attachment1=c;a.Parent=workspace.Terrain;b.Parent=workspace.Terrain;c.Parent=workspace.Terrain
 
task.spawn(function()
    rs.RenderStepped:Connect(function()
 
    local character = localPlayer.Character
        if not character then
        a.Enabled = false
        return
    end
 
 
 
 
 
 
    if _G.enable  and getgun() and target.Character:FindFirstChild("BodyEffects") and target.Character:FindFirstChild("Head")  then
        a.Enabled = true
        b.Position =  target.Character:FindFirstChild("Head").Position
        c.Position = target.Character.BodyEffects[_G.method].Value ---edit this if some random ass game got some weird ass other name :palingface
    else
        a.Enabled = false
    end
 
    end)
end)