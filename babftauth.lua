-- LocalScript в Xeno (FATALITY | Auth)
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ⚠️ ССЫЛКА НА СЕРВЕР (Render)
local API_URL = "https://babft-auth.onrender.com/api/check"

-- ⚠️ ССЫЛКА НА СКРИПТ (babftauth.lua)
local AUTH_SCRIPT_URL = "https://raw.githubusercontent.com/akkyant100-hue/authbabft/refs/heads/main/babftauth.lua"

local TELEGRAM_LINK = "https://t.me/velyastanok2"
local DISCORD_ID = "raman11_1"

-- === ЦВЕТА ===
local BG = Color3.fromRGB(20, 18, 30)
local PANEL = Color3.fromRGB(28, 25, 45)
local ACCENT = Color3.fromRGB(120, 80, 200)
local TEXT = Color3.fromRGB(220, 220, 230)
local SUBTEXT = Color3.fromRGB(150, 150, 170)
local GREEN = Color3.fromRGB(80, 200, 120)
local RED = Color3.fromRGB(255, 60, 120)

-- === АНИМАЦИЯ ===
local introGui = Instance.new("ScreenGui")
introGui.Name = "FatalityIntro"
introGui.IgnoreGuiInset = true
introGui.DisplayOrder = 999
introGui.Parent = playerGui

local blackScreen = Instance.new("Frame")
blackScreen.Size = UDim2.new(1, 0, 1, 0)
blackScreen.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
blackScreen.BorderSizePixel = 0
blackScreen.Parent = introGui

local logoContainer = Instance.new("Frame")
logoContainer.Size = UDim2.new(0, 250, 0, 60)
logoContainer.Position = UDim2.new(0.5, -125, 0.5, -30)
logoContainer.BackgroundTransparency = 1
logoContainer.Parent = blackScreen

local letterF = Instance.new("TextLabel")
letterF.Size = UDim2.new(0, 50, 1, 0)
letterF.Position = UDim2.new(0.5, -25, 0, 0)
letterF.BackgroundTransparency = 1
letterF.Text = "F"
letterF.TextColor3 = Color3.fromRGB(180, 100, 255)
letterF.Font = Enum.Font.GothamBlack
letterF.TextSize = 50
letterF.TextTransparency = 1
letterF.TextXAlignment = Enum.TextXAlignment.Right
letterF.Parent = logoContainer

local restOfText = Instance.new("TextLabel")
restOfText.Size = UDim2.new(0, 200, 1, 0)
restOfText.Position = UDim2.new(0.5, 25, 0, 0)
restOfText.BackgroundTransparency = 1
restOfText.Text = "ATALITY"
restOfText.TextColor3 = Color3.fromRGB(255, 255, 255)
restOfText.Font = Enum.Font.GothamBlack
restOfText.TextSize = 50
restOfText.TextTransparency = 1
restOfText.TextXAlignment = Enum.TextXAlignment.Left
restOfText.Parent = logoContainer

task.spawn(function()
    task.wait(0.5)
    TweenService:Create(letterF, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
    task.wait(0.8)
    TweenService:Create(letterF, TweenInfo.new(0.6), {Position = UDim2.new(0.5, -80, 0, 0)}):Play()
    TweenService:Create(restOfText, TweenInfo.new(0.6), {TextTransparency = 0, Position = UDim2.new(0.5, -30, 0, 0)}):Play()
    task.wait(1.2)
    TweenService:Create(blackScreen, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    TweenService:Create(letterF, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    TweenService:Create(restOfText, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    task.wait(0.5)
    introGui:Destroy()
end)

-- === ГУИ АВТОРИЗАЦИИ ===
local authGui = Instance.new("ScreenGui")
authGui.Name = "FatalityAuth"
authGui.ResetOnSpawn = false
authGui.Parent = playerGui

local authMain = Instance.new("Frame")
authMain.Size = UDim2.new(0, 400, 0, 320)
authMain.Position = UDim2.new(0.5, -200, 0.5, -160)
authMain.BackgroundColor3 = BG
authMain.BorderSizePixel = 0
authMain.Parent = authGui
Instance.new("UICorner", authMain).CornerRadius = UDim.new(0, 8)

local authTopBar = Instance.new("Frame")
authTopBar.Size = UDim2.new(1, 0, 0, 50)
authTopBar.BackgroundColor3 = PANEL
authTopBar.BorderSizePixel = 0
authTopBar.Parent = authMain
Instance.new("UICorner", authTopBar).CornerRadius = UDim.new(0, 8)

local authTitle = Instance.new("TextLabel")
authTitle.Size = UDim2.new(1, -40, 1, 0)
authTitle.Position = UDim2.new(0, 20, 0, 0)
authTitle.BackgroundTransparency = 1
authTitle.Text = "FATALITY"
authTitle.TextColor3 = TEXT
authTitle.Font = Enum.Font.GothamBold
authTitle.TextSize = 22
authTitle.TextXAlignment = Enum.TextXAlignment.Left
authTitle.Parent = authTopBar

local authSubtitle = Instance.new("TextLabel")
authSubtitle.Size = UDim2.new(0, 200, 0, 16)
authSubtitle.Position = UDim2.new(0, 22, 1, -20)
authSubtitle.BackgroundTransparency = 1
authSubtitle.Text = "Key System"
authSubtitle.TextColor3 = SUBTEXT
authSubtitle.Font = Enum.Font.Gotham
authSubtitle.TextSize = 11
authSubtitle.TextXAlignment = Enum.TextXAlignment.Left
authSubtitle.Parent = authTopBar

local authLine = Instance.new("Frame")
authLine.Size = UDim2.new(1, 0, 0, 2)
authLine.Position = UDim2.new(0, 0, 1, -2)
authLine.BackgroundColor3 = ACCENT
authLine.BorderSizePixel = 0
authLine.Parent = authTopBar

local authInputFrame = Instance.new("Frame")
authInputFrame.Size = UDim2.new(0, 320, 0, 40)
authInputFrame.Position = UDim2.new(0.5, -160, 0, 80)
authInputFrame.BackgroundColor3 = PANEL
authInputFrame.BorderSizePixel = 0
authInputFrame.Parent = authMain
Instance.new("UICorner", authInputFrame).CornerRadius = UDim.new(1, 0)

local authInputBox = Instance.new("TextBox")
authInputBox.Size = UDim2.new(1, -20, 1, 0)
authInputBox.Position = UDim2.new(0, 10, 0, 0)
authInputBox.BackgroundTransparency = 1
authInputBox.Text = ""
authInputBox.PlaceholderText = "Readmy Licence Key"
authInputBox.TextColor3 = TEXT
authInputBox.PlaceholderColor3 = SUBTEXT
authInputBox.Font = Enum.Font.Gotham
authInputBox.TextSize = 14
authInputBox.TextXAlignment = Enum.TextXAlignment.Left
authInputBox.ClearTextOnFocus = false
authInputBox.Parent = authInputFrame

local authSubmitBtn = Instance.new("TextButton")
authSubmitBtn.Size = UDim2.new(0, 150, 0, 32)
authSubmitBtn.Position = UDim2.new(0.5, -75, 0, 140)
authSubmitBtn.BackgroundColor3 = PANEL
authSubmitBtn.BorderSizePixel = 0
authSubmitBtn.Text = "ACTIVATE"
authSubmitBtn.TextColor3 = TEXT
authSubmitBtn.Font = Enum.Font.GothamBold
authSubmitBtn.TextSize = 13
authSubmitBtn.Parent = authMain
Instance.new("UICorner", authSubmitBtn).CornerRadius = UDim.new(0, 6)
local authSubmitStroke = Instance.new("UIStroke", authSubmitBtn)
authSubmitStroke.Color = ACCENT
authSubmitStroke.Thickness = 1
authSubmitStroke.Transparency = 0.4

local authStatusLabel = Instance.new("TextLabel")
authStatusLabel.Size = UDim2.new(1, 0, 0, 30)
authStatusLabel.Position = UDim2.new(0, 0, 1, -80)
authStatusLabel.BackgroundTransparency = 1
authStatusLabel.Text = ""
authStatusLabel.TextColor3 = SUBTEXT
authStatusLabel.Font = Enum.Font.Gotham
authStatusLabel.TextSize = 12
authStatusLabel.TextWrapped = true
authStatusLabel.TextXAlignment = Enum.TextXAlignment.Center
authStatusLabel.Parent = authMain

-- КОНТАКТЫ
local tgBtn = Instance.new("TextButton")
tgBtn.Size = UDim2.new(0, 140, 0, 30)
tgBtn.Position = UDim2.new(0.5, -150, 1, -45)
tgBtn.BackgroundColor3 = PANEL
tgBtn.Text = "Telegram: @velyastanok2"
tgBtn.TextColor3 = TEXT
tgBtn.Font = Enum.Font.Gotham
tgBtn.TextSize = 12
tgBtn.Parent = authMain
Instance.new("UICorner", tgBtn).CornerRadius = UDim.new(0, 6)

local dsBtn = Instance.new("TextButton")
dsBtn.Size = UDim2.new(0, 140, 0, 30)
dsBtn.Position = UDim2.new(0.5, 10, 1, -45)
dsBtn.BackgroundColor3 = PANEL
dsBtn.Text = "Discord: raman11_1"
dsBtn.TextColor3 = TEXT
dsBtn.Font = Enum.Font.Gotham
dsBtn.TextSize = 12
dsBtn.Parent = authMain
Instance.new("UICorner", dsBtn).CornerRadius = UDim.new(0, 6)

tgBtn.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard("https://t.me/velyastanok2") end
    authStatusLabel.Text = "Telegram link copied!"
    authStatusLabel.TextColor3 = GREEN
end)

dsBtn.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard("raman11_1") end
    authStatusLabel.Text = "Discord ID copied!"
    authStatusLabel.TextColor3 = GREEN
end)

-- === ЛОГИКА АВТОРИЗАЦИИ (ЗАГРУЗКА ЧЕРЕЗ LOADSTRING С ОБХОДОМ RETURN) ===
authSubmitBtn.MouseButton1Click:Connect(function()
    local key = authInputBox.Text
    if key == "" then
        authStatusLabel.Text = "Please enter a key"
        authStatusLabel.TextColor3 = RED
        return
    end
    
    authStatusLabel.Text = "Checking..."
    authStatusLabel.TextColor3 = SUBTEXT
    
    local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
    
    local success, response = pcall(function()
        local res = game:HttpGet(API_URL .. "?key=" .. key .. "&hwid=" .. hwid)
        return HttpService:JSONDecode(res)
    end)
    
    if success and response then
        if response.valid == true then
            authStatusLabel.Text = "Success! Loading Script..."
            authStatusLabel.TextColor3 = GREEN
            task.wait(0.5)
            authGui:Destroy()
            
            -- ЗАГРУЗКА СКРИПТА (ОБХОД RETURN)
            local loadSuccess, loadErr = pcall(function()
                local code = game:HttpGet(AUTH_SCRIPT_URL)
                -- Оборачиваем в функцию, чтобы return не прерывал выполнение
                local func = loadstring(code)
                if func then
                    func()
                end
            end)
            
            if not loadSuccess then
                print("Ошибка загрузки: " .. tostring(loadErr))
                authGui.Parent = playerGui
                authStatusLabel.Text = "Load Error: " .. tostring(loadErr)
                authStatusLabel.TextColor3 = RED
            end
        else
            authStatusLabel.Text = response.message or "Invalid Key"
            authStatusLabel.TextColor3 = RED
            authInputFrame.BackgroundColor3 = Color3.fromRGB(50, 20, 30)
            task.wait(1.5)
            authInputFrame.BackgroundColor3 = PANEL
        end
    else
        authStatusLabel.Text = "Server Offline (Check Render)"
        authStatusLabel.TextColor3 = RED
    end
end)

authSubmitBtn.MouseEnter:Connect(function() authSubmitBtn.BackgroundColor3 = Color3.fromRGB(40, 35, 65) end)
authSubmitBtn.MouseLeave:Connect(function() authSubmitBtn.BackgroundColor3 = PANEL end)
tgBtn.MouseEnter:Connect(function() tgBtn.BackgroundColor3 = Color3.fromRGB(40, 35, 65) end)
tgBtn.MouseLeave:Connect(function() tgBtn.BackgroundColor3 = PANEL end)
dsBtn.MouseEnter:Connect(function() dsBtn.BackgroundColor3 = Color3.fromRGB(40, 35, 65) end)
dsBtn.MouseLeave:Connect(function() dsBtn.BackgroundColor3 = PANEL end)
