-- [[ KLAUS SOFTWARE - FPS GERİ ÇEKİL EDITION ]] --

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local function GetGui()
    local ok, res = pcall(function() return game:GetService("CoreGui") end)
    if ok and res then return res end
    return LocalPlayer:WaitForChild("PlayerGui")
end

local GuiParent = GetGui()
if GuiParent:FindFirstChild("KlausSoftwareFixed") then
    GuiParent.KlausSoftwareFixed:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KlausSoftwareFixed"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = GuiParent
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Parent = ScreenGui
ToggleBtn.Position = UDim2.new(0.02, 0, 0.2, 0)
ToggleBtn.Size = UDim2.new(0, 55, 0, 55)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(156, 142, 230)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.Text = "Klaus"
ToggleBtn.TextColor3 = Color3.fromRGB(24, 23, 34)
ToggleBtn.TextSize = 13
ToggleBtn.Active = true
ToggleBtn.Draggable = true
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 50)

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(24, 23, 34)
MainFrame.Position = UDim2.new(0.25, 0, 0.15, 0)
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

local Sidebar = Instance.new("Frame")
Sidebar.Parent = MainFrame
Sidebar.BackgroundColor3 = Color3.fromRGB(19, 18, 26)
Sidebar.Size = UDim2.new(0, 140, 1, 0)
Sidebar.ZIndex = 2
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 8)

local BrandLabel = Instance.new("TextLabel")
BrandLabel.Parent = Sidebar
BrandLabel.BackgroundTransparency = 1
BrandLabel.Position = UDim2.new(0, 12, 0, 15)
BrandLabel.Size = UDim2.new(0, 120, 0, 25)
BrandLabel.Font = Enum.Font.GothamBold
BrandLabel.Text = "KLAUS SOFTWARE"
BrandLabel.TextColor3 = Color3.fromRGB(156, 142, 230)
BrandLabel.TextSize = 12
BrandLabel.TextXAlignment = Enum.TextXAlignment.Left
BrandLabel.ZIndex = 3

local TabContainer = Instance.new("Frame")
TabContainer.Parent = Sidebar
TabContainer.BackgroundTransparency = 1
TabContainer.Position = UDim2.new(0, 10, 0, 55)
TabContainer.Size = UDim2.new(0, 120, 0, 280)
TabContainer.ZIndex = 3
local TabLayout = Instance.new("UIListLayout")
TabLayout.Parent = TabContainer
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.Padding = UDim.new(0, 6)

-- Developer etiketi (sağ alt)
local DevLabel = Instance.new("TextLabel")
DevLabel.Parent = Sidebar
DevLabel.BackgroundTransparency = 1
DevLabel.Position = UDim2.new(0, 12, 1, -40)
DevLabel.Size = UDim2.new(0, 120, 0, 16)
DevLabel.Font = Enum.Font.GothamBold
DevLabel.Text = "Developer: zyrotht"
DevLabel.TextColor3 = Color3.fromRGB(156, 142, 230)
DevLabel.TextSize = 8
DevLabel.TextXAlignment = Enum.TextXAlignment.Left
DevLabel.ZIndex = 3

local FooterLabel = Instance.new("TextLabel")
FooterLabel.Parent = Sidebar
FooterLabel.BackgroundTransparency = 1
FooterLabel.Position = UDim2.new(0, 12, 1, -25)
FooterLabel.Size = UDim2.new(0, 120, 0, 20)
FooterLabel.Font = Enum.Font.Gotham
FooterLabel.Text = "FPS EDITION"
FooterLabel.TextColor3 = Color3.fromRGB(80, 80, 100)
FooterLabel.TextSize = 9
FooterLabel.TextXAlignment = Enum.TextXAlignment.Left
FooterLabel.ZIndex = 3

local ContentArea = Instance.new("Frame")
ContentArea.Parent = MainFrame
ContentArea.BackgroundTransparency = 1
ContentArea.Position = UDim2.new(0, 155, 0, 15)
ContentArea.Size = UDim2.new(0, 430, 0, 370)
ContentArea.ZIndex = 2
ContentArea.ClipsDescendants = true

local function MakePage()
    local p = Instance.new("ScrollingFrame")
    p.Parent = ContentArea
    p.BackgroundTransparency = 1
    p.Size = UDim2.new(1, 0, 1, 0)
    p.Visible = false
    p.ZIndex = 3
    p.ScrollBarThickness = 3
    p.AutomaticCanvasSize = Enum.AutomaticSize.Y
    p.CanvasSize = UDim2.new(0, 0, 0, 0)
    local layout = Instance.new("UIListLayout")
    layout.Parent = p
    layout.Padding = UDim.new(0, 8)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    return p
end

local AimbotPage = MakePage()
AimbotPage.Visible = true
local VisualsPage = MakePage()
local MiscPage = MakePage()

local function CreateSectionLabel(parent, text)
    local lbl = Instance.new("TextLabel")
    lbl.Parent = parent
    lbl.Size = UDim2.new(0.95, 0, 0, 22)
    lbl.BackgroundTransparency = 1
    lbl.Font = Enum.Font.GothamBold
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(156, 142, 230)
    lbl.TextSize = 11
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 4
end

local function CreateToggleButton(parent, labelText, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Size = UDim2.new(0.95, 0, 0, 42)
    btn.BackgroundColor3 = Color3.fromRGB(33, 31, 48)
    btn.Font = Enum.Font.GothamSemibold
    btn.Text = labelText .. "  [OFF]"
    btn.TextColor3 = Color3.fromRGB(200, 200, 220)
    btn.TextSize = 12
    btn.ZIndex = 4
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
    local on = false
    btn.MouseButton1Click:Connect(function()
        on = not on
        if on then
            btn.Text = labelText .. "  [ON]"
            btn.BackgroundColor3 = Color3.fromRGB(156, 142, 230)
            btn.TextColor3 = Color3.fromRGB(24, 23, 34)
        else
            btn.Text = labelText .. "  [OFF]"
            btn.BackgroundColor3 = Color3.fromRGB(33, 31, 48)
            btn.TextColor3 = Color3.fromRGB(200, 200, 220)
        end
        callback(on)
    end)
    return btn
end

local function CreateSlider(parent, labelText, minVal, maxVal, defaultVal, callback)
    local container = Instance.new("Frame")
    container.Parent = parent
    container.Size = UDim2.new(0.95, 0, 0, 58)
    container.BackgroundColor3 = Color3.fromRGB(33, 31, 48)
    container.ZIndex = 4
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 5)
    local title = Instance.new("TextLabel")
    title.Parent = container
    title.Size = UDim2.new(0.72, 0, 0, 22)
    title.Position = UDim2.new(0, 8, 0, 4)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamSemibold
    title.Text = labelText
    title.TextColor3 = Color3.fromRGB(200, 200, 220)
    title.TextSize = 12
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.ZIndex = 5
    local valLabel = Instance.new("TextLabel")
    valLabel.Parent = container
    valLabel.Size = UDim2.new(0.25, 0, 0, 22)
    valLabel.Position = UDim2.new(0.72, 0, 0, 4)
    valLabel.BackgroundTransparency = 1
    valLabel.Font = Enum.Font.GothamBold
    valLabel.Text = tostring(defaultVal)
    valLabel.TextColor3 = Color3.fromRGB(156, 142, 230)
    valLabel.TextSize = 13
    valLabel.TextXAlignment = Enum.TextXAlignment.Right
    valLabel.ZIndex = 5
    local bg = Instance.new("Frame")
    bg.Parent = container
    bg.Position = UDim2.new(0, 8, 0, 36)
    bg.Size = UDim2.new(1, -16, 0, 10)
    bg.BackgroundColor3 = Color3.fromRGB(50, 48, 70)
    bg.ZIndex = 5
    Instance.new("UICorner", bg).CornerRadius = UDim.new(0, 5)
    local fill = Instance.new("Frame")
    fill.Parent = bg
    fill.Size = UDim2.new((defaultVal - minVal) / (maxVal - minVal), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(156, 142, 230)
    fill.ZIndex = 6
    Instance.new("UICorner", fill).CornerRadius = UDim.new(0, 5)
    local dragging = false
    local function update(inputX)
        local ratio = math.clamp((inputX - bg.AbsolutePosition.X) / bg.AbsoluteSize.X, 0, 1)
        local val = math.floor(minVal + ratio * (maxVal - minVal))
        fill.Size = UDim2.new(ratio, 0, 1, 0)
        valLabel.Text = tostring(val)
        callback(val)
    end
    bg.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true; update(i.Position.X)
        end
    end)
    bg.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(i)
        if dragging and (i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseMovement) then
            update(i.Position.X)
        end
    end)
end

-- ============================================ --
--         KARAKTER YARDIMCI FONKSİYONLAR      --
-- ============================================ --
local function IsCharLoaded(char)
    for _, v in ipairs(char:GetDescendants()) do
        if v:IsA("BasePart") then return true end
    end
    return false
end

local function GetHeadPos(char)
    local head = char:FindFirstChild("Head")
    if head and head:IsA("BasePart") then return head.Position end
    local best, highY = nil, -math.huge
    for _, v in ipairs(char:GetDescendants()) do
        if v:IsA("BasePart") and not v.Name:lower():find("handle") then
            if v.Position.Y > highY then highY = v.Position.Y; best = v end
        end
    end
    if best then return best.Position end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if hrp then return hrp.Position end
    return nil
end

local function GetCenterPos(char)
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if hrp then return hrp.Position end
    local head = char:FindFirstChild("Head")
    if head then return head.Position end
    local torso = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
    if torso then return torso.Position end
    if char.PrimaryPart then return char.PrimaryPart.Position end
    local ok, piv = pcall(function() return char:GetPivot() end)
    if ok and piv then return piv.Position end
    for _, v in ipairs(char:GetDescendants()) do
        if v:IsA("BasePart") then return v.Position end
    end
    return nil
end

local function GetCharHeight(char)
    local minY, maxY, count = math.huge, -math.huge, 0
    local ignored = {}
    for _, acc in ipairs(char:GetChildren()) do
        if acc:IsA("Accessory") then
            local h = acc:FindFirstChild("Handle")
            if h then ignored[h] = true end
        end
    end
    for _, v in ipairs(char:GetDescendants()) do
        if v:IsA("BasePart") and not ignored[v] then
            minY = math.min(minY, v.Position.Y)
            maxY = math.max(maxY, v.Position.Y)
            count += 1
        end
    end
    if count < 2 then return 5 end
    return math.max(maxY - minY, 3)
end

local function GetScreenBBox(char)
    local center = GetCenterPos(char)
    if not center then return nil end
    local centerSc = Camera:WorldToViewportPoint(center)
    if centerSc.Z <= 0 then return nil end
    local height = GetCharHeight(char)
    local halfH  = height / 2
    local topSc  = Camera:WorldToViewportPoint(center + Vector3.new(0,  halfH, 0))
    local botSc  = Camera:WorldToViewportPoint(center + Vector3.new(0, -halfH, 0))
    local screenH = math.abs(botSc.Y - topSc.Y)
    screenH = math.clamp(screenH, 30, Camera.ViewportSize.Y * 1.5)
    local screenW = math.clamp(screenH * 0.55, 20, Camera.ViewportSize.X)
    local cx  = math.clamp(centerSc.X, -200, Camera.ViewportSize.X + 200)
    local cy  = math.clamp((topSc.Y + botSc.Y) / 2, -200, Camera.ViewportSize.Y + 200)
    local pad = 6
    return {
        minX    = cx - screenW/2 - pad,
        minY    = cy - screenH/2 - pad,
        maxX    = cx + screenW/2 + pad,
        maxY    = cy + screenH/2 + pad,
        centerX = cx,
        bottomX = cx,
        bottomY = cy + screenH/2 + pad,
        dist    = (Camera.CFrame.Position - center).Magnitude,
    }
end

local function IsAlive(char)
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then return hum.Health > 0 end
    return true
end

local function IsVisible(char)
    local pos = GetHeadPos(char)
    if not pos then pos = GetCenterPos(char) end
    if not pos then return false end
    local params = RaycastParams.new()
    params.FilterDescendantsInstances = {LocalPlayer.Character, char}
    params.FilterType = Enum.RaycastFilterType.Exclude
    local result = workspace:Raycast(Camera.CFrame.Position, pos - Camera.CFrame.Position, params)
    return result == nil
end

-- ============================================ --
--      AIMBOT / FOV - KAFA KİLİDİ             --
-- ============================================ --
local AimbotActive   = false
local FovActive      = false
local FovSize        = 150
local VisCheckActive = false

CreateSectionLabel(AimbotPage, "  🎯  AİMBOT & FOV")
CreateToggleButton(AimbotPage, "Aimbot Lock (Kafa)",                function(s) AimbotActive   = s end)
CreateToggleButton(AimbotPage, "Draw FOV Circle",                   function(s) FovActive      = s end)
CreateToggleButton(AimbotPage, "Visible Check (Sadece görünenler)", function(s) VisCheckActive = s end)
CreateSlider(AimbotPage, "FOV Boyutu", 30, 600, 150,                function(v) FovSize        = v end)

local function GetClosestInFov()
    local closest, minDist = nil, math.huge
    local center2d = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    for _, player in ipairs(Players:GetPlayers()) do
        if player == LocalPlayer then continue end
        local char = player.Character
        if not char or not IsCharLoaded(char) then continue end
        if not IsAlive(char) then continue end
        local pos = GetHeadPos(char)
        if not pos then continue end
        local sc, onScreen = Camera:WorldToViewportPoint(pos)
        if not onScreen then continue end
        local dist2d = (Vector2.new(sc.X, sc.Y) - center2d).Magnitude
        if dist2d < FovSize and dist2d < minDist then
            if VisCheckActive and not IsVisible(char) then continue end
            closest = player; minDist = dist2d
        end
    end
    return closest
end

local FovCircle     = Drawing.new("Circle")
FovCircle.Visible   = false
FovCircle.Color     = Color3.fromRGB(156, 142, 230)
FovCircle.Thickness = 2
FovCircle.Filled    = false
FovCircle.NumSides  = 64

RunService.RenderStepped:Connect(function()
    FovCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    FovCircle.Radius   = FovSize
    FovCircle.Visible  = FovActive
    if AimbotActive then
        local target = GetClosestInFov()
        if target and target.Character then
            local headPos = GetHeadPos(target.Character)
            if headPos then
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, headPos)
            end
        end
    end
end)

-- ============================================ --
--              VISUALS SAYFASI                 --
-- ============================================ --
local ChamsActive = false
local BoxActive   = false
local SnapActive  = false
local DistActive  = false

CreateSectionLabel(VisualsPage, "  👁  ESP AYARLARI")
CreateToggleButton(VisualsPage, "Chams / Highlight ESP", function(s)
    ChamsActive = s
    if not s then
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local ex = p.Character:FindFirstChild("KlausChams")
                if ex then ex:Destroy() end
            end
        end
    end
end)
CreateToggleButton(VisualsPage, "2D Box ESP",   function(s) BoxActive  = s end)
CreateToggleButton(VisualsPage, "Snapline ESP", function(s) SnapActive = s end)
CreateToggleButton(VisualsPage, "Distance ESP", function(s) DistActive = s end)

local ESPCache    = {}
local ChamsFolder = Instance.new("Folder")
ChamsFolder.Name   = "KlausChamsFolder"
ChamsFolder.Parent = ScreenGui
local ChamsMap    = {}

local function AddHighlight(player, char)
    local existing = ChamsMap[player]
    if existing and existing.Parent ~= nil and existing.Adornee == char then return end
    if existing then pcall(function() existing:Destroy() end) end
    local h = Instance.new("Highlight")
    h.Name                = "KlausChams_" .. player.UserId
    h.FillColor           = Color3.fromRGB(156, 142, 230)
    h.OutlineColor        = Color3.fromRGB(255, 255, 255)
    h.FillTransparency    = 0.4
    h.OutlineTransparency = 0
    h.DepthMode           = Enum.HighlightDepthMode.AlwaysOnTop
    h.Adornee             = char
    h.Parent              = ChamsFolder
    ChamsMap[player]      = h
end

local function RemoveHighlight(player)
    local h = ChamsMap[player]
    if h then pcall(function() h:Destroy() end) ChamsMap[player] = nil end
end

local function GetESP(player)
    if ESPCache[player] then return ESPCache[player] end
    local obj = { Lines = {} }
    for i = 1, 4 do
        local l = Drawing.new("Line")
        l.Visible = false; l.Color = Color3.fromRGB(156, 142, 230); l.Thickness = 1.5
        obj.Lines[i] = l
    end
    obj.Snap = Drawing.new("Line")
    obj.Snap.Visible = false; obj.Snap.Color = Color3.fromRGB(255, 80, 80); obj.Snap.Thickness = 1.5
    obj.Dist = Drawing.new("Text")
    obj.Dist.Visible = false; obj.Dist.Color = Color3.fromRGB(255, 255, 255)
    obj.Dist.Size = 14; obj.Dist.Font = 2; obj.Dist.Outline = true; obj.Dist.Center = true
    ESPCache[player] = obj
    return obj
end

local function HideESP(obj)
    for _, l in pairs(obj.Lines) do l.Visible = false end
    obj.Snap.Visible = false; obj.Dist.Visible = false
end

local function ClearESP(player)
    if not ESPCache[player] then return end
    for _, l in pairs(ESPCache[player].Lines) do pcall(function() l:Remove() end) end
    pcall(function() ESPCache[player].Snap:Remove() end)
    pcall(function() ESPCache[player].Dist:Remove() end)
    ESPCache[player] = nil
end

local function HookPlayer(player)
    player.CharacterAdded:Connect(function(char)
        ClearESP(player); RemoveHighlight(player)
        task.spawn(function()
            local t = 0
            repeat task.wait(0.1); t += 0.1 until IsCharLoaded(char) or t > 5
            if ChamsActive and player.Character == char then
                AddHighlight(player, char)
            end
        end)
    end)
end

for _, p in ipairs(Players:GetPlayers()) do
    if p ~= LocalPlayer then HookPlayer(p) end
end
Players.PlayerAdded:Connect(function(p)
    if p ~= LocalPlayer then HookPlayer(p) end
end)
Players.PlayerRemoving:Connect(function(p)
    ClearESP(p); RemoveHighlight(p)
end)

-- ============================================ --
--   ESP HEARTBEAT - YÜKLENME KONTROLLÜ        --
-- ============================================ --
RunService.Heartbeat:Connect(function()
    for _, player in ipairs(Players:GetPlayers()) do
        if player == LocalPlayer then continue end
        local char = player.Character
        if not char then
            if ESPCache[player] then HideESP(ESPCache[player]) end
            RemoveHighlight(player); continue
        end

        if not IsCharLoaded(char) then
            if ESPCache[player] then HideESP(ESPCache[player]) end
            if ChamsActive then AddHighlight(player, char) end
            continue
        end

        local obj = GetESP(player)
        if ChamsActive then AddHighlight(player, char) else RemoveHighlight(player) end
        if not (BoxActive or SnapActive or DistActive) then HideESP(obj) continue end
        if not IsAlive(char) then HideESP(obj) continue end

        local bb = GetScreenBBox(char)
        if not bb then HideESP(obj) continue end
        if (bb.maxX - bb.minX) < 4 or (bb.maxY - bb.minY) < 4 then HideESP(obj) continue end

        if BoxActive then
            obj.Lines[1].From = Vector2.new(bb.minX, bb.minY); obj.Lines[1].To = Vector2.new(bb.maxX, bb.minY); obj.Lines[1].Visible = true
            obj.Lines[2].From = Vector2.new(bb.minX, bb.maxY); obj.Lines[2].To = Vector2.new(bb.maxX, bb.maxY); obj.Lines[2].Visible = true
            obj.Lines[3].From = Vector2.new(bb.minX, bb.minY); obj.Lines[3].To = Vector2.new(bb.minX, bb.maxY); obj.Lines[3].Visible = true
            obj.Lines[4].From = Vector2.new(bb.maxX, bb.minY); obj.Lines[4].To = Vector2.new(bb.maxX, bb.maxY); obj.Lines[4].Visible = true
        else
            for _, l in pairs(obj.Lines) do l.Visible = false end
        end

        if SnapActive then
            obj.Snap.From    = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
            obj.Snap.To      = Vector2.new(bb.bottomX, bb.bottomY)
            obj.Snap.Visible = true
        else
            obj.Snap.Visible = false
        end

        if DistActive then
            obj.Dist.Text     = math.floor(bb.dist) .. " m"
            obj.Dist.Position = Vector2.new(bb.centerX, bb.maxY + 4)
            obj.Dist.Visible  = true
        else
            obj.Dist.Visible = false
        end
    end
end)

-- ============================================ --
--     MISC - SPEED HACK                       --
-- ============================================ --
local SpeedActive  = false
local SpeedValue   = 25
local DefaultSpeed = 16
local SpeedConn    = nil

local function HookSpeed(hum)
    if SpeedConn then pcall(function() SpeedConn:Disconnect() end) SpeedConn = nil end
    if not hum then return end
    SpeedConn = hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        if SpeedActive and hum.WalkSpeed ~= SpeedValue then
            hum.WalkSpeed = SpeedValue
        end
    end)
end

CreateSectionLabel(MiscPage, "  ⚡  MISC AYARLARI")

CreateToggleButton(MiscPage, "Speed Hack", function(s)
    SpeedActive = s
    local char = LocalPlayer.Character
    local hum  = char and char:FindFirstChildOfClass("Humanoid")
    if s then
        if hum then hum.WalkSpeed = SpeedValue; HookSpeed(hum) end
    else
        if SpeedConn then pcall(function() SpeedConn:Disconnect() end) SpeedConn = nil end
        if hum then hum.WalkSpeed = DefaultSpeed end
    end
end)

CreateSlider(MiscPage, "Speed Miktarı", 16, 150, 25, function(v)
    SpeedValue = v
    if SpeedActive then
        local char = LocalPlayer.Character
        local hum  = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = v end
    end
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild("Humanoid", 5)
    if not hum then return end
    if SpeedActive then hum.WalkSpeed = SpeedValue; HookSpeed(hum) end
end)

RunService.Heartbeat:Connect(function()
    if not SpeedActive then return end
    local char = LocalPlayer.Character
    local hum  = char and char:FindFirstChildOfClass("Humanoid")
    if hum and hum.WalkSpeed ~= SpeedValue then
        hum.WalkSpeed = SpeedValue
    end
end)

-- ============================================ --
--               SIDEBAR TABS                   --
-- ============================================ --
local AllPages = {AimbotPage, VisualsPage, MiscPage}

local function AddTab(name, page, isDefault)
    local btn = Instance.new("TextButton")
    btn.Parent = TabContainer
    btn.Size   = UDim2.new(1, 0, 0, 35)
    btn.Font   = Enum.Font.GothamSemibold
    btn.Text   = "  " .. name
    btn.TextSize = 12
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.ZIndex = 4
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
    btn.MouseButton1Click:Connect(function()
        for _, p in ipairs(AllPages) do p.Visible = false end
        page.Visible = true
        for _, c in ipairs(TabContainer:GetChildren()) do
            if c:IsA("TextButton") then
                c.BackgroundTransparency = 1
                c.TextColor3 = Color3.fromRGB(110, 110, 130)
            end
        end
        btn.BackgroundTransparency = 0
        btn.BackgroundColor3 = Color3.fromRGB(33, 31, 48)
        btn.TextColor3 = Color3.fromRGB(220, 220, 240)
    end)
    if isDefault then
        btn.BackgroundColor3 = Color3.fromRGB(33, 31, 48)
        btn.TextColor3 = Color3.fromRGB(220, 220, 240)
    else
        btn.BackgroundTransparency = 1
        btn.TextColor3 = Color3.fromRGB(110, 110, 130)
    end
end

AddTab("FOV / Aim", AimbotPage, true)
AddTab("Visuals",   VisualsPage, false)
AddTab("Misc",      MiscPage,    false)

local menuVisible = true
ToggleBtn.MouseButton1Click:Connect(function()
    menuVisible = not menuVisible
    TweenService:Create(MainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = menuVisible and UDim2.new(0.25, 0, 0.15, 0) or UDim2.new(0.25, 0, 0.1, 0)
    }):Play()
    MainFrame.Visible = menuVisible
end)
