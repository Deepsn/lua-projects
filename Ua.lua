local players = game:GetService("Players")
local http = game:GetService("HttpService")
local runs = game:GetService("RunService")

-- exploit compatibility:
local _default = "Your exploit isnt supported"

local mousemoverel = mousemoverel or (Input and Input.MoveMouse) or error(_default)
local writefile = writefile or warn("Your exploit doesnt have support for saving/reading config files")
local readfile = readfile or function() end
local loadstring = loadstring or error(_default)
local Drawing = Drawing or warn("Your exploit doesnt have support for the ESP function (Drawing)")

local get = function()
    local g
    local _ = pcall(function()
        g = game.HttpGet
    end)

    if not g then
        g = http.GetAsync
    end

    return g
end get = get()

local lPlayer = players.LocalPlayer
local getChar = function()
    return lPlayer.Character or lPlayer.CharacterAdded:Wait()
end
local mouse = lPlayer:GetMouse()
local lib = loadstring(readfile("uilib.lua"))() -- TODO: PUT THE REAL UILIB URL
local worldRoot = workspace
local aimbot = lib:Window("Aimbot")
local camera = worldRoot.CurrentCamera
local config = {}
local heads = {}
local esp = {}
local isPlayer = function(p)
    assert(p and p.Parent)
    local plr = players:GetPlayerFromCharacter(p.Parent)
    if plr then
        return true
    end

    local function getModel(obj)
        assert(typeof(obj) == "Instance", "expected Instance got ".. typeof(obj))
        if not obj then return nil end
        local last = obj
        for i = 1, #string.split(obj:GetFullName(), '.') do
            last = last:FindFirstAncestorOfClass("Model") or last
        end
        return last
    end

    for i, v in next, players:GetPlayers() do
        if v.Character then
            spawn(function()
                for ii, vv in next, v.Character:GetDescendants() do
                    if vv == p then
                        return true
                    end
                end
            end)
        end
    end

    local character = getModel(p)
    if character then
        plr = players:GetPlayerFromCharacter(character)
        if plr then
            return true
        end 
    end

    return false
end
local isHead = function(o)
    if o and o.Parent and o.Name == "Head" and o.Parent:FindFirstChild("HumanoidRootPart") and o:IsA("BasePart") then
        return true
    end

    return false
end

if writefile and readfile then
    local filename = "aimbot_config.json"
    aimbot:Button("Save config", function()
        config = {
            ESP = aimbot.ESP,
            teamcheck = aimbot.teamcheck,
            visiblecheck = aimbot.visiblecheck,
            ignoreclosest = aimbot.ignoreclosest,
            smooth = aimbot.smooth,
            radius = aimbot.radius,
            range = aimbot.range
        } -- stupid way to do this

        local str = http:JSONEncode(config)
        writefile(filename, tostring(str))
    end)
    
    aimbot:Button("Load config", function()
        local str = readfile(filename)
        config = http:JSONDecode(str)

        for i, v in next, config do
            aimbot[i] = v
        end
    end)
end

aimbot:Toggle2("ESP", {flag = "ESP"})
aimbot:Toggle2("Team Check", {flag = "teamcheck"})
aimbot:Toggle2("Visible Check", {flag = "visiblecheck"})
aimbot:Toggle2("Ignore closest", {flag = "ignoreclosest"})
aimbot:Slider("Aimbot Range", {flag = "range", min = 50, max = 5000, default = 500})
aimbot:Slider("Smooth", {flag = "smooth", min = 2, max = 30})
aimbot:Slider("Radius", {flag = "radius", min = 10, max = 500, default = 50})

aimbot:Toggle2("Toggle Aimbot", {flag = "Toggle"})
aimbot:KeyBind("Toggle Keybind", {default = Enum.KeyCode.T}, function()
    aimbot.Toggle = not aimbot.Toggle
end)

local _3 = runs.RenderStepped:Connect(function()
    if (not aimbot.Toggle or not aimbot.ESP) and esp ~= {} then
        for i, v in next, esp do
            local s, exists = pcall(function()
                return v and v.Visible
            end)
            if s and exists then
                v:Remove()
            else
                pcall(function()
                    v:Remove()
                end)
                esp[i] = nil
            end
        end
    end

    if not aimbot.Toggle then return end

    local smooth = config.smooth or aimbot.smooth or 3
    local ignoreclosest = config.ignoreclosest or aimbot.ignoreclosest or false
    local teamcheck = config.teamcheck or aimbot.teamcheck or false
    local ESP = config.ESP or aimbot.ESP or false
    local visiblecheck = config.visiblecheck or aimbot.visiblecheck or false 
    local radius = config.radius or aimbot.radius or 30

    local center = camera.ViewportSize/2
    local lower = ignoreclosest and Vector2.new(mouse.X, mouse.Y) or getChar():GetBoundingBox().Position
    local _lower = 9e9
    local head

    for i, v in next, heads do
        local player = v and v.Parent and (players:GetPlayerFromCharacter(v.Parent) or players:FindFirstChild(v.Parent.Name))
        local pos = camera:WorldToScreenPoint(v.Position)

        if (teamcheck and player and (player.Team ~= lPlayer.Team or player.Neutral and lPlayer.Neutral) or not teamcheck) and player ~= lPlayer then
            if ESP and player and v and v.Parent and Drawing then
                local circle = esp[player.Name .."_circle"] or Drawing.new("Circle")
                circle.Visible = true
                circle.Position = Vector2.new(pos.X, pos.Y)
                circle.Color = Color3.fromRGB(255, 0, 0)
                circle.Thickness = 10
                circle.Transparency = 1

                local text = esp[player.Name .."_text"] or Drawing.new("Text")
                text.Visible = true
                text.Text = v.Parent.Name 
                text.Position = Vector2.new(pos.X, pos.Y - 15)
                text.Size = 15
                text.Outline = true 
                text.OutlineColor = Color3.fromRGB(255, 0, 0)

                esp[player.Name .."_circle"] = circle 
                esp[player.Name .."_text"] = text
            end

            if ignoreclosest then
                local size = (lower - Vector2.new(pos.X, pos.Y)).Magnitude
            
                if size < _lower then
                    _lower = size 
                    lower = Vector2.new(pos.X, pos.Y)
                    head = v
                end
            else 
                local size = (v.Position - getChar():GetBoundingBox().Position).Magnitude
                
                if size < _lower then
                    _lower = size 
                    lower = v.Position
                    head = v 
                end
            end
        end
    end

    if head then
        if typeof(lower) == "Vector3" then
            local pos, _ = camera:WorldToScreenPoint(lower)
            lower = Vector2.new(pos.X, pos.Y)
        end

        local rad = (lower - center).Magnitude - 36.5
        local result do
            if visiblecheck then
                local cf = camera.CFrame
                local look = cf.LookVector
                local origin = cf.Position + (Vector3.new(0, 0, look.Z) * 5)
                local direction = (head.Position - cf.Position).Unit * ((cf.Position - head.Position).Magnitude - 12) 
                local params = RaycastParams.new()
                params.FilterDescendantsInstances = {camera, getChar()}
                params.FilterType = Enum.RaycastFilterType.Blacklist

                result = workspace:Raycast(origin, direction, params)
                -- if result then
                --     print("hit:", result.Instance)
                --     local a = game:require("util")():viewRay({ Origin = origin, Hit = result.Position })
                --     delay(0.0001, a)
                -- end
            end
        end 
        
        if rad <= radius and (visiblecheck and (not result or result.Instance == v) or not visiblecheck) then
            mousemoverel(-((mouse.X - lower.X) / smooth), -((mouse.Y - lower.Y) / smooth))  
        end
    end
end)

for i, v in next, worldRoot:GetDescendants() do
    if v:IsA("BasePart") and isHead(v) and isPlayer(v) and v.Parent ~= getChar() then
        table.insert(heads, v)
    end
end

local _1 = worldRoot.DescendantAdded:Connect(function(v)
    if v.Name == "Head" and v:IsA("BasePart") and isHead(v) and isPlayer(v) and v.Parent ~= getChar() then
        table.insert(heads, v)
    end
end)

local _2 = worldRoot.DescendantRemoving:Connect(function(v)
    if v.Name == "Head" and v:IsA("BasePart") and isHead(v) then
        local idx = table.find(heads, v) do
            if idx then
                table.remove(heads, idx)
            end
        end
    end
end)

-- local _1 = runs.Stepped:Connect(function()
--     local char = getChar()
--     if char and aimbot.Toggle then
--         local range = config.range or aimbot.range or 500
--         local pos = char:GetBoundingBox().Position
--         local region = Region3.new(
--             Vector3.new(pos.X - range, pos.Y - range, pos.Z - range),
--             Vector3.new(pos.X + range, pos.Y + range, pos.Z + range)
--         )
--         local parts = worldRoot:FindPartsInRegion3WithIgnoreList(region, {char, camera}, worldRoot:GetNumAwakeParts())

--         for i, v in next, parts do
--             spawn(function()
--                 if v:IsA("BasePart") and isHead(v) and isPlayer(v) and v.Parent ~= getChar() and not table.find(heads, v) then
--                     table.insert(heads, v)
--                     local id = v:GetDebugId()
--                     heads[id] = v

--                     local shit;shit = v.Changed:Connect(function()
--                         if v and v.Parent == nil or not v then
--                             heads[id] = nil
--                             shit:Disconnect()
--                         end
--                     end)-- listen
--                 end
--             end)
--         end
--     end
-- end)

aimbot.onUIDelete.Event:Connect(function()
    _1:Disconnect()
    _2:Disconnect()
    _3:Disconnect()
end)