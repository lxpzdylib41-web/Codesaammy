local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
if playerGui:FindFirstChild("AutoCodesGUI") then
	playerGui:FindFirstChild("AutoCodesGUI"):Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "Autocodesammy"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = playerGui
local shadow = Instance.new("ImageLabel")
shadow.Parent = gui
shadow.Size = UDim2.new(0, 360, 0, 260)
shadow.Position = UDim2.new(0.5, -186, 0.5, -122)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://105942777284630"
shadow.ImageColor3 = Color3.new(0, 0, 0)
shadow.ImageTransparency = 0.5
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(49, 49, 450, 450)
shadow.ZIndex = 0
local main = Instance.new("Frame")
main.Name = "Main"
main.Parent = gui
main.Size = UDim2.new(0, 320, 0, 220)
main.Position = UDim2.new(0.5, -160, 0.5, -110)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
main.BorderSizePixel = 0
main.ZIndex = 1
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 14)

-- Borde sutil
local stroke = Instance.new("UIStroke")
stroke.Parent = main
stroke.Color = Color3.fromRGB(55, 55, 65)
stroke.Thickness = 1.2
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- ─── Barra superior ───
local topBar = Instance.new("Frame")
topBar.Parent = main
topBar.Size = UDim2.new(1, 0, 0, 44)
topBar.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
topBar.BorderSizePixel = 0
topBar.ZIndex = 2
Instance.new("UICorner", topBar).CornerRadius = UDim.new(0, 14)

-- Parche para que la barra no tenga esquinas redondeadas abajo
local topPatch = Instance.new("Frame")
topPatch.Parent = topBar
topPatch.Size = UDim2.new(1, 0, 0.5, 0)
topPatch.Position = UDim2.new(0, 0, 0.5, 0)
topPatch.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
topPatch.BorderSizePixel = 0
topPatch.ZIndex = 2

-- Punto decorativo (acento de color)
local dot = Instance.new("Frame")
dot.Parent = topBar
dot.Size = UDim2.new(0, 8, 0, 8)
dot.Position = UDim2.new(0, 16, 0.5, -4)
dot.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
dot.BorderSizePixel = 0
dot.ZIndex = 3
Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

-- Título
local title = Instance.new("TextLabel")
title.Parent = topBar
title.Size = UDim2.new(1, -60, 1, 0)
title.Position = UDim2.new(0, 34, 0, 0)
title.BackgroundTransparency = 1
title.Text = "CODE SAMMY 👑"
title.TextColor3 = Color3.fromRGB(240, 240, 245)
title.Font = Enum.Font.GothamBold
title.TextSize = 15
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 3

-- Subtítulo / versión
local version = Instance.new("TextLabel")
version.Parent = topBar
version.Size = UDim2.new(0, 40, 1, 0)
version.Position = UDim2.new(1, -52, 0, 0)
version.BackgroundTransparency = 1
version.Text = "v1.0"
version.TextColor3 = Color3.fromRGB(100, 100, 115)
version.Font = Enum.Font.Gotham
version.TextSize = 12
version.ZIndex = 3

-- Botón minimizar
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Parent = topBar
minimizeBtn.Size = UDim2.new(0, 28, 0, 28)
minimizeBtn.Position = UDim2.new(1, -38, 0.5, -14)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
minimizeBtn.Text = "–"
minimizeBtn.TextColor3 = Color3.fromRGB(180, 180, 195)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 18
minimizeBtn.ZIndex = 4
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0, 8)

-- ─── Separador ───
local sep = Instance.new("Frame")
sep.Parent = main
sep.Size = UDim2.new(1, -32, 0, 1)
sep.Position = UDim2.new(0, 16, 0, 44)
sep.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
sep.BorderSizePixel = 0
sep.ZIndex = 2

-- ─── Contenido (se oculta al minimizar) ───
local content = Instance.new("Frame")
content.Parent = main
content.Size = UDim2.new(1, 0, 1, -45)
content.Position = UDim2.new(0, 0, 0, 45)
content.BackgroundTransparency = 1
content.ClipsDescendants = true
content.ZIndex = 2

-- Botón toggle
local toggle = Instance.new("TextButton")
toggle.Parent = content
toggle.Size = UDim2.new(0, 260, 0, 56)
toggle.Position = UDim2.new(0.5, -130, 0, 22)
toggle.BackgroundColor3 = Color3.fromRGB(195, 40, 40)
toggle.TextColor3 = Color3.new(1, 1, 1)
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 16
toggle.AutoButtonColor = false
toggle.ZIndex = 3
Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 12)

-- Stroke del botón
local toggleStroke = Instance.new("UIStroke")
toggleStroke.Parent = toggle
toggleStroke.Color = Color3.fromRGB(255, 80, 80)
toggleStroke.Thickness = 1
toggleStroke.Transparency = 0.6

-- Indicador de estado (pastilla)
local pill = Instance.new("Frame")
pill.Parent = content
pill.Size = UDim2.new(0, 220, 0, 32)
pill.Position = UDim2.new(0.5, -110, 0, 100)
pill.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
pill.BorderSizePixel = 0
pill.ZIndex = 3
Instance.new("UICorner", pill).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", pill).Color = Color3.fromRGB(45, 45, 55)

local pillDot = Instance.new("Frame")
pillDot.Parent = pill
pillDot.Size = UDim2.new(0, 10, 0, 10)
pillDot.Position = UDim2.new(0, 14, 0.5, -5)
pillDot.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
pillDot.BorderSizePixel = 0
pillDot.ZIndex = 4
Instance.new("UICorner", pillDot).CornerRadius = UDim.new(1, 0)

local pillLabel = Instance.new("TextLabel")
pillLabel.Parent = pill
pillLabel.Size = UDim2.new(1, -36, 1, 0)
pillLabel.Position = UDim2.new(0, 32, 0, 0)
pillLabel.BackgroundTransparency = 1
pillLabel.Text = "INACTIVO"
pillLabel.TextColor3 = Color3.fromRGB(200, 50, 50)
pillLabel.Font = Enum.Font.GothamBold
pillLabel.TextSize = 13
pillLabel.TextXAlignment = Enum.TextXAlignment.Left
pillLabel.ZIndex = 4

-- ─── Lógica de toggle ───
local enabled = false
local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local function updateUI()
	if enabled then
		TweenService:Create(toggle, tweenInfo, {BackgroundColor3 = Color3.fromRGB(30, 185, 90)}):Play()
		toggleStroke.Color = Color3.fromRGB(50, 255, 120)
		toggle.Text = "AUTO CODES  ·  ACTIVO ✓"
		TweenService:Create(pillDot, tweenInfo, {BackgroundColor3 = Color3.fromRGB(30, 220, 100)}):Play()
		TweenService:Create(pillLabel, tweenInfo, {TextColor3 = Color3.fromRGB(30, 220, 100)}):Play()
		pillLabel.Text = "ACTIVO"
	else
		TweenService:Create(toggle, tweenInfo, {BackgroundColor3 = Color3.fromRGB(195, 40, 40)}):Play()
		toggleStroke.Color = Color3.fromRGB(255, 80, 80)
		toggle.Text = "AUTO CODES  ·  INACTIVO"
		TweenService:Create(pillDot, tweenInfo, {BackgroundColor3 = Color3.fromRGB(200, 50, 50)}):Play()
		TweenService:Create(pillLabel, tweenInfo, {TextColor3 = Color3.fromRGB(200, 50, 50)}):Play()
		pillLabel.Text = "INACTIVO"
	end
end

updateUI()

-- Hover del botón
toggle.MouseEnter:Connect(function()
	TweenService:Create(toggle, TweenInfo.new(0.15), {
		BackgroundColor3 = enabled and Color3.fromRGB(40, 210, 105) or Color3.fromRGB(220, 55, 55)
	}):Play()
end)
toggle.MouseLeave:Connect(function()
	TweenService:Create(toggle, TweenInfo.new(0.15), {
		BackgroundColor3 = enabled and Color3.fromRGB(30, 185, 90) or Color3.fromRGB(195, 40, 40)
	}):Play()
end)

toggle.MouseButton1Click:Connect(function()
	enabled = not enabled
	updateUI()
	if enabled then
		-- Pon aquí tu función de auto codes
		print("[AutoCodes] Activado")
	else
		print("[AutoCodes] Desactivado")
	end
end)

-- ─── Minimizar ───
local minimized = false
minimizeBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	local targetSize = minimized and UDim2.new(0, 320, 0, 44) or UDim2.new(0, 320, 0, 220)
	minimizeBtn.Text = minimized and "+" or "–"
	TweenService:Create(main, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Size = targetSize}):Play()
	TweenService:Create(shadow, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
		Size = minimized and UDim2.new(0, 360, 0, 84) or UDim2.new(0, 360, 0, 260)
	}):Play()
end)

-- ─── Arrastre fluido ───
local dragging = false
local dragInput, dragStart, startPos

local function drag(input)
	local delta = input.Position - dragStart
	local target = UDim2.new(
		startPos.X.Scale, startPos.X.Offset + delta.X,
		startPos.Y.Scale, startPos.Y.Offset + delta.Y
	)
	TweenService:Create(main, TweenInfo.new(0.07, Enum.EasingStyle.Linear), {Position = target}):Play()
	-- Mover sombra en sync
	shadow.Position = UDim2.new(
		target.X.Scale, target.X.Offset - 20,
		target.Y.Scale, target.Y.Offset - 12
	)
end

topBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragInput = input
		dragStart = input.Position
		startPos = main.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

topBar.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and input == dragInput then
		drag(input)
	end
end)