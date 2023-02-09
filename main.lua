local engine = loadstring(game:HttpGet("https://raw.githubusercontent.com/Singularity5490/rbimgui-2/main/rbimgui-2.lua"))()

local window1 = engine.new({
    text = "Hyper's Silent Assassin Script",
    size = UDim2.new(300, 200),
})

window1.open()

local tab1 = window1.new({
    text = "Main",
})

local switch1 = tab1.new("switch", {
    text = "Role Esp";
})
switch1.set(true)
switch1.event:Connect(function(bool)
    print("switch set to: ", bool)
    game:getService("RunService").RenderStepped:Connect(function()
    for _, v in pairs(game.Players:GetPlayers()) do
        if v.Name ~= game.Players.LocalPlayer.Name then
            local b = v.Character:FindFirstChild("hlg") or Instance.new("Highlight", v.Character)
            b.Name = "hlg"
            b.Enabled = bool
            if workspace.assassin.pname.Value == v.Name then
                b.FillColor = Color3.new(1,0,0)
            elseif workspace.target.pname.Value == v.Name then
                b.FillColor = Color3.new(0,1,0)
            else 
                b.FillColor = Color3.new(0,0,1)
            end
        end
    end
    end)
end)

local switch2 = tab1.new("switch", {
    text = "Wallbang";
})
switch2.set(true)
switch2.event:Connect(function(bool)
    print("switch set to: ", bool)
    game:getService("RunService").RenderStepped:Connect(function()
    if bool == true then
        spawn(function()
        for _, v in pairs(workspace:FindFirstChild("Map"):FindFirstChild("OtherParts"):GetChildren()) do
            v.Parent = workspace:FindFirstChild("Map").BulletsGoThrough
        end 
        end)
    elseif bool == false then
        spawn(function()
        for _, v in pairs(workspace:FindFirstChild("Map"):FindFirstChild("BulletsGoThrough"):GetChildren()) do
            if v.Name == "OtherParts" then
                v.Parent = workspace:FindFirstChild("Map")
            end
        end 
        end) 
    end
    end)
end)

local slider1 = tab1.new("slider", {
    text = "Head Size",
    color = Color3.new(0.06, 0.02, 0.48),
    min = 3,
    max = 5,
    value = 5,
    rounding = 1,
})
slider1.event:Connect(function(x)
    print("hitbox slider value: " .. x)
    game:getService("RunService").RenderStepped:Connect(function()
    for _, v in pairs(game.Players:GetPlayers()) do
        if v.Name ~= game.Players.LocalPlayer.Name then
        v.Character:FindFirstChild("Head").Size = Vector3.new(x,x,x)
        end
    end
    end)
end)
slider1.set(5)

local label = tab1.new("label", {
    text = "Script made by 7Hypr",
    color = Color3.new(1,1,1)
})
