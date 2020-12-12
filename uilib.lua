local lib = {}
local userInput = game:GetService("UserInputService")
local players = game:GetService("Players")
local runs = game:GetService("RunService")
local coregui = game:GetService('CoreGui')
local player = players.LocalPlayer
local mouse = player:GetMouse()
local UIclosed = false

local names = {
	"RobloxLoadingGui",
	"Roblox",
	"Roblox_UI",
	"DevConsoleMaster",
	"CoreGui",
	"Meme",
	game.Name
}
local UI = Instance.new('ScreenGui')
UI.ResetOnSpawn = false
if _G.UI then
	if _G.UI:FindFirstChildOfClass('BindableEvent') then
		_G.UI:FindFirstChildOfClass('BindableEvent'):Fire()
	end
	_G.pos = nil
	_G.UI:Destroy()
end

if not _G.windowLibs then
	_G.windowLibs = {}
else
	for i, v in next, _G.windowLibs do 
		for _, a in next, v do 
			a = false
		end
	end 
end

function windowCreation(title)
	local Dragger = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Background = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local Content = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local Popup = Instance.new("TextButton")
	local UIListLayout = Instance.new("UIListLayout")
	local offset = 15
	local Xsize = 161

	_G.pos = _G.pos and _G.pos + (Xsize + offset) or 0
	Dragger.Name = "Dragger"
	Dragger.Parent = UI
	Dragger.Active = true
	Dragger.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
	Dragger.Position = UDim2.new(0, _G.pos, 0, 0)
	Dragger.Size = UDim2.new(0, Xsize, 0, 20)
	Dragger.ZIndex = 999999900--999999999
	Dragger.LayoutOrder = math.floor(math.random(1, 50))

	UICorner.Parent = Dragger

	Background.Name = "Background"
	Background.Parent = Dragger
	Background.AnchorPoint = Vector2.new(0.5, 0)
	Background.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
	Background.Position = UDim2.new(0.5, 0, 0.2, 0)
	Background.ZIndex = 999999900

	UICorner_2.Parent = Background

	Content.Name = "Content"
	Content.Parent = Background
	Content.AnchorPoint = Vector2.new(0.5, 1)
	Content.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
	Content.BackgroundTransparency = 1
	Content.Position = UDim2.new(0.5, 0, 1, 0)
	Content.Size = UDim2.new(1, -5, 1, -15)
	Content.ZIndex = 999999900 -- 999999905

	UIListLayout.Parent = Content
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 3)

	Title.Name = "Title"
	Title.Parent = Dragger
	Title.AnchorPoint = Vector2.new(0, 0.5)
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1
	Title.Position = UDim2.new(0, 10, 0.5, 0)
	Title.Size = UDim2.new(0, 100, 1, -5)
	Title.ZIndex = 999999900--999999999
	Title.Font = Enum.Font.GothamSemibold
	Title.Text = title
	Title.TextColor3 = Color3.fromRGB(232, 232, 232)
	Title.TextSize = 17
	Title.TextScaled = true
	Title.TextWrapped = true
	Title.TextTruncate = Enum.TextTruncate.AtEnd
	Title.TextXAlignment = Enum.TextXAlignment.Left

	Popup.Name = "Popup"
	Popup.Parent = Dragger
	Popup.Active = false
	Popup.AnchorPoint = Vector2.new(1, 0.5)
	Popup.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Popup.BackgroundTransparency = 1
	Popup.Position = UDim2.new(1, -9, 0.5, 0)
	Popup.Selectable = false
	Popup.Size = UDim2.new(0, 10, 0, 10)
	Popup.ZIndex = 999999900--999999999
	Popup.AutoButtonColor = false
	Popup.Font = Enum.Font.GothamBold
	Popup.Text = "-"
	Popup.TextColor3 = Color3.fromRGB(232, 232, 232)
	Popup.TextSize = 25

	local shadowHolder = Instance.new("Frame")
	local umbraShadow = Instance.new("ImageLabel")
	local penumbraShadow = Instance.new("ImageLabel")
	local ambientShadow = Instance.new("ImageLabel")

	shadowHolder.Name = "shadowHolder"
	shadowHolder.Parent = Background
	shadowHolder.AnchorPoint = Vector2.new(0.5, 0.5)
	shadowHolder.BackgroundTransparency = 1
	shadowHolder.Position = UDim2.new(0.5, 0, 0.5, -2)
	shadowHolder.Size = UDim2.new(1, 5, 1, 7)

	umbraShadow.Name = "umbraShadow"
	umbraShadow.Parent = shadowHolder
	umbraShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	umbraShadow.BackgroundTransparency = 1
	umbraShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	umbraShadow.Size = UDim2.new(1, 10, 1, 10)
	umbraShadow.Image = "rbxassetid://1316045217"
	umbraShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	umbraShadow.ImageTransparency = 0.860
	umbraShadow.ScaleType = Enum.ScaleType.Slice
	umbraShadow.SliceCenter = Rect.new(10, 10, 118, 118)

	penumbraShadow.Name = "penumbraShadow"
	penumbraShadow.Parent = shadowHolder
	penumbraShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	penumbraShadow.BackgroundTransparency = 1
	penumbraShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	penumbraShadow.Size = UDim2.new(1, 10, 1, 10)
	penumbraShadow.Image = "rbxassetid://1316045217"
	penumbraShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	penumbraShadow.ImageTransparency = 0.880
	penumbraShadow.ScaleType = Enum.ScaleType.Slice
	penumbraShadow.SliceCenter = Rect.new(10, 10, 118, 118)

	ambientShadow.Name = "ambientShadow"
	ambientShadow.Parent = shadowHolder
	ambientShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	ambientShadow.BackgroundTransparency = 1
	ambientShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	ambientShadow.Size = UDim2.new(1, 10, 1, 10)
	ambientShadow.Image = "rbxassetid://1316045217"
	ambientShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	ambientShadow.ImageTransparency = 0.880
	ambientShadow.ScaleType = Enum.ScaleType.Slice
	ambientShadow.SliceCenter = Rect.new(10, 10, 118, 118)

	local finish = UDim2.new(1, 0, 0, UIListLayout.AbsoluteContentSize.Y + 46)
	local start = UDim2.new(1, 0, 0, 0)
	local closed = false
	local check; check = userInput.InputBegan:Connect(function(input)
		if _G.UI ~= UI then return check:Disconnect() end 
		if input.KeyCode == Enum.KeyCode.Insert then 
			-- for i, v in next, Dragger:GetDescendants() do 
			-- 	if v:IsA("GuiObject") then
			-- 		v.Visible = not v.Visible
			-- 	end
			-- end 
			Dragger.Visible = not Dragger.Visible
		end 
	end)

	Popup.MouseButton1Click:Connect(function()
		if closed and Popup.Text ~= '-' then 
			Popup.Text = '-'

			delay(0.1, function()
				shadowHolder.Visible = true
				Background.Visible = true
			end)


			Background:TweenSize(finish, "In", "Quint", 0.25, true, function()
				wait(0.1)
				for i, v in next, Content:GetChildren() do 
					if v:IsA('GuiObject') then
						v.Visible = true
					end 
				end 
				closed = false
			end)
		elseif not closed and Popup.Text ~= '+' then
			Popup.Text = '+'

			for i, v in next, Content:GetChildren() do 
				if v:IsA('GuiObject') then
					v.Visible = false
				end 
			end 

			delay(0.1, function()
				shadowHolder.Visible = false
			end)

			delay(0.2, function()
				Background.Visible = false
			end)

			Background:TweenSize(start, "In", "Quint", 0.25, true, function()
				closed = true
			end)
		end 
	end)

	Background.Content.ChildAdded:Connect(function(obj)
		if obj:IsA("GuiObject") and not UIclosed then
			Background.Size = UDim2.new(1, 0, 0, UIListLayout.AbsoluteContentSize.Y + 46)
			finish = UDim2.new(1, 0, 0, UIListLayout.AbsoluteContentSize.Y + 46)
		end 
	end)

	Background.Size = UDim2.new(1, 0, 0, UIListLayout.AbsoluteContentSize.Y + 46)
	finish = UDim2.new(1, 0, 0, UIListLayout.AbsoluteContentSize.Y + 46)

	return Dragger
end

function createDragger(uiObj)
	assert(uiObj and uiObj:IsA('GuiObject'), 'Dragger needs a ui object')

	local dragging
	local dragInput
	local dragStart
	local startPos
	local lastOrder

	local function update(input)
		local delta = input.Position - dragStart
		uiObj.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	uiObj.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			local _uis = coregui:GetGuiObjectsAtPosition(input.Position.X, input.Position.Y)
			local __uis = {}
			for i, v in next, _uis do
				if v.Name == uiObj.Name then
					table.insert(__uis, v)
				end
			end

			if __uis[1] ~= uiObj then
				return
			end

			lastOrder = uiObj.ZIndex
			for i, v in next, uiObj:GetDescendants() do
				if v:IsA("GuiObject") and not v.Parent.Name == "shadowHolder" and v.Name == "shadowHolder" then
					v.ZIndex = 999999909
				end
			end 
			dragging = true
			dragStart = input.Position
			startPos = uiObj.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false

					for i, v in next, uiObj:GetDescendants() do
						if v:IsA("GuiObject") and not v.Parent.Name == "shadowHolder" and v.Name == "shadowHolder" then
							v.ZIndex = lastOrder
						end
					end
				end
			end)
		end
	end)

	uiObj.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	userInput.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end 

function lib:Window(t)
	assert(t, 'Window needs a title')

	local dragger = windowCreation(t)
	local contentZIndex = 999999900
	createDragger(dragger)

	UI.Parent = coregui
	UI.Name = names[math.random(1, #names)]
	_G.UI = UI

	local windowLib = {
		UI = UI, 
		onUIDelete = UI:FindFirstChildOfClass("BindableEvent") or Instance.new('BindableEvent', UI)
	}
	local _windowLib = windowLib
	local _changed = Instance.new("BindableEvent")
	local __changed = _changed.Event

	_windowLib = setmetatable({}, {
		__index = windowLib,
		__newindex = function(tb, key, v)
			--print(tb, key, v)
			_changed:Fire(key, v)
			rawset(windowLib, key, v)
		end
	})
	
	--windowLib.Changed = changed.Event

	function windowLib:Button(title, callback)
		assert(title, 'Button needs a title string')
		if callback == nil then callback = function() end end

		local Button = Instance.new("TextLabel")
		local Button_2 = Instance.new("TextButton")
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint")

		Button.Name = "Button"
		Button.Parent = dragger.Background.Content
		Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Button.BackgroundTransparency = 1
		Button.Size = UDim2.new(1, 0, 0, 23)
		Button.ZIndex = contentZIndex
		Button.Font = Enum.Font.SourceSans
		Button.Text = ""
		Button.TextColor3 = Color3.fromRGB(0, 0, 0)
		Button.TextSize = 14

		Button_2.Name = "Button"
		Button_2.Parent = Button
		Button_2.AnchorPoint = Vector2.new(0.25, 0.5)
		Button_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Button_2.BackgroundTransparency = 1
		Button_2.Position = UDim2.new(0.25, 0, 0.5, 0)
		Button_2.Size = UDim2.new(0.89, 0, 1, -6)
		Button_2.ZIndex = contentZIndex
		Button_2.Font = Enum.Font.GothamBold
		Button_2.TextColor3 = Color3.fromRGB(232, 232, 232)
		Button_2.TextSize = 14
		Button_2.TextScaled = true
		Button_2.TextWrapped = true
		Button_2.TextXAlignment = Enum.TextXAlignment.Left
		Button_2.Text = title

		UITextSizeConstraint.MaxTextSize = 14
		UITextSizeConstraint.MinTextSize = 4
		UITextSizeConstraint.Parent = Button_2

		Button_2.MouseButton1Down:Connect(function()
			callback()
		end)

		return Button
	end

	function windowLib:Toggle1(title, options, callback)
		assert(title, 'Toggle needs a title string')
		if callback == nil then callback = function() end end
		if typeof(options) ~= 'table' then callback = options options = nil end 
		if options and windowLib[options.flag] then return error(options.flag ..'" already exists') end

		if options then
			if options.flag then
				windowLib[options.flag] = false
			end 
		end 

		local Toggle = Instance.new("TextLabel")
		local Button = Instance.new("TextButton")
		local Title = Instance.new("TextLabel")

		Toggle.Name = "Toggle"
		Toggle.Parent = dragger.Background.Content
		Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Toggle.BackgroundTransparency = 1
		Toggle.Size = UDim2.new(1, 0, 0, 23)
		Toggle.ZIndex = contentZIndex
		Toggle.Font = Enum.Font.SourceSans
		Toggle.Text = ""
		Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
		Toggle.TextSize = 14

		Button.Name = "Button"
		Button.Parent = Toggle
		Button.AnchorPoint = Vector2.new(1, 0.5)
		Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Button.BackgroundTransparency = 1
		Button.Position = UDim2.new(1, -5, 0.5, 0)
		Button.Size = UDim2.new(0, 20, 1, -8)
		Button.ZIndex = contentZIndex
		Button.Font = Enum.Font.GothamBold
		Button.Text = "Off"
		Button.TextColor3 = Color3.fromRGB(248, 57, 40)
		Button.TextSize = 14

		Title.Name = "Title"
		Title.Parent = Toggle
		Title.Active = true
		Title.AnchorPoint = Vector2.new(0.25, 0)
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1
		Title.Position = UDim2.new(0.25, 0, 0, 0)
		Title.Size = UDim2.new(0.89, 0, 1, 0)
		Title.ZIndex = contentZIndex
		Title.Font = Enum.Font.GothamBold
		Title.Text = title
		Title.TextColor3 = Color3.fromRGB(232, 232, 232)
		Title.TextSize = 14
		Title.TextWrapped = true
		Title.TextXAlignment = Enum.TextXAlignment.Left
		
		local __active = options and options.default or false
		
		local set = function(tt, t)
			Button.Text = tt and "On" or "Off"
			Button.TextColor3 = tt and Color3.fromRGB(65, 248, 33) or Color3.fromRGB(248, 57, 40)
			
			if options and options.flag then
				rawset(windowLib, options.flag, tt)
			end
			if not t then callback(tt) end
			__active = tt
		end
		
		set(__active, true)
		if options then
			__changed:Connect(function(flag, value)
				if options.flag == flag then
					set(value)
				end
			end)
		end

		Button.MouseButton1Down:Connect(function()
			set(not __active)
		end)

		return Toggle
	end

	function windowLib:Toggle2(title, options, callback)
		assert(title, 'Toggle needs a title string')
		if callback == nil then callback = function() end end
		if typeof(options) ~= 'table' then callback = options options = nil end 
		if options and windowLib[options.flag] then return error(options.flag ..'" already exists') end

		if options then
			if options.flag then
				windowLib[options.flag] = false
			end 
		end 

		local Toggle2 = Instance.new("TextLabel")
		local Shadow = Instance.new("Frame")
		local Shadow_2 = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local Shadow_3 = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local Button = Instance.new("TextButton")
		local UICorner_3 = Instance.new("UICorner")
		local Title = Instance.new("TextLabel")

		Toggle2.Name = "Toggle2"
		Toggle2.Parent = dragger.Background.Content
		Toggle2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Toggle2.BackgroundTransparency = 1
		Toggle2.Size = UDim2.new(1, 0, 0, 23)
		Toggle2.ZIndex = contentZIndex
		Toggle2.Font = Enum.Font.SourceSans
		Toggle2.Text = ""
		Toggle2.TextColor3 = Color3.fromRGB(0, 0, 0)
		Toggle2.TextSize = 14

		Shadow.Name = "Shadow"
		Shadow.Parent = Toggle2
		Shadow.Active = true
		Shadow.AnchorPoint = Vector2.new(1, 0.5)
		Shadow.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
		Shadow.BorderSizePixel = 0
		Shadow.Position = UDim2.new(1, -18, 0.5, 0)
		Shadow.Selectable = true
		Shadow.Size = UDim2.new(0, 18, 0, 20)
		Shadow.ZIndex = contentZIndex

		Shadow_2.Name = "Shadow"
		Shadow_2.Parent = Shadow
		Shadow_2.Active = true
		Shadow_2.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
		Shadow_2.BorderSizePixel = 0
		Shadow_2.Position = UDim2.new(0, -10, 0, 0)
		Shadow_2.Selectable = true
		Shadow_2.Size = UDim2.new(0, 20, 0, 20)
		Shadow_2.ZIndex = contentZIndex

		UICorner.CornerRadius = UDim.new(1, 0)
		UICorner.Parent = Shadow_2

		Shadow_3.Name = "Shadow"
		Shadow_3.Parent = Shadow
		Shadow_3.Active = true
		Shadow_3.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
		Shadow_3.BorderSizePixel = 0
		Shadow_3.Position = UDim2.new(0, 10, 0, 0)
		Shadow_3.Selectable = true
		Shadow_3.Size = UDim2.new(0, 20, 0, 20)
		Shadow_3.ZIndex = contentZIndex

		UICorner_2.CornerRadius = UDim.new(1, 0)
		UICorner_2.Parent = Shadow_3

		Button.Name = "Button"
		Button.Parent = Shadow
		Button.AnchorPoint = Vector2.new(0, 0.5)
		Button.BackgroundColor3 = Color3.fromRGB(189, 47, 44)
		Button.BorderSizePixel = 0
		Button.Position = UDim2.new(0, -5, 0.5, 0)
		Button.Size = UDim2.new(0, 15, 0, 15)
		Button.ZIndex = 999999907
		Button.AutoButtonColor = false
		Button.Font = Enum.Font.GothamBold
		Button.Text = ""
		Button.TextColor3 = Color3.fromRGB(65, 248, 33)
		Button.TextSize = 14
		Button.TextWrapped = true

		UICorner_3.CornerRadius = UDim.new(1, 0)
		UICorner_3.Parent = Button

		Title.Name = "Title"
		Title.Parent = Toggle2
		Title.Active = true
		Title.AnchorPoint = Vector2.new(0.25, 0)
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1
		Title.Position = UDim2.new(0.23, 0, 0, 0)
		Title.Size = UDim2.new(0.8, 0, 1, 0)
		Title.ZIndex = contentZIndex
		Title.Font = Enum.Font.GothamBold
		Title.Text = title
		Title.TextColor3 = Color3.fromRGB(232, 232, 232)
		Title.TextSize = 14
		Title.TextWrapped = true
		Title.TextXAlignment = Enum.TextXAlignment.Left
		local start = UDim2.new(0, -5, 0.5, 0)
		local finish = UDim2.new(0, 9, 0.5, 0)
		Button.Position = start
		local tweening = false
		
		local __active = options and options.default or false

		local set = function(tt, t)
			if not tweening then
				tweening = true
				Button:TweenPosition(tt and finish or start, tt and "Out" or "In", "Quart", 0.1, true, function()
					tweening = false
				end)
				
				if options and options.flag then
					rawset(windowLib, options.flag, tt)
				end
				if not t then callback(tt) end
				__active = tt
			end
		end

		set(__active, true)
		if options then
			__changed:Connect(function(flag, value)
				if options.flag == flag then
					set(value)
				end
			end)
		end

		Shadow.InputBegan:Connect(function(input)
			if input.UserInputType.Value == 0 then
				set(not __active)
			end
		end)

		Shadow_2.InputBegan:Connect(function(input)
			if input.UserInputType.Value == 0 then
				set(not __active)
			end
		end)

		Shadow_3.InputBegan:Connect(function(input)
			if input.UserInputType.Value == 0 then
				set(not __active)
			end
		end)

		Button.MouseButton1Down:Connect(function()
			set(not __active)
		end)

		return Toggle2
	end

	function windowLib:Box(title, options, callback)
		assert(title, 'Box needs a title string')
		if callback == nil then callback = function() end end
		if typeof(options) ~= 'table' then callback = options options = nil end 
		if options and windowLib[options.flag] then return error(options.flag ..'" already exists') end

		if options then
			if options.type then
				assert(options.type == 'number' or options.type == 'string', 'Box options.type needs to be a type(number, string)')
			end
			if options.flag then
				windowLib[options.flag] = ''
			end 
		end 

		local TextBox = Instance.new("Frame")
		local Input = Instance.new("TextBox")
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
		local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
		local UICorner = Instance.new("UICorner")
		local Title = Instance.new("TextLabel")

		TextBox.Name = "TextBox"
		TextBox.Parent = dragger.Background.Content
		TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextBox.BackgroundTransparency = 1
		TextBox.BorderSizePixel = 0
		TextBox.Size = UDim2.new(1, 0, 0, 23)
		TextBox.ZIndex = contentZIndex

		Input.Name = "Input"
		Input.Parent = TextBox
		Input.AnchorPoint = Vector2.new(1, 0.5)
		Input.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
		Input.BorderColor3 = Color3.fromRGB(232, 232, 232)
		Input.BorderSizePixel = 0
		Input.Position = UDim2.new(1, -10, 0.5, 0)
		Input.Size = UDim2.new(0, 65, 1, -1)
		Input.ZIndex = 999999907
		Input.Font = Enum.Font.GothamSemibold
		Input.PlaceholderColor3 = Color3.fromRGB(232, 232, 232)
		Input.PlaceholderText = options and options.type or '..'
		Input.Text = ""
		Input.TextColor3 = Color3.fromRGB(232, 232, 232)
		Input.TextScaled = true
		Input.TextSize = 14
		Input.TextWrapped = true
		Input.TextTruncate = Enum.TextTruncate.AtEnd

		UITextSizeConstraint.Parent = Input
		UITextSizeConstraint.MaxTextSize = 13
		UITextSizeConstraint.MinTextSize = 8

		UITextSizeConstraint_2.Parent = Title
		UITextSizeConstraint_2.MaxTextSize = 14
		UITextSizeConstraint_2.MinTextSize = 7

		UICorner.Parent = Input

		Title.Name = "Title"
		Title.Parent = TextBox
		Title.Active = true
		Title.AnchorPoint = Vector2.new(0.25, 0)
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1
		Title.Position = UDim2.new(0.148557618, 0, 0, 0)
		Title.Size = UDim2.new(0.494231015, 0, 1, 0)
		Title.ZIndex = contentZIndex
		Title.Font = Enum.Font.GothamBold
		Title.Text = title
		Title.TextColor3 = Color3.fromRGB(232, 232, 232)
		Title.TextSize = 14
		Title.TextWrapped = true
		Title.TextScaled = true
		Title.TextXAlignment = Enum.TextXAlignment.Left

		Input.Text = options and options.default or options and options.type or ""

		local set = function(tt)
			if not typeof(tt) == "string" then
				return error("expected string got ".. typeof(tt))
			end
			oldT = tt

			if options and options.flag then
				rawset(windowLib, options.flag, tt)
			end
		end

		local oldT = Input.Text
		Input.FocusLost:Connect(function(enterPress)
			if oldT ~= Input.Text then 
				set(Input.Text)
				callback(Input.Text, enterPress)
			end 
		end)

		if options then
			__changed:Connect(function(flag, value)
				if options.flag == flag then
					set(value)
				end
			end)

			Input:GetPropertyChangedSignal("Text"):Connect(function()
				if options.type == "string" then
					Input.Text = string.gsub(Input.Text, "%d", "") 
				elseif options.type == "number" then
					Input.Text = string.gsub(Input.Text, "%a", "") 
				end
			end)
		end

		return TextBox
	end

	function windowLib:Label(text)
		local Label = Instance.new("TextLabel")
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint")

		Label.Name = "Label"
		Label.Parent = dragger.Background.Content
		Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Label.BackgroundTransparency = 1
		Label.Size = UDim2.new(1, 0, 0, 23)
		Label.ZIndex = contentZIndex
		Label.Font = Enum.Font.GothamSemibold
		Label.Text = text
		Label.TextColor3 = Color3.fromRGB(232, 232, 232)
		Label.TextScaled = true
		Label.TextSize = 20
		Label.TextWrapped = true

		UITextSizeConstraint.Parent = Label
		UITextSizeConstraint.MaxTextSize = 14
		UITextSizeConstraint.MinTextSize = 12

		return Label
	end 

	function windowLib:Slider(title, options, callback)
		assert(title, 'Slider needs a title string')
		if callback == nil then callback = function() end end
		if typeof(options) ~= 'table' then callback = options options = nil end 
		if options and windowLib[options.flag] then return error(options.flag ..'" already exists') end

		if options and options.min and options.max and options.max <= options.min then return error('min value needs to be lower than max value') end

		if options then
			if options.min then
				assert(typeof(options.min) == 'number', 'Slider options.min needs to be a number type')
			end

			if options.max then
				assert(typeof(options.max) == 'number', 'Slider options.max needs to be a number type')
			end

			if options.flag then
				windowLib[options.flag] = options.default or options.min or 0
			end 
		end 

		local Slider = Instance.new("Frame")
		local shadowBelow = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local slider = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local Title = Instance.new("TextLabel")
		local Input = Instance.new("TextBox")

		Slider.Name = "Slider"
		Slider.Parent = dragger.Background.Content
		Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Slider.BackgroundTransparency = 1
		Slider.ClipsDescendants = false
		Slider.Size = UDim2.new(1, 0, 0, 23)
		Slider.ZIndex = contentZIndex

		shadowBelow.Name = "shadowBelow"
		shadowBelow.Parent = Slider
		shadowBelow.AnchorPoint = Vector2.new(0.5, 0.949999988)
		shadowBelow.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
		shadowBelow.BorderSizePixel = 0
		shadowBelow.Position = UDim2.new(0.5, 0, 0.949999988, -1)
		shadowBelow.Size = UDim2.new(1, -10, 0, 6)
		shadowBelow.ZIndex = contentZIndex

		UICorner.CornerRadius = UDim.new(1, 0)
		UICorner.Parent = shadowBelow

		slider.Name = "slider"
		slider.Parent = shadowBelow
		slider.AnchorPoint = Vector2.new(0, 0.5)
		slider.BackgroundColor3 = Color3.fromRGB(189, 47, 44)
		slider.BorderSizePixel = 0
		slider.Position = UDim2.new(0, 0, 0.5, 0)
		slider.Size = UDim2.new(0, 0, 1, 0)
		slider.ZIndex = 999999907

		UICorner_2.CornerRadius = UDim.new(1, 0)
		UICorner_2.Parent = slider

		Title.Name = "Title"
		Title.Parent = Slider
		Title.Active = true
		Title.AnchorPoint = Vector2.new(0.25, 0)
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1
		Title.Position = UDim2.new(0.212660179, 0, 0, 0)
		Title.Size = UDim2.new(0.750999987, 0, 0.5, 0)
		Title.ZIndex = contentZIndex
		Title.Font = Enum.Font.GothamBold
		Title.Text = title
		Title.TextColor3 = Color3.fromRGB(232, 232, 232)
		Title.TextSize = 14
		Title.TextWrapped = true
		Title.TextXAlignment = Enum.TextXAlignment.Left

		Input.Name = "Input"
		Input.Parent = Slider
		Input.AnchorPoint = Vector2.new(1, 0.100000001)
		Input.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Input.BackgroundTransparency = 1
		Input.Position = UDim2.new(1, -5, 0.100000001, 0)
		Input.Size = UDim2.new(0, 20, 1, -10)
		Input.ZIndex = contentZIndex
		Input.Font = Enum.Font.GothamBold
		Input.PlaceholderColor3 = Color3.fromRGB(232, 232, 232)
		Input.PlaceholderText = "0"
		Input.Text = ""
		Input.TextColor3 = Color3.fromRGB(232, 232, 232)
		Input.TextScaled = true
		Input.TextSize = 14
		Input.TextWrapped = true

		local old = 0
		local max = options and options.max and typeof(tonumber(options.max)) == 'number' and options.max or 100
		local min = options and options.min and typeof(tonumber(options.min)) == 'number' and options.min or 0
		local hold = false
		local offset = 10
		local _mainP = shadowBelow.AbsolutePosition
		local _mainS = shadowBelow.AbsoluteSize
		local set = function(tt, t)
			local v = tt or mouse.X
					
			-- if not tt then
			-- 	if v < _mainP.X then
			-- 		slider.Size = UDim2.new(0, ((min / max) * _mainS.X), 1, 0)
			-- 	elseif v > (_mainP.X + _mainS.X) then
			-- 		slider.Size = UDim2.new(0, _mainS.X, 1, 0)
			-- 	else
			-- 		slider.Size = UDim2.new(0, math.max((v - _mainP.X), ((min / max) * _mainS.X)), 1, 0)
			-- 	end
			-- else
			-- 	if v < min then
			-- 		slider.Size = UDim2.new(0, ((min / max) * _mainS.X), 1, 0)
			-- 	elseif v > max then
			-- 		slider.Size = UDim2.new(0, _mainS.X, 1, 0)
			-- 	else
			-- 		slider.Size = UDim2.new(0, ((v / max) * _mainS.X), 1, 0)
			-- 	end
			-- end

			slider.Size = UDim2.new(0, math.max(math.min(-(slider.AbsolutePosition.X - v - 3), _mainS.X), 0), 1, 0)

			local amount = math.max(math.floor(max * (slider.AbsoluteSize.X / _mainS.X) + 0.5), min)

			if old ~= amount then
				Input.Text = amount
				old = amount

				if options and options.flag then
					windowLib[options.flag] = amount
				end
				if not t then callback(amount) end
			end
		end

		set(options and options.default or min, true)

		shadowBelow.InputBegan:Connect(function(obj)
			if obj.UserInputType == Enum.UserInputType.MouseButton1 then
				slider.Size = UDim2.new(0, (mouse.X - _mainP.X), 1, 0)
				hold = true
			end
		end)

		shadowBelow.InputEnded:Connect(function(obj)
			if obj.UserInputType == Enum.UserInputType.MouseButton1 then
				hold = false
			end
		end)

		if options then
			__changed:Connect(function(flag, value)
				if options.flag == flag then
					set(value)
				end
			end)
		end

		Input.FocusLost:Connect(function(enter)
			if typeof(tonumber(Input.Text)) == "number" then
				local num = tonumber(Input.Text)
				
				if num >= min and num <= max then
					set(num)
					return
				end
			end

			Input.Text = tostring(old)
		end)

		local loop;loop = runs.RenderStepped:Connect(function()
			if Input then
				_mainP = shadowBelow.AbsolutePosition
				if hold then
					set()
				end
				Input.Text = (Input.Text):gsub("%a", "")
			else
				loop:Disconnect()
			end
		end)

		return Slider
	end

	function windowLib:List(title, options, callback)
		assert(title, "List needs a title string")

		if callback == nil then callback = function() end end
		if typeof(options) ~= 'table' then callback = options options = nil end 
		--if options and windowLib[options.flag] then return error(options.flag ..'" already exists') end
		if options and (typeof(options.content) ~= "table") or not options then return error("expected content got: ".. (options and options.content or "options nil")) end

		local List = Instance.new("TextButton")
		local Title = Instance.new("TextLabel")
		local FrameList = Instance.new("ScrollingFrame")
		local Content = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")
		local Template = function(txt, cbc)
			local template = Instance.new("TextButton")
			local UITextSizeConstraint = Instance.new("UITextSizeConstraint", template)
			template.Name = txt
			template.Parent = Content
			template.Active = false
			template.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
			template.BorderSizePixel = 0
			template.Selectable = false
			template.Size = UDim2.new(1, -2, 0, 15)
			template.ZIndex = 999999899
			template.Font = Enum.Font.GothamSemibold
			template.Text = txt
			template.TextColor3 = Color3.fromRGB(232, 232, 232)
			template.TextSize = 14
			template.TextScaled = true

			UITextSizeConstraint.MinTextSize = 5
			UITextSizeConstraint.MaxTextSize = 14

			template.MouseButton1Click:Connect(cbc)
			return template
		end
		local Shadow = Instance.new("Frame")
		local shadowHolder = Instance.new("Frame")
		local umbraShadow = Instance.new("ImageLabel")
		local penumbraShadow = Instance.new("ImageLabel")
		local ambientShadow = Instance.new("ImageLabel")
		local Button = Instance.new("TextLabel")

		List.Name = "List"
		List.Parent = dragger.Background.Content
		List.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		List.BackgroundTransparency = 1.000
		List.Size = UDim2.new(1, 0, 0, 23)
		List.ZIndex = contentZIndex
		List.Font = Enum.Font.GothamBold
		List.Text = ""
		List.TextColor3 = Color3.fromRGB(232, 232, 232)
		List.TextSize = 14.000

		Title.Name = "Title"
		Title.Parent = List
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1.000
		Title.Position = UDim2.new(0, 5, 0, 0)
		Title.Size = UDim2.new(1, -30, 1, 0)
		Title.ZIndex = contentZIndex
		Title.Font = Enum.Font.GothamBold
		Title.Text = title
		Title.TextColor3 = Color3.fromRGB(232, 232, 232)
		Title.TextSize = 14.000
		Title.TextWrapped = true
		Title.TextXAlignment = Enum.TextXAlignment.Left

		FrameList.Name = "FrameList"
		FrameList.Parent = List
		FrameList.Active = true
		FrameList.Visible = false
		FrameList.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
		FrameList.BorderColor3 = Color3.fromRGB(189, 47, 44)
		FrameList.BorderSizePixel = 0
		FrameList.ClipsDescendants = false
		FrameList.Position = UDim2.new(0, 10, 0, 0)
		FrameList.Size = UDim2.new(0, 150, 0, math.max(UIListLayout.AbsoluteContentSize.Y + 30, 300))
		FrameList.ZIndex = 999999899

		Content.Name = "Content"
		Content.Parent = FrameList
		Content.AnchorPoint = Vector2.new(0, 0.5)
		Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Content.BackgroundTransparency = 1.000
		Content.BorderSizePixel = 0
		Content.Position = UDim2.new(0, 0, 0.5, 0)
		Content.Selectable = false
		Content.Size = UDim2.new(1, 0, 1, -5)
		Content.ZIndex = 999999899
		Content.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		Content.ScrollBarThickness = 6
		Content.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

		UIListLayout.Parent = Content
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 3)

		Shadow.Name = "Shadow"
		Shadow.Parent = FrameList
		Shadow.AnchorPoint = Vector2.new(0.5, 0)
		Shadow.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
		Shadow.BackgroundTransparency = 1.000
		Shadow.Position = UDim2.new(0.5, 0, 0, -7)
		Shadow.Size = UDim2.new(1, 7, 1, 7)
		Shadow.ZIndex = 999999898

		shadowHolder.Name = "shadowHolder"
		shadowHolder.Parent = Shadow
		shadowHolder.BackgroundTransparency = 1.000
		shadowHolder.Size = UDim2.new(1, 0, 1, 0)
		shadowHolder.ZIndex = 0

		umbraShadow.Name = "umbraShadow"
		umbraShadow.Parent = shadowHolder
		umbraShadow.AnchorPoint = Vector2.new(0.5, 0.5)
		umbraShadow.BackgroundTransparency = 1.000
		umbraShadow.Position = UDim2.new(0.5, 0, 0.5, 6)
		umbraShadow.Size = UDim2.new(1, 10, 1, 10)
		umbraShadow.ZIndex = 0
		umbraShadow.Image = "rbxassetid://1316045217"
		umbraShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
		umbraShadow.ImageTransparency = 0.860
		umbraShadow.ScaleType = Enum.ScaleType.Slice
		umbraShadow.SliceCenter = Rect.new(10, 10, 118, 118)

		penumbraShadow.Name = "penumbraShadow"
		penumbraShadow.Parent = shadowHolder
		penumbraShadow.AnchorPoint = Vector2.new(0.5, 0.5)
		penumbraShadow.BackgroundTransparency = 1.000
		penumbraShadow.Position = UDim2.new(0.5, 0, 0.5, 6)
		penumbraShadow.Size = UDim2.new(1, 10, 1, 10)
		penumbraShadow.ZIndex = 0
		penumbraShadow.Image = "rbxassetid://1316045217"
		penumbraShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
		penumbraShadow.ImageTransparency = 0.880
		penumbraShadow.ScaleType = Enum.ScaleType.Slice
		penumbraShadow.SliceCenter = Rect.new(10, 10, 118, 118)

		ambientShadow.Name = "ambientShadow"
		ambientShadow.Parent = shadowHolder
		ambientShadow.AnchorPoint = Vector2.new(0.5, 0.5)
		ambientShadow.BackgroundTransparency = 1.000
		ambientShadow.Position = UDim2.new(0.5, 0, 0.5, 6)
		ambientShadow.Size = UDim2.new(1, 10, 1, 10)
		ambientShadow.ZIndex = 0
		ambientShadow.Image = "rbxassetid://1316045217"
		ambientShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
		ambientShadow.ImageTransparency = 0.880
		ambientShadow.ScaleType = Enum.ScaleType.Slice
		ambientShadow.SliceCenter = Rect.new(10, 10, 118, 118)

		Button.Name = "Button"
		Button.Parent = List
		Button.Active = false
		Button.AnchorPoint = Vector2.new(1, 0)
		Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Button.BackgroundTransparency = 1.000
		Button.Position = UDim2.new(1, 0, 0, 0)
		Button.Selectable = false
		Button.Size = UDim2.new(0, 23, 1, 0)
		Button.ZIndex = contentZIndex
		Button.Font = Enum.Font.GothamBold
		Button.Text = ">"
		Button.TextColor3 = Color3.fromRGB(232, 232, 232)
		Button.TextSize = 16.000
		Button.TextWrapped = true

		local function update()
			FrameList.Size = UDim2.new(0, 150, 0, math.max(math.min((UIListLayout.AbsoluteContentSize.Y + 15), 300), 51))
			Content.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + UIListLayout.Padding.Offset + 15)
		end

		Content.ChildAdded:Connect(update)
		Content.ChildRemoved:Connect(update)
		update()

		for i, v in next, options.content or {} do
			local t = Template(v, function()
				callback(v, t)
			end)
		end

		List.MouseButton1Click:Connect(function()
			if Button.Text == ">" then
				Button.Text = "<"
				FrameList.Visible = true
				FrameList:TweenPosition(UDim2.new(1, 10, 0, 0), "Out","Quad", 0.2, true)
			else
				Button.Text = ">"
				FrameList:TweenPosition(UDim2.new(0, 10, 0, 0), "In","Quad", 0.2, true, function()
					if FrameList then FrameList.Visible = false end
				end)
			end
		end)

		return List, function(txt, cbc)
			local t = Template(txt, function()
				if cbc then cbc(txt, t) else callback(txt, t) end
			end)
			if not cbc then t.AutoButtonColor = false end
			return t
		end
	end

	function windowLib:KeyBind(title, options, callback)
		assert(title, 'KeyBind needs a title string')
		if callback == nil then callback = function() end end
		if typeof(options) ~= 'table' then callback = options options = nil end 
		if options and windowLib[options.flag] then return error(options.flag ..'" already exists') end

		local Keybind = Instance.new("Frame")
		local Input = Instance.new("TextButton")
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
		local UICorner = Instance.new("UICorner")
		local Title = Instance.new("TextLabel")
		local CurrentKey = options and options.default or Enum.KeyCode.E
		local needingInput = false

		Keybind.Name = "Keybind"
		Keybind.Parent = dragger.Background.Content
		Keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Keybind.BackgroundTransparency = 1
		Keybind.BorderSizePixel = 0
		Keybind.Size = UDim2.new(1, 0, 0, 23)
		Keybind.ZIndex = contentZIndex

		Input.Name = "Input"
		Input.Parent = Keybind
		Input.AnchorPoint = Vector2.new(1, 0.5)
		Input.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
		Input.BorderColor3 = Color3.fromRGB(232, 232, 232)
		Input.BorderSizePixel = 0
		Input.Position = UDim2.new(1, -5, 0.5, 0)
		Input.Size = UDim2.new(0, 50, 1, -7)
		Input.ZIndex = 999999907
		Input.Font = Enum.Font.GothamSemibold
		Input.Text = string.split(tostring(CurrentKey), '.')[3]
		Input.TextColor3 = Color3.fromRGB(232, 232, 232)
		Input.TextScaled = true
		Input.TextSize = 14
		Input.TextWrapped = true

		UITextSizeConstraint.Parent = Input
		UITextSizeConstraint.MaxTextSize = 14
		UITextSizeConstraint.MinTextSize = 8

		UICorner.CornerRadius = UDim.new(0, 5)
		UICorner.Parent = Input

		Title.Name = "Title"
		Title.Parent = Keybind
		Title.Active = true
		Title.AnchorPoint = Vector2.new(0, 0)
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1
		Title.Position = UDim2.new(0, 5, 0, 0)
		Title.Size = UDim2.new(0.4, 0, 1, 0)
		Title.ZIndex = contentZIndex
		Title.Font = Enum.Font.GothamBold
		Title.Text = title
		Title.TextColor3 = Color3.fromRGB(232, 232, 232)
		Title.TextSize = 14
		Title.TextWrapped = true
		Title.TextXAlignment = Enum.TextXAlignment.Left

		Input.MouseButton1Click:Connect(function()
			needingInput = true
		end)

		userInput.InputBegan:Connect(function(input, gameProcessedEvent)
			if _G.UI ~= UI then return end

			if needingInput then
				if input.UserInputType == Enum.UserInputType.Keyboard then
					CurrentKey = input.KeyCode
				else 
					CurrentKey = input.UserInputType
				end

				Input.Text = string.split(tostring(CurrentKey), '.')[3]
				needingInput = false
			else
				if input.UserInputType == CurrentKey or input.KeyCode == CurrentKey then
					if options and options.flag then
						windowLib[options.flag] = CurrentKey
					end

					callback(CurrentKey, gameProcessedEvent)
				end 
			end 
		end)
	end

	table.insert(_G.windowLibs, windowLib)
	return _windowLib
end

return lib