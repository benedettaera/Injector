local Players = game:GetService("Players")
-- Automatically gets the player executing the script
local Player = Players.LocalPlayer 
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Wait for leaderstats
local Leaderstats = Player:WaitForChild("leaderstats", 5)
local MoneyStat = Leaderstats and Leaderstats:WaitForChild("Money", 5)

-- Create main screen GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MoneyGenerator"
ScreenGui.Parent = PlayerGui

-- OUTER FRAME with cyan border (outline layer outside panel)
local OuterFrame = Instance.new("Frame")
OuterFrame.Size = UDim2.new(0, 280, 0, 280)  -- DECREASED size: from 320x310 to 280x280
OuterFrame.Position = UDim2.new(0.5, -140, 0.5, -140)  -- Adjusted for new size
OuterFrame.BackgroundColor3 = Color3.fromRGB(0, 255, 255)  -- Cyan border color
OuterFrame.BorderSizePixel = 0
OuterFrame.Visible = true
OuterFrame.Parent = ScreenGui

-- Outer frame corner rounding
local OuterCorner = Instance.new("UICorner")
OuterCorner.CornerRadius = UDim.new(0, 12)  -- Adjusted for smaller size
OuterCorner.Parent = OuterFrame

-- Version text in bottom right corner (small text) - on outer frame
local VersionText = Instance.new("TextLabel")
VersionText.Size = UDim2.new(0, 60, 0, 15)
VersionText.Position = UDim2.new(1, -65, 1, -18)  -- Bottom right corner
VersionText.BackgroundTransparency = 1
VersionText.Text = "Premium V2.04"  -- Updated version text
VersionText.TextColor3 = Color3.fromRGB(180, 180, 180)  -- Light gray color
VersionText.TextSize = 10  -- Very small text
VersionText.Font = Enum.Font.Gotham
VersionText.TextXAlignment = Enum.TextXAlignment.Right
VersionText.ZIndex = 2  -- Ensure it's on top
VersionText.Parent = OuterFrame

-- Main inner panel (slightly smaller to show cyan border)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(1, -4, 1, -4)  -- Slightly smaller than outer frame
MainFrame.Position = UDim2.new(0, 2, 0, 2)  -- Centered within outer frame
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = OuterFrame

-- Draggable - applied to outer frame so border is also draggable
OuterFrame.Active = true
OuterFrame.Draggable = true

-- Inner panel corner rounding (slightly smaller than outer)
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)  -- Adjusted for smaller size
UICorner.Parent = MainFrame

-- Title Background (DARKER background - changed from 18,18,18 to 25,25,25 for better contrast)
local TitleBg = Instance.new("Frame")
TitleBg.Size = UDim2.new(1, 0, 0, 34)  -- Changed to full width
TitleBg.Position = UDim2.new(0, 0, 0, 0)  -- Positioned at top of MainFrame
TitleBg.BackgroundColor3 = Color3.fromRGB(25, 25, 25)  -- DARKER than main background (40,40,40)
TitleBg.BorderSizePixel = 0
TitleBg.ZIndex = 2  -- Ensure it's above MainFrame
TitleBg.Parent = MainFrame

-- Title background corner rounding (only top corners rounded)
local TitleBgCorner = Instance.new("UICorner")
TitleBgCorner.CornerRadius = UDim.new(0, 10)  -- Match MainFrame corner radius
TitleBgCorner.Parent = TitleBg

-- Title Shadow (subtle drop shadow effect with neon purple)
local TitleShadow = Instance.new("TextLabel")
TitleShadow.Size = UDim2.new(1, -30, 0, 34)
TitleShadow.Position = UDim2.new(0, 16, 0, 3)  -- Slight offset from main text
TitleShadow.BackgroundTransparency = 1
TitleShadow.Text = "FB : DALVSTORE"
TitleShadow.TextColor3 = Color3.fromRGB(60, 0, 90)  -- Dark purple for shadow
TitleShadow.TextTransparency = 0.7  -- Semi-transparent shadow
TitleShadow.TextSize = 16
TitleShadow.Font = Enum.Font.SourceSansBold  -- Fallback font for shadow
TitleShadow.TextXAlignment = Enum.TextXAlignment.Left
TitleShadow.ZIndex = 3  -- Behind the main title
TitleShadow.Parent = MainFrame

-- Main Title (Left Aligned, Updated Text with SourceSansBold)
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -30, 0, 34)
Title.Position = UDim2.new(0, 15, 0, 2)
Title.BackgroundTransparency = 1
Title.Text = "FB : DALVSTORE"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.Font = Enum.Font.SourceSansBold  -- Changed to SourceSansBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 4  -- Above the shadow and TitleBg

-- Add text outline with NEON PURPLE color
local TitleOutline = Instance.new("UIStroke")
TitleOutline.Color = Color3.fromRGB(180, 0, 255)  -- NEON PURPLE outline
TitleOutline.Thickness = 1.2  -- Subtle thickness
TitleOutline.Transparency = 0.3  -- Slightly less transparent for neon effect
TitleOutline.Parent = Title

-- Add subtle glow effect to neon purple outline
local TitleGlow = Instance.new("UIGradient")
TitleGlow.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 0, 255)),  -- Neon purple
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(220, 80, 255)),  -- Lighter purple
    ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 0, 255))  -- Neon purple
})
TitleGlow.Rotation = 45  -- Diagonal gradient for glow effect
TitleGlow.Parent = TitleOutline

-- Add inner glow to text for better readability
local TitleInnerGlow = Instance.new("UIGradient")
TitleInnerGlow.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(240, 240, 240)),  -- Almost white
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),  -- Pure white
    ColorSequenceKeypoint.new(1, Color3.fromRGB(240, 240, 240))  -- Almost white
})
TitleInnerGlow.Rotation = 0  -- Horizontal gradient
TitleInnerGlow.Parent = Title

Title.Parent = MainFrame

-- Input frame (adjusted for smaller panel)
local InputFrame = Instance.new("Frame")
InputFrame.Size = UDim2.new(0.9, 0, 0, 90)  -- Slightly smaller
InputFrame.Position = UDim2.new(0.05, 0, 0.19, 0)
InputFrame.BackgroundTransparency = 1
InputFrame.Parent = MainFrame

-- Amount input
local AmountLabel = Instance.new("TextLabel")
AmountLabel.Size = UDim2.new(0, 70, 0, 25)  -- Adjusted for smaller panel
AmountLabel.Position = UDim2.new(0, 0, 0, 0)
AmountLabel.BackgroundTransparency = 1
AmountLabel.Text = "Amount:"
AmountLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AmountLabel.TextSize = 13  -- Slightly smaller
AmountLabel.TextXAlignment = Enum.TextXAlignment.Left
AmountLabel.Parent = InputFrame

local AmountBox = Instance.new("TextBox")
AmountBox.Size = UDim2.new(0, 90, 0, 30)  -- Adjusted for smaller panel
AmountBox.Position = UDim2.new(0, 70, 0, 0)
AmountBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
AmountBox.BorderSizePixel = 0
AmountBox.Text = "400"
AmountBox.TextColor3 = Color3.fromRGB(255, 255, 255)
AmountBox.TextSize = 15  -- Slightly smaller
AmountBox.PlaceholderText = "Amount"
AmountBox.Parent = InputFrame

-- Symbol selection
local SymbolLabel = Instance.new("TextLabel")
SymbolLabel.Size = UDim2.new(0, 70, 0, 25)  -- Adjusted for smaller panel
SymbolLabel.Position = UDim2.new(0, 0, 0, 45)
SymbolLabel.BackgroundTransparency = 1
SymbolLabel.Text = "Symbol:"
SymbolLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SymbolLabel.TextSize = 13  -- Slightly smaller
SymbolLabel.TextXAlignment = Enum.TextXAlignment.Left
SymbolLabel.Parent = InputFrame

local SymbolBox = Instance.new("TextBox")
SymbolBox.Size = UDim2.new(0, 90, 0, 30)  -- Adjusted for smaller panel
SymbolBox.Position = UDim2.new(0, 70, 0, 45)
SymbolBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SymbolBox.BorderSizePixel = 0
SymbolBox.Text = "K"
SymbolBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SymbolBox.TextSize = 15  -- Slightly smaller
SymbolBox.Parent = InputFrame

-- Symbol arrows (adjusted for smaller panel)
local UpButton = Instance.new("TextButton")
UpButton.Size = UDim2.new(0, 25, 0, 12)  -- Smaller
UpButton.Position = UDim2.new(0, 165, 0, 45)
UpButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
UpButton.BorderSizePixel = 0
UpButton.Text = "▲"
UpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
UpButton.TextSize = 10  -- Smaller
UpButton.Parent = InputFrame

local DownButton = Instance.new("TextButton")
DownButton.Size = UDim2.new(0, 25, 0, 12)  -- Smaller
DownButton.Position = UDim2.new(0, 165, 0, 60)
DownButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
DownButton.BorderSizePixel = 0
DownButton.Text = "▼"
DownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DownButton.TextSize = 10  -- Smaller
DownButton.Parent = InputFrame

-- === TOTAL FRAME ===
local TotalFrame = Instance.new("Frame")
TotalFrame.Size = UDim2.new(0.9, 0, 0, 35)  -- Slightly smaller
TotalFrame.Position = UDim2.new(0.05, 0, 0.55, 0)
TotalFrame.BackgroundTransparency = 1
TotalFrame.Parent = MainFrame

local TotalLabelTitle = Instance.new("TextLabel")
TotalLabelTitle.Size = UDim2.new(0, 50, 1, 0)  -- Smaller
TotalLabelTitle.BackgroundTransparency = 1
TotalLabelTitle.Text = "Total:"
TotalLabelTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
TotalLabelTitle.TextSize = 13  -- Smaller
TotalLabelTitle.TextXAlignment = Enum.TextXAlignment.Left
TotalLabelTitle.Parent = TotalFrame

-- Total Box (adjusted for smaller panel)
local TotalValueBox = Instance.new("TextBox")
TotalValueBox.Size = UDim2.new(1, -50, 1, 0)
TotalValueBox.Position = UDim2.new(0, 50, 0, 0)
TotalValueBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TotalValueBox.BorderSizePixel = 0
TotalValueBox.Text = "Loading..."
TotalValueBox.TextColor3 = Color3.fromRGB(255, 215, 0)
TotalValueBox.TextSize = 13  -- Smaller
TotalValueBox.Font = Enum.Font.Gotham
TotalValueBox.TextEditable = false
TotalValueBox.ClearTextOnFocus = false
TotalValueBox.Parent = TotalFrame

-- Result display
local ResultLabel = Instance.new("TextLabel")
ResultLabel.Size = UDim2.new(0.9, 0, 0, 25)  -- Smaller
ResultLabel.Position = UDim2.new(0.05, 0, 0.72, 0)
ResultLabel.BackgroundTransparency = 1
ResultLabel.Text = "" 
ResultLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ResultLabel.TextSize = 14  -- Smaller
ResultLabel.Parent = MainFrame

-- Generate button (MOVED SLIGHTLY DOWNWARD - from 0.80 to 0.83)
local GenerateButton = Instance.new("TextButton")
GenerateButton.Size = UDim2.new(0.9, 0, 0, 35)  -- Smaller
GenerateButton.Position = UDim2.new(0.05, 0, 0.83, 0)  -- MOVED DOWNWARD A LITTLE BIT: from 0.80 to 0.83
GenerateButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
GenerateButton.BorderSizePixel = 0
GenerateButton.Text = "GASKEUN"
GenerateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GenerateButton.TextSize = 15  -- Smaller
GenerateButton.Font = Enum.Font.GothamBold
GenerateButton.Parent = MainFrame

-- Minimize button (adjusted for smaller panel)
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 25, 0, 25)  -- Smaller
MinimizeButton.Position = UDim2.new(1, -60, 0, 5)  -- Adjusted position
MinimizeButton.BackgroundColor3 = Color3.fromRGB(80, 80, 200)
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Text = "—" 
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 14  -- Smaller
MinimizeButton.ZIndex = 3  -- Above TitleBg
MinimizeButton.Parent = MainFrame

-- Close button (adjusted for smaller panel)
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 25, 0, 25)  -- Smaller
CloseButton.Position = UDim2.new(1, -30, 0, 5)  -- Adjusted position
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
CloseButton.BorderSizePixel = 0
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 12  -- Smaller
CloseButton.ZIndex = 3  -- Above TitleBg
CloseButton.Parent = MainFrame

-- Mini Icon (slightly smaller)
local MiniIcon = Instance.new("TextButton")
MiniIcon.Size = UDim2.new(0, 45, 0, 45)  -- Smaller
MiniIcon.Position = UDim2.new(0, 10, 0, 10)
MiniIcon.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
MiniIcon.BorderSizePixel = 0
MiniIcon.Text = "🏦"
MiniIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
MiniIcon.TextSize = 18  -- Smaller
MiniIcon.Visible = false
MiniIcon.Parent = ScreenGui

-- Enable dragging for mini icon
MiniIcon.Active = true
MiniIcon.Draggable = true

local MiniCorner = Instance.new("UICorner")
MiniCorner.CornerRadius = UDim.new(0, 6)  -- Slightly smaller
MiniCorner.Parent = MiniIcon

-- ================= LOGIC SECTION =================

local commonSuffixes = {"", "K", "M", "B", "T", "q", "Q"}
local currentSuffixIndex = 54 -- Default "uuu"

-- 1. Generate Suffix String
function generateSuffix(index)
    if index <= #commonSuffixes then
        return commonSuffixes[index]
    end
    local customIndex = index - #commonSuffixes
    local length = 2 
    local maxForLength = 26
    while customIndex > maxForLength do
        customIndex = customIndex - maxForLength
        length = length + 1
        maxForLength = 26
    end
    local charIndex = customIndex
    local charCode = 96 + charIndex
    local char = string.char(charCode)
    return char:rep(length)
end

-- 2. Get Max Suffixes
function getTotalSuffixes()
    return #commonSuffixes + 26 + 26 + 26 + 26
end

-- 3. Calculate Exponent
function getSuffixExponent(suffix)
    if suffix == nil or suffix == "" then return 0 end
    local commonMap = { K = 3, M = 6, B = 9, T = 12, q = 15, Q = 18 }
    if commonMap[suffix] then return commonMap[suffix] end
    
    local firstChar = suffix:sub(1, 1):lower()
    local suffixLength = #suffix
    for i = 2, suffixLength do
        if suffix:sub(i, i):lower() ~= firstChar then return 0 end
    end
    
    local charIndex = string.byte(firstChar) - 96
    local baseExponent = 18 
    local stepsFromA = charIndex - 1
    local lengthBonus = (suffixLength - 2) * 78 
    return baseExponent + (stepsFromA * 3) + lengthBonus + 3
end

-- 4. Helper: Parse Money String
function parseMoneyString(val)
    if type(val) == "number" then return val end
    if type(val) ~= "string" then return 0 end
    local numStr, suffix = val:match("([%d%.]+)([%a]*)")
    if not numStr then return 0 end
    local number = tonumber(numStr) or 0
    local exponent = getSuffixExponent(suffix)
    return number * (10 ^ exponent)
end

-- 5. Helper: Format Number to Suffix
function formatValueToSuffix(value)
    if value == 0 then return "0" end
    if value < 1000 then return string.format("%.2f", value) end
    
    local exponent = math.floor(math.log10(value))
    local tier = math.floor(exponent / 3)
    local suffixIndex = tier
    local suffixStr = generateSuffix(suffixIndex + 1)
    
    local divisor = 10 ^ (tier * 3)
    local displayNum = value / divisor
    
    return string.format("%.2f%s", displayNum, suffixStr)
end

-- 6. Calculate N
function calculateN(number, suffix)
    local baseNumber = tonumber(number)
    if not baseNumber or baseNumber <= 0 then
        return "Error: Amount must be a number > 0"
    end
    local exponent = getSuffixExponent(suffix)
    local multiplier = 10 ^ exponent
    local actualValue = baseNumber * multiplier
    local n = actualValue / 40
    return math.floor(n + 0.5)
end

-- 7. Get Script Value
function getScriptValue(num)
    if num > 10^15 then
        local sciNotation = string.format("%.2e", num)
        local base, exponentStr = sciNotation:match("([%d%.]+)e([%d%-]+)")
        if base and exponentStr then
            local exponent = tonumber(exponentStr)
            if exponent >= 0 then return base .. "e+" .. exponentStr
            else return base .. "e-" .. math.abs(exponent) end
        end
    end
    return tostring(num)
end

-- ================= UPDATERS =================

function updateSymbol()
    SymbolBox.Text = generateSuffix(currentSuffixIndex)
    updateCalculations()
end

function updateCalculations()
    local inputNum = tonumber(AmountBox.Text) or 0
    local inputSuffix = SymbolBox.Text
    local inputRawValue = 0
    
    local n = calculateN(inputNum, inputSuffix)
    
    if type(n) == "number" then
        ResultLabel.Text = ""
        inputRawValue = inputNum * (10 ^ getSuffixExponent(inputSuffix))
    else
        ResultLabel.Text = n
        ResultLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        inputRawValue = 0
    end
    
    local currentMoneyRaw = 0
    if MoneyStat then
        currentMoneyRaw = parseMoneyString(MoneyStat.Value)
    end
    
    local totalRaw = currentMoneyRaw + inputRawValue
    TotalValueBox.Text = formatValueToSuffix(totalRaw)
end

-- ================= EVENTS =================

UpButton.MouseButton1Click:Connect(function()
    currentSuffixIndex = math.min(currentSuffixIndex + 1, getTotalSuffixes())
    updateSymbol()
end)

DownButton.MouseButton1Click:Connect(function()
    currentSuffixIndex = math.max(currentSuffixIndex - 1, 1)
    updateSymbol()
end)

AmountBox:GetPropertyChangedSignal("Text"):Connect(updateCalculations)
SymbolBox:GetPropertyChangedSignal("Text"):Connect(updateCalculations)

if MoneyStat then
    MoneyStat.Changed:Connect(function()
        updateCalculations()
    end)
else
    TotalValueBox.Text = "Money stat not found"
end

GenerateButton.MouseButton1Click:Connect(function()
    local number = tonumber(AmountBox.Text) or 400
    local suffix = SymbolBox.Text
    local n = calculateN(number, suffix)
    
    if type(n) == "number" then
        local scriptValue = getScriptValue(n)
        local scriptToExecute = string.format([[
local args = {
7000001,
-%s
}
game:GetService("ReplicatedStorage"):WaitForChild("Tool"):WaitForChild("DrawUp"):WaitForChild("Msg"):WaitForChild("DrawHero"):InvokeServer(unpack(args))
]], scriptValue)
        
        loadstring(scriptToExecute)()
        
        ResultLabel.Text = "Kasih paham boss"
        ResultLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
        wait(2)
        updateCalculations()
    else
        ResultLabel.Text = "Error: Invalid input"
        ResultLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

MinimizeButton.MouseButton1Click:Connect(function()
    OuterFrame.Visible = false
    MiniIcon.Visible = true
end)

MiniIcon.MouseButton1Click:Connect(function()
    OuterFrame.Visible = true
    MiniIcon.Visible = false
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Initialize
updateSymbol()