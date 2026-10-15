return(function(elBTK, ...)
local EcqGYl = {"n7axd0sI68IjnwUi";"zCQ";"LGfm0TYs";"lnpwl3w";"93ZTXt";"G5guzfq";"eHHfdp5BbMMZB3";"HdU9"}
local XAGP0eZp = function(...)
-- ============================================================
-- main.lua — FortniHub MM2 v20.3 — ЧАСТЬ 1/2
-- ============================================================

local Players=game:GetService(loadstring(base64decode("UGxheWVycw=="))())
local RunService=game:GetService(loadstring(base64decode("UnVuU2VydmljZQ=="))())
local UserInputService=game:GetService(loadstring(base64decode("VXNlcklucHV0U2VydmljZQ=="))())
local VirtualInputManager=game:GetService(loadstring(base64decode("VmlydHVhbElucHV0TWFuYWdlcg=="))())
local CoreGui=game:GetService(loadstring(base64decode("Q29yZUd1aQ=="))())
local Workspace=game:GetService(loadstring(base64decode("V29ya3NwYWNl"))())
local Lighting=game:GetService(loadstring(base64decode("TGlnaHRpbmc="))())
local HttpService=game:GetService(loadstring(base64decode("SHR0cFNlcnZpY2U="))())
local TeleportService=game:GetService(loadstring(base64decode("VGVsZXBvcnRTZXJ2aWNl"))())
local ReplicatedStorage=game:GetService(loadstring(base64decode("UmVwbGljYXRlZFN0b3JhZ2U="))())
local VirtualUser=game:GetService(loadstring(base64decode("VmlydHVhbFVzZXI="))())
local TweenService=game:GetService(loadstring(base64decode("VHdlZW5TZXJ2aWNl"))())
local Stats=game:GetService(loadstring(base64decode("U3RhdHM="))())
local CollectionService=game:GetService(loadstring(base64decode("Q29sbGVjdGlvblNlcnZpY2U="))())
local SoundService=game:GetService(loadstring(base64decode("U291bmRTZXJ2aWNl"))())
local Debris=game:GetService(loadstring(base64decode("RGVicmlz"))())
local LocalPlayer=Players.LocalPlayer
local Camera=Workspace.CurrentCamera
local VERSION=loadstring(base64decode("MjAuMyBCRVRB"))()
local CREDITS=loadstring(base64decode("YnkgSE9USSBhbmQgVmUzMTU="))()

getgenv().FLING_MODE = loadstring(base64decode("Q2xhc3NpYw=="))()  -- Classic | Turbo
getgenv().FLING_TURBO_SPEED = 350
getgenv().FLING_TURBO_LAPS = 8
getgenv().FLING_TURBO_DISTANCE = 14

getgenv().UNKNOWN_ROLE_COLOR = Color3.fromRGB(180, 60, 255)

local S={frozen=false,freezeUpKey=Enum.KeyCode.Space,freezeDownKey=Enum.KeyCode.LeftAlt}
local silent={enabled=false,predict=true,force=false,standoff=15,lastShot=0}
local knifeSilent={enabled=false,radius=20,fov=120,showFov=true,checkWalls=false,instaKill=true,predict=true}
local kaV1={on=false,dist=250,lastHit=0}
local kaV2={on=false,dist=250,lastHit=0}
local killAuraVersion=loadstring(base64decode("djI="))()
local Connections={}
local function AddConn(name,conn)
    if Connections[name] then pcall(function() Connections[name]:Disconnect() end) end
    Connections[name]=conn
end
local Cache={hrp=nil,hum=nil,cacheTime=0}
local function refreshChar()
    if tick()-Cache.cacheTime<0.5 then return end
    Cache.cacheTime=tick()
    local c=LocalPlayer.Character
    if c then Cache.hrp=c:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))());Cache.hum=c:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
    else Cache.hrp,Cache.hum=nil,nil end
end
local function getHRP() refreshChar() return Cache.hrp end
local function getHum() refreshChar() return Cache.hum end
local function getRoundData()
    local ok,m=pcall(function() return require(ReplicatedStorage:WaitForChild(loadstring(base64decode("TW9kdWxlcw=="))()):WaitForChild(loadstring(base64decode("Q3VycmVudFJvdW5kQ2xpZW50"))())) end)
    if ok and type(m)==loadstring(base64decode("dGFibGU="))() then return m.PlayerData end
    return nil
end
local function getRoleFromData(p)
    if not p then return loadstring(base64decode("bG9iYnk="))() end
    local ok,m=pcall(function() return require(ReplicatedStorage:WaitForChild(loadstring(base64decode("TW9kdWxlcw=="))()):WaitForChild(loadstring(base64decode("Q3VycmVudFJvdW5kQ2xpZW50"))())) end)
    if ok and type(m)==loadstring(base64decode("dGFibGU="))() and type(m.PlayerData)==loadstring(base64decode("dGFibGU="))() then
        local d=m.PlayerData[p.Name]
        if d and not d.Dead then
            if d.Role==loadstring(base64decode("TXVyZGVyZXI="))() then return loadstring(base64decode("bXVyZGVyZXI="))() end
            if d.Role==loadstring(base64decode("U2hlcmlmZg=="))() then return loadstring(base64decode("c2hlcmlmZg=="))() end
            if d.Role==loadstring(base64decode("SGVybw=="))() then return loadstring(base64decode("aGVybw=="))() end
            if d.Role==loadstring(base64decode("SW5ub2NlbnQ="))() then return loadstring(base64decode("aW5ub2NlbnQ="))() end
        end
    end
    local c=p.Character
    if c then
        local bp=p:FindFirstChild(loadstring(base64decode("QmFja3BhY2s="))())
        if c:FindFirstChild(loadstring(base64decode("S25pZmU="))()) or (bp and bp:FindFirstChild(loadstring(base64decode("S25pZmU="))())) then return loadstring(base64decode("bXVyZGVyZXI="))() end
        if c:FindFirstChild(loadstring(base64decode("R3Vu"))()) or (bp and bp:FindFirstChild(loadstring(base64decode("R3Vu"))())) then
            local allData=getRoundData()
            if allData then
                for _,info in pairs(allData) do
                    if type(info)==loadstring(base64decode("dGFibGU="))() and info.Role==loadstring(base64decode("U2hlcmlmZg=="))() and info.Dead then return loadstring(base64decode("aGVybw=="))() end
                end
            end
            return loadstring(base64decode("c2hlcmlmZg=="))()
        end
    end
    return loadstring(base64decode("dW5rbm93bg=="))()
end
local function isMurderer()
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LocalPlayer and getRoleFromData(p)==loadstring(base64decode("bXVyZGVyZXI="))() then return p end
    end
    return nil
end
local function srand(a,b)
    local _orig=math.random
    if a==nil then return _orig() end
    if b==nil then
        if type(a)~=loadstring(base64decode("bnVtYmVy"))() or a~=a or a<1 then a=1 end
        if a>2147483647 then a=2147483647 end
        return _orig(math.floor(a))
    end
    a,b=tonumber(a) or 0,tonumber(b) or 0
    if b<a then a,b=b,a end
    if a==b then return a end
    return _orig(math.floor(a),math.floor(b))
end

local KeyCodeLookup = {}
do
    local ok, items = pcall(function() return Enum.KeyCode:GetEnumItems() end)
    if ok and type(items) == loadstring(base64decode("dGFibGU="))() then
        for _, item in ipairs(items) do
            KeyCodeLookup[item.Name] = item
        end
    end
end
local function safeGetKeyCode(name)
    if type(name) ~= loadstring(base64decode("c3RyaW5n"))() then return nil end
    return KeyCodeLookup[name]
end

local OnChangedRegistry={}
getgenv().FH_OnChangedRegistry=OnChangedRegistry
local function registerOnChanged(name, cb) OnChangedRegistry[name]=cb end
local function fireRegistered(name, value)
    local cb=OnChangedRegistry[name]
    if cb then pcall(cb, value) end
end

local Fluent
do
    print(loadstring(base64decode("W0ZIXSDQl9Cw0LPRgNGD0LbQsNGOIEZsdWVudCBVSS4uLg=="))())
    local urls={
        loadstring(base64decode("aHR0cHM6Ly9naXRodWIuY29tL2Rhd2lkLXNjcmlwdHMvRmx1ZW50L3JlbGVhc2VzL2xhdGVzdC9kb3dubG9hZC9tYWluLmx1YQ=="))(),
        loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2Rhd2lkLXNjcmlwdHMvRmx1ZW50L21haW4vc3JjL2luaXQubHVh"))(),
        loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2Rhd2lkLXNjcmlwdHMvRmx1ZW50L21hc3Rlci9zcmMvaW5pdC5sdWE="))(),
        loadstring(base64decode("aHR0cHM6Ly9jZG4uanNkZWxpdnIubmV0L2doL2Rhd2lkLXNjcmlwdHMvRmx1ZW50QG1haW4vc3JjL2luaXQubHVh"))(),
        loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aGFjay5jb20vZGF3aWQtc2NyaXB0cy9GbHVlbnQvbWFpbi9zcmMvaW5pdC5sdWE="))(),
    }
    local body
    for _,u in ipairs(urls) do
        local ok,b=pcall(function() return game:HttpGet(u,true) end)
        if ok and type(b)==loadstring(base64decode("c3RyaW5n"))() and #b>1000 and not b:find(loadstring(base64decode("PGh0bWw="))()) then body=b;break end
    end
    if not body then error(loadstring(base64decode("W0ZIXSDQndC1INGD0LTQsNC70L7RgdGMINC30LDQs9GA0YPQt9C40YLRjCBGbHVlbnQgVUk="))()) end
    local fn=loadstring(body,loadstring(base64decode("QEZsdWVudA=="))())
    Fluent=fn and fn()
    if type(Fluent)~=loadstring(base64decode("dGFibGU="))() then error(loadstring(base64decode("W0ZIXSBGbHVlbnQg0L3QtSDRgtCw0LHQu9C40YbQsA=="))()) end
    print(loadstring(base64decode("W0ZIXSBGbHVlbnQg0LfQsNCz0YDRg9C20LXQvQ=="))())
end
local function adaptTab(tab)
    if not tab then return tab end
    for _,name in ipairs({loadstring(base64decode("QWRkVG9nZ2xl"))(),loadstring(base64decode("QWRkU2xpZGVy"))(),loadstring(base64decode("QWRkRHJvcGRvd24="))(),loadstring(base64decode("QWRkSW5wdXQ="))(),loadstring(base64decode("QWRkQnV0dG9u"))(),loadstring(base64decode("QWRkTGFiZWw="))(),loadstring(base64decode("QWRkS2V5YmluZA=="))(),loadstring(base64decode("QWRkQ29sb3JwaWNrZXI="))(),loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))()}) do
        local orig=tab[name]
        if type(orig)==loadstring(base64decode("ZnVuY3Rpb24="))() and not rawget(tab,loadstring(base64decode("X18="))()..name) then
            rawset(tab,loadstring(base64decode("X18="))()..name,true)
            tab[name]=function(self,...)
                local r=orig(self,...)
                if type(r)==loadstring(base64decode("dGFibGU="))() and r.Option==nil then r.Option=r end
                return r
            end
        end
    end
    if type(tab.AddColorpicker)==loadstring(base64decode("ZnVuY3Rpb24="))() and type(tab.AddColorPicker)~=loadstring(base64decode("ZnVuY3Rpb24="))() then tab.AddColorPicker=tab.AddColorpicker end
    if type(tab.AddSection)==loadstring(base64decode("ZnVuY3Rpb24="))() and not rawget(tab,loadstring(base64decode("X19BUw=="))()) then
        rawset(tab,loadstring(base64decode("X19BUw=="))(),true)
        local origAS=tab.AddSection
        tab.AddSection=function(self,arg)
            if type(arg)==loadstring(base64decode("dGFibGU="))() then arg=arg.Name or arg.name or loadstring(base64decode("0KHQtdC60YbQuNGP"))() end
            if arg==nil then arg=loadstring(base64decode("0KHQtdC60YbQuNGP"))() end
            local sec=origAS(self,arg)
            if sec then
                if sec.Option==nil then sec.Option=sec end
                adaptTab(sec)
            end
            return sec
        end
    end
    return tab
end
local Window,Options=nil,nil
do
    Window=Fluent:CreateWindow({
        Title=loadstring(base64decode("Rm9ydG5pSHViIE1NMg=="))(),
        SubTitle=loadstring(base64decode("dg=="))()..VERSION..loadstring(base64decode("IOKAlCA="))()..CREDITS,
        TabWidth=130,
        Size=UDim2.fromOffset(420,300),
        Theme=loadstring(base64decode("RGFya2Vy"))(),
        MinimizeKey=Enum.KeyCode.P,
    })
    Options=Fluent.Options
    getgenv().FH_Window=Window
    getgenv().Options=Options
    local origAddTab=Window.AddTab
    Window.AddTab=function(self,...)
        local tab=origAddTab(self,...)
        return adaptTab(tab)
    end
end
local Tabs={}
getgenv().FH_Tabs=Tabs
Tabs.Combat=Window:AddTab({Title=loadstring(base64decode("0JHQvtC5"))()})
Tabs.Movement=Window:AddTab({Title=loadstring(base64decode("0JTQstC40LbQtdC90LjQtQ=="))()})
Tabs.Binds=Window:AddTab({Title=loadstring(base64decode("0JHQuNC90LTRiw=="))()})
Tabs.Visual=Window:AddTab({Title=loadstring(base64decode("0JLQuNC30YPQsNC7"))()})
Tabs.Effects=Window:AddTab({Title=loadstring(base64decode("0K3RhNGE0LXQutGC0Ys="))()})
Tabs.Farm=Window:AddTab({Title=loadstring(base64decode("0KTQsNGA0Lw="))()})
Tabs.Animations=Window:AddTab({Title=loadstring(base64decode("0K3QvNC+0YbQuNC4"))()})
Tabs.Utility=Window:AddTab({Title=loadstring(base64decode("0KPRgtC40LvQuNGC0Ys="))()})
Tabs.Troll=Window:AddTab({Title=loadstring(base64decode("0KLRgNC+0LvQu9C40L3Qsw=="))()})
Tabs.Settings=Window:AddTab({Title=loadstring(base64decode("0J3QsNGB0YLRgNC+0LnQutC4"))()})

local function addOpt(container, method, name, opts, callback)
    local opt = container[method](container, name, opts)
    if opt and callback then
        opt:OnChanged(callback)
        registerOnChanged(name, callback)
    end
    return opt
end

local lastNotify={}
local function Notify(title,content,dur)
    local k=tostring(title)..loadstring(base64decode("fA=="))()..tostring(content)
    if lastNotify[k] and (tick()-lastNotify[k])<0.5 then return end
    lastNotify[k]=tick()
    pcall(function() Fluent:Notify({Title=title,Content=content,Duration=dur or 3}) end)
end
getgenv().FH_Notify=Notify

task.spawn(function()
    task.wait(0.8)
    Notify(loadstring(base64decode("Rm9ydG5pSHVi"))(),loadstring(base64decode("0KHQutGA0LjQv9GCINCx0YvQuyDRgdC+0LfQtNCw0L0gSE9USSDQuCBWZTMxNS4="))(), 7)
    task.wait(1.2)
    Notify(loadstring(base64decode("Rm9ydG5pSHVi"))(),loadstring(base64decode("0KHQutGA0LjQv9GCINC90LDRhdC+0LTQuNGC0YHRjyDQsiBCRVRBINCy0LXRgNGB0LjQuCwg0LzQvtCz0YPRgiDQsdGL0YLRjCDQsdCw0LPQuC4="))(), 7)
end)

local HUDGui,FPSLabel,PingLabel,Pill
do
    pcall(function()
        for _,name in ipairs({loadstring(base64decode("RkhfSFVEX3YxOA=="))(),loadstring(base64decode("RkhfSFVE"))(),loadstring(base64decode("RkhfSFVEX3YxODI="))(),loadstring(base64decode("RkhfSFVEX3YxODIx"))(),loadstring(base64decode("RkhfSFVEX3YxODM="))(),loadstring(base64decode("RkhfSFVEX3YxODQ="))(),loadstring(base64decode("RkhfSFVEX3YxODU="))(),loadstring(base64decode("RkhfSFVEX3YxODY="))(),loadstring(base64decode("RkhfSFVEX3YxOQ=="))(),loadstring(base64decode("RkhfSFVEX3YyMA=="))(),loadstring(base64decode("RkhfSFVEX3YyMQ=="))()}) do
            local old=CoreGui:FindFirstChild(name)
            if old then old:Destroy() end
        end
    end)
    HUDGui=Instance.new(loadstring(base64decode("U2NyZWVuR3Vp"))())
    HUDGui.Name=loadstring(base64decode("RkhfSFVEX3YyMg=="))()
    HUDGui.ResetOnSpawn=false
    HUDGui.IgnoreGuiInset=true
    HUDGui.DisplayOrder=500
    HUDGui.Parent=CoreGui
    Pill=Instance.new(loadstring(base64decode("RnJhbWU="))())
    Pill.Name=loadstring(base64decode("UGlsbA=="))()
    Pill.AnchorPoint=Vector2.new(0.5,0)
    Pill.Position=UDim2.new(0.5,0,0,12)
    Pill.Size=UDim2.fromOffset(400,40)
    Pill.BackgroundColor3=Color3.fromRGB(15,15,20)
    Pill.BorderSizePixel=0
    Pill.Active=true
    Pill.Parent=HUDGui
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(),Pill).CornerRadius=UDim.new(1,0)
    local stroke=Instance.new(loadstring(base64decode("VUlTdHJva2U="))(),Pill)
    stroke.Color=Color3.fromRGB(138,92,246)
    stroke.Thickness=1
    stroke.Transparency=0.5
    local grad=Instance.new(loadstring(base64decode("VUlHcmFkaWVudA=="))(),Pill)
    grad.Rotation=45
    grad.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(40,30,60)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(20,20,28)),ColorSequenceKeypoint.new(1,Color3.fromRGB(40,30,60))})
    local dragging,dragStart,posStart,dragMoved=false,nil,nil,false
    local TAP=6
    local function toggleMenu()
        local w=getgenv().FH_Window
        if w and type(w.Toggle)==loadstring(base64decode("ZnVuY3Rpb24="))() then
            local ok=pcall(function() w:Toggle() end)
            if ok then return end
        end
        pcall(function()
            VirtualInputManager:SendKeyEvent(true,Enum.KeyCode.P,false,game)
            task.wait(0.02)
            VirtualInputManager:SendKeyEvent(false,Enum.KeyCode.P,false,game)
        end)
    end
    Pill.InputBegan:Connect(function(uSCGtGib)
        if uSCGtGib.UserInputType==Enum.UserInputType.MouseButton1 or uSCGtGib.UserInputType==Enum.UserInputType.Touch then
            dragging=true;dragMoved=false;dragStart=uSCGtGib.Position;posStart=Pill.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(uSCGtGib)
        if not dragging then return end
        if uSCGtGib.UserInputType==Enum.UserInputType.MouseMovement or uSCGtGib.UserInputType==Enum.UserInputType.Touch then
            local d=uSCGtGib.Position-dragStart
            if math.abs(d.X)>TAP or math.abs(d.Y)>TAP then dragMoved=true end
            if dragMoved then Pill.Position=UDim2.new(posStart.X.Scale,posStart.X.Offset+d.X,posStart.Y.Scale,posStart.Y.Offset+d.Y) end
        end
    end)
    UserInputService.InputEnded:Connect(function(uSCGtGib)
        if uSCGtGib.UserInputType~=Enum.UserInputType.MouseButton1 and uSCGtGib.UserInputType~=Enum.UserInputType.Touch then return end
        if not dragging then return end
        local wasTap=not dragMoved
        dragging=false
        if wasTap then toggleMenu() end
    end)
    local function seg(8VHdxnGv,w)
        local f=Instance.new(loadstring(base64decode("RnJhbWU="))())
        f.BackgroundTransparency=1
        f.Position=UDim2.fromOffset(8VHdxnGv,0)
        f.Size=UDim2.fromOffset(w,40)
        f.Parent=Pill
        return f
    end
    local function div(8VHdxnGv)
        local d=Instance.new(loadstring(base64decode("RnJhbWU="))())
        d.BackgroundColor3=Color3.fromRGB(70,70,85)
        d.BorderSizePixel=0
        d.Position=UDim2.new(0,8VHdxnGv,0.5,-10)
        d.Size=UDim2.fromOffset(1,20)
        d.Parent=Pill
    end
    local s1=seg(8,130)
    local logo=Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    logo.BackgroundTransparency=1
    logo.Size=UDim2.fromOffset(120,40)
    logo.Position=UDim2.fromOffset(12,0)
    logo.Font=Enum.Font.GothamBold
    logo.Text=loadstring(base64decode("Rkg="))()
    logo.TextSize=20
    logo.TextColor3=Color3.fromRGB(178,152,255)
    logo.TextXAlignment=Enum.TextXAlignment.Left
    logo.Parent=s1
    div(142)
    local s2=seg(146,120)
    local fpsIcon=Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    fpsIcon.BackgroundTransparency=1
    fpsIcon.Size=UDim2.fromOffset(40,40)
    fpsIcon.Position=UDim2.fromOffset(6,0)
    fpsIcon.Font=Enum.Font.GothamBold
    fpsIcon.Text=loadstring(base64decode("RlBT"))()
    fpsIcon.TextSize=13
    fpsIcon.TextColor3=Color3.fromRGB(140,140,160)
    fpsIcon.TextXAlignment=Enum.TextXAlignment.Left
    fpsIcon.Parent=s2
    FPSLabel=Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    FPSLabel.BackgroundTransparency=1
    FPSLabel.Size=UDim2.fromOffset(60,40)
    FPSLabel.Position=UDim2.fromOffset(46,0)
    FPSLabel.Font=Enum.Font.GothamBold
    FPSLabel.Text=loadstring(base64decode("NjA="))()
    FPSLabel.TextSize=15
    FPSLabel.TextColor3=Color3.fromRGB(80,240,120)
    FPSLabel.TextXAlignment=Enum.TextXAlignment.Left
    FPSLabel.Parent=s2
    div(270)
    local s3=seg(274,110)
    local pingIcon=Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    pingIcon.BackgroundTransparency=1
    pingIcon.Size=UDim2.fromOffset(30,40)
    pingIcon.Position=UDim2.fromOffset(6,0)
    pingIcon.Font=Enum.Font.GothamBold
    pingIcon.Text=loadstring(base64decode("bXM="))()
    pingIcon.TextSize=13
    pingIcon.TextColor3=Color3.fromRGB(140,140,160)
    pingIcon.TextXAlignment=Enum.TextXAlignment.Left
    pingIcon.Parent=s3
    PingLabel=Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    PingLabel.BackgroundTransparency=1
    PingLabel.Size=UDim2.fromOffset(60,40)
    PingLabel.Position=UDim2.fromOffset(36,0)
    PingLabel.Font=Enum.Font.GothamBold
    PingLabel.Text=loadstring(base64decode("MA=="))()
    PingLabel.TextSize=15
    PingLabel.TextColor3=Color3.fromRGB(80,240,120)
    PingLabel.TextXAlignment=Enum.TextXAlignment.Left
    PingLabel.Parent=s3
    local function lockLabels()
        if FPSLabel and FPSLabel.Parent then
            local ok,cur=pcall(function() return FPSLabel.Text end)
            if not ok or type(cur)~=loadstring(base64decode("c3RyaW5n"))() or not tonumber(cur) then FPSLabel.Text=loadstring(base64decode("NjA="))() end
        end
        if PingLabel and PingLabel.Parent then
            local ok,cur=pcall(function() return PingLabel.Text end)
            if not ok or type(cur)~=loadstring(base64decode("c3RyaW5n"))() or not tonumber(cur) then PingLabel.Text=loadstring(base64decode("MA=="))() end
        end
    end
    local fc,lastSec=0,os.clock()
    AddConn(loadstring(base64decode("SFVEX0ZQUw=="))(),RunService.Heartbeat:Connect(function()
        fc=fc+1
        local now=os.clock()
        if now-lastSec>=1 then
            local cur=fc;fc=0;lastSec=now
            local c=cur<30 and Color3.fromRGB(255,80,80) or (cur<60 and Color3.fromRGB(255,200,80) or Color3.fromRGB(80,240,120))
            if FPSLabel and FPSLabel.Parent then FPSLabel.Text=tostring(cur) FPSLabel.TextColor3=c end
        end
    end))
    local lastPing=0
    AddConn(loadstring(base64decode("SFVEX1BJTkc="))(),RunService.Heartbeat:Connect(function()
        local now=os.clock()
        if now-lastPing<0.4 then return end
        lastPing=now
        local ok,p=pcall(function()
            local v=LocalPlayer:GetNetworkPing()*1000
            if v~=v or v<0 then v=0 end
            return math.floor(v)
        end)
        if ok and PingLabel and PingLabel.Parent then
            local c=p<60 and Color3.fromRGB(80,240,120) or (p<120 and Color3.fromRGB(255,200,80) or Color3.fromRGB(255,80,80))
            PingLabel.Text=tostring(p) PingLabel.TextColor3=c
        end
    end))
    task.spawn(function() while true do task.wait(0.5) lockLabels() end end)
    task.delay(0.5,lockLabels)
end

-- ============================================================
-- SILENT AIM
-- ============================================================
do
    local MAX_RANGE = 300
    local rs = ReplicatedStorage
    local players = Players
    local collection = CollectionService
    local run = RunService
    local lp = LocalPlayer
    local stats = Stats

    getgenv().SILENT_S = {
        enabled=false, predict=true, force=false, auto_on=false, auto_delay=0,
        am_sheriff=false, fire_gap=0, last_shot=0, stand_off=15,
    }
    local SS = getgenv().SILENT_S

    local silent_section = Tabs.Combat:AddSection({Name=loadstring(base64decode("0KLQuNGF0LjQuSDQstGL0YHRgtGA0LXQuw=="))()})

    local gap_min = 0
    local gap_seen = false
    local gap_gun = nil
    local want_since = 0

    local function gap_reset() gap_min=0 gap_seen=false SS.fire_gap=0 end
    local function gap_push(value)
        if value <= 0 then return end
        if not gap_seen or value < gap_min then
            gap_min=value gap_seen=true SS.fire_gap=value
        end
    end

    local round_mod = nil
    local function get_round()
        if round_mod then return round_mod end
        local ok, m = pcall(function()
            return require(rs:WaitForChild(loadstring(base64decode("TW9kdWxlcw=="))()):WaitForChild(loadstring(base64decode("Q3VycmVudFJvdW5kQ2xpZW50"))()))
        end)
        if ok and type(m) == loadstring(base64decode("dGFibGU="))() then round_mod = m end
        return round_mod
    end
    local function holds(container, name)
        return container ~= nil and container:FindFirstChild(name) ~= nil
    end
    local function lp_has_gun()
        return holds(lp.Character, loadstring(base64decode("R3Vu"))()) or holds(lp:FindFirstChildOfClass(loadstring(base64decode("QmFja3BhY2s="))()), loadstring(base64decode("R3Vu"))())
    end

    local target_player = nil
    local target_char = nil
    local target_part = nil
    local target_hum = nil

    local function refresh_target()
        local found = nil
        local m = get_round()
        local data = m and m.PlayerData or nil
        if type(data) == loadstring(base64decode("dGFibGU="))() then
            local me = data[lp.Name]
            SS.am_sheriff = (me ~= nil and (me.Role == loadstring(base64decode("U2hlcmlmZg=="))() or me.Role == loadstring(base64decode("SGVybw=="))())) or lp_has_gun()
            for name, d in pairs(data) do
                if type(d) == loadstring(base64decode("dGFibGU="))() and d.Role == loadstring(base64decode("TXVyZGVyZXI="))() and not d.Dead then
                    found = players:FindFirstChild(name)
                    break
                end
            end
        else
            SS.am_sheriff = lp_has_gun()
        end
        if not found then
            for _, plr in ipairs(players:GetPlayers()) do
                if plr ~= lp and holds(plr.Character, loadstring(base64decode("S25pZmU="))()) then
                    found = plr
                    break
                end
            end
        end
        if found ~= target_player then
            target_player = found
            target_char = nil
            target_part = nil
            target_hum = nil
        end
        if not found then return end
        local char = found.Character
        if char ~= target_char then
            target_char = char
            target_part = nil
            target_hum = nil
        end
        if not char then return end
        if not target_part or not target_part.Parent then
            target_part = char:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))()) or char:FindFirstChild(loadstring(base64decode("VXBwZXJUb3Jzbw=="))()) or char:FindFirstChild(loadstring(base64decode("VG9yc28="))())
        end
        if not target_hum or not target_hum.Parent then
            target_hum = char:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
        end
    end

    local function target_alive()
        if not target_part or not target_part.Parent then return false end
        if not target_hum or not target_hum.Parent then return false end
        return target_hum.Health > 0
    end

    local ray_params = RaycastParams.new()
    ray_params.FilterType = Enum.RaycastFilterType.Exclude
    ray_params.IgnoreWater = false

    local ignore_base = {}
    local ignore_work = {}
    local ignore_time = 0

    local function refresh_ignore()
        local now = os.clock()
        if #ignore_base > 0 and now - ignore_time < 0.5 then return end
        ignore_time = now
        table.clear(ignore_base)
        local char = lp.Character
        if char then ignore_base[1] = char end
        local ok, tagged = pcall(function() return collection:GetTagged(loadstring(base64decode("V2VhcG9uUGFzc3Rocm91Z2g="))()) end)
        if ok and type(tagged) == loadstring(base64decode("dGFibGU="))() then
            for k = 1, #tagged do ignore_base[#ignore_base + 1] = tagged[k] end
        end
    end

    local function trace(origin, direction)
        refresh_ignore()
        table.clear(ignore_work)
        for k = 1, #ignore_base do ignore_work[k] = ignore_base[k] end
        local result = nil
        for _ = 1, 6 do
            ray_params.FilterDescendantsInstances = ignore_work
            result = workspace:Raycast(origin, direction, ray_params)
            if not result then break end
            local inst = result.Instance
            if not inst then break end
            local ok, tr = pcall(function() return inst.Transparency end)
            if not ok or tr ~= 1 then break end
            ignore_work[#ignore_work + 1] = inst
        end
        return result
    end

    local function gun_attachment()
        local char = lp.Character
        local hrp = char and char:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
        if not hrp then return nil, nil end
        return hrp:FindFirstChild(loadstring(base64decode("R3VuUmF5Y2FzdEF0dGFjaG1lbnQ="))()), hrp
    end
    local function origin_cframe()
        local att, hrp = gun_attachment()
        if att then return att.WorldCFrame end
        if hrp then return hrp.CFrame end
        return nil
    end
    local function grav()
        local ok, g = pcall(function() return workspace.Gravity end)
        if ok and type(g) == loadstring(base64decode("bnVtYmVy"))() and g > 0 then return g end
        return 0
    end

    local P = {
        snap=48, ring=48, hit_r=2.1, pad=2.6, min_span=5, max_span=90,
        acc_t=0.15, acc_max=280, acc_min=40, speed_floor=26, speed_head=1.3,
    }

    local snap_t = table.create(P.snap, 0)
    local snap_p = table.create(P.snap, Vector3.zero)
    local snap_n = 0
    local snap_i = 0

    local TR = {
        part=nil, pos=nil, time=0, vel=Vector3.zero, gap=0,
        ready=false, fresh=Vector3.zero, air=false, air_since=0,
        jumping=false, jump_v=0, fresh_ok=false, turn=0,
        spoof=0, clr=0, air_edge=0, jump_fresh=false,
    }

    local SK = {
        vt=table.create(P.ring, 0), dx=table.create(P.ring, 0), dz=table.create(P.ring, 0),
        vn=0, vi=0,
    }

    local EC = { ping=0, rtt=0, jitter=0, seen=false, step=0, step_seen=false }

    local function step_push(dt)
        if dt <= 0 or dt > 0.5 then return end
        if EC.step_seen then EC.step = EC.step * 0.85 + dt * 0.15
        else EC.step = dt EC.step_seen = true end
    end
    local function sample_span()
        local span = math.max(EC.step, TR.gap)
        if span <= 0 then return 0 end
        return span
    end

    local HY = { pos={}, w={}, n=0, weight=0, primary=nil, stamp=0, conf=0 }

    local ground_params = RaycastParams.new()
    ground_params.FilterType = Enum.RaycastFilterType.Exclude
    ground_params.IgnoreWater = true
    local ground_filter = {}
    local axis_pool = {}

    local function ground_below(pos, reach)
        table.clear(ground_filter)
        local n = 0
        local char = target_char
        if char then n = n + 1; ground_filter[n] = char end
        local mine = lp.Character
        if mine then n = n + 1; ground_filter[n] = mine end
        ground_params.FilterDescendantsInstances = ground_filter
        local res = workspace:Raycast(pos, Vector3.new(0, -reach, 0), ground_params)
        if res then return res.Position.Y end
        return nil
    end

    local function snap_push(now, pos)
        snap_i = snap_i % P.snap + 1
        snap_t[snap_i] = now
        snap_p[snap_i] = pos
        if snap_n < P.snap then snap_n = snap_n + 1 end
    end
    local function snap_get(k)
        local idx = (snap_i - k - 1) % P.snap + 1
        return snap_t[idx], snap_p[idx]
    end

    local function fit_velocity()
        if snap_n < 3 then return nil end
        local newest = snap_get(0)
        local used = 0
        local sum_d = 0
        local win = sample_span() * 4
        for k = 0, snap_n - 1 do
            local t = snap_get(k)
            if newest - t > win then break end
            used = used + 1
            sum_d = sum_d + t - newest
        end
        if used < 3 then return nil end
        local mean_d = sum_d / used
        local num = Vector3.zero
        local den = 0
        for k = 0, used - 1 do
            local t, p = snap_get(k)
            local d = t - newest - mean_d
            num = num + p * d
            den = den + d * d
        end
        if den < 1e-8 then return nil end
        return num / den, -mean_d
    end

    local function recent_velocity()
        if snap_n < 2 then return nil end
        local newest, head = snap_get(0)
        local fallback, fallback_age = nil, nil
        local target_span = sample_span() * 2
        local max_span = target_span * 2
        for k = 1, snap_n - 1 do
            local t, p = snap_get(k)
            local dt = newest - t
            if dt > max_span then break end
            if dt > 0 then
                fallback = (head - p) / dt
                fallback_age = dt * 0.5
                if dt >= target_span then return fallback, fallback_age end
            end
        end
        return fallback, fallback_age
    end

    local KIN = { ok=false, ax=0, az=0, smax=0 }
    local function kin_clear() KIN.ok=false KIN.ax=0 KIN.az=0 KIN.smax=0 end

    local function fit_kin()
        if snap_n < 5 then return nil end
        local t0 = snap_get(0)
        local win = math.max(sample_span() * 5, 0.12)
        local scale = win
        local n, s1, s2, s3, s4 = 0, 0, 0, 0, 0
        local bx0, bx1, bx2 = 0, 0, 0
        local bz0, bz1, bz2 = 0, 0, 0
        for k = 0, snap_n - 1 do
            local t, p = snap_get(k)
            local age = t0 - t
            if age > win then break end
            local u = -age / scale
            local u2 = u * u
            n = n + 1
            s1 = s1 + u; s2 = s2 + u2; s3 = s3 + u2 * u; s4 = s4 + u2 * u2
            bx0 = bx0 + p.X; bx1 = bx1 + p.X * u; bx2 = bx2 + p.X * u2
            bz0 = bz0 + p.Z; bz1 = bz1 + p.Z * u; bz2 = bz2 + p.Z * u2
        end
        if n < 5 then return nil end
        local det = n*(s2*s4 - s3*s3) - s1*(s1*s4 - s3*s2) + s2*(s1*s3 - s2*s2)
        if math.abs(det) < 1e-9 then return nil end
        local function solve(b0, b1, b2)
            local d1 = n*(b1*s4 - s3*b2) - b0*(s1*s4 - s3*s2) + s2*(s1*b2 - b1*s2)
            local d2 = n*(s2*b2 - b1*s3) - s1*(s1*b2 - b1*s2) + b0*(s1*s3 - s2*s2)
            return d1/det, d2/det
        end
        local cx1, cx2 = solve(bx0, bx1, bx2)
        local cz1, cz2 = solve(bz0, bz1, bz2)
        local vx, vz = cx1/scale, cz1/scale
        local ax, az = 2*cx2/(scale*scale), 2*cz2/(scale*scale)
        if vx ~= vx or vz ~= vz or ax ~= ax or az ~= az then return nil end
        return Vector3.new(vx, 0, vz), Vector3.new(ax, 0, az)
    end

    local function kin_update()
        local kv, ka = fit_kin()
        if not kv then KIN.ok=false KIN.ax=0 KIN.az=0 return nil end
        KIN.ok = true
        local sp = math.sqrt(kv.X*kv.X + kv.Z*kv.Z)
        if sp > KIN.smax then KIN.smax = sp
        else KIN.smax = KIN.smax * 0.985 + sp * 0.015 end
        if ka and not TR.air then
            local am = math.sqrt(ka.X*ka.X + ka.Z*ka.Z)
            local ax, az = ka.X, ka.Z
            if am > P.acc_max and am > 0 then
                ax = ax * P.acc_max / am
                az = az * P.acc_max / am
            end
            KIN.ax = KIN.ax*0.5 + ax*0.5
            KIN.az = KIN.az*0.5 + az*0.5
        else
            KIN.ax = KIN.ax*0.5
            KIN.az = KIN.az*0.5
        end
        return kv
    end

    local function snap_vel(k)
        local t0, p0 = snap_get(k)
        local t1, p1 = snap_get(k+1)
        local d = t0 - t1
        if d <= 0 then return nil end
        return (p0 - p1) / d, d
    end

    local function vert_accel()
        if snap_n < 3 then return nil end
        local v0, d0 = snap_vel(0)
        local v1, d1 = snap_vel(1)
        if not v0 or not v1 then return nil end
        local span = (d0 + d1) * 0.5
        if span <= 1e-4 then return nil end
        return (v0.Y - v1.Y) / span
    end

    local function air_vy()
        if snap_n < 2 then return nil end
        local edge = TR.air_edge
        if edge <= 0 then return nil end
        local g = grav()
        local newest, head = snap_get(0)
        local want = sample_span() * 2
        local best = nil
        for k = 1, snap_n - 1 do
            local t, p = snap_get(k)
            if t < edge then break end
            local dt = newest - t
            if dt > 1e-4 then
                best = (head.Y - p.Y)/dt - 0.5*g*dt
                if dt >= want then break end
            end
        end
        return best
    end

    local function body_clearance()
        local part = target_part
        local hum = target_hum
        if not part or not hum then return 0 end
        local ok, value = pcall(function() return part.Size.Y * 0.5 + hum.HipHeight end)
        if ok and type(value) == loadstring(base64decode("bnVtYmVy"))() and value > 0 then return value end
        return 0
    end

    local GC = { base=0, seen=false }
    local JL = { v=0, seen=false }
    local function stand_clearance()
        if GC.seen then return GC.base end
        return body_clearance()
    end

    local function engine_vel(part)
        local ok, v = pcall(function() return part.AssemblyLinearVelocity end)
        if not ok or typeof(v) ~= loadstring(base64decode("VmVjdG9yMw=="))() then
            ok, v = pcall(function() return part.Velocity end)
        end
        if not ok or typeof(v) ~= loadstring(base64decode("VmVjdG9yMw=="))() then return nil end
        if v.Magnitude ~= v.Magnitude then return nil end
        return v
    end
    local function vel_trust(pv, ev)
        if not pv or not ev then return 0 end
        local ph = Vector3.new(pv.X, 0, pv.Z)
        local eh = Vector3.new(ev.X, 0, ev.Z)
        local pm, em = ph.Magnitude, eh.Magnitude
        if pm < 1 and em < 1 then return 1 end
        if pm < 1 or em < 1 then return 0 end
        local ratio = em / pm
        if ratio > 1.5 or ratio < 0.6 then return 0 end
        local align = ph.Unit:Dot(eh.Unit)
        if align < 0.7 then return 0 end
        local a = math.clamp((align - 0.7)/0.25, 0, 1)
        local r = 1 - math.clamp(math.abs(ratio - 1)/0.4, 0, 1)
        return a * r
    end
    local function phase_velocity(v, age, air)
        if not v then return nil end
        local KbNcpS8c = 0
        if air then KbNcpS8c = v.Y - grav() * math.clamp(age or 0, 0, sample_span() * 4) end
        return Vector3.new(v.X, KbNcpS8c, v.Z)
    end
    local function merge_vel(fit, fit_age, fast, fast_age, engine, engine_age, air)
        local stable = phase_velocity(fit, fit_age, air)
        local instant = phase_velocity(fast, fast_age, air)
        local turn = 0
        if stable and instant then
            local sh = Vector3.new(stable.X, 0, stable.Z)
            local ih = Vector3.new(instant.X, 0, instant.Z)
            if sh.Magnitude > 1 and ih.Magnitude > 1 then
                turn = math.acos(math.clamp(sh.Unit:Dot(ih.Unit), -1, 1)) / math.pi
            end
        end
        local base = instant or stable
        if not base then return Vector3.zero, 0, nil, 0 end
        if stable and instant then
            local agility = math.clamp(turn * 2.2, 0, 1)
            base = stable:Lerp(instant, 0.4 + 0.6 * agility)
        end
        local trust = 0
        if engine then
            local live = phase_velocity(engine, engine_age, air)
            trust = vel_trust(base, live)
            if trust > 0 and air then
                base = Vector3.new(base.X, base.Y, base.Z):Lerp(Vector3.new(base.X, live.Y, base.Z), trust * 0.35)
            end
        end
        return base, turn, instant or stable, trust
    end
    local function vel_push(now, hx, hz)
        SK.vi = SK.vi % P.ring + 1
        SK.vt[SK.vi] = now
        SK.dx[SK.vi] = hx
        SK.dz[SK.vi] = hz
        if SK.vn < P.ring then SK.vn = SK.vn + 1 end
    end
    local function track_clear()
        TR.part=nil TR.pos=nil TR.vel=Vector3.zero TR.gap=0
        TR.ready=false TR.fresh=Vector3.zero TR.air=false
        TR.jumping=false TR.jump_v=0 TR.fresh_ok=false
        TR.turn=0 TR.spoof=0 TR.clr=0 TR.air_edge=0 TR.jump_fresh=false
        GC.base=0 GC.seen=false
        JL.v=0 JL.seen=false
        snap_n, snap_i = 0, 0
        SK.vn, SK.vi = 0, 0
        kin_clear()
    end
    local function track_seed(part, pos, now)
        TR.part=part TR.pos=pos TR.time=now
        TR.vel=Vector3.zero TR.fresh=Vector3.zero TR.fresh_ok=false
        TR.turn=0 TR.jump_v=0 TR.gap=0 TR.ready=false
        TR.spoof=0 TR.air_edge=0 TR.jump_fresh=false
        GC.base=0 GC.seen=false
        snap_n, snap_i = 0, 0
        kin_clear()
        snap_push(now, pos)
    end
    local function track_fresh(now)
        local part = target_part
        if not part or not part.Parent then TR.fresh_ok = false return end
        local pos = part.Position
        local g = grav()
        local sv = snap_vel(0)
        local vy = sv and sv.Y or 0
        local accel = vert_accel()
        local falling = accel ~= nil and accel < -g*0.5
        local guess = stand_clearance()
        local reach = guess + 6 + math.abs(vy)*sample_span()*4
        local air
        local gy = ground_below(pos, reach)
        if gy then
            local clr = pos.Y - gy
            TR.clr = clr
            if math.abs(vy) < 1 and not falling then
                if GC.seen then
                    if clr < GC.base then GC.base = GC.base*0.7 + clr*0.3
                    else GC.base = GC.base*0.98 + clr*0.02 end
                else GC.base=clr GC.seen=true end
            end
            local floor = GC.seen and GC.base or guess
            local tol = math.max(floor * 0.35, 1)
            air = clr > floor + tol
            if not air and falling and math.abs(vy) > 4 and clr > floor + 0.35 then air = true end
        else air = true end
        if air ~= TR.air then
            TR.air_edge = now
            if air then
                TR.air_since = now
                TR.jump_fresh = true
                TR.jump_v = JL.seen and JL.v or math.max(vy, 0)
            else
                TR.jump_fresh = false
                TR.jump_v = 0
            end
        end
        local model_vy = TR.jump_v - g*math.max(0, now - TR.air_since)
        TR.air = air
        TR.jumping = air and (vy > 1 or model_vy > 1)
    end
    local function track(now)
        local part = target_part
        if not part or not part.Parent then
            if TR.part then track_clear() end
            return
        end
        track_fresh(now)
        local pos = part.Position
        if part ~= TR.part or not TR.pos then
            track_seed(part, pos, now)
            return
        end
        local dt = now - TR.time
        if dt > 0.75 or (pos - TR.pos).Magnitude > 140 then
            track_seed(part, pos, now)
            return
        end
        if dt <= 0 then return end
        if (pos - TR.pos).Magnitude == 0 then
            if TR.gap > 0 and dt >= TR.gap then
                TR.vel = Vector3.zero
                TR.fresh = Vector3.zero
            end
            return
        end
        step_push(dt)
        TR.gap = dt
        snap_push(now, pos)
        TR.pos = pos
        TR.time = now
        local fit, fit_age = fit_velocity()
        local fast, fast_age = recent_velocity()
        local engine = engine_vel(part)
        local fresh, turn, instant, trust = merge_vel(fit, fit_age, fast, fast_age, engine, sample_span()*0.5, TR.air)
        local kv = kin_update()
        if kv then fresh = Vector3.new(kv.X, fresh.Y, kv.Z) end
        if engine and trust <= 0 then
            if TR.spoof < 20 then TR.spoof = TR.spoof + 1 end
        elseif TR.spoof > 0 then TR.spoof = TR.spoof - 1 end
        if TR.air then
            local vy = air_vy()
            if vy then
                fresh = Vector3.new(fresh.X, vy, fresh.Z)
                local since = math.max(0, now - TR.air_edge)
                if TR.jump_fresh and since <= 0.2 then
                    local impulse = vy + grav()*since
                    if impulse > 1 then
                        if JL.seen then JL.v = JL.v*0.7 + impulse*0.3
                        else JL.v = impulse JL.seen = true end
                        if impulse > TR.jump_v then TR.jump_v = impulse end
                    end
                else TR.jump_fresh = false end
            end
        end
        TR.vel = fresh
        TR.ready = fit ~= nil or fast ~= nil
        TR.fresh = TR.vel
        TR.fresh_ok = TR.ready
        TR.turn = turn
        local raw = instant or fresh
        vel_push(now, raw.X, raw.Z)
    end

    local function raw_rtt()
        local a, b
        local ok, ms = pcall(function()
            return stats.Network.ServerStatsItem[loadstring(base64decode("RGF0YSBQaW5n"))()]:GetValue()
        end)
        if ok and type(ms) == loadstring(base64decode("bnVtYmVy"))() and ms == ms and ms > 4 and ms < 800 then a = ms/1000 end
        local fine, value = pcall(function() return lp:GetNetworkPing() end)
        if fine and type(value) == loadstring(base64decode("bnVtYmVy"))() and value == value and value > 0 then
            local rtt = value * 2
            if rtt > 0.004 and rtt < 0.8 then b = rtt end
        end
        if a and b then return (a + b) * 0.5 end
        return a or b
    end
    local function sample_ping()
        local rtt = raw_rtt()
        if not rtt or rtt ~= rtt then return end
        rtt = math.clamp(rtt, 0, 1)
        if EC.seen then
            EC.jitter = EC.jitter*0.9 + math.abs(rtt - EC.rtt)*0.1
            EC.rtt = EC.rtt*0.82 + rtt*0.18
        else EC.rtt=rtt EC.jitter=0 EC.seen=true end
        EC.ping = EC.rtt
    end
    local function lead_time()
        if not EC.seen then return 0 end
        local stale = 0
        if TR.time > 0 and EC.step_seen then
            stale = math.clamp(os.clock() - TR.time, 0, EC.step)
        end
        return math.clamp(EC.rtt + EC.jitter*0.5 + stale, 0, 1)
    end
    local function rotate_y(v, ang)
        local c, s = math.cos(ang), math.sin(ang)
        return Vector3.new(v.X*c - v.Z*s, v.Y, v.X*s + v.Z*c)
    end
    local function dir_stats(win)
        if SK.vn < 4 then return 1, 0 end
        win = math.max(win, sample_span()*3)
        local newest = SK.vt[SK.vi]
        local sx, sz, n = 0, 0, 0
        local prev = nil
        local turn, turn_n = 0, 0
        local oldest = newest
        for k = 0, SK.vn - 1 do
            local idx = (SK.vi - k - 1) % P.ring + 1
            local t = SK.vt[idx]
            if newest - t > win then break end
            local hx, hz = SK.dx[idx], SK.dz[idx]
            local m = math.sqrt(hx*hx + hz*hz)
            if m > 0 then
                sx = sx + hx/m
                sz = sz + hz/m
                n = n + 1
                local ang = math.atan2(hz, hx)
                if prev then
                    local d = ang - prev
                    while d > math.pi do d = d - 6.2831853 end
                    while d < -math.pi do d = d + 6.2831853 end
                    turn = turn + d
                    turn_n = turn_n + 1
                end
                prev = ang
                oldest = t
            end
        end
        if n < 2 then return 1, 0 end
        local coh = math.clamp(math.sqrt(sx*sx + sz*sz)/n, 0, 1)
        local omega = 0
        local elapsed = newest - oldest
        if turn_n >= 1 and elapsed > 1e-3 then omega = -turn/elapsed end
        return coh, omega
    end

    local function predict_from(base, sa, sb, fh, now)
        local span = math.max(0, sa + sb)
        local g = grav()
        local dir = fh
        if dir.Magnitude == 0 then dir = Vector3.new(TR.vel.X, 0, TR.vel.Z) end
        local 8VHdxnGv, Ar3r2fJH
        if span > 0 and KIN.ok then
            local age = math.clamp(now - TR.time, 0, sample_span()*2)
            local ax, az = KIN.ax, KIN.az
            if TR.air or math.sqrt(ax*ax + az*az) < P.acc_min then ax, az = 0, 0 end
            local vx = dir.X + ax*age
            local vz = dir.Z + az*age
            local ta = math.min(span, P.acc_t)
            local dx = vx*span + 0.5*ax*ta*ta
            local dz = vz*span + 0.5*az*ta*ta
            local reach = math.sqrt(dx*dx + dz*dz)
            local cap = math.max(KIN.smax*P.speed_head, P.speed_floor)*span
            if reach > cap and reach > 1e-6 then
                dx = dx*cap/reach
                dz = dz*cap/reach
            end
            8VHdxnGv = base.X + dx
            Ar3r2fJH = base.Z + dz
        else
            local hspan = span
            if span > 0 and dir.Magnitude > 0 and not TR.air then
                local coh, omega = dir_stats(span)
                local conf = math.clamp(coh, 0, 1) * (1 - math.clamp(TR.turn, 0, 1)*0.5)
                if omega ~= 0 then dir = rotate_y(dir, math.clamp(omega*span*0.5*conf, -0.6, 0.6)) end
                hspan = span * (0.85 + 0.15*conf)
            end
            8VHdxnGv = base.X + dir.X*hspan
            Ar3r2fJH = base.Z + dir.Z*hspan
        end
        local KbNcpS8c = base.Y
        if TR.air and span > 0 then
            local vy = TR.vel.Y
            local phase = math.max(0, now - TR.air_since)
            local modeled = TR.jump_v - g*phase
            if TR.jumping and TR.jump_v > 0 and g > 0 and phase <= TR.jump_v/g and modeled > vy then vy = modeled end
            KbNcpS8c = base.Y + vy*span - 0.5*g*span*span
            if KbNcpS8c < base.Y then
                local clearance = stand_clearance()
                local reach = base.Y - KbNcpS8c + clearance
                local gy = ground_below(Vector3.new(8VHdxnGv, base.Y, Ar3r2fJH), reach)
                if gy then
                    local floor = gy + clearance
                    if KbNcpS8c < floor then KbNcpS8c = floor end
                end
            end
        end
        return Vector3.new(8VHdxnGv, KbNcpS8c, Ar3r2fJH)
    end

    local function build_hyps(base, now)
        table.clear(HY.pos)
        table.clear(HY.w)
        local horizon = (SS.predict and not SS.force) and TR.ready and lead_time() or 0
        local fh = Vector3.new(TR.fresh.X, 0, TR.fresh.Z)
        HY.primary = predict_from(base, 0, horizon, fh, now)
        HY.n = 1
        HY.pos[1] = HY.primary
        HY.w[1] = 1
        HY.weight = 1
        HY.stamp = now
    end

    local function score_axis(anchor, axis)
        local covered = 0
        local lo, hi = 0, 0
        for k = 1, HY.n do
            local d = HY.pos[k] - anchor
            local a = d:Dot(axis)
            local perp = (d - axis*a).Magnitude
            if perp <= P.hit_r then
                covered = covered + HY.w[k]
                if a < lo then lo = a end
                if a > hi then hi = a end
            end
        end
        return covered, lo, hi
    end
    local function corridor_axes(anchor)
        table.clear(axis_pool)
        local n = 0
        local function add(v)
            if typeof(v) ~= loadstring(base64decode("VmVjdG9yMw=="))() or v.Magnitude < 1e-4 then return end
            local u = v.Unit
            for k = 1, n do if axis_pool[k]:Dot(u) > 0.985 then return end end
            n = n + 1
            axis_pool[n] = u
        end
        local fh = Vector3.new(TR.fresh.X, 0, TR.fresh.Z)
        if TR.air then add(TR.fresh) end
        add(fh)
        for k = 1, HY.n do add(HY.pos[k] - anchor) end
        add(TR.fresh)
        add(Vector3.new(0, 1, 0))
        return n
    end
    local function build_corridor(now)
        local part = target_part
        if not part or not part.Parent then return nil end
        local base = part.Position
        build_hyps(base, now)
        local anchor = HY.primary or base
        local count = corridor_axes(anchor)
        local best_axis, best_cov, best_lo, best_hi = nil, -1, 0, 0
        for k = 1, count do
            local axis = axis_pool[k]
            local cov, lo, hi = score_axis(anchor, axis)
            if cov > best_cov then best_axis, best_cov, best_lo, best_hi = axis, cov, lo, hi end
        end
        if not best_axis then return nil end
        HY.conf = HY.weight > 0 and best_cov / HY.weight or 0
        local pad = P.pad
        local origin = anchor + best_axis*(best_lo - pad)
        local aim = anchor + best_axis*(best_hi + pad)
        if (aim - origin).Magnitude < 4 then
            origin = anchor - best_axis*4
            aim = anchor + best_axis*4
        end
        return origin, aim, HY.conf, anchor
    end

    local pred_off = Vector3.zero
    local pred_stamp = 0
    local function lead_offset()
        local part = target_part
        if not part or not part.Parent then return Vector3.zero end
        if not SS.predict or not TR.ready or SS.force then return Vector3.zero end
        local base = part.Position
        local now = os.clock()
        local fh = Vector3.new(TR.fresh.X, 0, TR.fresh.Z)
        local point = predict_from(base, 0, lead_time(), fh, now)
        local off = point - base
        pred_stamp = now
        pred_off = off
        return pred_off
    end

    local hit_names = {
        loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))(), loadstring(base64decode("VXBwZXJUb3Jzbw=="))(), loadstring(base64decode("VG9yc28="))(), loadstring(base64decode("TG93ZXJUb3Jzbw=="))(), loadstring(base64decode("SGVhZA=="))(),
        loadstring(base64decode("UmlnaHRVcHBlckFybQ=="))(), loadstring(base64decode("TGVmdFVwcGVyQXJt"))(), loadstring(base64decode("UmlnaHQgQXJt"))(), loadstring(base64decode("TGVmdCBBcm0="))(),
        loadstring(base64decode("UmlnaHRVcHBlckxlZw=="))(), loadstring(base64decode("TGVmdFVwcGVyTGVn"))(), loadstring(base64decode("UmlnaHQgTGVn"))(), loadstring(base64decode("TGVmdCBMZWc="))(),
        loadstring(base64decode("UmlnaHRMb3dlckxlZw=="))(), loadstring(base64decode("TGVmdExvd2VyTGVn"))(),
    }
    local hit_parts = {}
    local hit_count = 0
    local hit_char = nil
    local function refresh_parts()
        local char = target_char
        if char == hit_char then return end
        table.clear(hit_parts)
        hit_count = 0
        hit_char = char
        if not char then return end
        for k = 1, #hit_names do
            local part = char:FindFirstChild(hit_names[k])
            if part and part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
                hit_count = hit_count + 1
                hit_parts[hit_count] = part
            end
        end
    end
    local function los_clear(origin, point)
        if not origin or not point then return false end
        local delta = point - origin
        local dist = delta.Magnitude
        if dist < 0.5 then return true end
        if dist > MAX_RANGE then return false end
        local hit = trace(origin, delta)
        if not hit then return true end
        local inst = hit.Instance
        local char = target_char
        if inst and char and (inst == char or inst:IsDescendantOf(char)) then return true end
        return (hit.Position - origin).Magnitude >= dist - 0.75
    end
    local function pick_point(origin, strict)
        refresh_parts()
        if hit_count == 0 then return nil end
        local off = lead_offset()
        local first = nil
        for k = 1, hit_count do
            local part = hit_parts[k]
            if not part.Parent then hit_char = nil
            else
                local point = part.Position + off
                if not origin then return point end
                if not first then first = point end
                if los_clear(origin, point) then return point end
            end
        end
        if strict then return nil end
        return first
    end

    local force_att = nil
    local force_saved = nil
    local force_stamp = 0
    local function restore_origin()
        local att = force_att
        if not att then return end
        local saved = force_saved
        force_att = nil
        force_saved = nil
        if saved then
            pcall(function() if att.Parent then att.CFrame = saved end end)
        end
    end
    local function push_origin(cf)
        local att = gun_attachment()
        if not att then return false end
        if force_att and force_att ~= att then restore_origin() end
        if not force_att then
            local ok, saved = pcall(function() return att.CFrame end)
            if not ok or typeof(saved) ~= loadstring(base64decode("Q0ZyYW1l"))() then return false end
            force_att = att
            force_saved = saved
        end
        force_stamp = os.clock()
        local ok = pcall(function() att.WorldCFrame = cf end)
        if not ok then restore_origin() return false end
        task.defer(restore_origin)
        return true
    end
    local function is_target_hit(inst)
        local char = target_char
        if not inst or not char then return false end
        return inst == char or inst:IsDescendantOf(char)
    end
    local function force_clear(origin, aim)
        local hit = trace(origin, aim - origin)
        if not hit then return false end
        return is_target_hit(hit.Instance)
    end
    local function force_velocity()
        if TR.fresh_ok and TR.fresh.Magnitude > 0.5 then return TR.fresh end
        if TR.ready and TR.vel.Magnitude > 0.5 then return TR.vel end
        return Vector3.zero
    end
    local function resolve_force()
        local part = target_part
        if not part or not part.Parent then return nil end
        local live = part.Position
        local now = os.clock()
        local origin, aim, conf, anchor = build_corridor(now)
        if origin and aim then
            local axis = aim - origin
            local span = axis.Magnitude
            if span > 1e-3 then
                local u = axis / span
                local mark = anchor or live
                local behind = (mark - origin):Dot(u)
                if behind < P.pad then origin = origin - u*(P.pad - behind) end
                local ahead = (aim - mark):Dot(u)
                if ahead < P.min_span then aim = mark + u*P.min_span end
                local want = SS.stand_off
                while want > 0 do
                    local probe = origin - u*want
                    if (aim - probe).Magnitude <= P.max_span
                        and los_clear(probe, mark)
                        and los_clear(probe, live) then
                        origin = probe
                        break
                    end
                    want = want - 3
                end
                if (aim - origin).Magnitude > P.max_span then origin = aim - u*P.max_span end
                return CFrame.new(origin, aim), CFrame.new(aim), conf or 0, mark
            end
        end
        local vel = force_velocity()
        local dir = Vector3.new(0, -1, 0)
        if vel.Magnitude > 3 then dir = vel.Unit
        else
            local mine = origin_cframe()
            if mine then
                local delta = live - mine.Position
                if delta.Magnitude > 2 then dir = delta.Unit end
            end
        end
        local back = live - dir*6
        local front = live + dir*math.max(P.min_span, vel.Magnitude*lead_time() + 8)
        if not force_clear(back, front) then back = live - dir*2.5 end
        return CFrame.new(back, front), CFrame.new(front), 0, live
    end
    local function shot_shift(dt)
        if not SS.predict or not TR.ready or dt <= 0 then return Vector3.zero end
        local shift = Vector3.new(TR.vel.X*dt, 0, TR.vel.Z*dt)
        if TR.air then
            local g = grav()
            local horizon = lead_time()
            local vy = TR.vel.Y
            local phase = math.max(0, os.clock() - TR.air_since)
            local modeled = TR.jump_v - g*phase
            if TR.jumping and TR.jump_v > 0 and g > 0 and phase <= TR.jump_v/g and modeled > vy then vy = modeled end
            shift = Vector3.new(shift.X, vy*dt - g*horizon*dt - 0.5*g*dt*dt, shift.Z)
        end
        return shift
    end
    local function compensate_force(origin_cf, aim_cf, started)
        if SS.force then return origin_cf, aim_cf end
        local shift = shot_shift(math.max(0, os.clock() - started))
        if shift == Vector3.zero then return origin_cf, aim_cf end
        local origin = origin_cf.Position + shift
        local aim = aim_cf.Position + shift
        return CFrame.new(origin, aim), CFrame.new(aim)
    end
    local function resolve_shot()
        if not SS.enabled or not SS.am_sheriff or not target_alive() then return nil end
        if SS.force then
            local started = os.clock()
            local origin_cf, aim_cf = resolve_force()
            if origin_cf and aim_cf then
                origin_cf, aim_cf = compensate_force(origin_cf, aim_cf, started)
                if push_origin(origin_cf) then return aim_cf end
            end
        end
        local cf = origin_cframe()
        local aim = pick_point(cf and cf.Position or nil, false)
        if not aim then return nil end
        return CFrame.new(aim)
    end
    local function compensate_resolve(cf)
        if SS.force or typeof(cf) ~= loadstring(base64decode("Q0ZyYW1l"))() then return cf end
        return CFrame.new(cf.Position + shot_shift(math.max(0, os.clock() - pred_stamp)))
    end

    local weapon_service = nil
    local orig_mouse = nil
    local orig_screen = nil
    local hook_mouse = nil
    local hook_screen = nil

    local function get_weapon_service()
        if weapon_service then return weapon_service end
        local ok, m = pcall(function()
            return require(rs:WaitForChild(loadstring(base64decode("Q2xpZW50U2VydmljZXM="))()):WaitForChild(loadstring(base64decode("V2VhcG9uU2VydmljZQ=="))()))
        end)
        if ok and type(m) == loadstring(base64decode("dGFibGU="))() then weapon_service = m end
        return weapon_service
    end
    local function install_hooks()
        local m = get_weapon_service()
        if not m then return end
        if not hook_mouse then
            hook_mouse = function(self, ...)
                sample_ping()
                local ok, cf = pcall(resolve_shot)
                if ok and cf then return compensate_resolve(cf) end
                return orig_mouse(self, ...)
            end
            hook_screen = function(self, 8VHdxnGv, KbNcpS8c, ...)
                sample_ping()
                local ok, cf = pcall(resolve_shot)
                if ok and cf then return compensate_resolve(cf) end
                return orig_screen(self, 8VHdxnGv, KbNcpS8c, ...)
            end
        end
        pcall(function() setreadonly(m, false) end)
        if type(m.GetMouseTargetCFrame) == loadstring(base64decode("ZnVuY3Rpb24="))() and m.GetMouseTargetCFrame ~= hook_mouse then
            orig_mouse = m.GetMouseTargetCFrame
            pcall(function() m.GetMouseTargetCFrame = hook_mouse end)
        end
        if type(m.GetTargetPosition) == loadstring(base64decode("ZnVuY3Rpb24="))() and m.GetTargetPosition ~= hook_screen then
            orig_screen = m.GetTargetPosition
            pcall(function() m.GetTargetPosition = hook_screen end)
        end
    end

    local gun_fired_conn = nil
    local last_fire_stamp = 0
    local function on_gun_fired(tool)
        if typeof(tool) ~= loadstring(base64decode("SW5zdGFuY2U="))() then return end
        local char = lp.Character
        if not char then return end
        local ok, mine = pcall(function() return tool:IsDescendantOf(char) end)
        if not ok or not mine then return end
        local now = os.clock()
        if last_fire_stamp > 0 and want_since > 0 and want_since <= last_fire_stamp then
            gap_push(now - last_fire_stamp)
        end
        last_fire_stamp = now
    end
    local function connect_gun_fired()
        if gun_fired_conn then return end
        local m = get_weapon_service()
        if not m then return end
        local ev = m.GunFired
        if typeof(ev) ~= loadstring(base64decode("SW5zdGFuY2U="))() then return end
        gun_fired_conn = ev.OnClientEvent:Connect(function(tool)
            pcall(on_gun_fired, tool)
        end)
    end

    local function get_gun()
        local char = lp.Character
        if char then
            local g = char:FindFirstChild(loadstring(base64decode("R3Vu"))())
            if g then return g, true end
        end
        local bp = lp:FindFirstChildOfClass(loadstring(base64decode("QmFja3BhY2s="))())
        if bp then
            local g = bp:FindFirstChild(loadstring(base64decode("R3Vu"))())
            if g then return g, false end
        end
        return nil, false
    end
    local function fire_gun(gun, start_cf, aim_cf)
        if not gun or not start_cf or not aim_cf then return false end
        local remote = gun:FindFirstChild(loadstring(base64decode("U2hvb3Q="))())
        if not remote or not remote:IsA(loadstring(base64decode("UmVtb3RlRXZlbnQ="))()) then return false end
        return (pcall(function() remote:FireServer(start_cf, aim_cf) end))
    end

    local function auto_step(now)
        if not SS.auto_on or not SS.enabled or not SS.am_sheriff or not target_alive() then
            want_since = 0
            return
        end
        local gun, equipped = get_gun()
        if not gun then want_since = 0 return end
        if gun ~= gap_gun then gap_gun = gun gap_reset() end
        if not equipped then
            want_since = 0
            local hum = lp.Character and lp.Character:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
            if hum then pcall(function() hum:EquipTool(gun) end) end
            return
        end
        if want_since == 0 then want_since = now end
        local hold = SS.auto_delay
        if hold < SS.fire_gap then hold = SS.fire_gap end
        local since = last_fire_stamp > 0 and last_fire_stamp or SS.last_shot
        if now - since < hold then return end
        if SS.force then
            local started = os.clock()
            local origin_cf, aim_cf = resolve_force()
            if not origin_cf or not aim_cf then return end
            origin_cf, aim_cf = compensate_force(origin_cf, aim_cf, started)
            if push_origin(origin_cf) then
                if fire_gun(gun, origin_cf, aim_cf) then
                    SS.last_shot = now
                end
            end
            return
        end
        local cf = origin_cframe()
        if not cf then return end
        local aim = pick_point(cf.Position, true)
        if not aim then return end
        local aim_cf = compensate_resolve(CFrame.new(aim))
        if fire_gun(gun, cf, aim_cf) then
            SS.last_shot = now
        end
    end

    local watch_conns = {}
    local function clear_watch()
        for k = 1, #watch_conns do pcall(function() watch_conns[k]:Disconnect() end) end
        table.clear(watch_conns)
    end
    local function setup_watch()
        clear_watch()
        local m = get_round()
        if m and m.PlayerDataChanged then
            watch_conns[#watch_conns+1] = m.PlayerDataChanged.Event:Connect(function()
                pcall(refresh_target)
            end)
        end
        watch_conns[#watch_conns+1] = lp.CharacterAdded:Connect(function()
            task.wait(0.3)
            pcall(refresh_target)
        end)
    end

    local next_role = 0
    local next_hook = 0
    local function tick_silent()
        if force_att and os.clock() - force_stamp > 0.05 then restore_origin() end
        if not SS.enabled then return end
        local now = os.clock()
        if now >= next_role then
            next_role = now + 0.2
            refresh_target()
        end
        sample_ping()
        track(now)
        if now >= next_hook then
            next_hook = now + 1
            install_hooks()
            connect_gun_fired()
        end
        auto_step(now)
    end
    local main_conn = run.Heartbeat:Connect(function() pcall(tick_silent) end)

    addOpt(silent_section, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("U2lsZW50RW5hYmxlZA=="))(), {
        Title = loadstring(base64decode("0JLQutC70Y7Rh9C40YLRjA=="))(), Default = false, Flag = loadstring(base64decode("U2lsZW50RW5hYmxlZA=="))(),
    }, function(v)
        SS.enabled = v
        getgenv().SILENT_AIM_ACTIVE = v
        if v then
            task.spawn(function()
                pcall(install_hooks)
                pcall(connect_gun_fired)
                pcall(setup_watch)
                pcall(refresh_target)
            end)
        else
            clear_watch()
            track_clear()
        end
        Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("U2lsZW50IA=="))()..(v and loadstring(base64decode("0JLQmtCb"))() or loadstring(base64decode("0JLQq9Ca0Js="))()), 1.5)
    end)
    addOpt(silent_section, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("U2lsZW50UHJlZGljdA=="))(), {
        Title = loadstring(base64decode("0J/RgNC10LTRgdC60LDQt9Cw0L3QuNC1"))(), Default = true, Flag = loadstring(base64decode("U2lsZW50UHJlZGljdA=="))(),
    }, function(v)
        SS.predict = v
        if not v then track_clear() end
    end)
    addOpt(silent_section, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("U2lsZW50Rm9yY2U="))(), {
        Title = loadstring(base64decode("0KHRgtGA0LXQu9GM0LHQsCDRh9C10YDQtdC3INGB0YLQtdC90Ys="))(), Default = false, Flag = loadstring(base64decode("U2lsZW50Rm9yY2U="))(),
    }, function(v)
        SS.force = v
        if v then
            local so = Options.SilentStandoff
            if so then
                pcall(function() if so.Lock then so:Lock() end end)
                pcall(function() so.Locked = true end)
            end
            local pr = Options.SilentPredict
            if pr then pcall(function() pr:SetValue(false) end) end
            SS.predict = false
            Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("Rm9yY2Ug0JLQmtCbIOKAlCDQv9GA0LXQtNC40LrRgiDQstGL0LrQu9GO0YfQtdC9"))(), 3)
        else
            restore_origin()
            local so = Options.SilentStandoff
            if so then
                pcall(function() if so.Unlock then so:Unlock() end end)
                pcall(function() so.Locked = false end)
            end
        end
    end)
    addOpt(silent_section, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("U2lsZW50U3RhbmRvZmY="))(), {
        Title = loadstring(base64decode("0J7RgtGB0YLRg9C/"))(), Default = 15, Min = 0, Max = 40, Rounding = 0, Flag = loadstring(base64decode("U2lsZW50U3RhbmRvZmY="))(),
    }, function(v) SS.stand_off = tonumber(v) or 15 end)
    addOpt(silent_section, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("U2lsZW50QXV0bw=="))(), {
        Title = loadstring(base64decode("0JDQstGC0L4t0LLRi9GB0YLRgNC10Ls="))(), Default = false, Flag = loadstring(base64decode("U2lsZW50QXV0bw=="))(),
    }, function(v) SS.auto_on = v end)
    addOpt(silent_section, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("U2lsZW50QXV0b0RlbGF5"))(), {
        Title = loadstring(base64decode("0JfQsNC00LXRgNC20LrQsCDQsNCy0YLQvg=="))(), Default = 0, Min = 0, Max = 600, Rounding = 0, Flag = loadstring(base64decode("U2lsZW50QXV0b0RlbGF5"))(),
    }, function(v) SS.auto_delay = (tonumber(v) or 0) / 1000 end)

    getgenv().SILENT_INSTALL_HOOKS = function() pcall(install_hooks) end
    getgenv().SILENT_UNLOAD = function()
        SS.enabled = false
        SS.predict = false
        SS.force = false
        SS.auto_on = false
        getgenv().SILENT_AIM_ACTIVE = false
        restore_origin()
        clear_watch()
        track_clear()
        if gun_fired_conn then pcall(function() gun_fired_conn:Disconnect() end) gun_fired_conn=nil end
        if main_conn then pcall(function() main_conn:Disconnect() end) main_conn=nil end
        local m = weapon_service
        if m then
            pcall(function() setreadonly(m, false) end)
            if orig_mouse then pcall(function() m.GetMouseTargetCFrame = orig_mouse end) end
            if orig_screen then pcall(function() m.GetTargetPosition = orig_screen end) end
        end
    end
end

-- ============================================================
-- ТИХИЙ БРОСОК НОЖА
-- ============================================================
do
    local knifeSec = Tabs.Combat:AddSection({Name=loadstring(base64decode("0KLQuNGF0LjQuSDQsdGA0L7RgdC+0Log0L3QvtC20LA="))()})
    addOpt(knifeSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("S25pZmVTaWxlbnRPbg=="))(), {Title=loadstring(base64decode("0JLQutC70Y7Rh9C40YLRjA=="))(), Default=false, Flag=loadstring(base64decode("S25pZmVTaWxlbnRPbg=="))()}, function(v)
        knifeSilent.enabled = v
        if v then
            Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("0JIg0YDQsNC30YDQsNCx0L7RgtC60LU="))(), 3)
            task.delay(0.5, function()
                local opt = Options.KnifeSilentOn
                if opt then pcall(function() opt:SetValue(false) end) end
            end)
        end
    end)
end

-- ============================================================
-- КИЛЛ АУРА
-- ============================================================
do
    local tC = Tabs.Combat
    local kaSec = tC:AddSection({Name=loadstring(base64decode("0JrQuNC70Lsg0JDRg9GA0LA="))()})
    addOpt(kaSec, loadstring(base64decode("QWRkRHJvcGRvd24="))(), loadstring(base64decode("S0FWZXJzaW9u"))(), {Title=loadstring(base64decode("0JLQtdGA0YHQuNGP"))(), Values={loadstring(base64decode("djE="))(),loadstring(base64decode("djI="))()}, Default=loadstring(base64decode("djI="))()}, function(v)
        killAuraVersion = v
        kaV1.on = false
        kaV2.on = false
        if Options.KAOn and Options.KAOn.Value then
            kaV1.on = v == loadstring(base64decode("djE="))()
            kaV2.on = v == loadstring(base64decode("djI="))()
        end
    end)
    addOpt(kaSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("S0FPbg=="))(), {Title=loadstring(base64decode("0JLQutC70Y7Rh9C40YLRjA=="))(), Default=false}, function(v)
        kaV1.on = v and killAuraVersion == loadstring(base64decode("djE="))()
        kaV2.on = v and killAuraVersion == loadstring(base64decode("djI="))()
    end)
    addOpt(kaSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("S0FEaXN0"))(), {Title=loadstring(base64decode("0KDQsNC00LjRg9GB"))(), Min=5, Max=250, Default=250, Rounding=0}, function(v)
        local n = tonumber(v) or 250
        kaV1.dist = n
        kaV2.dist = n
    end)
    AddConn(loadstring(base64decode("S0F2MVRpY2s="))(),RunService.Heartbeat:Connect(function()
        if not kaV1.on then return end
        if tick() - kaV1.lastHit < 0.05 then return end
        local char = LocalPlayer.Character
        if not char then return end
        local knife = char:FindFirstChild(loadstring(base64decode("S25pZmU="))())
        if not knife then return end
        local ev = knife:FindFirstChild(loadstring(base64decode("RXZlbnRz"))())
        if not ev then return end
        local stabbed = ev:FindFirstChild(loadstring(base64decode("S25pZmVTdGFiYmVk"))())
        local touched = ev:FindFirstChild(loadstring(base64decode("SGFuZGxlVG91Y2hlZA=="))())
        if not stabbed or not touched then return end
        local my = char:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
        if not my then return end
        local victims = {}
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then
                local tc = p.Character
                if tc then
                    local th = tc:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
                    local tp = tc:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
                    if th and th.Health > 0 and tp and (tp.Position - my.Position).Magnitude <= kaV1.dist then
                        victims[#victims + 1] = tp
                    end
                end
            end
        end
        if #victims > 0 then
            pcall(function() stabbed:FireServer() end)
            for _, v in ipairs(victims) do pcall(function() touched:FireServer(v) end) end
            kaV1.lastHit = tick()
        end
    end))
    AddConn(loadstring(base64decode("S0F2MlRpY2s="))(),RunService.Heartbeat:Connect(function()
        if not kaV2.on then return end
        if tick() - kaV2.lastHit < 0.05 then return end
        local char = LocalPlayer.Character
        if not char then return end
        local knife = char:FindFirstChild(loadstring(base64decode("S25pZmU="))())
        if not knife then
            local hum = char:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
            local bpk = LocalPlayer.Backpack and LocalPlayer.Backpack:FindFirstChild(loadstring(base64decode("S25pZmU="))())
            if hum and bpk then hum:EquipTool(bpk) end
            return
        end
        local ev = knife:FindFirstChild(loadstring(base64decode("RXZlbnRz"))())
        if not ev then return end
        local stabbed = ev:FindFirstChild(loadstring(base64decode("S25pZmVTdGFiYmVk"))())
        local touched = ev:FindFirstChild(loadstring(base64decode("SGFuZGxlVG91Y2hlZA=="))())
        if not stabbed or not touched then return end
        local my = char:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
        if not my then return end
        local victims = {}
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then
                local tc = p.Character
                if tc then
                    local th = tc:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
                    local tp = tc:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
                    if th and th.Health > 0 and tp and (tp.Position - my.Position).Magnitude <= kaV2.dist then
                        victims[#victims + 1] = tp
                    end
                end
            end
        end
        if #victims > 0 then
            pcall(function() stabbed:FireServer() end)
            for _, v in ipairs(victims) do pcall(function() touched:FireServer(v) end) end
            kaV2.lastHit = tick()
        end
    end))
end

-- ============================================================
-- АВТО-ПОДБОР ПИСТОЛЕТА
-- ============================================================
do
    local tC = Tabs.Combat
    local grabFailedRound, isGrabbing = false, false
    local gunCache = {}
    for _, v in ipairs(Workspace:GetDescendants()) do
        if v.Name == loadstring(base64decode("R3VuRHJvcA=="))() then gunCache[v] = true end
    end
    AddConn(loadstring(base64decode("R3VuQ2FjaGVBZGQ="))(), Workspace.DescendantAdded:Connect(function(v)
        if v.Name == loadstring(base64decode("R3VuRHJvcA=="))() then gunCache[v] = true end
    end))
    AddConn(loadstring(base64decode("R3VuQ2FjaGVSZW0="))(), Workspace.DescendantRemoving:Connect(function(v)
        if v.Name == loadstring(base64decode("R3VuRHJvcA=="))() then gunCache[v] = nil end
    end))
    task.spawn(function()
        local ok, remote = pcall(function()
            return ReplicatedStorage:WaitForChild(loadstring(base64decode("UmVtb3Rlcw=="))(), 15):WaitForChild(loadstring(base64decode("R2FtZXBsYXk="))(), 15):WaitForChild(loadstring(base64decode("Q29pbnNTdGFydGVk"))(), 15)
        end)
        if ok and remote then
            remote.OnClientEvent:Connect(function() grabFailedRound = false; isGrabbing = false end)
        end
    end)
    local function findNearestGun(my)
        local best, bd = nil, math.huge
        for gun in pairs(gunCache) do
            if gun.Parent and gun:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
                local d = (gun.Position - my.Position).Magnitude
                if d < bd then bd = d; best = gun end
            end
        end
        return best
    end
    local autoGrabEnabled = false
    addOpt(tC, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("QXV0b0dyYWJHdW4="))(), {Title=loadstring(base64decode("0JDQstGC0L4t0L/QvtC00LHQvtGAINC/0LjRgdGC0L7Qu9C10YLQsA=="))(), Default=false}, function(v) autoGrabEnabled = v end)
    AddConn(loadstring(base64decode("QXV0b0dyYWJUaWNr"))(), RunService.Heartbeat:Connect(function()
        if not autoGrabEnabled then return end
        if getgenv().FH_INVIS_ACTIVE then return end
        if getRoleFromData(LocalPlayer) == loadstring(base64decode("bXVyZGVyZXI="))() then return end
        if grabFailedRound or isGrabbing then return end
        local char = LocalPlayer.Character
        if not char then return end
        if char:FindFirstChild(loadstring(base64decode("R3Vu"))()) then return end
        local bp = LocalPlayer:FindFirstChildOfClass(loadstring(base64decode("QmFja3BhY2s="))())
        if bp and bp:FindFirstChild(loadstring(base64decode("R3Vu"))()) then return end
        local my = char:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
        if not my then return end
        local gun = findNearestGun(my)
        if not gun then return end
        isGrabbing = true
        task.spawn(function()
            local rp = my.CFrame
            local grabbed = false
            for uSCGtGib = 1, 3 do
                if getgenv().FH_INVIS_ACTIVE then break end
                if my and my.Parent then my.CFrame = gun.CFrame end
                task.wait(0.04)
                pcall(function() firetouchinterest(my, gun, 0) task.wait(0.02) firetouchinterest(my, gun, 1) end)
                local c = LocalPlayer.Character
                if c and c:FindFirstChild(loadstring(base64decode("R3Vu"))()) then grabbed = true break end
                local b = LocalPlayer:FindFirstChildOfClass(loadstring(base64decode("QmFja3BhY2s="))())
                if b and b:FindFirstChild(loadstring(base64decode("R3Vu"))()) then grabbed = true break end
            end
            if my and my.Parent then
                my.CFrame = rp
                my.AssemblyLinearVelocity = Vector3.zero
                my.AssemblyAngularVelocity = Vector3.zero
            end
            if not grabbed then
                grabFailedRound = true
                Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("0J/QuNGB0YLQvtC70LXRgiDQvdC1INC/0L7QtNC+0LHRgNCw0L0u"))(), 4)
            end
            isGrabbing = false
        end)
    end))
    AddConn(loadstring(base64decode("QXV0b0dyYWJSZXNldA=="))(), LocalPlayer.CharacterAdded:Connect(function() isGrabbing = false end))
end

-- ============================================================
-- ДВИЖЕНИЕ
-- ============================================================
do
    local tM = Tabs.Movement
    local mvSec = tM:AddSection({Name=loadstring(base64decode("0J7RgdC90L7QstC90L7QtQ=="))()})
    addOpt(mvSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("U3BlZWRUb2dnbGU="))(), {Title=loadstring(base64decode("0KHQutC+0YDQvtGB0YLRjA=="))(), Default=false}, function() end)
    addOpt(mvSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("U3BlZWRWYWx1ZQ=="))(), {Title=loadstring(base64decode("0KHQutC+0YDQvtGB0YLRjCDRhdC+0LTRjNCx0Ys="))(), Min=16, Max=500, Default=32, Rounding=0}, function() end)
    addOpt(mvSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("Tm9jbGlw"))(), {Title=loadstring(base64decode("Tm9jbGlw"))(), Default=false}, function() end)
    addOpt(mvSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("U3BpbmJvdA=="))(), {Title=loadstring(base64decode("U3BpbmJvdA=="))(), Default=false}, function() end)
    addOpt(mvSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("U3BpblNwZWVk"))(), {Title=loadstring(base64decode("0KHQutC+0YDQvtGB0YLRjCDQutGA0YPRh9C10L3QuNGP"))(), Min=1, Max=50, Default=8, Rounding=0}, function() end)
    addOpt(mvSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("SW5mSnVtcA=="))(), {Title=loadstring(base64decode("0JHQtdGB0LrQvtC90LXRh9C90YvQuSDQv9GA0YvQttC+0Lo="))(), Default=false}, function() end)
    addOpt(mvSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("SnVtcFBvd2VyVG9nZ2xl"))(), {Title=loadstring(base64decode("0KHQstC+0Y8g0YHQuNC70LAg0L/RgNGL0LbQutCw"))(), Default=false}, function() end)
    addOpt(mvSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("SnVtcFBvd2VyVmFs"))(), {Title=loadstring(base64decode("0KHQuNC70LAg0L/RgNGL0LbQutCw"))(), Min=50, Max=500, Default=100, Rounding=0}, function() end)
    addOpt(mvSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("Rmx5VG9nZ2xl"))(), {Title=loadstring(base64decode("0J/QvtC70ZHRgg=="))(), Default=false}, function() end)
    addOpt(mvSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("Rmx5U3BlZWQ="))(), {Title=loadstring(base64decode("0KHQutC+0YDQvtGB0YLRjCDQv9C+0LvRkdGC0LA="))(), Min=20, Max=500, Default=60, Rounding=0}, function() end)
    addOpt(mvSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("QmhvcE9u"))(), {Title=loadstring(base64decode("0JHQsNC90LjRhdC+0L8="))(), Default=false}, function() end)
    addOpt(mvSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("QmhvcFBvd2Vy"))(), {Title=loadstring(base64decode("0KHQuNC70LAg0LHQsNC90LjRhdC+0L/QsA=="))(), Min=10, Max=150, Default=40, Rounding=0}, function() end)
    addOpt(mvSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("QmhvcFN0cmFmZQ=="))(), {Title=loadstring(base64decode("0KHRgtGA0LXQudGE"))(), Default=false}, function() end)

    local bhopOn,bhopPower,bhopStrafe=false,40,false
    local bhopSpeed,wasJumping,isBoosting=0,false,false
    registerOnChanged(loadstring(base64decode("QmhvcE9u"))(), function(v) bhopOn=v end)
    registerOnChanged(loadstring(base64decode("QmhvcFBvd2Vy"))(), function(v) bhopPower=tonumber(v) or 40 end)
    registerOnChanged(loadstring(base64decode("QmhvcFN0cmFmZQ=="))(), function(v) bhopStrafe=v end)

    local jumpHoldAt=0
    UserInputService.JumpRequest:Connect(function() jumpHoldAt=os.clock() end)
    local function jumpHeld()
        if os.clock()-jumpHoldAt<0.2 then return true end
        return UserInputService:IsKeyDown(Enum.KeyCode.Space)
    end

    AddConn(loadstring(base64decode("QmhvcFRpY2s="))(),RunService.Heartbeat:Connect(function()
        if not bhopOn then wasJumping=false isBoosting=false bhopSpeed=0 return end
        local c=LocalPlayer.Character
        local hum=c and c:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
        local hrp=c and c:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
        if not hum or not hrp then return end
        local st=hum:GetState()
        local jumping=st==Enum.HumanoidStateType.Jumping
        local airborne=jumping or st==Enum.HumanoidStateType.Freefall
        if bhopStrafe then
            bhopSpeed=0
            if jumping and not wasJumping then
                local dir=hum.MoveDirection
                if dir.Magnitude<0.1 then dir=hrp.CFrame.LookVector end
                dir=Vector3.new(dir.X,0,dir.Z)
                if dir.Magnitude>0 then
                    dir=dir.Unit
                    local v=hrp.AssemblyLinearVelocity
                    hrp.AssemblyLinearVelocity=Vector3.new(dir.X*bhopPower,v.Y,dir.Z*bhopPower)
                    isBoosting=true
                end
            end
            if isBoosting and airborne then
                local dir=hum.MoveDirection
                if dir.Magnitude>0.1 then
                    dir=Vector3.new(dir.X,0,dir.Z).Unit
                    local v=hrp.AssemblyLinearVelocity
                    local cur=Vector3.new(v.X,0,v.Z)
                    local tgt=dir*bhopPower
                    local nxz=cur:Lerp(tgt,0.3)
                    hrp.AssemblyLinearVelocity=Vector3.new(nxz.X,v.Y,nxz.Z)
                end
            end
            if not airborne then isBoosting=false end
        else
            local base=math.max(hum.WalkSpeed,1)
            local cap=math.max(bhopPower,base)
            local step=math.max(bhopPower*0.1,1)
            if bhopSpeed<base then bhopSpeed=base end
            if jumping and not wasJumping then
                bhopSpeed=math.min(bhopSpeed+step,cap)
                local v=hrp.AssemblyLinearVelocity
                local xz=Vector3.new(v.X,0,v.Z)
                local dir
                if xz.Magnitude>0.1 then dir=xz.Unit
                else
                    local md=hum.MoveDirection
                    if md.Magnitude>0.1 then dir=Vector3.new(md.X,0,md.Z).Unit
                    else local lv=hrp.CFrame.LookVector dir=Vector3.new(lv.X,0,lv.Z) dir=(dir.Magnitude>0) and dir.Unit or Vector3.zero end
                end
                if dir.Magnitude>0 then hrp.AssemblyLinearVelocity=Vector3.new(dir.X*bhopSpeed,v.Y,dir.Z*bhopSpeed) isBoosting=true end
            end
            if airborne and isBoosting then
                local v=hrp.AssemblyLinearVelocity
                local xz=Vector3.new(v.X,0,v.Z)
                local md=hum.MoveDirection
                local dir
                if md.Magnitude>0.1 then dir=Vector3.new(md.X,0,md.Z).Unit
                elseif xz.Magnitude>0.1 then dir=xz.Unit end
                if dir then local sp=math.max(xz.Magnitude,bhopSpeed) hrp.AssemblyLinearVelocity=Vector3.new(dir.X*sp,v.Y,dir.Z*sp) end
            end
            if not airborne then
                isBoosting=false
                if jumpHeld() then hum.Jump=true else bhopSpeed=0 end
            end
        end
        wasJumping=jumping
    end))

    local sgOn,sgPower,sgAccel,sgGround=false,90,0.6,16
    addOpt(mvSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("U3BlZWRHbGl0Y2hPbg=="))(), {Title=loadstring(base64decode("0KHQv9C40LTQs9C70LjRgtGH"))(), Default=false}, function(v) sgOn=v end)
    addOpt(mvSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("U3BlZWRHbGl0Y2hQb3dlcg=="))(), {Title=loadstring(base64decode("0KHQutC+0YDQvtGB0YLRjCDQsiDQv9GA0YvQttC60LU="))(), Min=30, Max=250, Default=90, Rounding=0}, function(v) sgPower=tonumber(v) or 90 end)
    addOpt(mvSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("U3BlZWRHbGl0Y2hBY2NlbA=="))(), {Title=loadstring(base64decode("0KDQsNC30LPQvtC9"))(), Min=0.1, Max=1, Default=0.6, Rounding=2}, function(v) sgAccel=tonumber(v) or 0.6 end)
    AddConn(loadstring(base64decode("U3BlZWRHbGl0Y2hUaWNr"))(),RunService.Heartbeat:Connect(function()
        if not sgOn then return end
        local c=LocalPlayer.Character
        local h=c and c:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
        local hrp=c and c:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
        if not h or not hrp then return end
        local st=h:GetState()
        local air=st==Enum.HumanoidStateType.Jumping or st==Enum.HumanoidStateType.Freefall
        if air then
            local v=hrp.AssemblyLinearVelocity
            local flat=Vector3.new(v.X,0,v.Z)
            local dir=flat.Magnitude>0.1 and flat.Unit or (function() local lv=hrp.CFrame.LookVector return Vector3.new(lv.X,0,lv.Z).Unit end)()
            local cur=flat.Magnitude
            local target=math.max(cur,sgPower)
            local new_mag=cur+(target-cur)*sgAccel
            hrp.AssemblyLinearVelocity=Vector3.new(dir.X*new_mag,v.Y,dir.Z*new_mag)
        else
            local v=hrp.AssemblyLinearVelocity
            local flat=Vector3.new(v.X,0,v.Z)
            if flat.Magnitude>sgGround then local dir=flat.Unit hrp.AssemblyLinearVelocity=Vector3.new(dir.X*sgGround,v.Y,dir.Z*sgGround) end
        end
    end))

    local flyGrav = Workspace.Gravity
    local function flyOff()
        Workspace.Gravity = flyGrav
        local hum = getHum()
        if hum then
            pcall(function() hum.PlatformStand = false end)
            pcall(function() hum:ChangeState(Enum.HumanoidStateType.GettingUp) end)
            pcall(function() hum:ChangeState(Enum.HumanoidStateType.Landed) end)
            pcall(function() hum:ChangeState(Enum.HumanoidStateType.Running) end)
        end
        local hrp = getHRP()
        if hrp then
            pcall(function()
                hrp.AssemblyLinearVelocity = Vector3.zero
                hrp.AssemblyAngularVelocity = Vector3.zero
                hrp.Velocity = Vector3.zero
            end)
            local bv = hrp:FindFirstChild(loadstring(base64decode("RkhfRmx5QlY="))())
            if bv then bv:Destroy() end
        end
    end
    registerOnChanged(loadstring(base64decode("Rmx5VG9nZ2xl"))(), function(v)
        if v then flyGrav = Workspace.Gravity Workspace.Gravity = 0
        else flyOff() end
    end)
    if Options.FlyToggle then
        Options.FlyToggle:OnChanged(function(v)
            if v then flyGrav = Workspace.Gravity Workspace.Gravity = 0
            else flyOff() end
        end)
    end
    AddConn(loadstring(base64decode("Rmx5VGljaw=="))(),RunService.RenderStepped:Connect(function()
        if not (Options.FlyToggle and Options.FlyToggle.Value) then return end
        local hrp=getHRP() local hum=getHum()
        if not hrp or not hum then return end
        hum.PlatformStand = true
        local sp = (Options.FlySpeed and tonumber(Options.FlySpeed.Value)) or 60
        local dir=Vector3.zero
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir=dir+Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir=dir-Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir=dir-Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir=dir+Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir=dir+Vector3.new(0,1,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir=dir-Vector3.new(0,1,0) end
        hrp.Velocity = dir.Magnitude>0 and dir.Unit*sp or Vector3.zero
    end))

    AddConn(loadstring(base64decode("TW92ZW1lbnRUaWNr"))(),RunService.Heartbeat:Connect(function()
        local hum=getHum()
        if not hum then return end
        if Options.SpeedToggle and Options.SpeedToggle.Value then
            hum.WalkSpeed=(Options.SpeedValue and tonumber(Options.SpeedValue.Value)) or 32
        end
        if S.frozen then
            hum.WalkSpeed=0
            local hrp=getHRP()
            if hrp then
                if not hrp:FindFirstChild(loadstring(base64decode("RkhfRnJlZXplQlY="))()) then
                    local bv=Instance.new(loadstring(base64decode("Qm9keVZlbG9jaXR5"))())
                    bv.Name=loadstring(base64decode("RkhfRnJlZXplQlY="))()
                    bv.MaxForce=Vector3.new(1e5,1e5,1e5)
                    bv.Velocity=Vector3.zero
                    bv.Parent=hrp
                end
                local sp=(Options.FreezeSpeed and tonumber(Options.FreezeSpeed.Value)) or 60
                local dir=Vector3.zero
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir=dir+Camera.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir=dir-Camera.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir=dir+Camera.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir=dir+Camera.CFrame.RightVector end
                if UserInputService:IsKeyDown(S.freezeUpKey) then dir=dir+Vector3.new(0,1,0) end
                if UserInputService:IsKeyDown(S.freezeDownKey) then dir=dir-Vector3.new(0,1,0) end
                local bv=hrp:FindFirstChild(loadstring(base64decode("RkhfRnJlZXplQlY="))())
                if bv then bv.Velocity=dir.Magnitude>0 and dir.Unit*sp or Vector3.zero end
            end
        else
            local hrp=getHRP()
            if hrp then local bv=hrp:FindFirstChild(loadstring(base64decode("RkhfRnJlZXplQlY="))()) if bv then bv:Destroy() end end
        end
        if Options.JumpPowerToggle and Options.JumpPowerToggle.Value then
            hum.UseJumpPower=true
            local jp=(Options.JumpPowerVal and tonumber(Options.JumpPowerVal.Value)) or 100
            if hum.JumpPower~=jp then hum.JumpPower=jp end
        end
        if Options.Spinbot and Options.Spinbot.Value then
            local hrp=getHRP()
            if hrp then
                local s=(Options.SpinSpeed and tonumber(Options.SpinSpeed.Value)) or 8
                hrp.CFrame=hrp.CFrame*CFrame.Angles(0,math.rad(s),0)
            end
        end
    end))
    AddConn(loadstring(base64decode("Tm9jbGlwVGljaw=="))(),RunService.Stepped:Connect(function()
        if Options.Noclip and Options.Noclip.Value then
            local c=LocalPlayer.Character
            if c then for _,p in ipairs(c:GetDescendants()) do if p:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then p.CanCollide=false end end end
        end
    end))
    AddConn(loadstring(base64decode("SW5mSnVtcA=="))(),UserInputService.JumpRequest:Connect(function()
        if Options.InfJump and Options.InfJump.Value then
            local hum=getHum()
            if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
        end
    end))

    local freezeSec=tM:AddSection({Name=loadstring(base64decode("0JfQsNC80L7RgNC+0LfQutCw"))()})
    addOpt(freezeSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("RnJlZXplVG9nZ2xl"))(), {Title=loadstring(base64decode("0JLQutC70Y7Rh9C40YLRjA=="))(), Default=false}, function(v) S.frozen=v end)
    addOpt(freezeSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("RnJlZXplU3BlZWQ="))(), {Title=loadstring(base64decode("0KHQutC+0YDQvtGB0YLRjA=="))(), Min=20, Max=300, Default=60, Rounding=0}, function() end)
    local fUp=freezeSec:AddKeybind(loadstring(base64decode("RnJlZXplVXBLZXk="))(),{Title=loadstring(base64decode("0JrQvdC+0L/QutCwINCS0JLQldCg0KU="))(),Default=loadstring(base64decode("U3BhY2U="))()})
    fUp:OnChanged(function(k) if typeof(k)==loadstring(base64decode("RW51bUl0ZW0="))() then S.freezeUpKey=k end end)
    registerOnChanged(loadstring(base64decode("RnJlZXplVXBLZXk="))(), function(k) if typeof(k)==loadstring(base64decode("RW51bUl0ZW0="))() then S.freezeUpKey=k end end)
    local fDown=freezeSec:AddKeybind(loadstring(base64decode("RnJlZXplRG93bktleQ=="))(),{Title=loadstring(base64decode("0JrQvdC+0L/QutCwINCS0J3QmNCX"))(),Default=loadstring(base64decode("TGVmdEFsdA=="))()})
    fDown:OnChanged(function(k) if typeof(k)==loadstring(base64decode("RW51bUl0ZW0="))() then S.freezeDownKey=k end end)
    registerOnChanged(loadstring(base64decode("RnJlZXplRG93bktleQ=="))(), function(k) if typeof(k)==loadstring(base64decode("RW51bUl0ZW0="))() then S.freezeDownKey=k end end)

    getgenv().MOVE_UNLOAD=function()
        S.frozen=false
        local hrp=getHRP()
        if hrp then local bv=hrp:FindFirstChild(loadstring(base64decode("RkhfRnJlZXplQlY="))()) if bv then bv:Destroy() end end
        flyOff()
    end
end

-- ============================================================
-- БИНДЫ
-- ============================================================
do
    local tB=Tabs.Binds
    local BIND_LIST={
        {id=loadstring(base64decode("U2lsZW50RW5hYmxlZA=="))(),title=loadstring(base64decode("0KLQuNGF0LjQuSDQstGL0YHRgtGA0LXQuw=="))(),cat=loadstring(base64decode("0JHQvtC5"))(),opt=loadstring(base64decode("U2lsZW50RW5hYmxlZA=="))()},
        {id=loadstring(base64decode("S0FPbg=="))(),title=loadstring(base64decode("0JrQuNC70Lsg0JDRg9GA0LA="))(),cat=loadstring(base64decode("0JHQvtC5"))(),opt=loadstring(base64decode("S0FPbg=="))()},
        {id=loadstring(base64decode("QXV0b0dyYWJHdW4="))(),title=loadstring(base64decode("0JDQstGC0L4t0L/QvtC00LHQvtGAINC/0LjRgdGC0L7Qu9C10YLQsA=="))(),cat=loadstring(base64decode("0JHQvtC5"))(),opt=loadstring(base64decode("QXV0b0dyYWJHdW4="))()},
        {id=loadstring(base64decode("U3BlZWRUb2dnbGU="))(),title=loadstring(base64decode("0KHQutC+0YDQvtGB0YLRjA=="))(),cat=loadstring(base64decode("0JTQstC40LbQtdC90LjQtQ=="))(),opt=loadstring(base64decode("U3BlZWRUb2dnbGU="))()},
        {id=loadstring(base64decode("Tm9jbGlw"))(),title=loadstring(base64decode("Tm9jbGlw"))(),cat=loadstring(base64decode("0JTQstC40LbQtdC90LjQtQ=="))(),opt=loadstring(base64decode("Tm9jbGlw"))()},
        {id=loadstring(base64decode("U3BpbmJvdA=="))(),title=loadstring(base64decode("0KHQv9C40L3QsdC+0YI="))(),cat=loadstring(base64decode("0JTQstC40LbQtdC90LjQtQ=="))(),opt=loadstring(base64decode("U3BpbmJvdA=="))()},
        {id=loadstring(base64decode("SW5mSnVtcA=="))(),title=loadstring(base64decode("0JHQtdGB0LrQvtC90LXRh9C90YvQuSDQv9GA0YvQttC+0Lo="))(),cat=loadstring(base64decode("0JTQstC40LbQtdC90LjQtQ=="))(),opt=loadstring(base64decode("SW5mSnVtcA=="))()},
        {id=loadstring(base64decode("SnVtcFBvd2VyVG9nZ2xl"))(),title=loadstring(base64decode("0KHQstC+0Y8g0YHQuNC70LAg0L/RgNGL0LbQutCw"))(),cat=loadstring(base64decode("0JTQstC40LbQtdC90LjQtQ=="))(),opt=loadstring(base64decode("SnVtcFBvd2VyVG9nZ2xl"))()},
        {id=loadstring(base64decode("U3BlZWRHbGl0Y2hPbg=="))(),title=loadstring(base64decode("0KHQv9C40LTQs9C70LjRgtGH"))(),cat=loadstring(base64decode("0JTQstC40LbQtdC90LjQtQ=="))(),opt=loadstring(base64decode("U3BlZWRHbGl0Y2hPbg=="))()},
        {id=loadstring(base64decode("Rmx5VG9nZ2xl"))(),title=loadstring(base64decode("0J/QvtC70ZHRgg=="))(),cat=loadstring(base64decode("0JTQstC40LbQtdC90LjQtQ=="))(),opt=loadstring(base64decode("Rmx5VG9nZ2xl"))()},
        {id=loadstring(base64decode("QmhvcE9u"))(),title=loadstring(base64decode("0JHQsNC90LjRhdC+0L8="))(),cat=loadstring(base64decode("0JTQstC40LbQtdC90LjQtQ=="))(),opt=loadstring(base64decode("QmhvcE9u"))()},
        {id=loadstring(base64decode("RnJlZXplVG9nZ2xl"))(),title=loadstring(base64decode("0JfQsNC80L7RgNC+0LfQutCw"))(),cat=loadstring(base64decode("0JTQstC40LbQtdC90LjQtQ=="))(),opt=loadstring(base64decode("RnJlZXplVG9nZ2xl"))()},
        {id=loadstring(base64decode("SW52aXNPbg=="))(),title=loadstring(base64decode("0J3QtdCy0LjQtNC40LzQvtGB0YLRjA=="))(),cat=loadstring(base64decode("0JTRgNGD0LPQvtC1"))(),opt=loadstring(base64decode("SW52aXNPbg=="))()},
    }
    local BindState={}
    for _,e in ipairs(BIND_LIST) do
        BindState[e.id]={key=nil,touchOn=false,btn=nil,def=e}
    end
    getgenv().FH_BindState = BindState

    local touchGui=Instance.new(loadstring(base64decode("U2NyZWVuR3Vp"))())
    touchGui.Name=loadstring(base64decode("RkhfVG91Y2hCaW5kc192MjI="))()
    touchGui.ResetOnSpawn=false
    touchGui.IgnoreGuiInset=true
    touchGui.DisplayOrder=400
    pcall(function() touchGui.Parent=(gethui and gethui()) or CoreGui end)
    if not touchGui.Parent then touchGui.Parent=CoreGui end
    local buttonsFrozen=false
    getgenv().FH_ButtonsFrozen=false

    local function fireBind(id)
        local st=BindState[id]
        if not st then return end
        local def=st.def
        if def.opt then
            local o=Options[def.opt]
            if o and o.Value~=nil then
                o:SetValue(not o.Value)
                Notify(loadstring(base64decode("Rkg="))(),def.title..loadstring(base64decode("OiA="))()..tostring(o.Value),1.2)
            end
        end
    end

    local function centerSpawn()
        local vp=(Camera and Camera.ViewportSize) or Vector2.new(1280,720)
        return vp.X*0.5-75, vp.Y*0.5-17
    end

    local function makeTouchButton(id)
        local st=BindState[id]
        if not st or st.btn then return end
        local def=st.def
        local btn=Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))())
        btn.Name=loadstring(base64decode("RkhfQlROXw=="))()..id
        btn.Size=UDim2.fromOffset(150,34)
        local sx,sy=centerSpawn()
        btn.Position=UDim2.fromOffset(sx,sy)
        btn.BackgroundColor3=Color3.fromRGB(28,22,42)
        btn.BorderSizePixel=0
        btn.Text=def.title
        btn.TextColor3=Color3.fromRGB(235,225,255)
        btn.Font=Enum.Font.GothamSemibold
        btn.TextSize=13
        btn.AutoButtonColor=true
        btn.Active=true
        btn.ZIndex=3
        btn.Parent=touchGui
        Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(),btn).CornerRadius=UDim.new(0,8)
        local stroke=Instance.new(loadstring(base64decode("VUlTdHJva2U="))(),btn)
        stroke.Color=Color3.fromRGB(138,92,246)
        stroke.Thickness=1
        stroke.Transparency=0.35
        local dragging,dragStart,posStart,moved=false,nil,nil,false
        btn.InputBegan:Connect(function(uSCGtGib)
            if uSCGtGib.UserInputType==Enum.UserInputType.MouseButton1 or uSCGtGib.UserInputType==Enum.UserInputType.Touch then
                dragging=true moved=false
                dragStart=uSCGtGib.Position posStart=btn.Position
            end
        end)
        UserInputService.InputChanged:Connect(function(uSCGtGib)
            if not dragging then return end
            if getgenv().FH_ButtonsFrozen then return end
            if uSCGtGib.UserInputType==Enum.UserInputType.MouseMovement or uSCGtGib.UserInputType==Enum.UserInputType.Touch then
                local d=uSCGtGib.Position-dragStart
                if math.abs(d.X)>4 or math.abs(d.Y)>4 then moved=true end
                if moved then
                    btn.Position=UDim2.new(posStart.X.Scale,posStart.X.Offset+d.X,posStart.Y.Scale,posStart.Y.Offset+d.Y)
                end
            end
        end)
        UserInputService.InputEnded:Connect(function(uSCGtGib)
            if uSCGtGib.UserInputType~=Enum.UserInputType.MouseButton1 and uSCGtGib.UserInputType~=Enum.UserInputType.Touch then return end
            if not dragging then return end
            local wasTap=not moved
            dragging=false
            if wasTap then fireBind(id) end
        end)
        st.btn=btn
    end
    local function killTouchButton(id)
        local st=BindState[id]
        if not st then return end
        if st.btn then pcall(function() st.btn:Destroy() end) st.btn=nil end
    end

    local listSec=tB:AddSection({Name=loadstring(base64decode("0JzQvtC00YPQu9C4"))()})
    local currentCat=nil
    for _,def in ipairs(BIND_LIST) do
        if def.cat~=currentCat then
            currentCat=def.cat
            pcall(function() listSec:AddButton({Title=loadstring(base64decode("LS0tIA=="))()..currentCat..loadstring(base64decode("IC0tLQ=="))(),Callback=function() end}) end)
        end
        local st=BindState[def.id]
        local kb = listSec:AddKeybind(loadstring(base64decode("QklORF9LRVlf"))()..def.id,{Title=def.title,Default=loadstring(base64decode("VW5rbm93bg=="))()})
        kb:OnChanged(function(k)
            if typeof(k)==loadstring(base64decode("RW51bUl0ZW0="))() then
                st.key=k
                Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0JHQuNC90LQ6IA=="))()..def.title..loadstring(base64decode("ID4g"))()..tostring(k),2)
            else st.key=nil end
        end)
        registerOnChanged(loadstring(base64decode("QklORF9LRVlf"))()..def.id, function(k)
            if typeof(k)==loadstring(base64decode("RW51bUl0ZW0="))() then st.key=k else st.key=nil end
        end)
        addOpt(listSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("QklORF9UQ0hf"))()..def.id, {Title=loadstring(base64decode("ICDQmtC90L7Qv9C60LA6IA=="))()..def.title, Default=false}, function(v)
            st.touchOn=v
            if v then makeTouchButton(def.id) else killTouchButton(def.id) end
        end)
    end

    pcall(function() listSec:AddButton({Title=loadstring(base64decode("LS0tINCd0LDRgdGC0YDQvtC50LrQuCDQsdC40L3QtNC+0LIgLS0t"))(),Callback=function() end}) end)
    addOpt(listSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("QklORF9GUkVFWkU="))(), {Title=loadstring(base64decode("0JfQsNC80L7RgNC+0LfQutCwINC60L3QvtC/0L7Qug=="))(), Default=false}, function(v)
        buttonsFrozen=v
        getgenv().FH_ButtonsFrozen=v
        Notify(loadstring(base64decode("Rkg="))(),v and loadstring(base64decode("0JrQvdC+0L/QutC4INC30LDQvNC+0YDQvtC20LXQvdGL"))() or loadstring(base64decode("0JrQvdC+0L/QutC4INGA0LDQt9C80L7RgNC+0LbQtdC90Ys="))(),1.5)
    end)
    listSec:AddButton({Title=loadstring(base64decode("0KHQsdGA0L7RgdC40YLRjCDQstGB0LUg0LHQuNC90LTRiw=="))(),Callback=function()
        local count=0
        for id,st in pairs(BindState) do
            st.key=nil
            if Options[loadstring(base64decode("QklORF9LRVlf"))()..id] then
                pcall(function() Options[loadstring(base64decode("QklORF9LRVlf"))()..id]:SetValue(Enum.KeyCode.Unknown) end)
                count=count+1
            end
        end
        Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0KHQsdGA0L7RiNC10L3QviDQsdC40L3QtNC+0LI6IA=="))()..count,2)
    end})
    listSec:AddButton({Title=loadstring(base64decode("0KPQtNCw0LvQuNGC0Ywg0LLRgdC1INC60L3QvtC/0LrQuA=="))(),Callback=function()
        for id,st in pairs(BindState) do
            st.touchOn=false
            if Options[loadstring(base64decode("QklORF9UQ0hf"))()..id] then pcall(function() Options[loadstring(base64decode("QklORF9UQ0hf"))()..id]:SetValue(false) end) end
            killTouchButton(id)
        end
        Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0JLRgdC1INC60L3QvtC/0LrQuCDRg9C00LDQu9C10L3Riw=="))(),2)
    end})

    UserInputService.InputBegan:Connect(function(input,gpe)
        if gpe then return end
        if input.UserInputType~=Enum.UserInputType.Keyboard then return end
        for id,st in pairs(BindState) do
            if st.key and input.KeyCode==st.key then fireBind(id) end
        end
    end)

    getgenv().BINDS_UNLOAD=function()
        for id,st in pairs(BindState) do killTouchButton(id) end
        pcall(function() touchGui:Destroy() end)
    end
end

-- ============================================================
-- НАСТРОЙКИ
-- ============================================================
do
    local tS=Tabs.Settings
    local setSec=tS:AddSection({Name=loadstring(base64decode("0J7RgdC90L7QstC90YvQtQ=="))()})
    addOpt(setSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("U2hvd0hVRA=="))(), {Title=loadstring(base64decode("0J/QvtC60LDQt9GL0LLQsNGC0YwgSFVE"))(), Default=true}, function(v) if HUDGui then HUDGui.Enabled=v end end)
    addOpt(setSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("RlBTQ2Fw"))(), {Title=loadstring(base64decode("0JvQuNC80LjRgiBGUFMgKDAgLSDQsdC10Lcg0LvQuNC80LjRgtCwKQ=="))(), Min=0, Max=9999, Default=0, Rounding=0}, function(v) pcall(function() if setfpscap then setfpscap(tonumber(v) or 0) end end) end)
    setSec:AddButton({Title=loadstring(base64decode("0J/QtdGA0LXQv9C+0LTQutC70Y7Rh9C40YLRjNGB0Y8g0Log0YHQtdGA0LLQtdGA0YM="))(),Callback=function() TeleportService:TeleportToPlaceInstance(game.PlaceId,game.JobId,LocalPlayer) end})
    setSec:AddButton({Title=loadstring(base64decode("0KHQvNC10L3QuNGC0Ywg0YHQtdGA0LLQtdGA"))(),Callback=function()
        pcall(function()
            local url=loadstring(base64decode("aHR0cHM6Ly9nYW1lcy5yb2Jsb3guY29tL3YxL2dhbWVzLw=="))()..game.PlaceId..loadstring(base64decode("L3NlcnZlcnMvUHVibGljP3NvcnRPcmRlcj1Bc2MmbGltaXQ9MTAw"))()
            local data=game:HttpGet(url)
            local parsed=HttpService:JSONDecode(data)
            for _,s in ipairs(parsed.data) do
                if s.playing<s.maxPlayers and s.id~=game.JobId then TeleportService:TeleportToPlaceInstance(game.PlaceId,s.id,LocalPlayer) break end
            end
        end)
    end})
    addOpt(setSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("QW50aUFGSw=="))(), {Title=loadstring(base64decode("QW50aS1BRks="))(), Default=true}, function() end)
    AddConn(loadstring(base64decode("QW50aUFGSw=="))(),LocalPlayer.Idled:Connect(function()
        if Options.AntiAFK and Options.AntiAFK.Value then
            pcall(function() VirtualUser:Button2Down(Vector2.new(0,0),Camera.CFrame) task.wait(1) VirtualUser:Button2Up(Vector2.new(0,0),Camera.CFrame) end)
        end
    end))

    -- ============ РЕЖИМ ФЛИНГА ============
    local flingSec=tS:AddSection({Name=loadstring(base64decode("0KTQu9C40L3Qsw=="))()})
    addOpt(flingSec, loadstring(base64decode("QWRkRHJvcGRvd24="))(), loadstring(base64decode("RmxpbmdNb2Rl"))(), {
        Title=loadstring(base64decode("0KDQtdC20LjQvCDRhNC70LjQvdCz0LA="))(),
        Values={loadstring(base64decode("Q2xhc3NpYw=="))(),loadstring(base64decode("VHVyYm8="))()},
        Default=getgenv().FLING_MODE or loadstring(base64decode("Q2xhc3NpYw=="))(),
    }, function(v)
        getgenv().FLING_MODE = v or loadstring(base64decode("Q2xhc3NpYw=="))()
        Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0KDQtdC20LjQvCDRhNC70LjQvdCz0LA6IA=="))()..getgenv().FLING_MODE,2)
    end)
    addOpt(flingSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("RmxpbmdUdXJib1NwZWVk"))(), {
        Title=loadstring(base64decode("VHVyYm8g0YHQutC+0YDQvtGB0YLRjA=="))(), Min=100, Max=1500, Default=350, Rounding=0,
    }, function(v) getgenv().FLING_TURBO_SPEED = tonumber(v) or 350 end)
    addOpt(flingSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("RmxpbmdUdXJib0xhcHM="))(), {
        Title=loadstring(base64decode("VHVyYm8g0LrRgNGD0LPQvtCy"))(), Min=4, Max=30, Default=8, Rounding=0,
    }, function(v) getgenv().FLING_TURBO_LAPS = tonumber(v) or 8 end)
    addOpt(flingSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("RmxpbmdUdXJib0Rpc3RhbmNl"))(), {
        Title=loadstring(base64decode("VHVyYm8g0LTQuNGB0YLQsNC90YbQuNGP"))(), Min=6, Max=40, Default=14, Rounding=0,
    }, function(v) getgenv().FLING_TURBO_DISTANCE = tonumber(v) or 14 end)

    -- ============ ПРИНУДИТЕЛЬНОЕ 3-Е ЛИЦО ============
    local camSec=tS:AddSection({Name=loadstring(base64decode("0JrQsNC80LXRgNCw"))()})
    local thirdPersonOn=false
    local thirdPersonThread=nil
    addOpt(camSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("Rm9yY2VUaGlyZFBlcnNvbg=="))(), {Title=loadstring(base64decode("0JLRgdC10LPQtNCwIDMt0LUg0LvQuNGG0L4="))(), Default=false}, function(v)
        thirdPersonOn = v
        if v then
            if thirdPersonThread then return end
            thirdPersonThread = task.spawn(function()
                while thirdPersonOn do
                    local ok = pcall(function()
                        LocalPlayer.CameraMode = Enum.CameraMode.Classic
                        LocalPlayer.CameraMinZoomDistance = 12.5
                        LocalPlayer.CameraMaxZoomDistance = 12.5
                    end)
                    RunService.RenderStepped:Wait()
                end
                thirdPersonThread = nil
            end)
            Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("My3QtSDQu9C40YbQviDQktCa0Js="))(),2)
        else
            pcall(function()
                LocalPlayer.CameraMinZoomDistance = 0.5
                LocalPlayer.CameraMaxZoomDistance = 400
            end)
            Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("My3QtSDQu9C40YbQviDQktCr0JrQmw=="))(),2)
        end
    end)
    addOpt(camSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("VGhpcmRQZXJzb25EaXN0"))(), {
        Title=loadstring(base64decode("0JTQuNGB0YLQsNC90YbQuNGPIDMt0LPQviDQu9C40YbQsA=="))(), Min=5, Max=50, Default=12.5, Rounding=1,
    }, function(v)
        if thirdPersonOn then
            pcall(function()
                LocalPlayer.CameraMinZoomDistance = v
                LocalPlayer.CameraMaxZoomDistance = v
            end)
        end
    end)

    -- ============ ЦВЕТ НЕОПОЗНАННОЙ РОЛИ ============
    local espCfgSec=tS:AddSection({Name=loadstring(base64decode("RVNQINCd0LDRgdGC0YDQvtC50LrQuA=="))()})
    addOpt(espCfgSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("VW5rbm93blJvbGVDb2xvcg=="))(), {
        Title=loadstring(base64decode("0KbQstC10YIg0L3QtdC+0L/QvtC30L3QsNC90L3QvtC5INGA0L7Qu9C4"))(), Default=Color3.fromRGB(180, 60, 255)
    }, function(c)
        getgenv().UNKNOWN_ROLE_COLOR = c
    end)

    setSec:AddButton({Title=loadstring(base64decode("0JLRi9Cz0YDRg9C30LjRgtGMINGB0LrRgNC40L/Rgg=="))(),Callback=function()
        for _,c in pairs(Connections) do pcall(function() c:Disconnect() end) end
        Connections={}
        if HUDGui then HUDGui:Destroy() end
        if Window then pcall(function() Window:Destroy() end) end
        Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0KHQutGA0LjQv9GCINCy0YvQs9GA0YPQttC10L0="))(),3)
    end})

    local cfgSec=tS:AddSection({Name=loadstring(base64decode("0JrQvtC90YTQuNCz0Lg="))()})
    local CONFIG_DIR=loadstring(base64decode("Rm9ydG5pSHViX0NvbmZpZ3Mv"))()
    local CONFIG_EXT=loadstring(base64decode("LnR4dA=="))()
    local function ensureConfigDir()
        if type(isfolder)~=loadstring(base64decode("ZnVuY3Rpb24="))() or type(makefolder)~=loadstring(base64decode("ZnVuY3Rpb24="))() then return false end
        local ok,has=pcall(isfolder,CONFIG_DIR)
        if not ok then return false end
        if has then return true end
        return pcall(makefolder,CONFIG_DIR)==true
    end
    local function listConfigs()
        local out={}
        if type(listfiles)~=loadstring(base64decode("ZnVuY3Rpb24="))() then return out end
        if not ensureConfigDir() then return out end
        local ok,files=pcall(listfiles,CONFIG_DIR)
        if not ok or type(files)~=loadstring(base64decode("dGFibGU="))() then return out end
        for _,f in ipairs(files) do
            local name=string.match(f,loadstring(base64decode("KFteL1xcXSsp"))()..CONFIG_EXT..loadstring(base64decode("JA=="))())
            if name then out[#out+1]=name end
        end
        return out
    end

    local function serializeValue(v)
        if typeof(v)==loadstring(base64decode("Q29sb3Iz"))() then
            return string.format(loadstring(base64decode("QzolLjZmLCUuNmYsJS42Zg=="))(), v.R, v.G, v.B)
        end
        if typeof(v)==loadstring(base64decode("RW51bUl0ZW0="))() then
            local enumTypeName = nil
            pcall(function() enumTypeName = tostring(v.EnumType) end)
            if enumTypeName == loadstring(base64decode("RW51bS5LZXlDb2Rl"))() then return loadstring(base64decode("Szo="))()..v.Name end
            if enumTypeName then return loadstring(base64decode("RTo="))()..enumTypeName..loadstring(base64decode("fA=="))()..v.Name end
            return nil
        end
        local t=type(v)
        if t==loadstring(base64decode("bnVtYmVy"))() then return loadstring(base64decode("Tjo="))()..tostring(v) end
        if t==loadstring(base64decode("Ym9vbGVhbg=="))() then return loadstring(base64decode("Qjo="))()..tostring(v) end
        if t==loadstring(base64decode("c3RyaW5n"))() then
            if KeyCodeLookup[v] then return loadstring(base64decode("Szo="))()..v end
            v = v:gsub(loadstring(base64decode("XG4="))(),loadstring(base64decode("XFxu"))()):gsub(loadstring(base64decode("XHQ="))(),loadstring(base64decode("XFx0"))())
            return loadstring(base64decode("Uzo="))()..v
        end
        if t==loadstring(base64decode("dGFibGU="))() then
            local isArray=true
            for k in pairs(v) do if type(k)~=loadstring(base64decode("bnVtYmVy"))() then isArray=false break end end
            if isArray then
                local parts={}
                for uSCGtGib=1,#v do parts[#parts+1]=tostring(v[uSCGtGib]) end
                return loadstring(base64decode("TDo="))()..table.concat(parts,loadstring(base64decode("LA=="))())
            else
                local parts={}
                for k,kaDQmaZL in pairs(v) do parts[#parts+1]=tostring(k)..loadstring(base64decode("PQ=="))()..tostring(kaDQmaZL) end
                return loadstring(base64decode("RDo="))()..table.concat(parts,loadstring(base64decode("Ow=="))())
            end
        end
        return nil
    end

    local function deserializeValue(s)
        local prefix,rest=string.match(s,loadstring(base64decode("XiglYSk6KC4qKSQ="))())
        if not prefix then return nil end
        if prefix==loadstring(base64decode("Sw=="))() then return KeyCodeLookup[rest] end
        if prefix==loadstring(base64decode("Qw=="))() then
            local r,g,b=string.match(rest,loadstring(base64decode("KFteLF0rKSwoW14sXSspLChbXixdKyk="))())
            if r and g and b then
                local ok, col = pcall(function() return Color3.new(tonumber(r),tonumber(g),tonumber(b)) end)
                if ok then return col end
            end
            return nil
        end
        if prefix==loadstring(base64decode("RQ=="))() then
            local enumType,name=string.match(rest,loadstring(base64decode("XihbXnxdKyl8KC4rKSQ="))())
            if enumType and name then
                local ok, kaDQmaZL = pcall(function()
                    local et = Enum[enumType]
                    if et then return et[name] end
                    return nil
                end)
                if ok then return kaDQmaZL end
            end
            return nil
        end
        if prefix==loadstring(base64decode("Tg=="))() then return tonumber(rest) end
        if prefix==loadstring(base64decode("Qg=="))() then return rest==loadstring(base64decode("dHJ1ZQ=="))() end
        if prefix==loadstring(base64decode("Uw=="))() then return rest:gsub(loadstring(base64decode("XFxu"))(),loadstring(base64decode("XG4="))()):gsub(loadstring(base64decode("XFx0"))(),loadstring(base64decode("XHQ="))()) end
        if prefix==loadstring(base64decode("TA=="))() then
            local out={}
            for piece in string.gmatch(rest,loadstring(base64decode("W14sXSs="))()) do
                local n=tonumber(piece)
                if n then out[#out+1]=n else out[#out+1]=piece end
            end
            return out
        end
        if prefix==loadstring(base64decode("RA=="))() then
            local out={}
            for pair in string.gmatch(rest,loadstring(base64decode("W147XSs="))()) do
                local k,kaDQmaZL=string.match(pair,loadstring(base64decode("XiguLSk9KC4qKSQ="))())
                if k then
                    local n=tonumber(kaDQmaZL)
                    if n then out[k]=n
                    elseif kaDQmaZL==loadstring(base64decode("dHJ1ZQ=="))() then out[k]=true
                    elseif kaDQmaZL==loadstring(base64decode("ZmFsc2U="))() then out[k]=false
                    else out[k]=kaDQmaZL end
                end
            end
            return out
        end
        return nil
    end

    local function saveConfig(name)
        if type(writefile)~=loadstring(base64decode("ZnVuY3Rpb24="))() then Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0J3QtdGCIHdyaXRlZmlsZQ=="))(),4) return false end
        if not ensureConfigDir() then Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0J3QtSDRgdC+0LfQtNCw0Lsg0L/QsNC/0LrRgw=="))(),4) return false end
        local lines={loadstring(base64decode("LS0gRm9ydG5pSHViIENvbmZpZzog"))()..tostring(name),loadstring(base64decode("LS0g"))()..os.date(loadstring(base64decode("JVktJW0tJWQgJUg6JU06JVM="))())}
        for optionName,option in pairs(Options) do
            if option and option.Value~=nil then
                local ser=serializeValue(option.Value)
                if ser then lines[#lines+1]=optionName..loadstring(base64decode("XHQ="))()..ser end
            end
        end
        local path=CONFIG_DIR..name..CONFIG_EXT
        local ok=pcall(writefile,path,table.concat(lines,loadstring(base64decode("XG4="))()))
        if ok then Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0KHQvtGF0YDQsNC90LXQvdC+OiA="))()..name,3) return true end
        Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0J7RiNC40LHQutCwINGB0L7RhdGA0LDQvdC10L3QuNGP"))(),3)
        return false
    end

    local function loadConfig(name)
        if type(readfile)~=loadstring(base64decode("ZnVuY3Rpb24="))() then Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0J3QtdGCIHJlYWRmaWxl"))(),4) return false end
        local path=CONFIG_DIR..name..CONFIG_EXT
        local ok,data=pcall(readfile,path)
        if not ok or type(data)~=loadstring(base64decode("c3RyaW5n"))() then Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0J7RiNC40LHQutCwINGH0YLQtdC90LjRjw=="))(),3) return false end
        local loaded=0
        local bindLoaded=0
        local BS = getgenv().FH_BindState
        for line in string.gmatch(data,loadstring(base64decode("W15cclxuXSs="))()) do
            if line:sub(1,2)~=loadstring(base64decode("LS0="))() then
                local key,ser=string.match(line,loadstring(base64decode("XihbXlx0XSspXHQoLispJA=="))())
                if key and ser then
                    if key:sub(1,9)==loadstring(base64decode("QklORF9LRVlf"))() then
                        local id = key:sub(10)
                        local enumVal = nil
                        if ser:sub(1,2)==loadstring(base64decode("Szo="))() then
                            enumVal = safeGetKeyCode(ser:sub(3))
                        elseif ser:sub(1,2)==loadstring(base64decode("RTo="))() then
                            local raw = ser:sub(3)
                            local enumType,keyName=string.match(raw,loadstring(base64decode("XihbXnxdKyl8KC4rKSQ="))())
                            if enumType and keyName then
                                pcall(function()
                                    local et=Enum[enumType]
                                    if et then enumVal = et[keyName] end
                                end)
                            end
                        elseif ser:sub(1,2)==loadstring(base64decode("Uzo="))() then
                            enumVal = safeGetKeyCode(ser:sub(3))
                        end
                        if enumVal then
                            pcall(function() Options[key]:SetValue(enumVal) end)
                            if BS and BS[id] then BS[id].key = enumVal end
                            bindLoaded = bindLoaded + 1
                        else
                            pcall(function() Options[key]:SetValue(Enum.KeyCode.Unknown) end)
                            if BS and BS[id] then BS[id].key = nil end
                        end
                        loaded = loaded + 1
                    else
                        local kaDQmaZL=deserializeValue(ser)
                        if kaDQmaZL~=nil and Options[key] then
                            pcall(function() Options[key]:SetValue(kaDQmaZL) end)
                            fireRegistered(key, kaDQmaZL)
                            loaded=loaded+1
                        end
                    end
                end
            end
        end
        Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0JfQsNCz0YDRg9C20LXQvdC+OiA="))()..name..loadstring(base64decode("ICg="))()..loaded..loadstring(base64decode("LCDQsdC40L3QtNC+0LI6IA=="))()..bindLoaded..loadstring(base64decode("KQ=="))(),4)
        return true
    end

    local function deleteConfig(name)
        if type(delfile)~=loadstring(base64decode("ZnVuY3Rpb24="))() then Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0J3QtdGCIGRlbGZpbGU="))(),4) return false end
        local ok=pcall(delfile,CONFIG_DIR..name..CONFIG_EXT)
        if ok then Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0KPQtNCw0LvQtdC90L46IA=="))()..name,2) return true end
        return false
    end
    local currentList=listConfigs()
    if #currentList==0 then currentList={loadstring(base64decode("KNC90LXRgiDQutC+0L3RhNC40LPQvtCyKQ=="))()} end
    local drop=cfgSec:AddDropdown(loadstring(base64decode("Q29uZmlnUGljaw=="))(),{Title=loadstring(base64decode("0JLRi9Cx0YDQsNGC0Ywg0LrQvtC90YTQuNCz"))(),Values=currentList,Default=currentList[1]})
    local function refreshList()
        local list=listConfigs()
        if #list==0 then list={loadstring(base64decode("KNC90LXRgiDQutC+0L3RhNC40LPQvtCyKQ=="))()} end
        pcall(function() drop:SetValues(list) if drop.Generate then drop:Generate() end end)
    end
    cfgSec:AddInput(loadstring(base64decode("Q29uZmlnTmFtZQ=="))(),{Title=loadstring(base64decode("0JjQvNGPINC60L7QvdGE0LjQs9Cw"))(),Default=loadstring(base64decode("bXlfY29uZmln"))()})
    cfgSec:AddButton({Title=loadstring(base64decode("0KHQvtGF0YDQsNC90LjRgtGM"))(),Callback=function()
        local nameOpt=Options.ConfigName
        local name=nameOpt and nameOpt.Value or loadstring(base64decode("bXlfY29uZmln"))()
        if type(name)~=loadstring(base64decode("c3RyaW5n"))() or name==loadstring(base64decode(""))() then Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0JLQstC10LTQuCDQuNC80Y8="))(),3) return end
        if saveConfig(name) then refreshList() end
    end})
    cfgSec:AddButton({Title=loadstring(base64decode("0JfQsNCz0YDRg9C30LjRgtGM"))(),Callback=function()
        local pickOpt=Options.ConfigPick
        local name=pickOpt and pickOpt.Value
        if type(name)~=loadstring(base64decode("c3RyaW5n"))() or name==loadstring(base64decode(""))() or name==loadstring(base64decode("KNC90LXRgiDQutC+0L3RhNC40LPQvtCyKQ=="))() then Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0JLRi9Cx0LXRgNC4INC60L7QvdGE0LjQsw=="))(),3) return end
        loadConfig(name)
    end})
    cfgSec:AddButton({Title=loadstring(base64decode("0KPQtNCw0LvQuNGC0Yw="))(),Callback=function()
        local pickOpt=Options.ConfigPick
        local name=pickOpt and pickOpt.Value
        if type(name)~=loadstring(base64decode("c3RyaW5n"))() or name==loadstring(base64decode(""))() or name==loadstring(base64decode("KNC90LXRgiDQutC+0L3RhNC40LPQvtCyKQ=="))() then Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0JLRi9Cx0LXRgNC4INC60L7QvdGE0LjQsw=="))(),3) return end
        if deleteConfig(name) then refreshList() end
    end})
    cfgSec:AddButton({Title=loadstring(base64decode("0J7QsdC90L7QstC40YLRjCDRgdC/0LjRgdC+0Lo="))(),Callback=refreshList})
    if HUDGui then HUDGui.Enabled=true end
end

-- ============================================================
-- ESP И ВИЗУАЛЫ
-- ============================================================
do
    local espState={
        enabled=false,box=false,boxCol={Color3.fromRGB(255,255,255),1},boxType=loadstring(base64decode("U3RhdGlj"))(),
        boxGrd=false,boxGrd1=Color3.fromRGB(255,60,60),boxGrd2=Color3.fromRGB(255,180,60),
        boxFill=false,boxFillCol={Color3.fromRGB(255,60,60),0.5},
        name=false,nameCol={Color3.new(1,1,1),1},dist=false,distCol={Color3.fromRGB(220,220,220),1},
        avatar=false,skel=false,skelCol={Color3.new(1,1,1),1},chams=false,
        chamsFMur={Color3.fromRGB(255,60,60),0.55},chamsOMur={Color3.fromRGB(255,60,60),0.15},
        chamsFInno={Color3.new(1,1,1),0.55},chamsOInno={Color3.new(1,1,1),0.15},
        chamsFShf={Color3.fromRGB(0,153,255),0.55},chamsOShf={Color3.fromRGB(0,153,255),0.15},
        chamsFHero={Color3.fromRGB(255,215,0),0.55},chamsOHero={Color3.fromRGB(255,215,0),0.15},
        chamsFUnk={Color3.fromRGB(180,60,255),0.55},chamsOUnk={Color3.fromRGB(180,60,255),0.15},
        matChams=false,matType=loadstring(base64decode("Rm9yY2VGaWVsZA=="))(),matColMur=Color3.fromRGB(255,60,60),
        matColInno=Color3.new(1,1,1),matColShf=Color3.fromRGB(0,153,255),matColHero=Color3.fromRGB(255,215,0),
        matColUnk=Color3.fromRGB(180,60,255),
        flags=false,flagMur={Color3.fromRGB(255,60,60),1},flagShf={Color3.fromRGB(0,153,255),1},flagHero={Color3.fromRGB(255,215,0),1},
        flagUnk={Color3.fromRGB(180,60,255),1},
        arrows=false,arrowMur=Color3.fromRGB(255,60,60),arrowInno=Color3.new(1,1,1),
        arrowShf=Color3.fromRGB(0,153,255),arrowHero=Color3.fromRGB(255,215,0),
        arrowUnk=Color3.fromRGB(180,60,255),
        arrowSize=42,arrowDist=260,maxDist=500,allowLocal=false,
        gunEspOn=false,gunTextOn=false,gunTextCol=Color3.new(1,1,1),
        gunHlOn=false,gunHlCol=Color3.new(1,1,1),
    }
    _G.FH_ESP=espState
    local drawCache={}
    local chamsFolder=Instance.new(loadstring(base64decode("Rm9sZGVy"))()) chamsFolder.Name=loadstring(base64decode("RkhfQ2hhbXM="))() chamsFolder.Parent=Workspace
    local gunFolder=Instance.new(loadstring(base64decode("Rm9sZGVy"))()) gunFolder.Name=loadstring(base64decode("RkhfR3VuQ2hhbXM="))() gunFolder.Parent=Workspace
    local function classifyRole(p)
        local r=getRoleFromData(p)
        if r==loadstring(base64decode("bXVyZGVyZXI="))() then return loadstring(base64decode("TXVy"))() end
        if r==loadstring(base64decode("c2hlcmlmZg=="))() then return loadstring(base64decode("U2hm"))() end
        if r==loadstring(base64decode("aGVybw=="))() then return loadstring(base64decode("SGVybw=="))() end
        if r==loadstring(base64decode("aW5ub2NlbnQ="))() then return loadstring(base64decode("SW5ubw=="))() end
        return loadstring(base64decode("VW5r"))()
    end
    local function roleColor(role)
        if role==loadstring(base64decode("TXVy"))() then return Color3.fromRGB(255,60,60) end
        if role==loadstring(base64decode("U2hm"))() then return Color3.fromRGB(0,153,255) end
        if role==loadstring(base64decode("SGVybw=="))() then return Color3.fromRGB(255,215,0) end
        if role==loadstring(base64decode("VW5r"))() then return getgenv().UNKNOWN_ROLE_COLOR or Color3.fromRGB(180,60,255) end
        return Color3.new(1,1,1)
    end
    local function getDraw(p)
        local d=drawCache[p]
        if d then return d end
        d={box={},boxFill=nil,name=nil,dist=nil,avatar=nil,skel={},flags={},arrow=nil}
        drawCache[p]=d
        return d
    end
    local function ensureBox(e,uSCGtGib)
        if e.box[uSCGtGib] then return e.box[uSCGtGib] end
        local d=Drawing.new(loadstring(base64decode("TGluZQ=="))()) d.Thickness=1.5 d.Transparency=1 d.Visible=false e.box[uSCGtGib]=d return d
    end
    local function grad(c1,c2)
        local t=math.sin(os.clock()*3)*0.5+0.5
        return c1:Lerp(c2,t)
    end
    local function dispose(e)
        for _,d in pairs(e.box) do pcall(function() d:Remove() end) end
        if e.boxFill then pcall(function() e.boxFill:Remove() end) end
        if e.name then pcall(function() e.name:Remove() end) end
        if e.dist then pcall(function() e.dist:Remove() end) end
        if e.avatar then pcall(function() e.avatar:Remove() end) end
        for _,d in pairs(e.skel) do pcall(function() d:Remove() end) end
        for _,d in pairs(e.flags) do pcall(function() d:Remove() end) end
        if e.arrow then pcall(function() e.arrow:Remove() end) end
    end
    local chams={}
    local function killCham(p)
        local h=chams[p]
        if h then pcall(function() h:Destroy() end) chams[p]=nil end
    end
    local function ensureCham(p,char)
        local h=chams[p]
        if h and h.Parent and h.Adornee==char then return h end
        if h then pcall(function() h:Destroy() end) end
        h=Instance.new(loadstring(base64decode("SGlnaGxpZ2h0"))())
        h.Name=loadstring(base64decode("Rkhf"))()..p.Name
        h.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
        h.Adornee=char
        h.Parent=chamsFolder
        chams[p]=h
        return h
    end
    local matCache={}
    local function restoreMat()
        for part,o in pairs(matCache) do
            if part.Parent then
                pcall(function() part.Material=o.m end)
                pcall(function() part.Color=o.c end)
            end
        end
        table.clear(matCache)
    end
    local function updateMatChams()
        if not espState.matChams then
            if next(matCache) then restoreMat() end
            return
        end
        local mat=Enum.Material.ForceField
        if espState.matType==loadstring(base64decode("RmxhdA=="))() then mat=Enum.Material.SmoothPlastic
        elseif espState.matType==loadstring(base64decode("Q2hyb21hdGlj"))() then mat=Enum.Material.Foil end
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=LocalPlayer and p.Character then
                local role=classifyRole(p)
                local col
                if role==loadstring(base64decode("TXVy"))() then col=espState.matColMur
                elseif role==loadstring(base64decode("U2hm"))() then col=espState.matColShf
                elseif role==loadstring(base64decode("SGVybw=="))() then col=espState.matColHero
                elseif role==loadstring(base64decode("VW5r"))() then col=espState.matColUnk
                else col=espState.matColInno end
                for _,part in ipairs(p.Character:GetDescendants()) do
                    if part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) and part.Name~=loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))() then
                        if not matCache[part] then matCache[part]={m=part.Material,c=part.Color} end
                        pcall(function() part.Material=mat end)
                        pcall(function() part.Color=col end)
                    end
                end
            end
        end
    end
    local gunCache,gunCandidates,gunScanAcc={},{},0
    local function inCharacter(obj)
        local node=obj.Parent
        while node and node~=Workspace do
            if node:IsA(loadstring(base64decode("TW9kZWw="))()) and Players:GetPlayerFromCharacter(node) then return true end
            node=node.Parent
        end
        return false
    end
    local function renderPart(obj)
        if obj:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then return obj end
        if obj:IsA(loadstring(base64decode("TW9kZWw="))()) then return obj.PrimaryPart or obj:FindFirstChildWhichIsA(loadstring(base64decode("QmFzZVBhcnQ="))(),true) end
        return obj:FindFirstChild(loadstring(base64decode("SGFuZGxl"))()) or obj:FindFirstChildWhichIsA(loadstring(base64decode("QmFzZVBhcnQ="))(),true)
    end
    local function collectGuns()
        local list={}
        for obj in pairs(gunCandidates) do
            if obj.Name==loadstring(base64decode("R3VuRHJvcA=="))() and obj.Parent and not inCharacter(obj) then
                local part=renderPart(obj)
                if part then
                    local adorn=(obj:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) or obj:IsA(loadstring(base64decode("TW9kZWw="))())) and obj or part
                    list[#list+1]={obj=obj,part=part,adorn=adorn}
                end
            end
        end
        return list
    end
    local function clearGun(obj)
        local e=gunCache[obj]
        if e then
            if e.hl then pcall(function() e.hl:Destroy() end) end
            if e.txt then pcall(function() e.txt:Remove() end) end
            gunCache[obj]=nil
        end
    end
    local function clearGuns()
        for obj in pairs(gunCache) do clearGun(obj) end
    end
    local gunParts={}
    local function gunRender(dt)
        if not espState.gunEspOn then
            if next(gunCache) then clearGuns() end
            return
        end
        gunScanAcc=gunScanAcc+dt
        if gunScanAcc>=0.25 then
            gunScanAcc=0
            gunParts=collectGuns()
            local set={}
            for _,entry in ipairs(gunParts) do set[entry.obj]=true end
            for obj in pairs(gunCache) do if not set[obj] then clearGun(obj) end end
        end
        for _,entry in ipairs(gunParts) do
            local obj,part=entry.obj,entry.part
            if obj.Parent and part and part.Parent then
                local e=gunCache[obj]
                if not e then e={} gunCache[obj]=e end
                if espState.gunHlOn then
                    if not e.hl then
                        local hl=Instance.new(loadstring(base64decode("SGlnaGxpZ2h0"))())
                        hl.FillTransparency=1
                        hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
                        hl.Parent=gunFolder
                        e.hl=hl
                    end
                    e.hl.Adornee=entry.adorn
                    e.hl.OutlineColor=espState.gunHlCol
                    e.hl.OutlineTransparency=0
                    e.hl.Enabled=true
                elseif e.hl then e.hl.Enabled=false end
                if espState.gunTextOn then
                    local sp=Camera:WorldToViewportPoint(part.Position)
                    if not e.txt then
                        local t=Drawing.new(loadstring(base64decode("VGV4dA=="))())
                        t.Center=true t.Outline=true t.Size=13
                        e.txt=t
                    end
                    if sp.Z>0 then
                        e.txt.Position=Vector2.new(sp.X,sp.Y)
                        e.txt.Text=loadstring(base64decode("R3Vu"))()
                        e.txt.Color=espState.gunTextCol
                        e.txt.Visible=true
                    else e.txt.Visible=false end
                elseif e.txt then e.txt.Visible=false end
            else clearGun(obj) end
        end
    end
    local function collectCandidates()
        table.clear(gunCandidates)
        for _,obj in ipairs(Workspace:GetDescendants()) do
            if obj.Name==loadstring(base64decode("R3VuRHJvcA=="))() and (obj:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) or obj:IsA(loadstring(base64decode("TW9kZWw="))()) or obj:IsA(loadstring(base64decode("VG9vbA=="))())) then
                gunCandidates[obj]=true
            end
        end
    end
    Workspace.DescendantAdded:Connect(function(obj)
        if obj.Name==loadstring(base64decode("R3VuRHJvcA=="))() and (obj:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) or obj:IsA(loadstring(base64decode("TW9kZWw="))()) or obj:IsA(loadstring(base64decode("VG9vbA=="))())) then gunCandidates[obj]=true end
    end)
    Workspace.DescendantRemoving:Connect(function(obj)
        if obj.Name==loadstring(base64decode("R3VuRHJvcA=="))() then gunCandidates[obj]=nil end
    end)
    RunService.RenderStepped:Connect(function(dt)
        local seen={}
        for _,p in ipairs(Players:GetPlayers()) do
            if p==LocalPlayer and not espState.allowLocal then
                killCham(p)
            else
                local char=p.Character
                local hrp=char and (char:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))()) or char:FindFirstChild(loadstring(base64decode("VXBwZXJUb3Jzbw=="))()) or char:FindFirstChild(loadstring(base64decode("VG9yc28="))()))
                local head=char and char:FindFirstChild(loadstring(base64decode("SGVhZA=="))())
                local hum=char and char:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
                if char and hrp and head and hum and hum.Health>0 then
                    seen[p]=true
                    local role=classifyRole(p)
                    local dcol=roleColor(role)
                    local dist=(Camera.CFrame.Position-hrp.Position).Magnitude
                    local fade=math.clamp(1-dist/espState.maxDist,0.15,1)
                    if espState.enabled then
                        local headPos=head.Position+Vector3.new(0,head.Size.Y*0.5,0)
                        local footPos=hrp.Position-Vector3.new(0,hrp.Size.Y*0.5+(hum.HipHeight or 0),0)
                        local hsp,hon=Camera:WorldToViewportPoint(headPos)
                        local fsp,fon=Camera:WorldToViewportPoint(footPos)
                        if hon or fon then
                            local e=getDraw(p)
                            if espState.box then
                                local w=math.max(40,(hsp.Y-fsp.Y)*0.5)
                                local cx=(hsp.X+fsp.X)*0.5
                                local top,bot=hsp.Y,fsp.Y
                                local l,r=cx-w,cx+w
                                local col=espState.boxGrd and grad(espState.boxGrd1,espState.boxGrd2) or dcol
                                local a=(espState.boxCol[2] or 1)*fade
                                if espState.boxType==loadstring(base64decode("Q29ybmVycw=="))() then
                                    local sg=math.min(w,bot-top)*0.25
                                    local lines={
                                        {l,top,l+sg,top},{l,top,l,top+sg},
                                        {r,top,r-sg,top},{r,top,r,top+sg},
                                        {l,bot,l+sg,bot},{l,bot,l,bot-sg},
                                        {r,bot,r-sg,bot},{r,bot,r,bot-sg},
                                    }
                                    for uSCGtGib,ln in ipairs(lines) do
                                        local line=ensureBox(e,uSCGtGib)
                                        line.From=Vector2.new(ln[1],ln[2])
                                        line.To=Vector2.new(ln[3],ln[4])
                                        line.Color=col
                                        line.Transparency=a
                                        line.Visible=true
                                    end
                                    for uSCGtGib=#lines+1,#e.box do e.box[uSCGtGib].Visible=false end
                                else
                                    local lines={{l,top,r,top},{r,top,r,bot},{r,bot,l,bot},{l,bot,l,top}}
                                    for uSCGtGib,ln in ipairs(lines) do
                                        local line=ensureBox(e,uSCGtGib)
                                        line.From=Vector2.new(ln[1],ln[2])
                                        line.To=Vector2.new(ln[3],ln[4])
                                        line.Color=col
                                        line.Transparency=a
                                        line.Visible=true
                                    end
                                    for uSCGtGib=5,#e.box do e.box[uSCGtGib].Visible=false end
                                end
                                if espState.boxFill then
                                    if not e.boxFill then
                                        e.boxFill=Drawing.new(loadstring(base64decode("U3F1YXJl"))())
                                        e.boxFill.Filled=true
                                        e.boxFill.Thickness=0
                                    end
                                    e.boxFill.Position=Vector2.new(l,top)
                                    e.boxFill.Size=Vector2.new(r-l,bot-top)
                                    e.boxFill.Color=dcol
                                    e.boxFill.Transparency=(espState.boxFillCol[2] or 0.5)*fade
                                    e.boxFill.Visible=true
                                elseif e.boxFill then e.boxFill.Visible=false end
                            else
                                for _,ln in pairs(e.box) do ln.Visible=false end
                                if e.boxFill then e.boxFill.Visible=false end
                            end
                            if espState.name then
                                if not e.name then
                                    e.name=Drawing.new(loadstring(base64decode("VGV4dA=="))())
                                    e.name.Size=13
                                    e.name.Center=true
                                    e.name.Outline=true
                                end
                                e.name.Text=p.Name
                                e.name.Position=Vector2.new((hsp.X+fsp.X)*0.5,hsp.Y-18)
                                e.name.Color=espState.nameCol[1]
                                e.name.Transparency=(espState.nameCol[2] or 1)*fade
                                e.name.Visible=true
                            elseif e.name then e.name.Visible=false end
                            if espState.dist then
                                if not e.dist then
                                    e.dist=Drawing.new(loadstring(base64decode("VGV4dA=="))())
                                    e.dist.Size=12
                                    e.dist.Center=true
                                    e.dist.Outline=true
                                end
                                e.dist.Text=string.format(loadstring(base64decode("JWQgc3R1ZHM="))(),math.floor(dist))
                                e.dist.Position=Vector2.new((hsp.X+fsp.X)*0.5,fsp.Y+4)
                                e.dist.Color=espState.distCol[1]
                                e.dist.Transparency=(espState.distCol[2] or 1)*fade
                                e.dist.Visible=true
                            elseif e.dist then e.dist.Visible=false end
                            if espState.avatar then
                                if not e.avatar then
                                    e.avatar=Drawing.new(loadstring(base64decode("SW1hZ2U="))())
                                    e.avatar.Size=Vector2.new(40,40)
                                    pcall(function()
                                        e.avatar.Data=Players:GetUserThumbnailAsync(p.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size100x100)
                                    end)
                                end
                                e.avatar.Position=Vector2.new((hsp.X+fsp.X)*0.5-20,hsp.Y-60)
                                e.avatar.Transparency=fade
                                e.avatar.Visible=true
                            elseif e.avatar then e.avatar.Visible=false end
                            if espState.skel then
                                local bones={
                                    {loadstring(base64decode("SGVhZA=="))(),loadstring(base64decode("VXBwZXJUb3Jzbw=="))()},{loadstring(base64decode("VXBwZXJUb3Jzbw=="))(),loadstring(base64decode("TG93ZXJUb3Jzbw=="))()},
                                    {loadstring(base64decode("VXBwZXJUb3Jzbw=="))(),loadstring(base64decode("TGVmdFVwcGVyQXJt"))()},{loadstring(base64decode("TGVmdFVwcGVyQXJt"))(),loadstring(base64decode("TGVmdExvd2VyQXJt"))()},{loadstring(base64decode("TGVmdExvd2VyQXJt"))(),loadstring(base64decode("TGVmdEhhbmQ="))()},
                                    {loadstring(base64decode("VXBwZXJUb3Jzbw=="))(),loadstring(base64decode("UmlnaHRVcHBlckFybQ=="))()},{loadstring(base64decode("UmlnaHRVcHBlckFybQ=="))(),loadstring(base64decode("UmlnaHRMb3dlckFybQ=="))()},{loadstring(base64decode("UmlnaHRMb3dlckFybQ=="))(),loadstring(base64decode("UmlnaHRIYW5k"))()},
                                    {loadstring(base64decode("TG93ZXJUb3Jzbw=="))(),loadstring(base64decode("TGVmdFVwcGVyTGVn"))()},{loadstring(base64decode("TGVmdFVwcGVyTGVn"))(),loadstring(base64decode("TGVmdExvd2VyTGVn"))()},{loadstring(base64decode("TGVmdExvd2VyTGVn"))(),loadstring(base64decode("TGVmdEZvb3Q="))()},
                                    {loadstring(base64decode("TG93ZXJUb3Jzbw=="))(),loadstring(base64decode("UmlnaHRVcHBlckxlZw=="))()},{loadstring(base64decode("UmlnaHRVcHBlckxlZw=="))(),loadstring(base64decode("UmlnaHRMb3dlckxlZw=="))()},{loadstring(base64decode("UmlnaHRMb3dlckxlZw=="))(),loadstring(base64decode("UmlnaHRGb290"))()},
                                }
                                for uSCGtGib,b in ipairs(bones) do
                                    local p1=char:FindFirstChild(b[1])
                                    local p2=char:FindFirstChild(b[2])
                                    if p1 and p2 and p1:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) and p2:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
                                        local s1,o1=Camera:WorldToViewportPoint(p1.Position)
                                        local s2,o2=Camera:WorldToViewportPoint(p2.Position)
                                        if not e.skel[uSCGtGib] then
                                            local dr=Drawing.new(loadstring(base64decode("TGluZQ=="))())
                                            dr.Thickness=1
                                            dr.Transparency=1
                                            e.skel[uSCGtGib]=dr
                                        end
                                        local dr=e.skel[uSCGtGib]
                                        if o1 and o2 then
                                            dr.From=Vector2.new(s1.X,s1.Y)
                                            dr.To=Vector2.new(s2.X,s2.Y)
                                            dr.Color=espState.skelCol[1]
                                            dr.Transparency=(espState.skelCol[2] or 1)*fade
                                            dr.Visible=true
                                        else dr.Visible=false end
                                    elseif e.skel[uSCGtGib] then e.skel[uSCGtGib].Visible=false end
                                end
                                for uSCGtGib=#bones+1,#e.skel do e.skel[uSCGtGib].Visible=false end
                            else
                                for _,dr in pairs(e.skel) do dr.Visible=false end
                            end
                            if espState.flags then
                                local txt
                                if role==loadstring(base64decode("TXVy"))() then txt=loadstring(base64decode("W01VUkRd"))()
                                elseif role==loadstring(base64decode("U2hm"))() then txt=loadstring(base64decode("W1NIRl0="))()
                                elseif role==loadstring(base64decode("SGVybw=="))() then txt=loadstring(base64decode("W0hFUk9d"))()
                                elseif role==loadstring(base64decode("VW5r"))() then txt=loadstring(base64decode("Wz9d"))()
                                else txt=loadstring(base64decode(""))() end
                                if txt~=loadstring(base64decode(""))() then
                                    if not e.flags[1] then
                                        e.flags[1]=Drawing.new(loadstring(base64decode("VGV4dA=="))())
                                        e.flags[1].Size=13
                                        e.flags[1].Outline=true
                                    end
                                    local dr=e.flags[1]
                                    dr.Text=txt
                                    dr.Position=Vector2.new(hsp.X+60,hsp.Y-10)
                                    if role==loadstring(base64decode("TXVy"))() then dr.Color=espState.flagMur[1]
                                    elseif role==loadstring(base64decode("SGVybw=="))() then dr.Color=espState.flagHero[1]
                                    elseif role==loadstring(base64decode("VW5r"))() then dr.Color=espState.flagUnk[1]
                                    else dr.Color=espState.flagShf[1] end
                                    dr.Transparency=fade
                                    dr.Visible=true
                                else
                                    for _,dr in pairs(e.flags) do dr.Visible=false end
                                end
                            else
                                for _,dr in pairs(e.flags) do dr.Visible=false end
                            end
                            if espState.arrows then
                                local vp=Camera.ViewportSize
                                local onScreen=hsp.X>=0 and hsp.X<=vp.X and hsp.Y>=0 and hsp.Y<=vp.Y
                                if onScreen then
                                    if e.arrow then e.arrow.Visible=false end
                                else
                                    if not e.arrow then
                                        e.arrow=Drawing.new(loadstring(base64decode("VHJpYW5nbGU="))())
                                        e.arrow.Filled=true
                                    end
                                    local cx,cy=vp.X*0.5,vp.Y*0.5
                                    local dir=Vector2.new(hsp.X-cx,hsp.Y-cy)
                                    if dir.Magnitude<0.01 then dir=Vector2.new(0,1) end
                                    dir=dir.Unit
                                    local px=cx+dir.X*espState.arrowDist
                                    local py=cy+dir.Y*espState.arrowDist
                                    local sz=espState.arrowSize
                                    local perp=Vector2.new(-dir.Y,dir.X)
                                    e.arrow.PointA=Vector2.new(px+dir.X*sz*0.5,py+dir.Y*sz*0.5)
                                    e.arrow.PointB=Vector2.new(px-dir.X*sz*0.5+perp.X*sz*0.5,py-dir.Y*sz*0.5+perp.Y*sz*0.5)
                                    e.arrow.PointC=Vector2.new(px-dir.X*sz*0.5-perp.X*sz*0.5,py-dir.Y*sz*0.5-perp.Y*sz*0.5)
                                    if role==loadstring(base64decode("TXVy"))() then e.arrow.Color=espState.arrowMur
                                    elseif role==loadstring(base64decode("U2hm"))() then e.arrow.Color=espState.arrowShf
                                    elseif role==loadstring(base64decode("SGVybw=="))() then e.arrow.Color=espState.arrowHero
                                    elseif role==loadstring(base64decode("VW5r"))() then e.arrow.Color=espState.arrowUnk
                                    else e.arrow.Color=espState.arrowInno end
                                    e.arrow.Transparency=fade
                                    e.arrow.Visible=true
                                end
                            elseif e.arrow then e.arrow.Visible=false end
                        end
                    else
                        local e=drawCache[p]
                        if e then
                            for _,ln in pairs(e.box) do ln.Visible=false end
                            if e.boxFill then e.boxFill.Visible=false end
                            if e.name then e.name.Visible=false end
                            if e.dist then e.dist.Visible=false end
                            if e.avatar then e.avatar.Visible=false end
                            for _,dr in pairs(e.skel) do dr.Visible=false end
                            for _,dr in pairs(e.flags) do dr.Visible=false end
                            if e.arrow then e.arrow.Visible=false end
                        end
                    end
                    if espState.chams then
                        local h=ensureCham(p,char)
                        local fill=espState[loadstring(base64decode("Y2hhbXNG"))()..role] or espState.chamsFInno
                        local outl=espState[loadstring(base64decode("Y2hhbXNP"))()..role] or espState.chamsOInno
                        h.FillColor=fill[1]
                        h.FillTransparency=fill[2]
                        h.OutlineColor=outl[1]
                        h.OutlineTransparency=outl[2]
                    else killCham(p) end
                else
                    local e=drawCache[p]
                    if e then
                        for _,ln in pairs(e.box) do ln.Visible=false end
                        if e.boxFill then e.boxFill.Visible=false end
                        if e.name then e.name.Visible=false end
                        if e.dist then e.dist.Visible=false end
                        if e.avatar then e.avatar.Visible=false end
                        for _,dr in pairs(e.skel) do dr.Visible=false end
                        for _,dr in pairs(e.flags) do dr.Visible=false end
                        if e.arrow then e.arrow.Visible=false end
                    end
                    killCham(p)
                end
            end
        end
        for p,e in pairs(drawCache) do
            if not seen[p] then
                dispose(e)
                drawCache[p]=nil
            end
        end
        updateMatChams()
        gunRender(dt)
    end)
    Players.PlayerRemoving:Connect(function(p) killCham(p) end)
    local tV=Tabs.Visual
    local espSec=tV:AddSection({Name=loadstring(base64decode("RVNQINCY0LPRgNC+0LrQvtCy"))()})
    addOpt(espSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("RVNQT24="))(), {Title=loadstring(base64decode("0JLQutC70Y7Rh9C40YLRjCBFU1A="))(), Default=false}, function(v)
        espState.enabled=v
        if not v then
            for _,e in pairs(drawCache) do dispose(e) end
            drawCache={}
        end
    end)
    addOpt(espSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("RVNQQm94"))(), {Title=loadstring(base64decode("0KDQsNC80LrQsA=="))(), Default=false}, function(v) espState.box=v end)
    addOpt(espSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("RVNQQm94Q29s"))(), {Title=loadstring(base64decode("0KbQstC10YIg0YDQsNC80LrQuCAo0L/QtdGA0LXQutGA0YvQstCw0LXRgtGB0Y8g0YDQvtC70Y/QvNC4KQ=="))(), Default=Color3.new(1,1,1)}, function(c) espState.boxCol[1]=c end)
    addOpt(espSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("RVNQQm94QWxwaGE="))(), {Title=loadstring(base64decode("0J/RgNC+0LfRgNCw0YfQvdC+0YHRgtGMINGA0LDQvNC60Lg="))(), Min=0, Max=1, Default=1, Rounding=2}, function(v) espState.boxCol[2]=tonumber(v) or 1 end)
    addOpt(espSec, loadstring(base64decode("QWRkRHJvcGRvd24="))(), loadstring(base64decode("RVNQQm94VHlwZQ=="))(), {Title=loadstring(base64decode("0KLQuNC/INGA0LDQvNC60Lg="))(), Values={loadstring(base64decode("0J/RgNGP0LzQvtGD0LPQvtC70YzQvdC40Lo="))(),loadstring(base64decode("0KPQs9C+0LvQutC4"))()}, Default=loadstring(base64decode("0J/RgNGP0LzQvtGD0LPQvtC70YzQvdC40Lo="))()}, function(v) espState.boxType=(v==loadstring(base64decode("0KPQs9C+0LvQutC4"))()) and loadstring(base64decode("Q29ybmVycw=="))() or loadstring(base64decode("U3RhdGlj"))() end)
    addOpt(espSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("RVNQQm94R3Jk"))(), {Title=loadstring(base64decode("0JPRgNCw0LTQuNC10L3RgiDRgNCw0LzQutC4"))(), Default=false}, function(v) espState.boxGrd=v end)
    addOpt(espSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("RVNQQm94R3JkMQ=="))(), {Title=loadstring(base64decode("0KbQstC10YIgMQ=="))(), Default=Color3.fromRGB(255,60,60)}, function(c) espState.boxGrd1=c end)
    addOpt(espSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("RVNQQm94R3JkMg=="))(), {Title=loadstring(base64decode("0KbQstC10YIgMg=="))(), Default=Color3.fromRGB(255,180,60)}, function(c) espState.boxGrd2=c end)
    addOpt(espSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("RVNQQm94RmlsbA=="))(), {Title=loadstring(base64decode("0JfQsNC70LjQstC60LA="))(), Default=false}, function(v) espState.boxFill=v end)
    addOpt(espSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("RVNQQm94RmlsbENvbA=="))(), {Title=loadstring(base64decode("0KbQstC10YIg0LfQsNC70LjQstC60LggKNC/0LXRgNC10LrRgNGL0LLQsNC10YLRgdGPINGA0L7Qu9GP0LzQuCk="))(), Default=Color3.fromRGB(255,60,60)}, function(c) espState.boxFillCol[1]=c end)
    addOpt(espSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("RVNQQm94RmlsbEFscGhh"))(), {Title=loadstring(base64decode("0J/RgNC+0LfRgNCw0YfQvdC+0YHRgtGMINC30LDQu9C40LLQutC4"))(), Min=0, Max=1, Default=0.5, Rounding=2}, function(v) espState.boxFillCol[2]=tonumber(v) or 0.5 end)
    addOpt(espSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("RVNQTmFtZQ=="))(), {Title=loadstring(base64decode("0JjQvNGP"))(), Default=false}, function(v) espState.name=v end)
    addOpt(espSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("RVNQTmFtZUNvbA=="))(), {Title=loadstring(base64decode("0KbQstC10YIg0LjQvNC10L3QuA=="))(), Default=Color3.new(1,1,1)}, function(c) espState.nameCol[1]=c end)
    addOpt(espSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("RVNQRGlzdA=="))(), {Title=loadstring(base64decode("0JTQuNGB0YLQsNC90YbQuNGP"))(), Default=false}, function(v) espState.dist=v end)
    addOpt(espSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("RVNQRGlzdENvbA=="))(), {Title=loadstring(base64decode("0KbQstC10YIg0LTQuNGB0YLQsNC90YbQuNC4"))(), Default=Color3.fromRGB(220,220,220)}, function(c) espState.distCol[1]=c end)
    addOpt(espSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("RVNQQXZhdGFy"))(), {Title=loadstring(base64decode("0JDQstCw0YLQsNGA0LrQsA=="))(), Default=false}, function(v) espState.avatar=v end)
    addOpt(espSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("RVNQU2tlbA=="))(), {Title=loadstring(base64decode("0KHQutC10LvQtdGC"))(), Default=false}, function(v) espState.skel=v end)
    addOpt(espSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("RVNQU2tlbENvbA=="))(), {Title=loadstring(base64decode("0KbQstC10YIg0YHQutC10LvQtdGC0LA="))(), Default=Color3.new(1,1,1)}, function(c) espState.skelCol[1]=c end)
    addOpt(espSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("RVNQQ2hhbXM="))(), {Title=loadstring(base64decode("0KHQstC10YfQtdC90LjQtQ=="))(), Default=false}, function(v) espState.chams=v end)
    local function chamsPair(prefix,role,defFill,defOut)
        addOpt(espSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("Q2hhbXNG"))()..prefix, {Title=role..loadstring(base64decode("INC30LDQu9C40LLQutCw"))(), Default=defFill}, function(c) espState[loadstring(base64decode("Y2hhbXNG"))()..prefix][1]=c end)
        addOpt(espSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("Q2hhbXNGQQ=="))()..prefix, {Title=role..loadstring(base64decode("INC/0YDQvtC30YA="))(), Min=0, Max=1, Default=0.55, Rounding=2}, function(v) espState[loadstring(base64decode("Y2hhbXNG"))()..prefix][2]=tonumber(v) or 0.55 end)
        addOpt(espSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("Q2hhbXNP"))()..prefix, {Title=role..loadstring(base64decode("INC+0LHQstC+0LTQutCw"))(), Default=defOut}, function(c) espState[loadstring(base64decode("Y2hhbXNP"))()..prefix][1]=c end)
        addOpt(espSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("Q2hhbXNPQQ=="))()..prefix, {Title=role..loadstring(base64decode("INC/0YDQvtC30YAg0L7QsdCy0L7QtNC60Lg="))(), Min=0, Max=1, Default=0.15, Rounding=2}, function(v) espState[loadstring(base64decode("Y2hhbXNP"))()..prefix][2]=tonumber(v) or 0.15 end)
    end
    chamsPair(loadstring(base64decode("TXVy"))(),loadstring(base64decode("0KPQsdC40LnRhtCw"))(),Color3.fromRGB(255,60,60),Color3.fromRGB(255,120,120))
    chamsPair(loadstring(base64decode("SW5ubw=="))(),loadstring(base64decode("0JzQuNGA0L3Ri9C5"))(),Color3.new(1,1,1),Color3.new(1,1,1))
    chamsPair(loadstring(base64decode("U2hm"))(),loadstring(base64decode("0KjQtdGA0LjRhA=="))(),Color3.fromRGB(0,153,255),Color3.fromRGB(120,200,255))
    chamsPair(loadstring(base64decode("SGVybw=="))(),loadstring(base64decode("0JPQtdGA0L7QuQ=="))(),Color3.fromRGB(255,215,0),Color3.fromRGB(255,240,140))
    chamsPair(loadstring(base64decode("VW5r"))(),loadstring(base64decode("0J3QtdC+0L/QvtC30L3QsNC9"))(),Color3.fromRGB(180,60,255),Color3.fromRGB(220,140,255))
    addOpt(espSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("RVNQTWF0Q2hhbXM="))(), {Title=loadstring(base64decode("0JzQsNGC0LXRgNC40LDQuy3Rh9Cw0LzRgdGL"))(), Default=false}, function(v) espState.matChams=v end)
    addOpt(espSec, loadstring(base64decode("QWRkRHJvcGRvd24="))(), loadstring(base64decode("RVNQTWF0VHlwZQ=="))(), {Title=loadstring(base64decode("0JzQsNGC0LXRgNC40LDQuw=="))(), Values={loadstring(base64decode("Rm9yY2VGaWVsZA=="))(),loadstring(base64decode("RmxhdA=="))(),loadstring(base64decode("Q2hyb21hdGlj"))()}, Default=loadstring(base64decode("Rm9yY2VGaWVsZA=="))()}, function(v) espState.matType=v end)
    addOpt(espSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("RVNQTWF0TXVy"))(), {Title=loadstring(base64decode("0KPQsdC40LnRhtCw"))(), Default=Color3.fromRGB(255,60,60)}, function(c) espState.matColMur=c end)
    addOpt(espSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("RVNQTWF0SW5ubw=="))(), {Title=loadstring(base64decode("0JzQuNGA0L3Ri9C5"))(), Default=Color3.new(1,1,1)}, function(c) espState.matColInno=c end)
    addOpt(espSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("RVNQTWF0U2hm"))(), {Title=loadstring(base64decode("0KjQtdGA0LjRhA=="))(), Default=Color3.fromRGB(0,153,255)}, function(c) espState.matColShf=c end)
    addOpt(espSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("RVNQTWF0SGVybw=="))(), {Title=loadstring(base64decode("0JPQtdGA0L7QuQ=="))(), Default=Color3.fromRGB(255,215,0)}, function(c) espState.matColHero=c end)
    addOpt(espSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("RVNQTWF0VW5r"))(), {Title=loadstring(base64decode("0J3QtdC+0L/QvtC30L3QsNC9"))(), Default=Color3.fromRGB(180,60,255)}, function(c) espState.matColUnk=c end)
    addOpt(espSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("RVNQRmxhZ3M="))(), {Title=loadstring(base64decode("0JzQtdGC0LrQuCDRgNC+0LvQtdC5"))(), Default=false}, function(v) espState.flags=v end)
    addOpt(espSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("RVNQRmxhZ1Vuaw=="))(), {Title=loadstring(base64decode("0JzQtdGC0LrQsCDQvdC10L7Qv9C+0LfQvdCw0L3QvdC+0Lk="))(), Default=Color3.fromRGB(180,60,255)}, function(c) espState.flagUnk[1]=c end)
    addOpt(espSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("RVNQQXJyb3dz"))(), {Title=loadstring(base64decode("0KHRgtGA0LXQu9C60Lg="))(), Default=false}, function(v) espState.arrows=v end)
    addOpt(espSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("RVNQQXJyTXVy"))(), {Title=loadstring(base64decode("0KPQsdC40LnRhtCw"))(), Default=Color3.fromRGB(255,60,60)}, function(c) espState.arrowMur=c end)
    addOpt(espSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("RVNQQXJySW5ubw=="))(), {Title=loadstring(base64decode("0JzQuNGA0L3Ri9C5"))(), Default=Color3.new(1,1,1)}, function(c) espState.arrowInno=c end)
    addOpt(espSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("RVNQQXJyU2hm"))(), {Title=loadstring(base64decode("0KjQtdGA0LjRhA=="))(), Default=Color3.fromRGB(0,153,255)}, function(c) espState.arrowShf=c end)
    addOpt(espSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("RVNQQXJySGVybw=="))(), {Title=loadstring(base64decode("0JPQtdGA0L7QuQ=="))(), Default=Color3.fromRGB(255,215,0)}, function(c) espState.arrowHero=c end)
    addOpt(espSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("RVNQQXJyVW5r"))(), {Title=loadstring(base64decode("0J3QtdC+0L/QvtC30L3QsNC9"))(), Default=Color3.fromRGB(180,60,255)}, function(c) espState.arrowUnk=c end)
    addOpt(espSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("RVNQQXJyU3o="))(), {Title=loadstring(base64decode("0KDQsNC30LzQtdGAINGB0YLRgNC10LvQvtC6"))(), Min=16, Max=96, Default=42, Rounding=0}, function(v) espState.arrowSize=tonumber(v) or 42 end)
    addOpt(espSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("RVNQQXJyRGlzdA=="))(), {Title=loadstring(base64decode("0JTQuNGB0YLQsNC90YbQuNGPINGB0YLRgNC10LvQvtC6"))(), Min=40, Max=520, Default=260, Rounding=0}, function(v) espState.arrowDist=tonumber(v) or 260 end)
    addOpt(espSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("RVNQTWF4RGlzdA=="))(), {Title=loadstring(base64decode("0JzQsNC60YEg0LTQuNGB0YLQsNC90YbQuNGPIEVTUA=="))(), Min=50, Max=1000, Default=500, Rounding=0}, function(v) espState.maxDist=tonumber(v) or 500 end)
    addOpt(espSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("RVNQQWxsb3dMb2NhbA=="))(), {Title=loadstring(base64decode("0J/QvtC60LDQt9GL0LLQsNGC0Ywg0YHQtdCx0Y8="))(), Default=false}, function(v) espState.allowLocal=v end)
    local gunSec=tV:AddSection({Name=loadstring(base64decode("RVNQINCf0LjRgdGC0L7Qu9C10YLQsA=="))()})
    addOpt(gunSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("R3VuRXNwT24="))(), {Title=loadstring(base64decode("RVNQINC/0LjRgdGC0L7Qu9C10YLQsA=="))(), Default=false}, function(v)
        espState.gunEspOn=v
        if v then collectCandidates() else clearGuns() end
    end)
    addOpt(gunSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("R3VuVGV4dE9u"))(), {Title=loadstring(base64decode("0KLQtdC60YHRgg=="))(), Default=false}, function(v) espState.gunTextOn=v end)
    addOpt(gunSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("R3VuVGV4dENvbA=="))(), {Title=loadstring(base64decode("0KbQstC10YIg0YLQtdC60YHRgtCw"))(), Default=Color3.new(1,1,1)}, function(c) espState.gunTextCol=c end)
    addOpt(gunSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("R3VuSGxPbg=="))(), {Title=loadstring(base64decode("0J7QsdCy0L7QtNC60LA="))(), Default=false}, function(v) espState.gunHlOn=v end)
    addOpt(gunSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("R3VuSGxDb2w="))(), {Title=loadstring(base64decode("0KbQstC10YIg0L7QsdCy0L7QtNC60Lg="))(), Default=Color3.new(1,1,1)}, function(c) espState.gunHlCol=c end)
    local camSec=tV:AddSection({Name=loadstring(base64decode("0JrQsNC80LXRgNCw"))()})
    local ratioOn,ratioValue=false,100
    local aspectMul=CFrame.new(0,0,0,1,0,0,0,1,0,0,0,1)
    RunService:BindToRenderStep(loadstring(base64decode("RkhfYXNwZWN0"))(),Enum.RenderPriority.Camera.Value+1,function()
        if not ratioOn then return end
        local cam=Workspace.CurrentCamera
        if cam then cam.CFrame=cam.CFrame*aspectMul end
    end)
    addOpt(camSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("QXNwZWN0T24="))(), {Title=loadstring(base64decode("QXNwZWN0IHJhdGlv"))(), Default=false}, function(v) ratioOn=v end)
    addOpt(camSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("QXNwZWN0VmFs"))(), {Title=loadstring(base64decode("0JfQvdCw0YfQtdC90LjQtQ=="))(), Min=1, Max=100, Default=100, Rounding=0}, function(v)
        ratioValue=tonumber(v) or 100
        aspectMul=CFrame.new(0,0,0,1,0,0,0,ratioValue/100,0,0,0,1)
    end)
    local fovOn,fovValue,fovOrig=false,70,nil
    RunService.RenderStepped:Connect(function()
        if not fovOn then return end
        local cam=Workspace.CurrentCamera
        if cam and cam.FieldOfView~=fovValue then cam.FieldOfView=fovValue end
    end)
    addOpt(camSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("Rm92T24="))(), {Title=loadstring(base64decode("0KHQstC+0ZEgRk9W"))(), Default=false}, function(v)
        fovOn=v
        local cam=Workspace.CurrentCamera
        if v then if cam then fovOrig=cam.FieldOfView cam.FieldOfView=fovValue end
        else if cam and fovOrig then cam.FieldOfView=fovOrig end end
    end)
    addOpt(camSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("Rm92VmFs"))(), {Title=loadstring(base64decode("Rk9W"))(), Min=30, Max=120, Default=70, Rounding=0}, function(v)
        fovValue=tonumber(v) or 70
        if fovOn then
            local cam=Workspace.CurrentCamera
            if cam then cam.FieldOfView=fovValue end
        end
    end)
end

-- ============================================================
-- СВОИ ВИЗУАЛЫ
-- ============================================================
do
    local lvSec=Tabs.Visual:AddSection({Name=loadstring(base64decode("0KHQstC+0Lgg0LLQuNC30YPQsNC70Ys="))()})
    local chGui=Instance.new(loadstring(base64decode("U2NyZWVuR3Vp"))())
    chGui.Name=loadstring(base64decode("RkhfQ2hpbmFIYXRfdjIy"))()
    chGui.ResetOnSpawn=false
    chGui.IgnoreGuiInset=true
    chGui.DisplayOrder=999
    chGui.Parent=(gethui and gethui()) or CoreGui
    local holder=Instance.new(loadstring(base64decode("RnJhbWU="))())
    holder.Size=UDim2.fromScale(1,1)
    holder.BackgroundTransparency=1
    holder.BorderSizePixel=0
    holder.Parent=chGui
    local chRows={}
    local chOn,chCol=false,Color3.fromRGB(170,85,255)
    local SEG,RAD,HEIGHT,DROP,ALPHA=36,1.6,0.9,0.02,0.28
    local MAX_ROWS=120
    local function chEnsure(n)
        for uSCGtGib=#chRows+1,n do
            local f=Instance.new(loadstring(base64decode("RnJhbWU="))())
            f.BorderSizePixel=0
            f.BackgroundTransparency=ALPHA
            f.Visible=false
            f.ZIndex=5
            f.Parent=holder
            chRows[uSCGtGib]=f
        end
    end
    local function chHideAll()
        for _,f in ipairs(chRows) do if f.Visible then f.Visible=false end end
    end
    local function proj(p)
        local sp,on=Camera:WorldToViewportPoint(p)
        if sp.Z<=0 then return nil,false end
        return Vector2.new(sp.X,sp.Y),true
    end
    local function cross(o,a,b)
        return (a.X-o.X)*(b.Y-o.Y)-(a.Y-o.Y)*(b.X-o.X)
    end
    local function hull(pts)
        table.sort(pts,function(a,b)
            if a.X==b.X then return a.Y<b.Y end
            return a.X<b.X
        end)
        local lo={}
        for _,p in ipairs(pts) do
            while #lo>=2 and cross(lo[#lo-1],lo[#lo],p)<=0 do table.remove(lo) end
            lo[#lo+1]=p
        end
        local up={}
        for uSCGtGib=#pts,1,-1 do
            local p=pts[uSCGtGib]
            while #up>=2 and cross(up[#up-1],up[#up],p)<=0 do table.remove(up) end
            up[#up+1]=p
        end
        table.remove(lo);table.remove(up)
        local out={}
        for _,p in ipairs(lo) do out[#out+1]=p end
        for _,p in ipairs(up) do out[#out+1]=p end
        return out
    end
    RunService.RenderStepped:Connect(function()
        if not chOn then chHideAll() return end
        local char=LocalPlayer.Character
        local head=char and char:FindFirstChild(loadstring(base64decode("SGVhZA=="))())
        if not head then chHideAll() return end
        local cam=Workspace.CurrentCamera
        if not cam then chHideAll() return end
        local base=Vector3.new(head.Position.X,head.Position.Y+head.Size.Y*0.5-DROP,head.Position.Z)
        local apex2d,ok=proj(base+Vector3.new(0,HEIGHT,0))
        if not ok then chHideAll() return end
        local pts={apex2d}
        for uSCGtGib=1,SEG do
            local a=(uSCGtGib-1)/SEG*math.pi*2
            local p,ok2=proj(base+Vector3.new(math.cos(a)*RAD,0,math.sin(a)*RAD))
            if not ok2 then chHideAll() return end
            pts[#pts+1]=p
        end
        local h=hull(pts)
        if #h<3 then chHideAll() return end
        local minY,maxY=math.huge,-math.huge
        for _,p in ipairs(h) do
            if p.Y<minY then minY=p.Y end
            if p.Y>maxY then maxY=p.Y end
        end
        minY=math.max(0,math.floor(minY))
        maxY=math.min(cam.ViewportSize.Y,math.ceil(maxY))
        if maxY-minY<2 then chHideAll() return end
        local span=math.max(1,maxY-minY)
        local step=math.max(1,math.ceil((maxY-minY)/MAX_ROWS))
        chEnsure(MAX_ROWS)
        local used=0
        for y0=minY,maxY-1,step do
            local hh=math.min(step,maxY-y0)
            local KbNcpS8c=y0+hh*0.5
            local left,right=math.huge,-math.huge
            local ax,ay=h[#h].X,h[#h].Y
            for uSCGtGib=1,#h do
                local bx,by=h[uSCGtGib].X,h[uSCGtGib].Y
                if (ay<=KbNcpS8c and by>KbNcpS8c) or (by<=KbNcpS8c and ay>KbNcpS8c) then
                    local 8VHdxnGv=ax+(KbNcpS8c-ay)*(bx-ax)/(by-ay)
                    if 8VHdxnGv<left then left=8VHdxnGv end
                    if 8VHdxnGv>right then right=8VHdxnGv end
                end
                ax,ay=bx,by
            end
            local w=right-left
            if w>=2 then
                used=used+1
                local t=(KbNcpS8c-minY)/span
                local light=math.max(0,1-t*1.35)
                local dark=math.max(0,(t-0.58)/0.42)
                local col=chCol:Lerp(Color3.new(1,1,1),light*0.26):Lerp(Color3.new(0,0,0),dark*0.12)
                local f=chRows[used]
                f.Position=UDim2.fromOffset(left,y0)
                f.Size=UDim2.fromOffset(w,hh)
                f.BackgroundColor3=col
                f.Visible=true
            end
        end
        for uSCGtGib=used+1,#chRows do
            if chRows[uSCGtGib].Visible then chRows[uSCGtGib].Visible=false end
        end
    end)
    addOpt(lvSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("Q2hpbmFIYXRPbg=="))(), {Title=loadstring(base64decode("0JrQuNGC0LDQudGB0LrQsNGPINGI0LvRj9C/0LA="))(), Default=false}, function(v) chOn=v end)
    addOpt(lvSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("Q2hpbmFIYXRDb2w="))(), {Title=loadstring(base64decode("0KbQstC10YI="))(), Default=Color3.fromRGB(170,85,255)}, function(c) chCol=c end)

    local btOn,btCol=false,Color3.fromRGB(255,60,60)
    local btModel=nil
    local btPairs={}
    local BTCAP=256
    local btHist=table.create(BTCAP)
    for uSCGtGib=1,BTCAP do btHist[uSCGtGib]={0,CFrame.identity} end
    local btFirst,btCount=1,0
    local btPing,btPingAt=0.15,0
    local function btKill()
        if btModel then pcall(function() btModel:Destroy() end) btModel=nil end
        btPairs={}
        btFirst,btCount=1,0
    end
    local function btBuild()
        btKill()
        local char=LocalPlayer.Character
        if not char then return end
        local hrp=char:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
        if not hrp then return end
        char.Archivable=true
        local ok,m=pcall(function() return char:Clone() end)
        char.Archivable=false
        if not ok or not m then return end
        local rp={}
        for _,o in ipairs(char:GetDescendants()) do
            if o:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then rp[#rp+1]=o end
        end
        local ci=0
        for _,o in ipairs(m:GetDescendants()) do
            if o:IsA(loadstring(base64decode("U2NyaXB0"))()) or o:IsA(loadstring(base64decode("TG9jYWxTY3JpcHQ="))()) then pcall(function() o:Destroy() end)
            elseif o:IsA(loadstring(base64decode("RGVjYWw="))()) or o:IsA(loadstring(base64decode("VGV4dHVyZQ=="))()) or o:IsA(loadstring(base64decode("U3VyZmFjZUFwcGVhcmFuY2U="))()) then pcall(function() o:Destroy() end)
            elseif o:IsA(loadstring(base64decode("UGFydGljbGVFbWl0dGVy"))()) or o:IsA(loadstring(base64decode("QmVhbQ=="))()) or o:IsA(loadstring(base64decode("VHJhaWw="))()) or o:IsA(loadstring(base64decode("UG9pbnRMaWdodA=="))()) then pcall(function() o:Destroy() end)
            elseif o:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
                o.Anchored=true
                o.CanCollide=false
                o.CanQuery=false
                o.CastShadow=false
                if o.Name==loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))() then o.Transparency=1
                else
                    o.Material=Enum.Material.ForceField
                    o.Color=btCol
                    o.Transparency=0
                end
                ci=ci+1
                btPairs[#btPairs+1]={o,rp[ci]}
            end
        end
        local h=m:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
        if h then pcall(function() h:Destroy() end) end
        m.Parent=Workspace
        btModel=m
    end
    local function btUpdate()
        local char=LocalPlayer.Character
        local hrp=char and char:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
        if not hrp then return end
        if not btModel then btBuild() if not btModel then return end end
        if not btModel.Parent then btModel.Parent=Workspace end
        local now=os.clock()
        local cf=hrp.CFrame
        if btCount<BTCAP then btCount=btCount+1
        else btFirst=btFirst%BTCAP+1 end
        local slot=btHist[(btFirst+btCount-2)%BTCAP+1]
        slot[1],slot[2]=now,cf
        if now-btPingAt>=0.2 then
            btPingAt=now
            local ok,v=pcall(function() return Stats.Network.ServerStatsItem[loadstring(base64decode("RGF0YSBQaW5n"))()]:GetValue()/1000 end)
            btPing=math.clamp((ok and v) or 0.15,0.05,0.6)
        end
        local target=now-btPing
        local tcf=cf
        for k=btCount,1,-1 do
            local s=btHist[(btFirst+k-2)%BTCAP+1]
            if s[1]<=target then tcf=s[2] break end
        end
        local inv=hrp.CFrame:Inverse()
        for uSCGtGib=1,#btPairs do
            local cp,rp=btPairs[uSCGtGib][1],btPairs[uSCGtGib][2]
            if cp and cp.Parent and rp and rp.Parent then
                cp.CFrame=tcf*(inv*rp.CFrame)
            end
        end
    end
    addOpt(lvSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("QmFja3RyYWNrT24="))(), {Title=loadstring(base64decode("0JHRjdC60YLRgNC10Lo="))(), Default=false}, function(v)
        btOn=v
        if v then
            if not _G.FH_BT_CONN then
                _G.FH_BT_CONN=RunService.Heartbeat:Connect(function() if btOn then btUpdate() end end)
            end
            if not btModel then btBuild() end
        else btKill() end
    end)
    addOpt(lvSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("QmFja3RyYWNrQ29s"))(), {Title=loadstring(base64decode("0KbQstC10YI="))(), Default=Color3.fromRGB(255,60,60)}, function(c)
        btCol=c
        if btModel then
            for _,p in ipairs(btModel:GetDescendants()) do
                if p:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) and p.Name~=loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))() then p.Color=c end
            end
        end
    end)

    local lcOn,lcCol,lcTr,lcDur=false,Color3.new(1,1,1),1,0.82
    local lcConn
    local function lcHit(char,root)
        local prm=RaycastParams.new()
        prm.FilterType=Enum.RaycastFilterType.Exclude
        prm.FilterDescendantsInstances={char}
        prm.IgnoreWater=true
        local hit=Workspace:Raycast(root.Position+Vector3.new(0,1,0),Vector3.new(0,-16,0),prm)
        if hit then return hit.Position,hit.Normal end
    end
    local function lcMake(p,n)
        local ref=math.abs(n.Y)>0.98 and Vector3.xAxis or Vector3.yAxis
        local right=n:Cross(ref).Unit
        local front=right:Cross(n).Unit
        local pt=Instance.new(loadstring(base64decode("UGFydA=="))())
        pt.Anchored=true
        pt.CanCollide=false
        pt.CanQuery=false
        pt.CanTouch=false
        pt.CastShadow=false
        pt.Transparency=1
        pt.Size=Vector3.new(0.3,0.01,0.3)
        pt.CFrame=CFrame.fromMatrix(p+n*0.012,right,n,front)
        pt.Parent=Workspace
        local sg=Instance.new(loadstring(base64decode("U3VyZmFjZUd1aQ=="))())
        sg.Face=Enum.NormalId.Top
        sg.AlwaysOnTop=true
        sg.LightInfluence=0
        sg.ZOffset=4
        sg.CanvasSize=Vector2.new(1024,1024)
        sg.Parent=pt
        local img=Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
        img.BackgroundTransparency=1
        img.Size=UDim2.fromScale(1,1)
        img.Image=loadstring(base64decode("cmJ4YXNzZXRpZDovLzcxODUwMDMwNTg="))()
        img.ImageColor3=lcCol
        img.ImageTransparency=1-lcTr
        img.ScaleType=Enum.ScaleType.Stretch
        img.Parent=sg
        local info=TweenInfo.new(lcDur,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
        TweenService:Create(pt,info,{Size=Vector3.new(6.4,0.01,6.4)}):Play()
        TweenService:Create(img,info,{ImageTransparency=1}):Play()
        Debris:AddItem(pt,lcDur+0.2)
    end
    local function lcBind()
        if lcConn then pcall(function() lcConn:Disconnect() end) lcConn=nil end
        if not lcOn then return end
        local char=LocalPlayer.Character
        local hum=char and char:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
        local root=char and char:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
        if not hum or not root then return end
        local air=false
        lcConn=hum.StateChanged:Connect(function(_,state)
            if state==Enum.HumanoidStateType.Jumping or state==Enum.HumanoidStateType.Freefall then
                air=true
            elseif state==Enum.HumanoidStateType.Landed and air and lcOn then
                air=false
                local p,n=lcHit(char,root)
                if p and n then lcMake(p,n) end
            end
        end)
    end
    addOpt(lvSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("TGFuZENpcmNsZU9u"))(), {Title=loadstring(base64decode("0JrRgNGD0LMg0L/QsNC00LXQvdC40Y8="))(), Default=false}, function(v)
        lcOn=v
        if v then lcBind()
        elseif lcConn then pcall(function() lcConn:Disconnect() end) lcConn=nil end
    end)
    addOpt(lvSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("TGFuZENpcmNsZUNvbA=="))(), {Title=loadstring(base64decode("0KbQstC10YI="))(), Default=Color3.new(1,1,1)}, function(c) lcCol=c end)
    addOpt(lvSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("TGFuZENpcmNsZVRy"))(), {Title=loadstring(base64decode("0J/RgNC+0LfRgNCw0YfQvdC+0YHRgtGM"))(), Min=0, Max=1, Default=1, Rounding=2}, function(v) lcTr=tonumber(v) or 1 end)
    addOpt(lvSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("TGFuZENpcmNsZUR1cg=="))(), {Title=loadstring(base64decode("0JTQu9C40YLQtdC70YzQvdC+0YHRgtGM"))(), Min=0.1, Max=3, Default=0.82, Rounding=2}, function(v) lcDur=tonumber(v) or 0.82 end)

    local mgOn,mgCol=false,Color3.fromRGB(242,242,242)
    local mgWidth,mgHeight,mgOffset=280,72,180
    local mgLines,mgShadows={},{}
    local mgCurrent=nil
    local mgHist,mgAccum,mgSmooth={},0,0
    local mgSpan,mgStep=2.8,1/45
    local mgConn=nil
    local function mgSpeed()
        local c=LocalPlayer.Character
        local r=c and c:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
        if not r then return 0 end
        local v=r.AssemblyLinearVelocity
        return Vector3.new(v.X,0,v.Z).Magnitude
    end
    local function mgRef()
        local c=LocalPlayer.Character
        local h=c and c:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
        return math.max(1,(h and h.WalkSpeed) or 16)
    end
    local function mgClear()
        if mgConn then pcall(function() mgConn:Disconnect() end) mgConn=nil end
        if mgCurrent then pcall(function() mgCurrent:Remove() end) mgCurrent=nil end
        for uSCGtGib=1,#mgLines do
            pcall(function() mgLines[uSCGtGib]:Remove() end)
            pcall(function() mgShadows[uSCGtGib]:Remove() end)
        end
        mgLines,mgShadows={},{}
        mgHist={}
        mgAccum=0
    end
    local function mgStart()
        mgClear()
        mgSmooth=mgSpeed()
        local now=os.clock()
        local cnt=math.ceil(mgSpan/mgStep)
        for uSCGtGib=0,cnt do mgHist[#mgHist+1]={t=now-mgSpan+uSCGtGib*mgStep,v=mgSmooth} end
        for uSCGtGib=1,300 do
            local s=Drawing.new(loadstring(base64decode("TGluZQ=="))())
            s.Color=Color3.new(0,0,0);s.Thickness=3;s.Transparency=0.4;s.Visible=false
            mgShadows[#mgShadows+1]=s
            local l=Drawing.new(loadstring(base64decode("TGluZQ=="))())
            l.Color=mgCol;l.Thickness=1.5;l.Transparency=1;l.Visible=false
            mgLines[#mgLines+1]=l
        end
        mgConn=RunService.RenderStepped:Connect(function(dt)
            if not mgOn then
                for uSCGtGib=1,#mgLines do mgLines[uSCGtGib].Visible=false mgShadows[uSCGtGib].Visible=false end
                if mgCurrent then mgCurrent.Visible=false end
                return
            end
            local raw=mgSpeed()
            mgSmooth=mgSmooth+(raw-mgSmooth)*(1-math.exp(-dt*18))
            mgAccum=mgAccum+dt
            local now=os.clock()
            if mgAccum>=mgStep then
                mgAccum=mgAccum%mgStep
                mgHist[#mgHist+1]={t=now,v=mgSmooth}
                local cutoff=now-mgSpan
                while #mgHist>2 and mgHist[2].t<cutoff do table.remove(mgHist,1) end
            end
            local vp=Camera.ViewportSize
            local w=math.min(mgWidth,math.max(120,vp.X-48))
            local h=math.min(mgHeight,math.max(36,vp.Y-32))
            local left=math.floor(vp.X*0.5-w*0.5)
            local center=math.clamp(math.floor(vp.Y*0.5+mgOffset),h*0.5+8,vp.Y-h*0.5-8)
            local ref=mgRef()
            local startT=now-mgSpan
            local count=#mgHist
            for uSCGtGib=1,count-1 do
                local a,b=mgHist[uSCGtGib],mgHist[uSCGtGib+1]
                local ap=math.clamp((a.t-startT)/mgSpan,0,1)
                local bp=math.clamp((b.t-startT)/mgSpan,0,1)
                local fade=math.clamp(math.min((ap+bp)*6,(2-ap-bp)*5),0,1)
                local ay=center-(math.clamp(a.v/ref-1,-1,1))*h*0.44
                local by=center-(math.clamp(b.v/ref-1,-1,1))*h*0.44
                local from=Vector2.new(left+ap*w,ay)
                local to=Vector2.new(left+bp*w,by)
                if mgLines[uSCGtGib] then
                    mgLines[uSCGtGib].From=from
                    mgLines[uSCGtGib].To=to
                    mgLines[uSCGtGib].Transparency=fade
                    mgLines[uSCGtGib].Visible=fade>0.02
                    mgLines[uSCGtGib].Color=mgCol
                    mgShadows[uSCGtGib].From=from
                    mgShadows[uSCGtGib].To=to
                    mgShadows[uSCGtGib].Transparency=fade*0.42
                    mgShadows[uSCGtGib].Visible=fade>0.02
                end
            end
            for uSCGtGib=count,#mgLines do
                mgLines[uSCGtGib].Visible=false
                mgShadows[uSCGtGib].Visible=false
            end
            if not mgCurrent then
                mgCurrent=Drawing.new(loadstring(base64decode("VGV4dA=="))())
                mgCurrent.Center=false
                mgCurrent.Outline=true
                mgCurrent.Size=12
            end
            mgCurrent.Text=tostring(math.floor(mgSmooth+0.5))
            mgCurrent.Position=Vector2.new(left+w+5,center-7)
            mgCurrent.Color=mgCol
            mgCurrent.Visible=true
        end)
    end
    addOpt(lvSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("TW92R3JhcGhPbg=="))(), {Title=loadstring(base64decode("0JPRgNCw0YTQuNC6INGB0LrQvtGA0L7RgdGC0Lg="))(), Default=false}, function(v)
        mgOn=v
        if v then mgStart() else mgClear() end
    end)
    addOpt(lvSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("TW92R3JhcGhDb2w="))(), {Title=loadstring(base64decode("0KbQstC10YI="))(), Default=Color3.fromRGB(242,242,242)}, function(c)
        mgCol=c
        for uSCGtGib=1,#mgLines do mgLines[uSCGtGib].Color=c end
    end)
    addOpt(lvSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("TW92R3JhcGhX"))(), {Title=loadstring(base64decode("0KjQuNGA0LjQvdCw"))(), Min=180, Max=420, Default=280, Rounding=0}, function(v) mgWidth=tonumber(v) or 280 end)
    addOpt(lvSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("TW92R3JhcGhI"))(), {Title=loadstring(base64decode("0JLRi9GB0L7RgtCw"))(), Min=40, Max=120, Default=72, Rounding=0}, function(v) mgHeight=tonumber(v) or 72 end)
    addOpt(lvSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("TW92R3JhcGhZ"))(), {Title=loadstring(base64decode("0KHQvNC10YnQtdC90LjQtSBZ"))(), Min=-200, Max=400, Default=180, Rounding=0}, function(v) mgOffset=tonumber(v) or 180 end)

    local chOn2,chCol2=false,Color3.new(1,1,1)
    local chLines={}
    for uSCGtGib=1,4 do
        local l=Drawing.new(loadstring(base64decode("TGluZQ=="))())
        l.Thickness=2
        l.Color=chCol2
        l.Visible=false
        chLines[uSCGtGib]=l
    end
    RunService.RenderStepped:Connect(function()
        if not chOn2 then
            for uSCGtGib=1,#chLines do chLines[uSCGtGib].Visible=false end
            return
        end
        local mp=UserInputService:GetMouseLocation()
        local gap,len=4,8
        local cx,cy=mp.X,mp.Y
        local arr={
            {cx,cy-gap,cx,cy-gap-len},
            {cx,cy+gap,cx,cy+gap+len},
            {cx-gap,cy,cx-gap-len,cy},
            {cx+gap,cy,cx+gap+len,cy},
        }
        for uSCGtGib=1,4 do
            local a=arr[uSCGtGib]
            chLines[uSCGtGib].From=Vector2.new(a[1],a[2])
            chLines[uSCGtGib].To=Vector2.new(a[3],a[4])
            chLines[uSCGtGib].Color=chCol2
            chLines[uSCGtGib].Visible=true
        end
    end)
    addOpt(lvSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("Q3Jvc3NoYWlyT24="))(), {Title=loadstring(base64decode("0J/RgNC40YbQtdC7"))(), Default=false}, function(v)
        chOn2=v
        pcall(function() UserInputService.MouseIconEnabled=not v end)
    end)
    addOpt(lvSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("Q3Jvc3NoYWlyQ29s"))(), {Title=loadstring(base64decode("0KbQstC10YI="))(), Default=Color3.new(1,1,1)}, function(c) chCol2=c end)

    local scOn,scType,scCol=false,loadstring(base64decode("Rm9yY2VGaWVsZA=="))(),Color3.fromRGB(0,200,255)
    local scCache={}
    local scConn=nil
    local function scRestore()
        if scConn then pcall(function() scConn:Disconnect() end) scConn=nil end
        for part,d in pairs(scCache) do
            if part and part.Parent then
                pcall(function() part.Material=d[1] end)
                pcall(function() part.Color=d[2] end)
            end
        end
        scCache={}
    end
    local function scApply()
        local c=LocalPlayer.Character
        if not c then return end
        for _,p in ipairs(c:GetDescendants()) do
            if p:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) and p.Name~=loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))() then
                if not scCache[p] then scCache[p]={p.Material,p.Color} end
                if scType==loadstring(base64decode("Rm9yY2VGaWVsZA=="))() then
                    pcall(function() p.Material=Enum.Material.ForceField end)
                    pcall(function() p.Color=scCol end)
                elseif scType==loadstring(base64decode("RmxhdA=="))() then
                    pcall(function() p.Material=Enum.Material.SmoothPlastic end)
                    pcall(function() p.Color=scCol end)
                elseif scType==loadstring(base64decode("Q2hyb21hdGlj"))() then
                    pcall(function() p.Material=Enum.Material.Foil end)
                    pcall(function() p.Color=scCol end)
                end
            end
        end
    end
    addOpt(lvSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("U2VsZkNoYW1zT24="))(), {Title=loadstring(base64decode("0KfQsNC80YHRiyDQvdCwINGB0LXQsdC1"))(), Default=false}, function(v)
        scOn=v
        if v then
            if not scConn then scConn=RunService.Heartbeat:Connect(function() if scOn then scApply() end end) end
        else scRestore() end
    end)
    addOpt(lvSec, loadstring(base64decode("QWRkRHJvcGRvd24="))(), loadstring(base64decode("U2VsZkNoYW1zVHlwZQ=="))(), {Title=loadstring(base64decode("0J/RgNC10YHQtdGC"))(), Values={loadstring(base64decode("Rm9yY2VGaWVsZA=="))(),loadstring(base64decode("RmxhdA=="))(),loadstring(base64decode("Q2hyb21hdGlj"))()}, Default=loadstring(base64decode("Rm9yY2VGaWVsZA=="))()}, function(v) scType=v end)
    addOpt(lvSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("U2VsZkNoYW1zQ29s"))(), {Title=loadstring(base64decode("0KbQstC10YI="))(), Default=Color3.fromRGB(0,200,255)}, function(c) scCol=c end)

    local tcOn,tcType,tcCol=false,loadstring(base64decode("Rm9yY2VGaWVsZA=="))(),Color3.fromRGB(255,200,0)
    local tcCache={}
    local tcConn=nil
    local function tcRestore()
        if tcConn then pcall(function() tcConn:Disconnect() end) tcConn=nil end
        for part,d in pairs(tcCache) do
            if part and part.Parent then
                pcall(function() part.Material=d[1] end)
                pcall(function() part.Color=d[2] end)
            end
        end
        tcCache={}
    end
    local function tcApply()
        local c=LocalPlayer.Character
        if not c then return end
        for _,t in ipairs(c:GetChildren()) do
            if t:IsA(loadstring(base64decode("VG9vbA=="))()) then
                for _,p in ipairs(t:GetDescendants()) do
                    if p:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
                        if not tcCache[p] then tcCache[p]={p.Material,p.Color} end
                        if tcType==loadstring(base64decode("Rm9yY2VGaWVsZA=="))() then
                            pcall(function() p.Material=Enum.Material.ForceField end)
                            pcall(function() p.Color=tcCol end)
                        elseif tcType==loadstring(base64decode("RmxhdA=="))() then
                            pcall(function() p.Material=Enum.Material.SmoothPlastic end)
                            pcall(function() p.Color=tcCol end)
                        elseif tcType==loadstring(base64decode("Q2hyb21hdGlj"))() then
                            pcall(function() p.Material=Enum.Material.Foil end)
                            pcall(function() p.Color=tcCol end)
                        end
                    end
                end
            end
        end
    end
    addOpt(lvSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("VG9vbENoYW1zT24="))(), {Title=loadstring(base64decode("0KfQsNC80YHRiyDQvtGA0YPQttC40Y8="))(), Default=false}, function(v)
        tcOn=v
        if v then
            if not tcConn then tcConn=RunService.Heartbeat:Connect(function() if tcOn then tcApply() end end) end
        else tcRestore() end
    end)
    addOpt(lvSec, loadstring(base64decode("QWRkRHJvcGRvd24="))(), loadstring(base64decode("VG9vbENoYW1zVHlwZQ=="))(), {Title=loadstring(base64decode("0J/RgNC10YHQtdGC"))(), Values={loadstring(base64decode("Rm9yY2VGaWVsZA=="))(),loadstring(base64decode("RmxhdA=="))(),loadstring(base64decode("Q2hyb21hdGlj"))()}, Default=loadstring(base64decode("Rm9yY2VGaWVsZA=="))()}, function(v) tcType=v end)
    addOpt(lvSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("VG9vbENoYW1zQ29s"))(), {Title=loadstring(base64decode("0KbQstC10YI="))(), Default=Color3.fromRGB(255,200,0)}, function(c) tcCol=c end)

    LocalPlayer.CharacterAdded:Connect(function()
        task.wait(1)
        if scOn then scRestore() scApply() end
    end)
end

-- ============================================================
-- ЭФФЕКТЫ
-- ============================================================
do
    local tE=Tabs.Effects
    local tracerSec=tE:AddSection({Name=loadstring(base64decode("0KLRgNCw0YHRgdC10YAg0L/Rg9C70Lg="))()})
    local tracerOn,tracerCol,tracerDur=false,Color3.fromRGB(133,220,255),1
    local tracerTrackBullet=true
    local function makePoint(pos,life)
        local pt=Instance.new(loadstring(base64decode("UGFydA=="))())
        pt.Transparency=1
        pt.Anchored=true
        pt.CanCollide=false
        pt.CanQuery=false
        pt.Size=Vector3.new(1,1,1)
        pt.CFrame=CFrame.new(pos)
        Instance.new(loadstring(base64decode("QXR0YWNobWVudA=="))(),pt)
        pt.Parent=Workspace
        Debris:AddItem(pt,life)
        return pt
    end
    local function toPos(v)
        if typeof(v)==loadstring(base64decode("VmVjdG9yMw=="))() then return v end
        if typeof(v)==loadstring(base64decode("Q0ZyYW1l"))() then return v.Position end
        if typeof(v)==loadstring(base64decode("SW5zdGFuY2U="))() then
            if v:IsA(loadstring(base64decode("QXR0YWNobWVudA=="))()) then return v.WorldPosition end
            if v:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then return v.Position end
        end
    end
    local function createTracer(sv,ev)
        local sp,ep=toPos(sv),toPos(ev)
        if not sp or not ep then return end
        local p1=makePoint(sp,tracerDur+0.5)
        local p2=makePoint(ep,tracerDur+0.5)
        local beam=Instance.new(loadstring(base64decode("QmVhbQ=="))())
        beam.FaceCamera=true
        beam.TextureSpeed=1.5
        beam.TextureLength=2
        beam.Width0=0.25
        beam.Width1=0.25
        beam.LightEmission=3
        beam.LightInfluence=0
        beam.Brightness=2.5
        beam.Texture=loadstring(base64decode("cmJ4YXNzZXRpZDovLzEyNzgxODAwNjY4"))()
        beam.Color=ColorSequence.new(tracerCol)
        beam.Transparency=NumberSequence.new(0.1)
        beam.Attachment0=p1:FindFirstChildOfClass(loadstring(base64decode("QXR0YWNobWVudA=="))())
        beam.Attachment1=p2:FindFirstChildOfClass(loadstring(base64decode("QXR0YWNobWVudA=="))())
        beam.Parent=p1
        task.delay(tracerDur,function()
            if beam.Parent then
                TweenService:Create(beam,TweenInfo.new(0.2),{Width0=0,Width1=0}):Play()
            end
        end)
    end
    local function createGunTracer()
        local c=LocalPlayer.Character
        if not c then return end
        local hrp=c:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
        if not hrp then return end
        local att=hrp:FindFirstChild(loadstring(base64decode("R3VuUmF5Y2FzdEF0dGFjaG1lbnQ="))())
        local origin=att and att.WorldPosition or hrp.Position
        local dir=Camera.CFrame.LookVector*8
        local p1=makePoint(origin,tracerDur+0.5)
        local p2=makePoint(origin+dir,tracerDur+0.5)
        local beam=Instance.new(loadstring(base64decode("QmVhbQ=="))())
        beam.FaceCamera=true
        beam.TextureSpeed=1.5
        beam.TextureLength=2
        beam.Width0=0.2
        beam.Width1=0.2
        beam.LightEmission=3
        beam.LightInfluence=0
        beam.Brightness=2.5
        beam.Texture=loadstring(base64decode("cmJ4YXNzZXRpZDovLzEyNzgxODAwNjY4"))()
        beam.Color=ColorSequence.new(tracerCol)
        beam.Transparency=NumberSequence.new(0.1)
        beam.Attachment0=p1:FindFirstChildOfClass(loadstring(base64decode("QXR0YWNobWVudA=="))())
        beam.Attachment1=p2:FindFirstChildOfClass(loadstring(base64decode("QXR0YWNobWVudA=="))())
        beam.Parent=p1
        task.delay(tracerDur,function()
            if beam.Parent then
                TweenService:Create(beam,TweenInfo.new(0.2),{Width0=0,Width1=0}):Play()
            end
        end)
    end
    local tracerConn
    local function connectTracer()
        if tracerConn then return end
        local ok,remote=pcall(function() return ReplicatedStorage:WaitForChild(loadstring(base64decode("Q2xpZW50U2VydmljZXM="))()):WaitForChild(loadstring(base64decode("V2VhcG9uU2VydmljZQ=="))()):WaitForChild(loadstring(base64decode("R3VuRmlyZWQ="))()) end)
        if not ok or not remote then return end
        tracerConn=remote.OnClientEvent:Connect(function(gun,sv,ev)
            if not tracerOn then return end
            local c=LocalPlayer.Character
            if not c then return end
            if not (typeof(gun)==loadstring(base64decode("SW5zdGFuY2U="))() and gun:IsDescendantOf(c)) then return end
            if tracerTrackBullet then createTracer(sv,ev)
            else createGunTracer() end
        end)
    end
    addOpt(tracerSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("VHJhY2VyT24="))(), {Title=loadstring(base64decode("0JLQutC70Y7Rh9C40YLRjCDRgtGA0LDRgdGB0LXRgA=="))(), Default=false}, function(v)
        tracerOn=v
        if v then connectTracer() end
    end)
    addOpt(tracerSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("VHJhY2VyVHJhY2tCdWxsZXQ="))(), {Title=loadstring(base64decode("0J7RgtGB0LvQtdC20LjQstCw0L3QuNC1INC/0YPQu9GM"))(), Default=true}, function(v) tracerTrackBullet=v end)
    addOpt(tracerSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("VHJhY2VyQ29s"))(), {Title=loadstring(base64decode("0KbQstC10YI="))(), Default=Color3.fromRGB(133,220,255)}, function(c) tracerCol=c end)
    addOpt(tracerSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("VHJhY2VyRHVy"))(), {Title=loadstring(base64decode("0JTQu9C40YLQtdC70YzQvdC+0YHRgtGM"))(), Min=0.1, Max=5, Default=1, Rounding=1}, function(v) tracerDur=tonumber(v) or 1 end)

    local fxSec=tE:AddSection({Name=loadstring(base64decode("0K3RhNGE0LXQutGC0Ysg0LzQuNGA0LA="))()})
    local fxOn,fxType,fxCol,fxRate=false,loadstring(base64decode("U25vdw=="))(),Color3.fromRGB(150,200,255),250
    local fxPart,fxEmit,fxConn=nil,nil,nil
    local function styleFX()
        local e=fxEmit
        if not e then return end
        e.Texture=loadstring(base64decode("cmJ4YXNzZXQ6Ly90ZXh0dXJlcy9wYXJ0aWNsZXMvc21va2VfbWFpbi5kZHM="))()
        e.LightInfluence=0
        e.LightEmission=0.4
        e.EmissionDirection=Enum.NormalId.Bottom
        e.Rate=fxRate
        e.Color=ColorSequence.new(fxCol)
        if fxType==loadstring(base64decode("U25vdw=="))() then
            e.Lifetime=NumberRange.new(4,6)
            e.Speed=NumberRange.new(6,12)
            e.Acceleration=Vector3.new(2,-6,1)
            e.SpreadAngle=Vector2.new(35,35)
            e.Rotation=NumberRange.new(0,360)
            e.RotSpeed=NumberRange.new(-40,40)
            e.Size=NumberSequence.new(0.55)
            e.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0.2),NumberSequenceKeypoint.new(0.8,0.3),NumberSequenceKeypoint.new(1,1)})
        else
            e.Lifetime=NumberRange.new(5,7)
            e.Speed=NumberRange.new(5,10)
            e.Acceleration=Vector3.new(4,-5,2)
            e.SpreadAngle=Vector2.new(40,40)
            e.Rotation=NumberRange.new(0,360)
            e.RotSpeed=NumberRange.new(-80,80)
            e.Size=NumberSequence.new(0.5)
            e.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0.15),NumberSequenceKeypoint.new(0.85,0.25),NumberSequenceKeypoint.new(1,1)})
        end
    end
    local function stopFX()
        if fxConn then pcall(function() fxConn:Disconnect() end) fxConn=nil end
        if fxPart then pcall(function() fxPart:Destroy() end) fxPart=nil end
        fxEmit=nil
    end
    local function startFX()
        stopFX()
        fxPart=Instance.new(loadstring(base64decode("UGFydA=="))())
        fxPart.Name=loadstring(base64decode("RkhfV09STERfRlg="))()
        fxPart.Anchored=true
        fxPart.CanCollide=false
        fxPart.CanQuery=false
        fxPart.CanTouch=false
        fxPart.Transparency=1
        fxPart.Size=Vector3.new(260,140,260)
        fxPart.Parent=Workspace
        fxEmit=Instance.new(loadstring(base64decode("UGFydGljbGVFbWl0dGVy"))())
        pcall(function() fxEmit.Shape=Enum.ParticleEmitterShape.Box fxEmit.ShapeStyle=Enum.ParticleEmitterShapeStyle.Volume end)
        fxEmit.Parent=fxPart
        styleFX()
        fxConn=RunService.RenderStepped:Connect(function()
            local cam=Workspace.CurrentCamera
            if not cam then return end
            local cf=cam.CFrame
            local d=cf.LookVector
            local flat=Vector3.new(d.X,0,d.Z)
            if flat.Magnitude<0.05 then flat=Vector3.new(0,0,-1) else flat=flat.Unit end
            fxPart.CFrame=CFrame.new(cf.Position+flat*57+Vector3.new(0,44,0))
        end)
    end
    addOpt(fxSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("RlhPbg=="))(), {Title=loadstring(base64decode("0JLQutC70Y7Rh9C40YLRjCDRjdGE0YTQtdC60YLRiw=="))(), Default=false}, function(v)
        fxOn=v
        if v then startFX() else stopFX() end
    end)
    addOpt(fxSec, loadstring(base64decode("QWRkRHJvcGRvd24="))(), loadstring(base64decode("RlhUeXBl"))(), {Title=loadstring(base64decode("0KLQuNC/"))(), Values={loadstring(base64decode("0KHQvdC10LM="))(),loadstring(base64decode("0KHQsNC60YPRgNCw"))()}, Default=loadstring(base64decode("0KHQvdC10LM="))()}, function(v)
        fxType=(v==loadstring(base64decode("0KHQsNC60YPRgNCw"))()) and loadstring(base64decode("U2FrdXJh"))() or loadstring(base64decode("U25vdw=="))()
        if fxOn then styleFX() end
    end)
    addOpt(fxSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("RlhDb2w="))(), {Title=loadstring(base64decode("0KbQstC10YI="))(), Default=Color3.fromRGB(150,200,255)}, function(c)
        fxCol=c
        if fxEmit then fxEmit.Color=ColorSequence.new(c) end
    end)
    addOpt(fxSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("RlhSYXRl"))(), {Title=loadstring(base64decode("0JjQvdGC0LXQvdGB0LjQstC90L7RgdGC0Yw="))(), Min=20, Max=900, Default=250, Rounding=1}, function(v)
        fxRate=tonumber(v) or 250
        if fxEmit then styleFX() end
    end)

    local wSec=tE:AddSection({Name=loadstring(base64decode("0JzQuNGA"))()})
    local orig={
        Amb=Lighting.Ambient,Br=Lighting.Brightness,CT=Lighting.ClockTime,
        CSB=Lighting.ColorShift_Bottom,CST=Lighting.ColorShift_Top,
        Exp=Lighting.ExposureCompensation,
        FC=Lighting.FogColor,FS=Lighting.FogStart,FE=Lighting.FogEnd,
        OA=Lighting.OutdoorAmbient,GS=Lighting.GlobalShadows,
    }
    addOpt(wSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("RkJPbg=="))(), {Title=loadstring(base64decode("RnVsbGJyaWdodA=="))(), Default=false}, function(v)
        if v then
            Lighting.Brightness=2
            Lighting.ClockTime=14
            Lighting.GlobalShadows=false
            Lighting.OutdoorAmbient=Color3.fromRGB(128,128,128)
            Lighting.FogEnd=100000
        else
            Lighting.Brightness=orig.Br
            Lighting.ClockTime=orig.CT
            Lighting.GlobalShadows=orig.GS
            Lighting.OutdoorAmbient=orig.OA
            Lighting.FogEnd=orig.FE
        end
    end)
    local timeOn,timeVal=false,12
    addOpt(wSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("VGltZU9u"))(), {Title=loadstring(base64decode("0KHQstC+0ZEg0LLRgNC10LzRjw=="))(), Default=false}, function(v)
        timeOn=v
        Lighting.ClockTime=v and timeVal or orig.CT
    end)
    addOpt(wSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("VGltZVZhbA=="))(), {Title=loadstring(base64decode("0KfQsNGB"))(), Min=0, Max=24, Default=12, Rounding=0}, function(v)
        timeVal=tonumber(v) or 12
        if timeOn then Lighting.ClockTime=timeVal end
    end)
    local expOn,expVal=false,0
    addOpt(wSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("RXhwT24="))(), {Title=loadstring(base64decode("0K3QutGB0L/QvtC30LjRhtC40Y8="))(), Default=false}, function(v)
        expOn=v
        Lighting.ExposureCompensation=v and expVal or orig.Exp
    end)
    addOpt(wSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("RXhwVmFs"))(), {Title=loadstring(base64decode("0JfQvdCw0YfQtdC90LjQtQ=="))(), Min=-5, Max=5, Default=0, Rounding=2}, function(v)
        expVal=tonumber(v) or 0
        if expOn then Lighting.ExposureCompensation=expVal end
    end)
    local fogOn,fogCol,fogStart,fogEnd=false,Color3.fromRGB(192,192,192),0,1000
    addOpt(wSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("Rm9nT24="))(), {Title=loadstring(base64decode("0KHQstC+0Lkg0YLRg9C80LDQvQ=="))(), Default=false}, function(v)
        fogOn=v
        if v then
            Lighting.FogColor=fogCol
            Lighting.FogStart=fogStart
            Lighting.FogEnd=fogEnd
        else
            Lighting.FogColor=orig.FC
            Lighting.FogStart=orig.FS
            Lighting.FogEnd=orig.FE
        end
    end)
    addOpt(wSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("Rm9nQ29s"))(), {Title=loadstring(base64decode("0KbQstC10YIg0YLRg9C80LDQvdCw"))(), Default=Color3.fromRGB(192,192,192)}, function(c)
        fogCol=c
        if fogOn then Lighting.FogColor=c end
    end)
    addOpt(wSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("Rm9nU3RhcnQ="))(), {Title=loadstring(base64decode("0J3QsNGH0LDQu9C+"))(), Min=0, Max=1000, Default=0, Rounding=0}, function(v)
        fogStart=tonumber(v) or 0
        if fogOn then Lighting.FogStart=fogStart end
    end)
    addOpt(wSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("Rm9nRW5k"))(), {Title=loadstring(base64decode("0JrQvtC90LXRhg=="))(), Min=0, Max=1000, Default=1000, Rounding=0}, function(v)
        fogEnd=tonumber(v) or 1000
        if fogOn then Lighting.FogEnd=fogEnd end
    end)
    local ambOn,ambCol=false,Color3.fromRGB(128,128,128)
    addOpt(wSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("QW1iT24="))(), {Title=loadstring(base64decode("0KHQstC+0LkgYW1iaWVudA=="))(), Default=false}, function(v)
        ambOn=v
        if v then
            Lighting.Ambient=ambCol
            Lighting.OutdoorAmbient=ambCol
        else
            Lighting.Ambient=orig.Amb
            Lighting.OutdoorAmbient=orig.OA
        end
    end)
    addOpt(wSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("QW1iQ29s"))(), {Title=loadstring(base64decode("0KbQstC10YIgYW1iaWVudA=="))(), Default=Color3.fromRGB(128,128,128)}, function(c)
        ambCol=c
        if ambOn then Lighting.Ambient=c Lighting.OutdoorAmbient=c end
    end)
    local skyOn,skyName=false,loadstring(base64decode("SnVuZ2xl"))()
    local createdSky,origSky,origSkyParent=nil,nil,nil
    local skyboxes={
        [loadstring(base64decode("SnVuZ2xl"))()]={SkyboxBk=loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0yMTQzOTk4OTE="))(),SkyboxDn=loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0yMTQzOTk4ODc="))(),SkyboxFt=loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0yMTQzOTk4OTQ="))(),SkyboxLf=loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0yMTQ0MDU2Njg="))(),SkyboxRt=loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0yMTQzOTk4OTk="))(),SkyboxUp=loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0yMTQzOTk4ODk="))()},
        [loadstring(base64decode("Qmxvc3NvbQ=="))()]={SkyboxBk=loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0yNzEwNDI1MTY="))(),SkyboxDn=loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0yNzEwNzcyNDM="))(),SkyboxFt=loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0yNzEwNDI1NTY="))(),SkyboxLf=loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0yNzEwNDIzMTA="))(),SkyboxRt=loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0yNzEwNDI0Njc="))(),SkyboxUp=loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0yNzEwNzc5NTg="))()},
        [loadstring(base64decode("UmVkIG5pZ2h0"))()]={SkyboxBk=loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL0Fzc2V0Lz9JRD00MDE2NjQ4Mzk="))(),SkyboxDn=loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL0Fzc2V0Lz9JRD00MDE2NjQ4NjI="))(),SkyboxFt=loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL0Fzc2V0Lz9JRD00MDE2NjQ5NjA="))(),SkyboxLf=loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL0Fzc2V0Lz9JRD00MDE2NjQ4ODE="))(),SkyboxRt=loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL0Fzc2V0Lz9JRD00MDE2NjQ5MDE="))(),SkyboxUp=loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL0Fzc2V0Lz9JRD00MDE2NjQ5MzY="))()},
        [loadstring(base64decode("UHVycGxl"))()]={SkyboxBk=loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0xMzY5NDk1Mjg2Nw=="))(),SkyboxDn=loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0xMzY5NDk2ODMyNQ=="))(),SkyboxFt=loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0xMzY5NDk4MDY1NA=="))(),SkyboxLf=loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0xMzY5NDk5ODExMw=="))(),SkyboxRt=loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0xMzY5NTAwMjcwMA=="))(),SkyboxUp=loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0xMzY5NTAwNzEwMw=="))()},
        [loadstring(base64decode("Rm9nZ3k="))()]={SkyboxBk=loadstring(base64decode("cmJ4YXNzZXRpZDovLzEzNzA3MTcyNDQ="))(),SkyboxDn=loadstring(base64decode("cmJ4YXNzZXRpZDovLzEzNzA3MTczMzY="))(),SkyboxFt=loadstring(base64decode("cmJ4YXNzZXRpZDovLzEzNzA3MTc0Mzg="))(),SkyboxLf=loadstring(base64decode("cmJ4YXNzZXRpZDovLzEzNzA3MTc1Njc="))(),SkyboxRt=loadstring(base64decode("cmJ4YXNzZXRpZDovLzEzNzA3MTc2OTg="))(),SkyboxUp=loadstring(base64decode("cmJ4YXNzZXRpZDovLzEzNzA3MTc3ODI="))()},
    }
    local skyAssets={Galaxy=15983996673,Anime=13107361022,Minecraft=2758029221}
    local function clearSky()
        if createdSky then pcall(function() createdSky:Destroy() end) createdSky=nil end
    end
    local function applySky(name)
        if not origSky then
            local existing=Lighting:FindFirstChildOfClass(loadstring(base64decode("U2t5"))())
            if existing and existing~=createdSky then
                origSky=existing
                origSkyParent=existing.Parent
                pcall(function() existing.Parent=nil end)
            end
        end
        clearSky()
        if skyboxes[name] then
            local sky=Instance.new(loadstring(base64decode("U2t5"))())
            sky.Name=loadstring(base64decode("RkhfQ3VzdG9tU2t5"))()
            for k,v in pairs(skyboxes[name]) do pcall(function() sky[k]=v end) end
            sky.Parent=Lighting
            createdSky=sky
        elseif skyAssets[name] then
            task.spawn(function()
                local ok,objs=pcall(game.GetObjects,game,loadstring(base64decode("cmJ4YXNzZXRpZDovLw=="))()..skyAssets[name])
                if not ok or type(objs)~=loadstring(base64decode("dGFibGU="))() then return end
                local found
                for _,o in ipairs(objs) do
                    if o:IsA(loadstring(base64decode("U2t5"))()) then found=o break end
                    local s=o:FindFirstChildWhichIsA(loadstring(base64decode("U2t5"))(),true)
                    if s then found=s break end
                end
                if not found or not skyOn then return end
                clearSky()
                found.Name=loadstring(base64decode("RkhfQ3VzdG9tU2t5"))()
                found.Parent=Lighting
                createdSky=found
            end)
        end
    end
    local function restoreSky()
        clearSky()
        if origSky then
            pcall(function() origSky.Parent=origSkyParent or Lighting end)
            origSky,origSkyParent=nil,nil
        end
    end
    addOpt(wSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("U2t5T24="))(), {Title=loadstring(base64decode("0J3QtdCx0L4="))(), Default=false}, function(v)
        skyOn=v
        if v then applySky(skyName) else restoreSky() end
    end)
    addOpt(wSec, loadstring(base64decode("QWRkRHJvcGRvd24="))(), loadstring(base64decode("U2t5TmFtZQ=="))(), {Title=loadstring(base64decode("0J/RgNC10YHQtdGC"))(), Values={loadstring(base64decode("SnVuZ2xl"))(),loadstring(base64decode("Qmxvc3NvbQ=="))(),loadstring(base64decode("UmVkIG5pZ2h0"))(),loadstring(base64decode("UHVycGxl"))(),loadstring(base64decode("Rm9nZ3k="))(),loadstring(base64decode("R2FsYXh5"))(),loadstring(base64decode("QW5pbWU="))(),loadstring(base64decode("TWluZWNyYWZ0"))()}, Default=loadstring(base64decode("SnVuZ2xl"))()}, function(v)
        skyName=v
        if skyOn then applySky(v) end
    end)
    getgenv().EFFECTS_UNLOAD=function()
        tracerOn=false
        if tracerConn then pcall(function() tracerConn:Disconnect() end) end
        stopFX()
        restoreSky()
        Lighting.Ambient=orig.Amb
        Lighting.Brightness=orig.Br
        Lighting.ClockTime=orig.CT
        Lighting.ColorShift_Bottom=orig.CSB
        Lighting.ColorShift_Top=orig.CST
        Lighting.ExposureCompensation=orig.Exp
        Lighting.FogColor=orig.FC
        Lighting.FogStart=orig.FS
        Lighting.FogEnd=orig.FE
        Lighting.OutdoorAmbient=orig.OA
        Lighting.GlobalShadows=orig.GS
    end
end

-- ============================================================
-- ЭФФЕКТ ПРИ СМЕРТИ УБИЙЦЫ
-- ============================================================
do
    local meSec=Tabs.Effects:AddSection({Name=loadstring(base64decode("0KHQvNC10YDRgtGMINGD0LHQuNC50YbRiw=="))()})
    local mOn,mCloneOn,mPartOn,mEmitOn=false,false,false,false
    local mCloneCol=Color3.fromRGB(255,0,0)
    local mPartCol=Color3.fromRGB(255,0,0)
    local mEmitCol=Color3.fromRGB(255,100,100)
    local mCloneDur,mEmitDur=3,1.2
    local mClones,mConns,mRoles={},{},{}
    local mThread,mAddConn=nil,nil
    local mActive={}
    local function removeEmitter(rec)
        for uSCGtGib=1,#mActive do
            if mActive[uSCGtGib]==rec then
                mActive[uSCGtGib]=mActive[#mActive]
                mActive[#mActive]=nil
                break
            end
        end
        if rec.part and rec.part.Parent then rec.part:Destroy() end
    end
    local function spawnEmitter(char,tint,dur,channel)
        if not char or not char.Parent then return end
        if #mActive>=3 then removeEmitter(mActive[1]) end
        dur=math.max(dur,0.2)
        local bodyParts={}
        for _,s in ipairs(char:GetChildren()) do
            if s:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) and s.Name~=loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))() and #bodyParts<15 then bodyParts[#bodyParts+1]=s end
        end
        if #bodyParts==0 then return end
        local root=Instance.new(loadstring(base64decode("Rm9sZGVy"))())
        root.Name=loadstring(base64decode("RkhfTXVyZGVyRlg="))()
        root.Parent=Workspace
        local rec={part=root,balls={},channel=channel}
        mActive[#mActive+1]=rec
        local rnd=srand
        local golden=math.pi*(3-math.sqrt(5))
        local function surfPos(source,radius,index,count,headSeed)
            local sz=source.Size
            local pad=radius*0.92
            if source.Name==loadstring(base64decode("SGVhZA=="))() then
                local KbNcpS8c=1-2*((index-0.5)/count)
                local angle=index*golden+headSeed
                local radial=math.sqrt(math.max(0,1-KbNcpS8c*KbNcpS8c))
                local dir=Vector3.new(radial*math.cos(angle),KbNcpS8c,radial*math.sin(angle))
                local half=sz*0.5
                return source.CFrame:PointToWorldSpace(Vector3.new(dir.X*(half.X+pad),dir.Y*(half.Y+pad),dir.Z*(half.Z+pad)))
            end
            local ax=sz.Y*sz.Z
            local ay=sz.X*sz.Z
            local az=sz.X*sz.Y
            local pick=rnd()*(ax+ay+az)
            local pos
            if pick<ax then
                local side=rnd()<0.5 and -1 or 1
                pos=Vector3.new(side*(sz.X*0.5+pad),(rnd()-0.5)*sz.Y,(rnd()-0.5)*sz.Z)
            elseif pick<ax+ay then
                local side=rnd()<0.5 and -1 or 1
                pos=Vector3.new((rnd()-0.5)*sz.X,side*(sz.Y*0.5+pad),(rnd()-0.5)*sz.Z)
            else
                local side=rnd()<0.5 and -1 or 1
                pos=Vector3.new((rnd()-0.5)*sz.X,(rnd()-0.5)*sz.Y,side*(sz.Z*0.5+pad))
            end
            return source.CFrame:PointToWorldSpace(pos)
        end
        local minY,maxY=math.huge,-math.huge
        for _,s in ipairs(bodyParts) do
            local hy=s.Size.Y*0.5
            minY=math.min(minY,s.Position.Y-hy)
            maxY=math.max(maxY,s.Position.Y+hy)
        end
        local phaseCount=8
        local groups={}
        for uSCGtGib=1,phaseCount do groups[uSCGtGib]={} end
        local headSeed=rnd()*math.pi*2
        local height=math.max(maxY-minY,0.01)
        local created=0
        for _,s in ipairs(bodyParts) do
            local sz=s.Size
            local surface=2*(sz.X*sz.Y+sz.X*sz.Z+sz.Y*sz.Z)
            local count=s.Name==loadstring(base64decode("SGVhZA=="))() and 24 or math.clamp(math.floor(surface*0.65+0.5),7,12)
            count=math.min(count,140-created)
            for index=1,count do
                local dia=s.Name==loadstring(base64decode("SGVhZA=="))() and (0.115+rnd()*0.045) or (0.13+rnd()*0.06)
                local tsz=Vector3.new(dia,dia,dia)
                local pos=surfPos(s,dia*0.5,index,count,headSeed)
                local ball=Instance.new(loadstring(base64decode("UGFydA=="))())
                ball.Shape=Enum.PartType.Ball
                ball.Material=Enum.Material.Neon
                ball.Color=tint
                ball.Size=Vector3.new(0.015,0.015,0.015)
                ball.Position=pos
                ball.Anchored=true
                ball.CanCollide=false
                ball.CanQuery=false
                ball.CanTouch=false
                ball.CastShadow=false
                ball.Massless=true
                ball.Transparency=1
                ball.Parent=root
                rec.balls[#rec.balls+1]=ball
                created=created+1
                local v=math.clamp((pos.Y-minY)/height,0,1)
                local phase=math.clamp(math.floor(v*(phaseCount-1)+1.5)+rnd(-1,1),1,phaseCount)
                groups[phase][#groups[phase]+1]={ball=ball,size=tsz}
            end
            if created>=140 then break end
        end
        local revealWindow=math.min(0.34,dur*0.26)
        local revealTime=math.min(0.2,dur*0.18)
        local fadeBegin=math.max(revealWindow+revealTime+0.06,dur*0.42)
        local fadeWindow=math.min(0.28,dur*0.18)
        local fadeTime=math.max(dur-fadeBegin-fadeWindow,0.1)
        for phase=1,phaseCount do
            local alpha=(phase-1)/(phaseCount-1)
            local group=groups[phase]
            task.delay(revealWindow*alpha,function()
                if not root.Parent then return end
                for _,item in ipairs(group) do
                    if item.ball.Parent then
                        TweenService:Create(item.ball,TweenInfo.new(revealTime,Enum.EasingStyle.Sine),{Size=item.size,Transparency=0.05}):Play()
                    end
                end
            end)
            task.delay(fadeBegin+fadeWindow*alpha,function()
                if not root.Parent then return end
                for _,item in ipairs(group) do
                    if item.ball.Parent then
                        TweenService:Create(item.ball,TweenInfo.new(fadeTime,Enum.EasingStyle.Sine),{Size=item.size*0.58,Transparency=1}):Play()
                    end
                end
            end)
        end
        task.delay(dur+0.12,function() removeEmitter(rec) end)
    end
    local function makeClone(char)
        local ok,clone=pcall(function() return char:Clone() end)
        if not ok or not clone then return end
        for _,d in ipairs(clone:GetDescendants()) do
            if d:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
                d.Anchored=true
                d.CanCollide=false
                d.CanQuery=false
                d.CanTouch=false
                if d.Name==loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))() then d.Transparency=1
                else
                    d.Material=Enum.Material.ForceField
                    d.Color=mCloneCol
                end
            elseif d:IsA(loadstring(base64decode("SHVtYW5vaWQ="))()) or d:IsA(loadstring(base64decode("U2NyaXB0"))()) or d:IsA(loadstring(base64decode("TG9jYWxTY3JpcHQ="))()) or d:IsA(loadstring(base64decode("TW9kdWxlU2NyaXB0"))()) or d:IsA(loadstring(base64decode("U291bmQ="))()) or d:IsA(loadstring(base64decode("U3VyZmFjZUFwcGVhcmFuY2U="))()) or d:IsA(loadstring(base64decode("UGFydGljbGVFbWl0dGVy"))()) or d:IsA(loadstring(base64decode("VHJhaWw="))()) or d:IsA(loadstring(base64decode("QmVhbQ=="))()) or d:IsA(loadstring(base64decode("UG9pbnRMaWdodA=="))()) or d:IsA(loadstring(base64decode("U3BvdExpZ2h0"))()) or d:IsA(loadstring(base64decode("U3VyZmFjZUxpZ2h0"))()) or d:IsA(loadstring(base64decode("SGlnaGxpZ2h0"))()) then
                pcall(function() d:Destroy() end)
            end
        end
        clone.Name=loadstring(base64decode("RkhfTXVyZGVyQ2xvbmU="))()
        clone.Parent=Workspace
        mClones[#mClones+1]=clone
        task.delay(mCloneDur,function()
            if not clone.Parent then return end
            for _,d in ipairs(clone:GetDescendants()) do
                if d:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) and d.Name~=loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))() then
                    TweenService:Create(d,TweenInfo.new(1.5),{Transparency=1}):Play()
                end
            end
            task.delay(1.6,function()
                for uSCGtGib=#mClones,1,-1 do
                    if mClones[uSCGtGib]==clone then table.remove(mClones,uSCGtGib) end
                end
                if clone.Parent then clone:Destroy() end
            end)
        end)
    end
    local function onMurderDeath(char)
        if mCloneOn then makeClone(char) end
        if mPartOn then spawnEmitter(char,mPartCol,1.2,loadstring(base64decode("cGFydGljbGU="))()) end
        if mEmitOn then spawnEmitter(char,mEmitCol,mEmitDur,loadstring(base64decode("ZW1pdHRlcg=="))()) end
    end
    local function hookPlayer(pl)
        local function onChar(char)
            local hum=char:WaitForChild(loadstring(base64decode("SHVtYW5vaWQ="))(),5)
            if not hum then return end
            mConns[#mConns+1]=hum.Died:Connect(function()
                if mOn and mRoles[pl.Name]==loadstring(base64decode("TXVyZGVyZXI="))() then onMurderDeath(char) end
            end)
        end
        if pl.Character then task.spawn(onChar,pl.Character) end
        mConns[#mConns+1]=pl.CharacterAdded:Connect(onChar)
    end
    local function stopMurder()
        for _,c in ipairs(mConns) do pcall(function() c:Disconnect() end) end
        mConns={}
        for uSCGtGib=1,#mActive do
            local p=mActive[uSCGtGib]
            if p then pcall(function() p.part:Destroy() end) end
        end
        mActive={}
        if mAddConn then pcall(function() mAddConn:Disconnect() end) mAddConn=nil end
        for _,c in ipairs(mClones) do pcall(function() c:Destroy() end) end
        mClones={}
    end
    addOpt(meSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("TUVPbg=="))(), {Title=loadstring(base64decode("0JLQutC70Y7Rh9C40YLRjCDRjdGE0YTQtdC60YI="))(), Default=false}, function(v)
        mOn=v
        if v then
            mThread=task.spawn(function()
                while mOn do
                    pcall(function()
                        local data=getRoundData()
                        if type(data)==loadstring(base64decode("dGFibGU="))() then
                            local m={}
                            for name,d in pairs(data) do
                                if type(d)==loadstring(base64decode("dGFibGU="))() and d.Role then m[name]=d.Role end
                            end
                            mRoles=m
                        end
                    end)
                    task.wait(1)
                end
            end)
            for _,pl in ipairs(Players:GetPlayers()) do
                if pl~=LocalPlayer then hookPlayer(pl) end
            end
            mAddConn=Players.PlayerAdded:Connect(function(pl)
                if pl~=LocalPlayer then hookPlayer(pl) end
            end)
        else
            stopMurder()
            if mThread then pcall(function() task.cancel(mThread) end) mThread=nil end
        end
    end)
    addOpt(meSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("TUVDbG9uZQ=="))(), {Title=loadstring(base64decode("0JrQu9C+0L0="))(), Default=false}, function(v) mCloneOn=v end)
    addOpt(meSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("TUVDbG9uZUNvbA=="))(), {Title=loadstring(base64decode("0KbQstC10YIg0LrQu9C+0L3QsA=="))(), Default=Color3.fromRGB(255,0,0)}, function(c) mCloneCol=c end)
    addOpt(meSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("TUVDbG9uZUR1cg=="))(), {Title=loadstring(base64decode("0JTQu9C40YLQtdC70YzQvdC+0YHRgtGMINC60LvQvtC90LA="))(), Min=1, Max=5, Default=3, Rounding=1}, function(v) mCloneDur=tonumber(v) or 3 end)
    addOpt(meSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("TUVQYXJ0"))(), {Title=loadstring(base64decode("0KfQsNGB0YLQuNGG0Ys="))(), Default=false}, function(v) mPartOn=v end)
    addOpt(meSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("TUVQYXJ0Q29s"))(), {Title=loadstring(base64decode("0KbQstC10YIg0YfQsNGB0YLQuNGG"))(), Default=Color3.fromRGB(255,0,0)}, function(c) mPartCol=c end)
    addOpt(meSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("TUVFbWl0"))(), {Title=loadstring(base64decode("RW1pdHRlcg=="))(), Default=false}, function(v) mEmitOn=v end)
    addOpt(meSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("TUVFbWl0Q29s"))(), {Title=loadstring(base64decode("0KbQstC10YIgZW1pdHRlcg=="))(), Default=Color3.fromRGB(255,100,100)}, function(c)
        mEmitCol=c
        for uSCGtGib=1,#mActive do
            local e=mActive[uSCGtGib]
            if e and e.channel==loadstring(base64decode("ZW1pdHRlcg=="))() then
                for _,b in ipairs(e.balls) do
                    if b.Parent then b.Color=c end
                end
            end
        end
    end)
    addOpt(meSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("TUVFbWl0RHVy"))(), {Title=loadstring(base64decode("0JTQu9C40YLQtdC70YzQvdC+0YHRgtGMIGVtaXR0ZXI="))(), Min=1, Max=5, Default=1, Rounding=1}, function(v) mEmitDur=tonumber(v) or 1 end)
    getgenv().MURDER_UNLOAD=function()
        mOn=false
        stopMurder()
        if mThread then pcall(function() task.cancel(mThread) end) mThread=nil end
    end
end

-- ============================================================
-- ФАРМ
-- ============================================================
do
    local tF=Tabs.Farm
    local farmSec=tF:AddSection({Name=loadstring(base64decode("0JDQstGC0L7RhNCw0YDQvA=="))()})
    local active=false
    local mode=loadstring(base64decode("QmFzaWM="))()
    local speed=23
    local avoid=false
    local fullAction=loadstring(base64decode("UmVzcGF3bg=="))()
    local ncCache={}
    local farmTarget=nil
    local coinsDone,sawCoins=false,false
    local wasDown,downRefY=false,nil
    local lastTouch=0
    local DOWN_DEPTH,DOWN_RISE_XZ,AVOID_DIST,RISE_SAFE_DIST=14,4,40,20
    local function hrp()
        local c=LocalPlayer.Character
        return c and c:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
    end
    local function canFarm()
        local char=LocalPlayer.Character
        local h=char and char:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
        if not h or h.Health<=0 then return false end
        local d=getRoundData()
        if type(d)==loadstring(base64decode("dGFibGU="))() then
            local me=d[LocalPlayer.Name]
            if not me or not me.Role or me.Dead then return false end
        end
        return true
    end
    local function bagsFull()
        local pg=LocalPlayer:FindFirstChild(loadstring(base64decode("UGxheWVyR3Vp"))())
        local main=pg and pg:FindFirstChild(loadstring(base64decode("TWFpbkdVSQ=="))())
        local gg=main and main:FindFirstChild(loadstring(base64decode("R2FtZQ=="))())
        local b=gg and gg:FindFirstChild(loadstring(base64decode("Q29pbkJhZ3M="))())
        local cont=b and b:FindFirstChild(loadstring(base64decode("Q29udGFpbmVy"))())
        if not cont then return false end
        local any=false
        for _,v in ipairs(cont:GetChildren()) do
            if v:IsA(loadstring(base64decode("RnJhbWU="))()) and v.Visible then
                any=true
                local full=v:FindFirstChild(loadstring(base64decode("RnVsbA=="))())
                if not (full and full.Visible) then return false end
            end
        end
        return any
    end
    local function resetProgress()
        coinsDone=false
        sawCoins=false
        farmTarget=nil
    end
    task.spawn(function()
        local ok,r=pcall(function() return ReplicatedStorage:WaitForChild(loadstring(base64decode("UmVtb3Rlcw=="))()):WaitForChild(loadstring(base64decode("R2FtZXBsYXk="))()):WaitForChild(loadstring(base64decode("Q29pbnNTdGFydGVk"))(),15) end)
        if ok and r then r.OnClientEvent:Connect(resetProgress) end
    end)
    LocalPlayer.CharacterAdded:Connect(resetProgress)
    local function coinOK(v)
        return v and v.Parent and v:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) and not v:GetAttribute(loadstring(base64decode("Q29sbGVjdGVk"))()) and not v:GetAttribute(loadstring(base64decode("RGVsZXRl"))())
    end
    local function coinList()
        local out={}
        for _,v in ipairs(CollectionService:GetTagged(loadstring(base64decode("Q29pblZpc3VhbA=="))())) do
            if coinOK(v) then out[#out+1]=v end
        end
        return out
    end
    local function nearest(pos,list)
        local b,bd=nil,math.huge
        for _,v in ipairs(list) do
            local d=(v.Position-pos).Magnitude
            if d<bd then bd=d b=v end
        end
        return b
    end
    local function setNoclip(on)
        local c=LocalPlayer.Character
        local h=c and c:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
        if on then
            if not c then return end
            if h then pcall(function() h.PlatformStand=true end) end
            for _,p in ipairs(c:GetDescendants()) do
                if p:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) and p.CanCollide then
                    if ncCache[p]==nil then ncCache[p]=p.CanCollide end
                    p.CanCollide=false
                end
            end
        else
            if h then pcall(function() h.PlatformStand=false end) end
            for p,v in pairs(ncCache) do
                if p and p.Parent then pcall(function() p.CanCollide=v end) end
            end
            ncCache={}
        end
    end
    local mhrpCache,mhrpT=nil,0
    local function murdererHRP()
        local now=os.clock()
        if now-mhrpT<0.25 then return mhrpCache end
        mhrpT=now
        mhrpCache=nil
        local d=getRoundData()
        if type(d)~=loadstring(base64decode("dGFibGU="))() then return nil end
        for name,info in pairs(d) do
            if type(info)==loadstring(base64decode("dGFibGU="))() and info.Role==loadstring(base64decode("TXVyZGVyZXI="))() and not info.Dead and name~=LocalPlayer.Name then
                local pl=Players:FindFirstChild(name)
                local ch=pl and pl.Character
                local hh=ch and ch:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
                local hum=ch and ch:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
                if hh and (not hum or hum.Health>0) then mhrpCache=hh end
                break
            end
        end
        return mhrpCache
    end
    local function flatDist(a,b)
        return Vector3.new(a.X-b.X,0,a.Z-b.Z).Magnitude
    end
    local function fireTouch(coin)
        if type(firetouchinterest)~=loadstring(base64decode("ZnVuY3Rpb24="))() then return end
        if not coin or not coin.Parent then return end
        local now=os.clock()
        if now-lastTouch<0.05 then return end
        lastTouch=now
        local my=hrp()
        if not my then return end
        local targets={coin}
        for _,v in ipairs(coin:GetChildren()) do
            if v:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then targets[#targets+1]=v end
        end
        for _,p in ipairs(targets) do
            pcall(firetouchinterest,my,p,0)
            pcall(firetouchinterest,my,p,1)
        end
    end
    local function pickCoin(pos,list,mpos)
        if not (avoid and mpos) then return nearest(pos,list) end
        local safe,sd=nil,math.huge
        local far,fd=nil,-1
        for _,v in ipairs(list) do
            local md=flatDist(v.Position,mpos)
            if md>fd then fd=md far=v end
            if md>=AVOID_DIST then
                local d=(v.Position-pos).Magnitude
                if d<sd then sd=d safe=v end
            end
        end
        return safe or (fd>=AVOID_DIST*0.6 and far or nil)
    end
    local function coinOKNow(v,mpos)
        if not coinOK(v) then return false end
        if avoid and mpos and flatDist(v.Position,mpos)<AVOID_DIST*0.6 then return false end
        return true
    end
    local function avoidSteer(cur,dest,mpos)
        if not (avoid and mpos) then return dest end
        local dm=flatDist(cur,mpos)
        if dm>=AVOID_DIST then return dest end
        local away=Vector3.new(cur.X-mpos.X,0,cur.Z-mpos.Z)
        if away.Magnitude<0.1 then away=Vector3.new(1,0,0) end
        away=away.Unit
        local want=Vector3.new(dest.X-cur.X,0,dest.Z-cur.Z)
        local mag=want.Magnitude
        if mag<0.1 then return dest end
        local w=1+(1-dm/AVOID_DIST)*2
        local blend=(want.Unit+away*w)
        if blend.Magnitude<0.1 then blend=away else blend=blend.Unit end
        local np=cur+blend*mag
        return Vector3.new(np.X,dest.Y,np.Z)
    end
    local function farmMove(my,dest,dt)
        local dir=dest-my.Position
        local dist=dir.Magnitude
        local np=dest
        if dist>0.1 then np=my.Position+dir.Unit*math.min(speed*dt,dist) end
        local cf=CFrame.new(np)
        if mode==loadstring(base64decode("RG93bg=="))() then
            cf=cf*CFrame.Angles(-math.pi*0.5,0,0)
            wasDown=true
        end
        pcall(function()
            my.CFrame=cf
            my.AssemblyLinearVelocity=Vector3.zero
            my.AssemblyAngularVelocity=Vector3.zero
        end)
    end
    local upParams=RaycastParams.new()
    upParams.FilterType=Enum.RaycastFilterType.Exclude
    upParams.IgnoreWater=true
    local function returnToSurface()
        local my=hrp()
        if not my then return end
        local origin=my.Position
        upParams.FilterDescendantsInstances={LocalPlayer.Character}
        local res=Workspace:Raycast(origin,Vector3.new(0,400,0),upParams)
        local KbNcpS8c=res and (res.Position.Y+5) or (downRefY and downRefY+5 or nil)
        if not KbNcpS8c then return end
        pcall(function()
            my.CFrame=CFrame.new(origin.X,KbNcpS8c,origin.Z)
            my.AssemblyLinearVelocity=Vector3.zero
            my.AssemblyAngularVelocity=Vector3.zero
        end)
    end
    local function farmRelease()
        if wasDown then
            wasDown=false
            returnToSurface()
        end
        setNoclip(false)
    end
    local function killAllPlayersViaKA()
        local char=LocalPlayer.Character
        if not char then return end
        local knife=char:FindFirstChild(loadstring(base64decode("S25pZmU="))())
        if not knife then
            local bp=LocalPlayer:FindFirstChildOfClass(loadstring(base64decode("QmFja3BhY2s="))())
            knife=bp and bp:FindFirstChild(loadstring(base64decode("S25pZmU="))())
            if knife then
                local hum=char:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
                if hum then hum:EquipTool(knife) task.wait(0.1) end
            end
        end
        if not knife then return end
        local ev=knife:FindFirstChild(loadstring(base64decode("RXZlbnRz"))())
        if not ev then return end
        local stabbed=ev:FindFirstChild(loadstring(base64decode("S25pZmVTdGFiYmVk"))())
        local touched=ev:FindFirstChild(loadstring(base64decode("SGFuZGxlVG91Y2hlZA=="))())
        if not stabbed or not touched then return end
        local my=char:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
        if not my then return end
        for _=1,3 do
            local victims={}
            for _,p in ipairs(Players:GetPlayers()) do
                if p~=LocalPlayer then
                    local tc=p.Character
                    if tc then
                        local th=tc:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
                        local tp=tc:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
                        if th and th.Health>0 and tp and (tp.Position-my.Position).Magnitude<=250 then
                            victims[#victims+1]=tp
                        end
                    end
                end
            end
            if #victims>0 then
                pcall(function() stabbed:FireServer() end)
                for _,v in ipairs(victims) do pcall(function() touched:FireServer(v) end) end
            end
            task.wait(0.05)
        end
    end
    local function fireFullAction()
        if fullAction==loadstring(base64decode("UmVzcGF3bg=="))() then
            local hum=LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
            if hum then pcall(function() hum.Health=0 end) end
        elseif fullAction==loadstring(base64decode("QXV0bw=="))() then
            local myRole=getRoleFromData(LocalPlayer)
            if myRole==loadstring(base64decode("bXVyZGVyZXI="))() then
                task.spawn(killAllPlayersViaKA)
            end
        end
    end

    local CONFLICT_OPTS = {
        loadstring(base64decode("S0FPbg=="))(),loadstring(base64decode("U2lsZW50QXV0bw=="))(),loadstring(base64decode("U2lsZW50RW5hYmxlZA=="))(),loadstring(base64decode("QXV0b0dyYWJHdW4="))(),
        loadstring(base64decode("VG9vbEZsaW5n"))(),loadstring(base64decode("VG9vbFRQ"))(),loadstring(base64decode("QXVyYU9u"))(),loadstring(base64decode("RlhPbg=="))(),loadstring(base64decode("VHJhY2VyT24="))(),
        loadstring(base64decode("RnJlZXplVG9nZ2xl"))(),loadstring(base64decode("Tm9jbGlw"))(),loadstring(base64decode("U3BpbmJvdA=="))(),loadstring(base64decode("U3BlZWRHbGl0Y2hPbg=="))(),
        loadstring(base64decode("QmhvcE9u"))(),loadstring(base64decode("SW5mSnVtcA=="))()
    }
    local savedConflicts = {}
    local function disableConflicts()
        savedConflicts = {}
        for _, name in ipairs(CONFLICT_OPTS) do
            local opt = Options[name]
            if opt and opt.Value == true then
                savedConflicts[name] = true
                pcall(function() opt:SetValue(false) end)
            end
        end
        if next(savedConflicts) then
            Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0JrQvtC90YTQu9C40LrRgtGD0Y7RidC40LUg0YTRg9C90LrRhtC40Lgg0L7RgtC60LvRjtGH0LXQvdGL"))(),3)
        end
    end
    local function restoreConflicts()
        for name, was in pairs(savedConflicts) do
            local opt = Options[name]
            if opt then pcall(function() opt:SetValue(true) end) end
        end
        if next(savedConflicts) then
            Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0KTRg9C90LrRhtC40Lgg0LLQvtGB0YHRgtCw0L3QvtCy0LvQtdC90Ys="))(),2)
        end
        savedConflicts = {}
    end

    RunService.Stepped:Connect(function(_,dt)
        if not active then return end
        if not canFarm() then
            farmTarget=nil;wasDown=false
            setNoclip(false)
            return
        end
        local my=hrp()
        if not my then return end
        local list=coinList()
        local function finish()
            farmTarget=nil
            farmRelease()
            if not coinsDone then
                coinsDone=true
                fireFullAction()
            end
        end
        if sawCoins and bagsFull() then finish() return end
        if #list>0 then
            sawCoins=true
            if coinsDone then coinsDone=false end
            local mhrp=avoid and murdererHRP() or nil
            local mpos=mhrp and mhrp.Position or nil
            if not coinOKNow(farmTarget,mpos) then
                farmTarget=pickCoin(my.Position,list,mpos)
            end
            if farmTarget then
                setNoclip(true)
                local cpos=farmTarget.Position
                downRefY=cpos.Y
                local dest=cpos
                if mode==loadstring(base64decode("RG93bg=="))() then
                    local xz=flatDist(my.Position,cpos)
                    local safe=(not mpos) or flatDist(my.Position,mpos)>RISE_SAFE_DIST
                    if xz<=DOWN_RISE_XZ and safe then
                        dest=cpos
                        fireTouch(farmTarget)
                    else
                        dest=Vector3.new(cpos.X,cpos.Y-DOWN_DEPTH,cpos.Z)
                    end
                elseif (cpos-my.Position).Magnitude<=6 then
                    fireTouch(farmTarget)
                end
                dest=avoidSteer(my.Position,dest,mpos)
                farmMove(my,dest,dt)
            elseif mpos then
                setNoclip(true)
                local away=Vector3.new(my.Position.X-mpos.X,0,my.Position.Z-mpos.Z)
                if away.Magnitude<0.1 then away=Vector3.new(1,0,0) end
                away=away.Unit
                local KbNcpS8c=my.Position.Y
                if mode==loadstring(base64decode("RG93bg=="))() and downRefY then KbNcpS8c=downRefY-DOWN_DEPTH end
                farmMove(my,my.Position+away*40+Vector3.new(0,KbNcpS8c-my.Position.Y,0),dt)
            end
        else
            farmTarget=nil
            farmRelease()
            if sawCoins and not coinsDone then finish() end
        end
    end)
    addOpt(farmSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("RmFybVYzT24="))(), {Title=loadstring(base64decode("0JLQutC70Y7Rh9C40YLRjCDQsNCy0YLQvtGE0LDRgNC8"))(), Default=false}, function(v)
        active=v
        if v then disableConflicts()
        else restoreConflicts() farmRelease() end
        resetProgress()
    end)
    addOpt(farmSec, loadstring(base64decode("QWRkRHJvcGRvd24="))(), loadstring(base64decode("RmFybVYzTW9kZQ=="))(), {Title=loadstring(base64decode("0KLQuNC/"))(), Values={loadstring(base64decode("QmFzaWM="))(),loadstring(base64decode("RG93bg=="))()}, Default=loadstring(base64decode("QmFzaWM="))()}, function(v)
        mode=v or loadstring(base64decode("QmFzaWM="))()
        farmTarget=nil
        if mode==loadstring(base64decode("QmFzaWM="))() and wasDown then wasDown=false returnToSurface() end
    end)
    addOpt(farmSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("RmFybVYzU3BlZWQ="))(), {Title=loadstring(base64decode("0KHQutC+0YDQvtGB0YLRjA=="))(), Min=5, Max=60, Default=23, Rounding=1}, function(v) speed=tonumber(v) or 23 end)
    addOpt(farmSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("RmFybVYzQXZvaWQ="))(), {Title=loadstring(base64decode("0JjQt9Cx0LXQs9Cw0YLRjCDQvNCw0L3RjNGP0LrQsA=="))(), Default=false}, function(v) avoid=v farmTarget=nil end)
    addOpt(farmSec, loadstring(base64decode("QWRkRHJvcGRvd24="))(), loadstring(base64decode("RmFybUZ1bGxBY3Rpb24="))(), {Title=loadstring(base64decode("0J/RgNC4INC/0L7Qu9C90L7QvCDQvNC10YjQutC1"))(), Values={loadstring(base64decode("UmVzcGF3bg=="))(),loadstring(base64decode("QXV0bw=="))()}, Default=loadstring(base64decode("UmVzcGF3bg=="))()}, function(v) fullAction=v or loadstring(base64decode("UmVzcGF3bg=="))() end)
    getgenv().FARMV3_UNLOAD=function()
        active=false
        farmTarget=nil
        farmRelease()
        restoreConflicts()
    end
end

-- ============================================================
-- УТИЛИТЫ
-- ============================================================
do
    local tU=Tabs.Utility
    local notifySec=tU:AddSection({Name=loadstring(base64decode("0KPQstC10LTQvtC80LvQtdC90LjRjw=="))()})
    local notifyOn,rolesOn=false,false
    local lastRole=nil
    task.spawn(function()
        while task.wait(0.5) do
            if notifyOn and rolesOn then
                local d=getRoundData()
                local r=d and d[LocalPlayer.Name] and d[LocalPlayer.Name].Role
                if r and r~=lastRole then
                    lastRole=r
                    local ru=(r==loadstring(base64decode("U2hlcmlmZg=="))() and loadstring(base64decode("0KjQtdGA0LjRhA=="))()) or (r==loadstring(base64decode("SGVybw=="))() and loadstring(base64decode("0JPQtdGA0L7QuQ=="))()) or (r==loadstring(base64decode("TXVyZGVyZXI="))() and loadstring(base64decode("0JzQsNC90YzRj9C6"))()) or (r==loadstring(base64decode("SW5ub2NlbnQ="))() and loadstring(base64decode("0JzQuNGA0L3Ri9C5"))()) or r
                    Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0KDQvtC70Yw6IA=="))()..ru,4)
                elseif not r then lastRole=nil end
            end
        end
    end)
    addOpt(notifySec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("Tm90aWZ5T24="))(), {Title=loadstring(base64decode("0JLQutC70Y7Rh9C40YLRjA=="))(), Default=false}, function(v) notifyOn=v end)
    addOpt(notifySec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("Tm90aWZ5Um9sZXM="))(), {Title=loadstring(base64decode("0J/QvtC60LDQt9GL0LLQsNGC0Ywg0YDQvtC70Yw="))(), Default=false}, function(v) rolesOn=v end)

    -- ============================================================
    -- НЕВИДИМОСТЬ
    -- ============================================================
    local invisSec=tU:AddSection({Name=loadstring(base64decode("0J3QtdCy0LjQtNC40LzQvtGB0YLRjA=="))()})
    local invis={active=false,realCF=nil,hbConn=nil,bindName=loadstring(base64decode("RkhfSW52aXNDbGllbnQ="))(),savedLTM={},savedDecals={},savedFallenHeight=nil}
    local HIDDEN_CF=CFrame.new(0,-50000,0)
    getgenv().FH_INVIS_ACTIVE=false
    local function invisRestoreParts()
        local char=LocalPlayer.Character
        if char then
            for p,v in pairs(invis.savedLTM) do
                if p and p.Parent then pcall(function() p.LocalTransparencyModifier=v end) end
            end
            for d,v in pairs(invis.savedDecals) do
                if d and d.Parent then pcall(function() d.Transparency=v end) end
            end
        end
        invis.savedLTM={}
        invis.savedDecals={}
    end
    local function invisBegin()
        if invis.active then return end
        local char=LocalPlayer.Character
        if not char then Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0J/QtdGA0YHQvtC90LDQtiDQvdC1INC30LDQs9GA0YPQttC10L0="))(),2) return end
        local hrp=char:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
        local hum=char:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
        if not hrp or not hum then Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0J/QtdGA0YHQvtC90LDQtiDQvdC1INC30LDQs9GA0YPQttC10L0="))(),2) return end
        invis.savedLTM={}
        invis.savedDecals={}
        invis.realCF=hrp.CFrame
        invis.active=true
        getgenv().FH_INVIS_ACTIVE=true
        invis.savedFallenHeight=Workspace.FallenPartsDestroyHeight
        pcall(function() Workspace.FallenPartsDestroyHeight=-9e9 end)
        for _,p in ipairs(char:GetDescendants()) do
            if p:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
                invis.savedLTM[p]=p.LocalTransparencyModifier
                p.LocalTransparencyModifier=0.5
            elseif p:IsA(loadstring(base64decode("RGVjYWw="))()) or p:IsA(loadstring(base64decode("VGV4dHVyZQ=="))()) then
                invis.savedDecals[p]=p.Transparency
                p.Transparency=0.5
            end
        end
        invis.hbConn=RunService.Heartbeat:Connect(function()
            if not invis.active then return end
            local c=LocalPlayer.Character
            local h=c and c:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
            if not h then return end
            invis.realCF=h.CFrame
            h.CFrame=HIDDEN_CF
        end)
        RunService:BindToRenderStep(invis.bindName,Enum.RenderPriority.Camera.Value-1,function()
            if not invis.active then return end
            local c=LocalPlayer.Character
            local h=c and c:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
            if h and invis.realCF then h.CFrame=invis.realCF end
        end)
        Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0J3QtdCy0LjQtNC40LzQvtGB0YLRjCDQktCa0Js="))(),2)
    end
    local function invisEnd()
        if not invis.active then return end
        local char=LocalPlayer.Character
        local hrp=char and char:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
        local finalCF=invis.realCF
        invis.active=false
        getgenv().FH_INVIS_ACTIVE=false
        if invis.hbConn then
            pcall(function() invis.hbConn:Disconnect() end)
            invis.hbConn=nil
        end
        pcall(function() RunService:UnbindFromRenderStep(invis.bindName) end)
        if hrp and finalCF then
            pcall(function()
                hrp.CFrame=finalCF
                hrp.AssemblyLinearVelocity=Vector3.zero
                hrp.AssemblyAngularVelocity=Vector3.zero
            end)
        end
        invisRestoreParts()
        if invis.savedFallenHeight~=nil then
            pcall(function() Workspace.FallenPartsDestroyHeight=invis.savedFallenHeight end)
            invis.savedFallenHeight=nil
        end
        invis.realCF=nil
        Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0J3QtdCy0LjQtNC40LzQvtGB0YLRjCDQktCr0JrQmw=="))(),2)
    end
    addOpt(invisSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("SW52aXNPbg=="))(), {Title=loadstring(base64decode("0JLQutC70Y7Rh9C40YLRjCDQvdC10LLQuNC00LjQvNC+0YHRgtGM"))(), Default=false}, function(v)
        if v then invisBegin() else invisEnd() end
    end)
    getgenv().INVIS_UNLOAD=function() if invis.active then invisEnd() end end

    -- ============================================================
    -- БУСТ ГОЛОСОВ
    -- ============================================================
    local mvSec=tU:AddSection({Name=loadstring(base64decode("0JHRg9GB0YIg0LPQvtC70L7RgdC+0LI="))()})
    local mvDupCap=10
    local function DupeVoteFast(times)
        local char=LocalPlayer.Character
        if not char then Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0J/QtdGA0YHQvtC90LDQtiDQvdC1INC30LDQs9GA0YPQttC10L0="))(),2) return end
        local hrp=char:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
        if not hrp then Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("SFJQINC90LUg0L3QsNC50LTQtdC9"))(),2) return end
        local savedCF=hrp.CFrame
        Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0JHRg9GB0YIg0LPQvtC70L7RgdC+0LI6IA=="))()..times..loadstring(base64decode("INGA0LDQtw=="))(),3)
        task.spawn(function()
            for uSCGtGib=1,times do
                local c=LocalPlayer.Character
                local h=c and c:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
                if h and h.Health>0 then
                    pcall(function() h.Health=0 end)
                    pcall(function() h:ChangeState(Enum.HumanoidStateType.Dead) end)
                end
                local waited=0
                local lastChar=c
                local respawned=false
                while waited < 5 do
                    task.wait(0.02)
                    waited = waited + 0.02
                    local nc=LocalPlayer.Character
                    if nc and nc~=lastChar then
                        local nh=nc:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
                        local nhrp=nc:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
                        if nh and nh.Health>0 and nhrp then
                            pcall(function() nhrp.CFrame=savedCF end)
                            pcall(function() nhrp.AssemblyLinearVelocity=Vector3.zero end)
                            pcall(function() nhrp.AssemblyAngularVelocity=Vector3.zero end)
                            respawned=true
                            break
                        end
                    end
                end
                if respawned then task.wait(0.5) end
            end
            Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0JHRg9GB0YIg0LfQsNCy0LXRgNGI0ZHQvQ=="))(),3)
        end)
    end
    addOpt(mvSec, loadstring(base64decode("QWRkU2xpZGVy"))(), loadstring(base64decode("TVZEdXBlQ2Fw"))(), {Title=loadstring(base64decode("0JrQvtC7LdCy0L4="))(), Min=1, Max=15, Default=10, Rounding=0}, function(v) mvDupCap=tonumber(v) or 10 end)
    mvSec:AddButton({Title=loadstring(base64decode("0JHRg9GB0YIg0LPQvtC70L7RgdC+0LI="))(),Callback=function()
        task.spawn(function()
            DupeVoteFast(math.clamp(math.floor(mvDupCap),1,15))
        end)
    end})

    -- ============================================================
    -- АНТИ
    -- ============================================================
    local antiSec=tU:AddSection({Name=loadstring(base64decode("0JDQvdGC0Lg="))()})

    -- Анти-отброс (без KITI в названии)
    local antiFlingOn=false
    local flingCache,flingReg={},{}
    local flingConns={}
    local flingSafeCF=nil
    local flingHoldUntil=0
    local FLING_MAX_VEL=700
    local FLING_MAX_ANG=90
    local FLING_SNAP_DIST=60
    local FLING_HOLD=0.25
    local FLING_SAFE_VEL=250

    local function flingIsBody(m)
        return m ~= LocalPlayer.Character
            and m:IsA(loadstring(base64decode("TW9kZWw="))())
            and m:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))()) ~= nil
    end
    local function flingKillPart(p)
        if flingCache[p]==nil then flingCache[p]=p.CanCollide end
        if p.CanCollide then p.CanCollide=false end
    end
    local function flingUnregister(model)
        local entry=flingReg[model]
        if not entry then return end
        flingReg[model]=nil
        for uSCGtGib=1,#entry.conns do pcall(function() entry.conns[uSCGtGib]:Disconnect() end) end
        for p in pairs(entry.parts) do
            local v=flingCache[p]
            flingCache[p]=nil
            if v~=nil and p.Parent then pcall(function() p.CanCollide=v end) end
        end
        table.clear(entry.parts)
    end
    local function flingRegister(model)
        if not antiFlingOn or not model then return end
        if flingReg[model] or model==LocalPlayer.Character then return end
        local entry={parts={},conns={}}
        flingReg[model]=entry
        local function add(d)
            if d:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) and not entry.parts[d] then
                entry.parts[d]=true
                if antiFlingOn then pcall(flingKillPart,d) end
            end
        end
        for _,d in model:GetDescendants() do pcall(add,d) end
        local function push(c) entry.conns[#entry.conns+1]=c end
        push(model.DescendantAdded:Connect(function(d) if antiFlingOn then pcall(add,d) end end))
        push(model.DescendantRemoving:Connect(function(d)
            if entry.parts[d] then
                entry.parts[d]=nil
                flingCache[d]=nil
            end
        end))
        push(model.AncestryChanged:Connect(function(_,parent)
            if not parent then flingUnregister(model) end
        end))
    end
    local function flingScan()
        for _,pl in Players:GetPlayers() do
            if pl~=LocalPlayer and pl.Character then flingRegister(pl.Character) end
        end
        for _,m in Workspace:GetChildren() do
            if flingIsBody(m) then flingRegister(m) end
        end
    end
    local function flingSweep()
        for model,entry in pairs(flingReg) do
            if not model.Parent or model==LocalPlayer.Character then
                flingUnregister(model)
            else
                for p in pairs(entry.parts) do
                    if p.Parent then
                        if p.CanCollide then
                            if flingCache[p]==nil then flingCache[p]=true end
                            p.CanCollide=false
                        end
                    else
                        entry.parts[p]=nil
                        flingCache[p]=nil
                    end
                end
            end
        end
    end
    local function flingBusy()
        if (getgenv().FLING_ACTIVE or 0)>0 then return true end
        return false
    end
    local function flingGuard(full)
        local hrp=getHRP()
        if not hrp or not hrp.Parent then
            flingSafeCF=nil
            return
        end
        if flingBusy() then
            flingSafeCF=nil
            return
        end
        local lin=hrp.AssemblyLinearVelocity
        local ang=hrp.AssemblyAngularVelocity
        local spike=lin.Magnitude>FLING_MAX_VEL or ang.Magnitude>FLING_MAX_ANG
        local now=os.clock()
        if spike then flingHoldUntil=now+FLING_HOLD end
        if spike or now<flingHoldUntil then
            hrp.AssemblyLinearVelocity=Vector3.zero
            hrp.AssemblyAngularVelocity=Vector3.zero
            if full and flingSafeCF then
                if (hrp.Position-flingSafeCF.Position).Magnitude>FLING_SNAP_DIST then
                    hrp.CFrame=flingSafeCF
                end
            end
        elseif full and lin.Magnitude<FLING_SAFE_VEL then
            flingSafeCF=hrp.CFrame
        end
    end
    local function flingDetach()
        for uSCGtGib=1,#flingConns do pcall(function() flingConns[uSCGtGib]:Disconnect() end) end
        table.clear(flingConns)
    end
    local function flingAttach()
        if #flingConns>0 then return end
        local function push(c) flingConns[#flingConns+1]=c end
        local function watch(pl)
            if pl==LocalPlayer then return end
            push(pl.CharacterAdded:Connect(function(c) if antiFlingOn then flingRegister(c) end end))
            push(pl.CharacterRemoving:Connect(function(c) flingUnregister(c) end))
        end
        for _,pl in Players:GetPlayers() do watch(pl) end
        push(Players.PlayerAdded:Connect(function(pl)
            watch(pl)
            if antiFlingOn and pl.Character then flingRegister(pl.Character) end
        end))
        push(Players.PlayerRemoving:Connect(function(pl)
            if pl.Character then flingUnregister(pl.Character) end
        end))
        push(Workspace.ChildAdded:Connect(function(m)
            if not antiFlingOn then return end
            task.defer(function()
                if antiFlingOn and m.Parent==Workspace and flingIsBody(m) then flingRegister(m) end
            end)
        end))
        push(LocalPlayer.CharacterAdded:Connect(function(c)
            flingUnregister(c)
            flingSafeCF=nil
            flingHoldUntil=0
            if antiFlingOn then task.defer(flingScan) end
        end))
        flingScan()
    end
    local function flingRestore()
        flingDetach()
        for model in pairs(flingReg) do flingUnregister(model) end
        table.clear(flingReg)
        for p,v in pairs(flingCache) do
            if p and p.Parent then pcall(function() p.CanCollide=v end) end
        end
        table.clear(flingCache)
        flingSafeCF=nil
        flingHoldUntil=0
    end
    AddConn(loadstring(base64decode("QW50aUZsaW5nU3RlcA=="))(),RunService.Stepped:Connect(function()
        if antiFlingOn then
            if #flingConns==0 then pcall(flingAttach) end
            pcall(flingSweep)
            pcall(flingGuard,true)
        end
    end))
    AddConn(loadstring(base64decode("QW50aUZsaW5nQmVhdA=="))(),RunService.Heartbeat:Connect(function()
        if antiFlingOn then pcall(flingGuard,false) end
    end))
    addOpt(antiSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("QW50aUZsaW5n"))(), {Title=loadstring(base64decode("0JDQvdGC0Lgt0L7RgtCx0YDQvtGB"))(), Default=false}, function(v)
        antiFlingOn=v
        if v then flingAttach() else flingRestore() end
    end)

    local antiVoidOn=false
    local voidOrig=Workspace.FallenPartsDestroyHeight
    RunService.Heartbeat:Connect(function()
        pcall(function() Workspace.FallenPartsDestroyHeight=antiVoidOn and -9e9 or voidOrig end)
    end)
    addOpt(antiSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("QW50aVZvaWQ="))(), {Title=loadstring(base64decode("0JDQvdGC0Lgt0L/QsNC00LXQvdC40LU="))(), Default=false}, function(v) antiVoidOn=v end)
    local antiTrapOn=false
    local trapSpeedCache,trapJumpCache=16,50
    RunService.Heartbeat:Connect(function()
        if not antiTrapOn then return end
        local hum=getHum()
        if not hum then return end
        if hum.WalkSpeed>1 then trapSpeedCache=hum.WalkSpeed end
        if hum.JumpPower>1 then trapJumpCache=hum.JumpPower end
        pcall(function()
            if hum.WalkSpeed<=1 then hum.WalkSpeed=trapSpeedCache end
            if hum.JumpPower<=1 then hum.JumpPower=trapJumpCache end
        end)
        local pg=LocalPlayer:FindFirstChild(loadstring(base64decode("UGxheWVyR3Vp"))())
        if pg then
            for _,g in ipairs(pg:GetChildren()) do
                if g.Name==loadstring(base64decode("VHJhcEdVSQ=="))() then pcall(function() g:Destroy() end) end
            end
        end
    end)
    addOpt(antiSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("QW50aVRyYXA="))(), {Title=loadstring(base64decode("0JDQvdGC0Lgt0LvQvtCy0YPRiNC60LA="))(), Default=false}, function(v) antiTrapOn=v end)
    local antiFadeOn=false
    local fadeCache,fadeConns={},{}
    local fadeNames={CameraFade=true,SpawnFade=true,Fade=true,DeathFade=true}
    local function fadeHide(frame)
        if not frame or not frame.Parent or not frame:IsA(loadstring(base64decode("R3VpT2JqZWN0"))()) then return end
        if fadeCache[frame]==nil then fadeCache[frame]=frame.Visible end
        if frame.Visible then pcall(function() frame.Visible=false end) end
        if not fadeConns[frame] then
            fadeConns[frame]=frame:GetPropertyChangedSignal(loadstring(base64decode("VmlzaWJsZQ=="))()):Connect(function()
                if antiFadeOn and frame.Visible then pcall(function() frame.Visible=false end) end
            end)
        end
    end
    local function fadeApply()
        local pg=LocalPlayer:FindFirstChild(loadstring(base64decode("UGxheWVyR3Vp"))())
        if not pg then return end
        for _,child in ipairs(pg:GetChildren()) do
            if child:IsA(loadstring(base64decode("U2NyZWVuR3Vp"))()) and fadeNames[child.Name] then
                for _,sub in ipairs(child:GetChildren()) do
                    if sub:IsA(loadstring(base64decode("R3VpT2JqZWN0"))()) and (sub.Name==loadstring(base64decode("RmFkZQ=="))() or sub.Name==loadstring(base64decode("RnJhbWU="))()) then fadeHide(sub) end
                end
            end
        end
        local main=pg:FindFirstChild(loadstring(base64decode("TWFpbkdVSQ=="))())
        local gg=main and main:FindFirstChild(loadstring(base64decode("R2FtZQ=="))())
        local gf=gg and gg:FindFirstChild(loadstring(base64decode("RmFkZQ=="))())
        if gf and gf:IsA(loadstring(base64decode("R3VpT2JqZWN0"))()) then fadeHide(gf) end
    end
    local function fadeRestore()
        for _,c in pairs(fadeConns) do pcall(function() c:Disconnect() end) end
        fadeConns={}
        for frame,v in pairs(fadeCache) do
            if frame and frame.Parent then pcall(function() frame.Visible=v end) end
        end
        fadeCache={}
    end
    addOpt(antiSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("QW50aUZhZGU="))(), {Title=loadstring(base64decode("0KPQsdGA0LDRgtGMINGH0ZHRgNC90YvQuSDRjdC60YDQsNC9"))(), Default=false}, function(v)
        antiFadeOn=v
        if v then fadeApply() else fadeRestore() end
    end)
    getgenv().ANTI_UNLOAD=function()
        antiFlingOn=false
        flingRestore()
        antiVoidOn=false
        antiTrapOn=false
        antiFadeOn=false
        fadeRestore()
    end
end

-- ============================================================
-- ТРОЛЛИНГ
-- ============================================================
do
    local tT=Tabs.Troll
    local tpOn,tpTool,tpActConn=false,nil,nil
    local function giveTpTool()
        if not tpOn then return end
        local bp=LocalPlayer:FindFirstChildOfClass(loadstring(base64decode("QmFja3BhY2s="))())
        if not bp then return end
        local existing=bp:FindFirstChild(loadstring(base64decode("dHA="))())
        if not existing and LocalPlayer.Character then existing=LocalPlayer.Character:FindFirstChild(loadstring(base64decode("dHA="))()) end
        if existing then tpTool=existing return end
        tpTool=Instance.new(loadstring(base64decode("VG9vbA=="))())
        tpTool.Name=loadstring(base64decode("dHA="))()
        tpTool.RequiresHandle=false
        tpTool.CanBeDropped=false
        tpTool.Parent=bp
        tpActConn=tpTool.Activated:Connect(function()
            local hrp=getHRP()
            local m=LocalPlayer:GetMouse()
            if not hrp or not m.Hit then return end
            hrp.CFrame=CFrame.new(m.Hit.X,m.Hit.Y+3,m.Hit.Z)
        end)
    end
    local function removeTpTool()
        if tpActConn then pcall(function() tpActConn:Disconnect() end) tpActConn=nil end
        if tpTool then pcall(function() tpTool:Destroy() end) tpTool=nil end
        local bp=LocalPlayer:FindFirstChildOfClass(loadstring(base64decode("QmFja3BhY2s="))())
        if bp then local t=bp:FindFirstChild(loadstring(base64decode("dHA="))()) if t then pcall(function() t:Destroy() end) end end
        local c=LocalPlayer.Character
        if c then local t=c:FindFirstChild(loadstring(base64decode("dHA="))()) if t then pcall(function() t:Destroy() end) end end
    end
    addOpt(tT:AddSection({Name=loadstring(base64decode("0JjQvdGB0YLRgNGD0LzQtdC90YLRiw=="))()}), loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("VG9vbFRQ"))(), {Title=loadstring(base64decode("0KLQny3RgtGD0Ls="))(), Default=false}, function(v)
        tpOn=v
        if v then giveTpTool() else removeTpTool() end
    end)
    LocalPlayer.CharacterAdded:Connect(function()
        task.wait(1)
        if tpOn then giveTpTool() end
    end)

    local ftOn,ftTool,ftActConn=false,nil,nil
    local function clickedPlayer()
        local m=LocalPlayer:GetMouse()
        local tgt=m.Target
        if tgt then
            local node=tgt
            while node and node~=Workspace do
                local p=Players:GetPlayerFromCharacter(node)
                if p and p~=LocalPlayer then return p end
                node=node.Parent
            end
        end
        local cam=Workspace.CurrentCamera
        local mp=Vector2.new(m.X,m.Y)
        local best,bd=nil,110
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=LocalPlayer and p.Character then
                local hrp=p.Character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
                if hrp then
                    local sp,on=cam:WorldToViewportPoint(hrp.Position)
                    if on then
                        local d=(Vector2.new(sp.X,sp.Y)-mp).Magnitude
                        if d<bd then bd=d best=p end
                    end
                end
            end
        end
        return best
    end

    -- CLASSIC FLING
    local function flingClassic(tp)
        if not tp or not tp.Character then return end
        local hrp=getHRP()
        if not hrp then return end
        local tc=tp.Character
        local thrp=tc:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))()) or tc:FindFirstChild(loadstring(base64decode("SGVhZA=="))())
        if not thrp then return end
        getgenv().FLING_ACTIVE = (getgenv().FLING_ACTIVE or 0) + 1
        local oldPos=hrp.CFrame
        local cam=Workspace.CurrentCamera
        cam.CameraSubject=thrp
        local bv=Instance.new(loadstring(base64decode("Qm9keVZlbG9jaXR5"))())
        bv.Parent=hrp
        bv.Velocity=Vector3.zero
        bv.MaxForce=Vector3.new(9e9,9e9,9e9)
        local tm=tick()
        repeat
            if hrp and hrp.Parent and thrp and thrp.Parent then
                hrp.CFrame=CFrame.new(thrp.Position)*CFrame.new(0,1.5,0)
                hrp.AssemblyLinearVelocity=Vector3.new(9e7,9e7*10,9e7)
                hrp.AssemblyAngularVelocity=Vector3.new(9e8,9e8,9e8)
            end
            RunService.Heartbeat:Wait()
        until tick()-tm>1.5 or not ftOn
        if bv then bv:Destroy() end
        local hum=LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
        cam.CameraSubject=hum
        if hrp then
            pcall(function()
                hrp.CFrame=oldPos
                hrp.AssemblyLinearVelocity=Vector3.zero
                hrp.AssemblyAngularVelocity=Vector3.zero
            end)
        end
        getgenv().FLING_ACTIVE = math.max(0, (getgenv().FLING_ACTIVE or 1) - 1)
    end

    -- TURBO FLING — теперь растянут на ~2.8 сек, не залипает
    local function flingTurbo(tp)
        if not tp or not tp.Character then return end
        local hrp=getHRP()
        if not hrp then return end
        local tc=tp.Character
        local thrp=tc:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))()) or tc:FindFirstChild(loadstring(base64decode("SGVhZA=="))())
        if not thrp then return end
        getgenv().FLING_ACTIVE = (getgenv().FLING_ACTIVE or 0) + 1
        local oldPos=hrp.CFrame
        local oldVel=hrp.AssemblyLinearVelocity
        local oldAng=hrp.AssemblyAngularVelocity
        local cam=Workspace.CurrentCamera
        cam.CameraSubject=thrp

        local speed = tonumber(getgenv().FLING_TURBO_SPEED) or 350
        local laps = tonumber(getgenv().FLING_TURBO_LAPS) or 8
        local distance = tonumber(getgenv().FLING_TURBO_DISTANCE) or 14
        local totalTime = 2.8
        local perLap = totalTime / laps

        local bodyVel = Instance.new(loadstring(base64decode("Qm9keVZlbG9jaXR5"))())
        bodyVel.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        bodyVel.Parent = hrp

        local startT = tick()
        for uSCGtGib = 1, laps do
            if not ftOn then break end
            if tick() - startT > totalTime + 1 then break end
            local tc2 = tp.Character
            if not tc2 then break end
            local thrp2 = tc2:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))()) or tc2:FindFirstChild(loadstring(base64decode("SGVhZA=="))())
            if not thrp2 then break end

            -- Круговой проход: 2 полных оборота вокруг цели
            local angle = (uSCGtGib / laps) * math.pi * 2
            local yOffset = math.sin(uSCGtGib * 0.6) * 2.5
            local dir = Vector3.new(math.cos(angle), 0, math.sin(angle))
            local startPos = thrp2.Position - dir * distance + Vector3.new(0, yOffset, 0)
            local endPos = thrp2.Position + dir * distance + Vector3.new(0, yOffset, 0)

            pcall(function()
                hrp.CFrame = CFrame.new(startPos, endPos)
                bodyVel.Velocity = (endPos - startPos).Unit * speed
                hrp.AssemblyLinearVelocity = (endPos - startPos).Unit * speed
                hrp.AssemblyAngularVelocity = Vector3.new(
                    math.random(-9999, 9999),
                    math.random(-9999, 9999),
                    math.random(-9999, 9999)
                )
            end)
            -- Ждём perLap секунд, чтобы физика успела обработать касание
            task.wait(perLap)
        end

        if bodyVel then bodyVel:Destroy() end
        cam.CameraSubject = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
        pcall(function()
            hrp.CFrame = oldPos
            hrp.AssemblyLinearVelocity = oldVel
            hrp.AssemblyAngularVelocity = oldAng
        end)
        getgenv().FLING_ACTIVE = math.max(0, (getgenv().FLING_ACTIVE or 1) - 1)
    end

    local function doFling(tp)
        local mode = getgenv().FLING_MODE or loadstring(base64decode("Q2xhc3NpYw=="))()
        if mode == loadstring(base64decode("VHVyYm8="))() then
            flingTurbo(tp)
        else
            flingClassic(tp)
        end
    end

    local function giveFlingTool()
        if not ftOn then return end
        local bp=LocalPlayer:FindFirstChildOfClass(loadstring(base64decode("QmFja3BhY2s="))())
        if not bp then return end
        local existing=bp:FindFirstChild(loadstring(base64decode("Zmxpbmc="))())
        if not existing and LocalPlayer.Character then existing=LocalPlayer.Character:FindFirstChild(loadstring(base64decode("Zmxpbmc="))()) end
        if existing then ftTool=existing return end
        ftTool=Instance.new(loadstring(base64decode("VG9vbA=="))())
        ftTool.Name=loadstring(base64decode("Zmxpbmc="))()
        ftTool.RequiresHandle=false
        ftTool.CanBeDropped=false
        ftTool.Parent=bp
        ftActConn=ftTool.Activated:Connect(function()
            local tp=clickedPlayer()
            if tp then doFling(tp) end
        end)
    end
    local function removeFlingTool()
        if ftActConn then pcall(function() ftActConn:Disconnect() end) ftActConn=nil end
        if ftTool then pcall(function() ftTool:Destroy() end) ftTool=nil end
        local bp=LocalPlayer:FindFirstChildOfClass(loadstring(base64decode("QmFja3BhY2s="))())
        if bp then local t=bp:FindFirstChild(loadstring(base64decode("Zmxpbmc="))()) if t then pcall(function() t:Destroy() end) end end
        local c=LocalPlayer.Character
        if c then local t=c:FindFirstChild(loadstring(base64decode("Zmxpbmc="))()) if t then pcall(function() t:Destroy() end) end end
    end

    local flingSec=tT:AddSection({Name=loadstring(base64decode("0J7RgtCx0YDQvtGB"))()})
    addOpt(flingSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("VG9vbEZsaW5n"))(), {Title=loadstring(base64decode("0KLRg9C7INC+0YLQsdGA0L7RgdCw"))(), Default=false}, function(v)
        ftOn=v
        if v then giveFlingTool() else removeFlingTool() end
    end)
    -- Вместо AddLabel (которого нет в этой Fluent) используем AddParagraph + pcall
    pcall(function()
        if type(flingSec.AddParagraph) == loadstring(base64decode("ZnVuY3Rpb24="))() then
            flingSec:AddParagraph({
                Title = loadstring(base64decode("0KLQtdC60YPRidC40Lkg0YDQtdC20LjQvCDRhNC70LjQvdCz0LA="))(),
                Content = getgenv().FLING_MODE or loadstring(base64decode("Q2xhc3NpYw=="))(),
            })
        end
    end)
    LocalPlayer.CharacterAdded:Connect(function()
        task.wait(1)
        if ftOn then giveFlingTool() end
    end)

    local fdSec=tT:AddSection({Name=loadstring(base64decode("0KTQtdC50Lot0YHQvNC10YDRgtGM"))()})
    local FAKE_DEATH_1_ID = loadstring(base64decode("MTMyMzg0NzAxNzA2MDQ2"))()
    local FAKE_DEATH_2_ID = loadstring(base64decode("MTI1MDMyMzU3NDk2NzI5"))()
    local fdTrack1,fdTrack2=nil,nil
    local function stopAllFd()
        if fdTrack1 then pcall(function() fdTrack1:Stop() end) fdTrack1=nil end
        if fdTrack2 then pcall(function() fdTrack2:Stop() end) fdTrack2=nil end
    end
    local animCache={}
    local function resolveId(id)
        if animCache[id] then return animCache[id] end
        if type(id)==loadstring(base64decode("bnVtYmVy"))() then id=tostring(id) end
        if id:find(loadstring(base64decode("Oi8v"))()) then animCache[id]=id return id end
        local raw=tostring(id):gsub(loadstring(base64decode("JUQ="))(),loadstring(base64decode(""))())
        if raw==loadstring(base64decode(""))() then return nil end
        local url=loadstring(base64decode("cmJ4YXNzZXRpZDovLw=="))()..raw
        animCache[id]=url
        return url
    end
    local function playFd(id, slot)
        local c=LocalPlayer.Character
        local hum=c and c:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
        if not hum then Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0J/QtdGA0YHQvtC90LDQtiDQvdC1INC30LDQs9GA0YPQttC10L0="))(),2) return end
        local resolved = resolveId(id)
        if not resolved then return end
        if slot==1 and fdTrack1 then pcall(function() fdTrack1:Stop() end) fdTrack1=nil end
        if slot==2 and fdTrack2 then pcall(function() fdTrack2:Stop() end) fdTrack2=nil end
        local anim=Instance.new(loadstring(base64decode("QW5pbWF0aW9u"))())
        anim.AnimationId=resolved
        local animator = hum:FindFirstChildOfClass(loadstring(base64decode("QW5pbWF0b3I="))())
        if not animator then
            animator = Instance.new(loadstring(base64decode("QW5pbWF0b3I="))())
            animator.Parent = hum
        end
        local ok,track=pcall(function() return animator:LoadAnimation(anim) end)
        anim:Destroy()
        if ok and track then
            track.Priority=Enum.AnimationPriority.Action4
            track.Looped=true
            pcall(function() track:Play(0) end)
            if slot==1 then fdTrack1=track else fdTrack2=track end
            Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0KTQtdC50Lot0YHQvNC10YDRgtGMIA=="))()..slot,2)
        else
            Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0J3QtSDRg9C00LDQu9C+0YHRjCDQt9Cw0L/Rg9GB0YLQuNGC0Ywg"))()..slot,2)
        end
    end
    fdSec:AddButton({Title=loadstring(base64decode("0KTQtdC50Lot0YHQvNC10YDRgtGMIDE="))(),Callback=function() playFd(FAKE_DEATH_1_ID, 1) end})
    fdSec:AddButton({Title=loadstring(base64decode("0KTQtdC50Lot0YHQvNC10YDRgtGMIDI="))(),Callback=function() playFd(FAKE_DEATH_2_ID, 2) end})
    fdSec:AddButton({Title=loadstring(base64decode("0J7RgdGC0LDQvdC+0LLQuNGC0Yw="))(),Callback=function()
        stopAllFd()
        Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0J7RgdGC0LDQvdC+0LLQu9C10L3Qvg=="))(),2)
    end})

    local function inLobby(obj)
        local p=obj.Parent
        while p and p~=Workspace do
            if p.Name==loadstring(base64decode("UmVndWxhckxvYmJ5"))() or p.Name==loadstring(base64decode("TG9iYnk="))() then return true end
            p=p.Parent
        end
        return false
    end
    local tpBtnSec=tT:AddSection({Name=loadstring(base64decode("0KLQtdC70LXQv9C+0YDRgg=="))()})
    tpBtnSec:AddButton({Title=loadstring(base64decode("0KLQnyDQsiDQu9C+0LHQsdC4"))(),Callback=function()
        local hrp=getHRP()
        if not hrp then return end
        local lobby=Workspace:FindFirstChild(loadstring(base64decode("UmVndWxhckxvYmJ5"))()) or Workspace:FindFirstChild(loadstring(base64decode("TG9iYnk="))())
        if not lobby then return end
        local locs={}
        for _,o in ipairs(lobby:GetDescendants()) do
            if o:IsA(loadstring(base64decode("U3Bhd25Mb2NhdGlvbg=="))()) or (o:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) and o.Name==loadstring(base64decode("U3Bhd24="))()) then locs[#locs+1]=o end
        end
        if #locs>0 then
            local s=locs[math.random(1,#locs)]
            hrp.CFrame=s.CFrame+Vector3.new(0,3,0)
        end
    end})
    tpBtnSec:AddButton({Title=loadstring(base64decode("0KLQnyDQvdCwINC60LDRgNGC0YM="))(),Callback=function()
        local hrp=getHRP()
        if not hrp then return end
        local spawns={}
        for _,o in ipairs(Workspace:GetDescendants()) do
            if (o:IsA(loadstring(base64decode("U3Bhd25Mb2NhdGlvbg=="))()) or (o:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) and o.Name==loadstring(base64decode("U3Bhd24="))())) and not inLobby(o) then
                spawns[#spawns+1]=o
            end
        end
        if #spawns>0 then
            local s=spawns[math.random(1,#spawns)]
            hrp.CFrame=s.CFrame+Vector3.new(0,5,0)
        end
    end})
    getgenv().TROLL_UNLOAD=function()
        tpOn,ftOn=false,false
        removeTpTool()
        removeFlingTool()
        stopAllFd()
    end
end

pcall(function() Window:SelectTab(1) end)
print(loadstring(base64decode("W0ZIXSA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ=="))())
print(loadstring(base64decode("W0ZIXSBQYXJ0IDEvMiDigJQgRm9ydG5pSHViIHYyMC4zIOKAlCA="))()..CREDITS)
print(loadstring(base64decode("W0ZIXSA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ=="))())
-- ============================================================
-- FORTNIHUB v20.3 — EXTRA FEATURES — ЧАСТЬ 2/2
-- ============================================================

if not (Window and Options and Notify and getRoundData and getRoleFromData and getHRP and getHum) then
    warn(loadstring(base64decode("W0ZIXSBQYXJ0IDEg0L3QtSDQt9Cw0LPRgNGD0LbQtdC90LAg4oCUIEV4dHJhIFBhcnQgMi8yINC/0YDQvtC/0YPRidC10L3QsC4="))())
    return
end
local Tabs = getgenv().FH_Tabs
if not Tabs then warn(loadstring(base64decode("W0ZIXSBGSF9UYWJzINC90LUg0L3QsNC50LTQtdC9Lg=="))()) return end
local _OnChangedRegistry = getgenv().FH_OnChangedRegistry or {}
getgenv().FH_OnChangedRegistry = _OnChangedRegistry
local function _regOnChanged(name, cb) _OnChangedRegistry[name] = cb end
local function _addOpt(container, method, name, opts, callback)
    local opt = container[method](container, name, opts)
    if opt and callback then
        opt:OnChanged(callback)
        _regOnChanged(name, callback)
    end
    return opt
end
local _uiRoot = function() return (gethui and gethui()) or CoreGui end
local Debris = Debris or game:GetService(loadstring(base64decode("RGVicmlz"))())

-- ============================================================
-- 1. TRADE HELPER
-- ============================================================
do
    getgenv().TH = getgenv().TH or {}
    local th = getgenv().TH
    th.TradeValues = th.TradeValues or {}
    th.On = false
    th.LoopThread = nil
    th.Loaded = false

    local function normalizeKey(str)
        if not str then return loadstring(base64decode(""))() end
        return str:lower():gsub(loadstring(base64decode("WyVzJV8nJS4tXQ=="))(), loadstring(base64decode(""))())
    end
    local function addValue(name, value)
        if not name or not value then return end
        local clean = name:gsub(loadstring(base64decode("PFtePl0rPg=="))(), loadstring(base64decode(""))()):match(loadstring(base64decode("XiVzKiguLSklcyok"))())
        if not clean or #clean <= 1 then return end
        th.TradeValues[clean] = value
        th.TradeValues[normalizeKey(clean)] = value
        if clean:sub(1, 3) == loadstring(base64decode("Qy4g"))() then
            local alt = loadstring(base64decode("Q2hyb21hIA=="))() .. clean:sub(4)
            th.TradeValues[alt] = value
            th.TradeValues[normalizeKey(alt)] = value
        elseif clean:sub(1, 7) == loadstring(base64decode("Q2hyb21hIA=="))() then
            local alt = loadstring(base64decode("Qy4g"))() .. clean:sub(8)
            th.TradeValues[alt] = value
            th.TradeValues[normalizeKey(alt)] = value
        end
    end
    local function fetchWithProxy(url)
        local list = {
            loadstring(base64decode("aHR0cHM6Ly9hcGkuY29kZXRhYnMuY29tL3YxL3Byb3h5P3F1ZXN0PQ=="))() .. url,
            loadstring(base64decode("aHR0cHM6Ly9jb3JzcHJveHkuaW8vPw=="))() .. url,
            loadstring(base64decode("aHR0cHM6Ly9hcGkuYWxsb3JpZ2lucy53aW4vcmF3P3VybD0="))() .. url,
            url,
        }
        for _, u in ipairs(list) do
            local body = nil
            local done = false
            task.spawn(function()
                local ok, r = pcall(function() return game:HttpGet(u, true) end)
                if ok and type(r) == loadstring(base64decode("c3RyaW5n"))() and #r > 300 then body = r end
                done = true
            end)
            local t0 = tick()
            while not done and tick() - t0 < 3 do task.wait(0.1) end
            if body then return body end
        end
        return nil
    end
    local function parseMM2Values(html)
        html = html:gsub(loadstring(base64decode("W1xyXG5d"))(), loadstring(base64decode("IA=="))())
        local n = 0
        for block in html:gmatch(loadstring(base64decode("PGRpdiVzK2NsYXNzPXN0YWNrYWJsZT4oLi0pPC9kaXY+"))()) do
            local valStr = block:match(loadstring(base64decode("VmFsdWU6JXMqKFslZCxdKyk="))())
            if valStr then
                local num = tonumber((valStr:gsub(loadstring(base64decode("LA=="))(), loadstring(base64decode(""))())))
                local name = block:match(loadstring(base64decode("PGI+KFtePF0rKTwvYj4="))())
                    or block:match('<span%s+class=loadstring(base64decode("W14="))()]+loadstring(base64decode("PihbXjxdKyk8L3NwYW4+JykKICAgICAgICAgICAgICAgICAgICBvciBibG9jazptYXRjaCg="))()<span%s+class=[^>]+>([^<]+)</span>loadstring(base64decode("KQogICAgICAgICAgICAgICAgICAgIG9yIGJsb2NrOm1hdGNoKA=="))()([%w%s%_'%.-]+)%s*<br>%s*Value:loadstring(base64decode("KQogICAgICAgICAgICAgICAgaWYgbmFtZSBhbmQgbnVtIHRoZW4KICAgICAgICAgICAgICAgICAgICBhZGRWYWx1ZShuYW1lLCBudW0pCiAgICAgICAgICAgICAgICAgICAgbiA9IG4gKyAxCiAgICAgICAgICAgICAgICBlbmQKICAgICAgICAgICAgZW5kCiAgICAgICAgZW5kCiAgICAgICAgaWYgbiA9PSAwIHRoZW4KICAgICAgICAgICAgZm9yIG5hbWUsIHZhbFN0ciBpbiBodG1sOmdtYXRjaCg="))()<b>([^<]+)</b>.-Value:%s*([%d,]+)loadstring(base64decode("KSBkbwogICAgICAgICAgICAgICAgbG9jYWwgbnVtID0gdG9udW1iZXIoKHZhbFN0cjpnc3ViKA=="))(),loadstring(base64decode("LCA="))()loadstring(base64decode("KSkpCiAgICAgICAgICAgICAgICBpZiBuYW1lIGFuZCBudW0gdGhlbiBhZGRWYWx1ZShuYW1lLCBudW0pOyBuID0gbiArIDEgZW5kCiAgICAgICAgICAgIGVuZAogICAgICAgIGVuZAogICAgICAgIHJldHVybiBuCiAgICBlbmQKICAgIGxvY2FsIGZ1bmN0aW9uIHBhcnNlTU0yQ2hlY2tlcihodG1sKQogICAgICAgIGh0bWwgPSBodG1sOmdzdWIo"))()[\r\n]loadstring(base64decode("LCA="))() loadstring(base64decode("KQogICAgICAgIGxvY2FsIG4gPSAwCiAgICAgICAgZm9yIG5hbWUsIHZhbFN0ciBpbiBodG1sOmdtYXRjaCgnPGRpdiVzK2NsYXNzPQ=="))()boxloadstring(base64decode("JXMraWQ9"))()([^loadstring(base64decode("XSsp"))().-class=loadstring(base64decode("aXRlbXZhbHVl"))()>%s*([%d,]+)%s*</span>') do
            local num = tonumber((valStr:gsub(loadstring(base64decode("LA=="))(), loadstring(base64decode(""))())))
            if name and num then addValue(name, num); n = n + 1 end
        end
        return n
    end
    local function fmtValue(v)
        if not v or v == 0 then return loadstring(base64decode("MA=="))() end
        if v >= 1000000 then return string.format(loadstring(base64decode("JS4xZk0="))(), v / 1000000) end
        if v >= 1000 then return string.format(loadstring(base64decode("JS4xZks="))(), v / 1000) end
        return tostring(v)
    end
    local function valueColor(v)
        if v >= 100000 then return Color3.fromRGB(255, 50, 50) end
        if v >= 10000 then return Color3.fromRGB(255, 100, 50) end
        if v >= 1000 then return Color3.fromRGB(255, 215, 0) end
        if v >= 100 then return Color3.fromRGB(0, 200, 100) end
        if v >= 10 then return Color3.fromRGB(100, 200, 255) end
        return Color3.fromRGB(180, 180, 180)
    end
    local function lookupValue(name)
        if not name then return 0 end
        if th.TradeValues[name] then return th.TradeValues[name] end
        local k = normalizeKey(name)
        return th.TradeValues[k] or 0
    end
    local function attachValueLabel(container, itemName)
        if not container then return end
        local old = container:FindFirstChild(loadstring(base64decode("RkhfVmFsdWVMYWJlbA=="))())
        if old then old:Destroy() end
        local kaDQmaZL = lookupValue(itemName)
        if kaDQmaZL == 0 then return end
        local lbl = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
        lbl.Name = loadstring(base64decode("RkhfVmFsdWVMYWJlbA=="))()
        lbl.Size = UDim2.new(0.96, 0, 0, 16)
        lbl.Position = UDim2.new(0.02, 0, 1, -18)
        lbl.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        lbl.BackgroundTransparency = 0.25
        lbl.Text = loadstring(base64decode("JA=="))() .. fmtValue(kaDQmaZL)
        lbl.TextColor3 = valueColor(kaDQmaZL)
        lbl.TextScaled = true
        lbl.Font = Enum.Font.GothamBold
        lbl.ZIndex = 1000
        lbl.Parent = container
        local c = Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), lbl)
        c.CornerRadius = UDim.new(0, 4)
    end
    local function processCard(obj)
        if not obj or not obj:IsA(loadstring(base64decode("R3VpT2JqZWN0"))()) then return end
        local container = obj:FindFirstChild(loadstring(base64decode("Q29udGFpbmVy"))()) or obj
        local name = nil
        local nameFrame = obj:FindFirstChild(loadstring(base64decode("SXRlbU5hbWU="))())
        if nameFrame then
            local lbl = nameFrame:FindFirstChild(loadstring(base64decode("TGFiZWw="))())
            if lbl and lbl.Text ~= loadstring(base64decode(""))() and lbl.Text ~= loadstring(base64decode("TG9hZGluZy4uLg=="))() then
                name = lbl.Text
            end
        end
        if not name and lookupValue(obj.Name) > 0 then name = obj.Name end
        if not name then
            for _, d in ipairs(obj:GetDescendants()) do
                if d:IsA(loadstring(base64decode("VGV4dExhYmVs"))()) and d.Name ~= loadstring(base64decode("RkhfVmFsdWVMYWJlbA=="))() and lookupValue(d.Text) > 0 then
                    name = d.Text
                    break
                end
            end
        end
        if name then attachValueLabel(container, name) end
    end
    local function scanContainer(cont)
        if not cont then return end
        local c = cont:FindFirstChild(loadstring(base64decode("Q29udGFpbmVy"))()) or cont
        for _, child in ipairs(c:GetChildren()) do
            if child:IsA(loadstring(base64decode("R3VpT2JqZWN0"))()) then processCard(child) end
        end
    end
    local function scanTradeGui()
        local pg = LocalPlayer:FindFirstChild(loadstring(base64decode("UGxheWVyR3Vp"))())
        if not pg then return end
        local main = pg:FindFirstChild(loadstring(base64decode("TWFpbkdVSQ=="))())
        if main then
            for _, d in ipairs(main:GetDescendants()) do
                if d:IsA(loadstring(base64decode("R3VpT2JqZWN0"))()) and d:FindFirstChild(loadstring(base64decode("SXRlbU5hbWU="))()) and d:FindFirstChild(loadstring(base64decode("Q29udGFpbmVy"))()) then
                    processCard(d)
                end
            end
        end
        local list = {pg:FindFirstChild(loadstring(base64decode("VHJhZGVHVUk="))()), pg:FindFirstChild(loadstring(base64decode("VHJhZGVHVUlfUGhvbmU="))())}
        for _, g in ipairs(list) do
            if g then
                local c = g:FindFirstChild(loadstring(base64decode("Q29udGFpbmVy"))())
                if c then
                    local t = c:FindFirstChild(loadstring(base64decode("VHJhZGU="))())
                    if t then
                        scanContainer(t:FindFirstChild(loadstring(base64decode("WW91ck9mZmVy"))()))
                        scanContainer(t:FindFirstChild(loadstring(base64decode("VGhlaXJPZmZlcg=="))()))
                    end
                end
            end
        end
    end
    local function loadValues()
        if th.Loaded then return end
        th.Loaded = true
        local sources = {
            {url = loadstring(base64decode("aHR0cHM6Ly9tbTJ2YWx1ZXMuY29tLz9wPWdvZGx5"))(), type = loadstring(base64decode("dmFsdWVz"))()},
            {url = loadstring(base64decode("aHR0cHM6Ly9tbTJ2YWx1ZXMuY29tLz9wPWNocm9tYQ=="))(), type = loadstring(base64decode("dmFsdWVz"))()},
            {url = loadstring(base64decode("aHR0cHM6Ly9tbTJ2YWx1ZXMuY29tLz9wPWFuY2llbnQ="))(), type = loadstring(base64decode("dmFsdWVz"))()},
            {url = loadstring(base64decode("aHR0cHM6Ly9tbTJ2YWx1ZXMuY29tLz9wPXVuaXF1ZQ=="))(), type = loadstring(base64decode("dmFsdWVz"))()},
            {url = loadstring(base64decode("aHR0cHM6Ly9tbTJ2YWx1ZXMuY29tLz9wPWxlZ2VuZA=="))(), type = loadstring(base64decode("dmFsdWVz"))()},
            {url = loadstring(base64decode("aHR0cHM6Ly9tbTJ2YWx1ZXMuY29tLz9wPXJhcmU="))(), type = loadstring(base64decode("dmFsdWVz"))()},
            {url = loadstring(base64decode("aHR0cHM6Ly9tbTJ2YWx1ZXMuY29tLz9wPXZpbnRhZ2U="))(), type = loadstring(base64decode("dmFsdWVz"))()},
            {url = loadstring(base64decode("aHR0cHM6Ly9tbTJ2YWx1ZXMuY29tLz9wPXBldHM="))(), type = loadstring(base64decode("dmFsdWVz"))()},
            {url = loadstring(base64decode("aHR0cHM6Ly9tbTJ2YWx1ZXMuY29tLz9wPW1pc2M="))(), type = loadstring(base64decode("dmFsdWVz"))()},
            {url = loadstring(base64decode("aHR0cHM6Ly9tbTJjaGVja2VyLmNvbS9nb2RsaWVzLmh0bWw="))(), type = loadstring(base64decode("Y2hlY2tlcg=="))()},
            {url = loadstring(base64decode("aHR0cHM6Ly9tbTJjaGVja2VyLmNvbS9hbmNpZW50cy5odG1s"))(), type = loadstring(base64decode("Y2hlY2tlcg=="))()},
            {url = loadstring(base64decode("aHR0cHM6Ly9tbTJjaGVja2VyLmNvbS92aW50YWdlcy5odG1s"))(), type = loadstring(base64decode("Y2hlY2tlcg=="))()},
            {url = loadstring(base64decode("aHR0cHM6Ly9tbTJjaGVja2VyLmNvbS9sZWdlbmRhcmllcy5odG1s"))(), type = loadstring(base64decode("Y2hlY2tlcg=="))()},
            {url = loadstring(base64decode("aHR0cHM6Ly9tbTJjaGVja2VyLmNvbS9wZXRzLmh0bWw="))(), type = loadstring(base64decode("Y2hlY2tlcg=="))()},
            {url = loadstring(base64decode("aHR0cHM6Ly9tbTJjaGVja2VyLmNvbS9vdGhlci5odG1s"))(), type = loadstring(base64decode("Y2hlY2tlcg=="))()},
        }
        task.spawn(function()
            local loaded = 0
            for _, src in ipairs(sources) do
                task.spawn(function()
                    local html = fetchWithProxy(src.url)
                    if html then
                        if src.type == loadstring(base64decode("dmFsdWVz"))() then parseMM2Values(html)
                        else parseMM2Checker(html) end
                    end
                    loaded = loaded + 1
                    if loaded == #sources then
                        print(loadstring(base64decode("W0ZIIFRyYWRlSGVscGVyXSBMb2FkZWQg"))()..tostring(loaded)..loadstring(base64decode("IHNvdXJjZXMu"))())
                        Notify(loadstring(base64decode("VHJhZGUgSGVscGVy"))(), loadstring(base64decode("0JfQvdCw0YfQtdC90LjRjyDQt9Cw0LPRgNGD0LbQtdC90Ys="))(), 2)
                    end
                end)
            end
        end)
    end
    local function loop()
        while th.On do
            task.wait(0.5)
            pcall(scanTradeGui)
        end
        th.LoopThread = nil
    end
    function th.Start()
        if not th.On then
            th.On = true
            loadValues()
            th.LoopThread = task.spawn(loop)
        end
    end
    function th.Stop()
        th.On = false
        if th.LoopThread then
            pcall(task.cancel, th.LoopThread)
            th.LoopThread = nil
        end
    end

    local thSec = Tabs.Visual:AddSection({Name=loadstring(base64decode("VHJhZGUgSGVscGVy"))()})
    _addOpt(thSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("VEhPbg=="))(), {Title=loadstring(base64decode("VHJhZGUgSGVscGVyIChNTTIgVmFsdWVzKQ=="))(), Default=false}, function(v)
        if v then
            th.Start()
            Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("VHJhZGUgSGVscGVyINCS0JrQmw=="))(), 2)
        else
            th.Stop()
            Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("VHJhZGUgSGVscGVyINCS0KvQmtCb"))(), 2)
        end
    end)
    thSec:AddButton({Title=loadstring(base64decode("0J7QsdC90L7QstC40YLRjCDQt9C90LDRh9C10L3QuNGP"))(), Callback=function()
        th.Loaded = false
        th.TradeValues = {}
        loadValues()
        Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("0J7QsdC90L7QstC70Y/RjiDQt9C90LDRh9C10L3QuNGPLi4u"))(), 3)
    end})
    thSec:AddButton({Title=loadstring(base64decode("0J/QvtC60LDQt9Cw0YLRjCDRgdGH0ZHRgtGH0LjQug=="))(), Callback=function()
        local n = 0
        for _ in pairs(th.TradeValues) do n = n + 1 end
        Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("0JfQsNCz0YDRg9C20LXQvdC+INC/0YDQtdC00LzQtdGC0L7Qsjog"))()..n, 3)
    end})
end

-- ============================================================
-- 2. BIG EMOTE LIST (ФИКС)
-- ============================================================
do
    local emoteTab = Tabs.Animations
    local emoteSec = emoteTab:AddSection({Name=loadstring(base64decode("0K3QvNC+0YbQuNC4ICjRgNCw0YHRiNC40YDQtdC90L3Ri9C1KQ=="))()})

    local EMOTE_LIST = {
        [loadstring(base64decode("QXJvdW5kIFRvd24="))()]=3576747102, [loadstring(base64decode("RmFzaGlvbmFibGU="))()]=3576745472, [loadstring(base64decode("U3dpc2g="))()]=3821527813,
        [loadstring(base64decode("VG9wIFJvY2s="))()]=3570535774, [loadstring(base64decode("RmFuY3kgRmVldA=="))()]=3934988903, [loadstring(base64decode("SWRvbA=="))()]=4102317848,
        [loadstring(base64decode("U25lYWt5"))()]=3576754235, [loadstring(base64decode("Um9ib3Q="))()]=3576721660, [loadstring(base64decode("TG91ZGVy"))()]=3576751796,
        [loadstring(base64decode("VHdpcmw="))()]=3716633898, [loadstring(base64decode("Qm9keWJ1aWxkZXI="))()]=3994130516, [loadstring(base64decode("SmFja3M="))()]=3570649048,
        [loadstring(base64decode("U2h1ZmZsZQ=="))()]=4391208058, [loadstring(base64decode("RG9ya3kgRGFuY2U="))()]=4212499637, [loadstring(base64decode("RGl6enk="))()]=3934986896,
        [loadstring(base64decode("VA=="))()]=3576719440, [loadstring(base64decode("QWlyIERhbmNl"))()]=4646302011, [loadstring(base64decode("VE1OVCBEYW5jZQ=="))()]=18665886405,
        [loadstring(base64decode("TGluZSBEYW5jZQ=="))()]=4049646104, [loadstring(base64decode("QnJlYWsgRGFuY2U="))()]=5915773992, [loadstring(base64decode("Wm9tYmll"))()]=4212496830,
        [loadstring(base64decode("QmFieSBEYW5jZQ=="))()]=4272484885, [loadstring(base64decode("Q2hhIENoYQ=="))()]=6865013133, [loadstring(base64decode("RG9scGhpbiBEYW5jZQ=="))()]=5938365243,
        [loadstring(base64decode("WQ=="))()]=4391211308, [loadstring(base64decode("U2FtYmE="))()]=6869813008,
        [loadstring(base64decode("U2lkZSB0byBTaWRl"))()]=3762641826, [loadstring(base64decode("VHJlZQ=="))()]=4049634387, [loadstring(base64decode("R29kbGlrZQ=="))()]=3823158750,
        [loadstring(base64decode("S2VlcGluZyBUaW1l"))()]=4646306072, [loadstring(base64decode("VGFudHJ1bQ=="))()]=5104374556, [loadstring(base64decode("Um9jayBPbg=="))()]=5915782672,
        [loadstring(base64decode("SGVybyBMYW5kaW5n"))()]=5104377791, [loadstring(base64decode("RmlzaGluZw=="))()]=3994129128, [loadstring(base64decode("Rmxvc3MgRGFuY2U="))()]=5917570207,
        [loadstring(base64decode("R2V0IE91dA=="))()]=3934984583, [loadstring(base64decode("VmljdG9yeSBEYW5jZQ=="))()]=15506503658, [loadstring(base64decode("TW9ua2V5"))()]=3716636630,
        [loadstring(base64decode("R3JlYXRlc3Q="))()]=3762654854, [loadstring(base64decode("SnVtcGluZyBXYXZl"))()]=4940602656, [loadstring(base64decode("SGFoYQ=="))()]=4102315500,
        [loadstring(base64decode("QWdyZWU="))()]=4849487550, [loadstring(base64decode("TWluaSBLb25n"))()]=17000058939, [loadstring(base64decode("RmVzdGl2ZSBEYW5jZQ=="))()]=15679955281,
        [loadstring(base64decode("SnVtcGluZyBDaGVlcg=="))()]=5895009708, [loadstring(base64decode("U2xlZXA="))()]=4689362868, [loadstring(base64decode("RGlzYWdyZWU="))()]=4849495710,
        [loadstring(base64decode("SGFwcHk="))()]=4849499887, [loadstring(base64decode("Qm9yZWQ="))()]=5230661597, [loadstring(base64decode("SGlnaCBXYXZl"))()]=5915776835,
        [loadstring(base64decode("Q293ZXI="))()]=4940597758, [loadstring(base64decode("Um9jayBuIFJvbGw="))()]=15506496093, [loadstring(base64decode("U2h5"))()]=3576717965,
        [loadstring(base64decode("Q3VydHN5"))()]=4646306583, [loadstring(base64decode("Q2VsZWJyYXRl"))()]=3994127840, [loadstring(base64decode("Q29uZnVzZWQ="))()]=4940592718,
        [loadstring(base64decode("QmVja29u"))()]=5230615437, [loadstring(base64decode("U2Fk"))()]=4849502101, [loadstring(base64decode("Q2hhLUNoYQ=="))()]=3696764866,
        [loadstring(base64decode("Q2hpY2tlbiBEYW5jZQ=="))()]=4849493309, [loadstring(base64decode("U2FuZHdpY2ggRGFuY2U="))()]=4390121879, [loadstring(base64decode("U2FsdXRl"))()]=3360689775,
        [loadstring(base64decode("U3RhZGl1bQ=="))()]=3360686498, [loadstring(base64decode("QnVubnkgSG9w"))()]=4646296016, [loadstring(base64decode("U3dhZyBXYWxr"))()]=10478377385,
        [loadstring(base64decode("U3VwZXJoZXJvIFJldmVhbA=="))()]=3696759798, [loadstring(base64decode("SHlwZSBEYW5jZQ=="))()]=3696757129, [loadstring(base64decode("SGVpc21hbiBQb3Nl"))()]=3696763549,
        [loadstring(base64decode("UG9pbnQy"))()]=3576823880, [loadstring(base64decode("VnJvb20gVnJvb20="))()]=18526410572, [loadstring(base64decode("VGlsdA=="))()]=3360692915,
        [loadstring(base64decode("QXBwbGF1ZA=="))()]=5915779043, [loadstring(base64decode("SGVsbG8="))()]=3576686446, [loadstring(base64decode("VmFucyBPbGxpZQ=="))()]=18305539673,
        [loadstring(base64decode("U2hydWc="))()]=3576968026, [loadstring(base64decode("V2FsbHkgV2VzdA=="))()]=133948663586698, [loadstring(base64decode("VGFrZSBUaGUgTA=="))()]=123159156696507,
        [loadstring(base64decode("QmVsbHkgRGFuY2luZw=="))()]=131939729732240, [loadstring(base64decode("Q2FyYW1lbGxEYW5zZW4="))()]=93105950995997,
        [loadstring(base64decode("UmFtYnVuY3Rpb3Vz"))()]=134311528115559, [loadstring(base64decode("QmFsbGlu"))()]=96293409369770,
        [loadstring(base64decode("TnlhbiBOeWFuIQ=="))()]=73796726960568, [loadstring(base64decode("U2tpYmlkaQ=="))()]=124828909173982,
        [loadstring(base64decode("Q2hyb25vc2hpZnQ="))()]=92600655160976, [loadstring(base64decode("RmxvYXRpbmcgb24gQ2xvdWRz"))()]=111426928948833,
        [loadstring(base64decode("SmVyc2V5IEpvZQ=="))()]=134149640725489, [loadstring(base64decode("VmlydHVhbCBJbnNhbml0eQ=="))()]=83261816934732,
        [loadstring(base64decode("RG9vZGxlIERhbmNl"))()]=107091254142209, [loadstring(base64decode("Q2x1YiBQZW5ndWlu"))()]=98099211500155,
        [loadstring(base64decode("S2F6b3Rza3k="))()]=97629500912487, [loadstring(base64decode("TWlrdSBEYW5jZQ=="))()]=117734400993750,
        [loadstring(base64decode("R2FuZ25hbSBTdHlsZQ=="))()]=77205409178702, [loadstring(base64decode("UHVzaC1VcA=="))()]=117922227854118,
        [loadstring(base64decode("U3BsaXQ="))()]=98522218962476, [loadstring(base64decode("UFJPWElNQQ=="))()]=81390693780805,
        [loadstring(base64decode("SGVhZEJhbmdpbmc="))()]=87447252507832, [loadstring(base64decode("QXNzdW1wdGlvbnM="))()]=127507691649322,
        [loadstring(base64decode("SnVtcHN0eWxl"))()]=99563839802389, [loadstring(base64decode("RmxvcHBpbmcgRmlzaA=="))()]=133142324349281,
        [loadstring(base64decode("RmFuY3kgRmVldHM="))()]=124512151372711, [loadstring(base64decode("QWJzb2x1dGUgQ2luZW1h"))()]=97258018304125,
        [loadstring(base64decode("R3JpZGR5"))()]=116065653184749, [loadstring(base64decode("UGFyYW5vaWQ="))()]=123407922818447,
        [loadstring(base64decode("S2F3YWlpIEdyb292ZQ=="))()]=77152953688098, [loadstring(base64decode("U21lZXpl"))()]=131683926643291,
        [loadstring(base64decode("T25pb24="))()]=113890289455724, [loadstring(base64decode("VGhpbmtpbmc="))()]=124584711308900,
        [loadstring(base64decode("U2xlbmRlcm1hbg=="))()]=81926508907412, [loadstring(base64decode("TWFjYXJlbmE="))()]=91274761264433,
        [loadstring(base64decode("Uk9OQUxETw=="))()]=97547486465713, [loadstring(base64decode("U2xpY2tiYWNr"))()]=103789826265487,
        [loadstring(base64decode("RGVmYXVsdCBEYW5jZQ=="))()]=80877772569772, [loadstring(base64decode("RmFtaWx5IEd1eQ=="))()]=78459263478161,
        [loadstring(base64decode("U3BvbmdlQm9iIFNodWZmbGU="))()]=107899954696611, [loadstring(base64decode("RWxlY3RybyBTaHVmZmxl"))()]=96426537876059,
        [loadstring(base64decode("Rm9yZWlnbiBTaHVmZmxl"))()]=101507732056031, [loadstring(base64decode("Q2FpcGlyaW5oYQ=="))()]=100165303717371,
        [loadstring(base64decode("U3F1aWR3YXJkIFllbGw="))()]=109244554368414, [loadstring(base64decode("VGV0byBEYW5jZQ=="))()]=93031502567721,
        [loadstring(base64decode("TWljaGFlbCBNeWVycw=="))()]=88229016850146, [loadstring(base64decode("VG9ydHVyZSBEYW5jZQ=="))()]=116099356619436,
        [loadstring(base64decode("TWV3aW5nIC8gTW9nZ2luZw=="))()]=135493514352956, [loadstring(base64decode("Q3V0ZSBKdW1w"))()]=80556794144838,
        [loadstring(base64decode("QmlsbHkgQm91bmNl"))()]=126516908191316, [loadstring(base64decode("RGlvIFBvc2U="))()]=76736978166708,
        [loadstring(base64decode("R29sZGVuIEZyZWRkeQ=="))()]=122463450997235, [loadstring(base64decode("TGV0aGFsIERhbmNl"))()]=77108921633993,
        [loadstring(base64decode("UGx1ZyBXYWxr"))()]=100359724990859, [loadstring(base64decode("QXQgRWFzZQ=="))()]=76993139936388,
        [loadstring(base64decode("Q29uZ2E="))()]=97547955535086, [loadstring(base64decode("QmFycmVs"))()]=84511772437190,
        [loadstring(base64decode("SGVsaWNvcHRlcg=="))()]=84555218084038, [loadstring(base64decode("SmVyc2V5IEpvZTI="))()]=115782117564871,
        [loadstring(base64decode("Q2FsaWZvcm5pYSBHaXJs"))()]=132074413582912, [loadstring(base64decode("U2hvY2tlZCBtZW1l"))()]=129501229484294,
        [loadstring(base64decode("Q2FyIFRyYW5zZm9ybWF0aW9u"))()]=96887377943085, [loadstring(base64decode("SW5zYW5pdHk="))()]=129843344424281,
        [loadstring(base64decode("SG9ub3JlZCBPbmU="))()]=121643381580730, [loadstring(base64decode("U3VrdW5h"))()]=91839607010745,
        [loadstring(base64decode("RHJvcHBlcg=="))()]=130358790702800, [loadstring(base64decode("QmUgTm90IEFmcmFpZA=="))()]=70635223083942,
        [loadstring(base64decode("SGVsaWNvcHRlcjI="))()]=119431985170060, [loadstring(base64decode("TnlhIEFuaW1lIERhbmNl"))()]=126647057611522,
        [loadstring(base64decode("RG8gdGhhdCB0aGFuZw=="))()]=113772829398170, [loadstring(base64decode("U3F1YXQ/"))()]=95441477641149,
    }

    local emoteNames = {}
    for name in pairs(EMOTE_LIST) do emoteNames[#emoteNames+1] = name end
    table.sort(emoteNames, function(a,b) return a:lower() < b:lower() end)

    local drop = emoteSec:AddDropdown(loadstring(base64decode("RkhCaWdFbW90ZVBpY2s="))(), {
        Title=loadstring(base64decode("0JLRi9Cx0YDQsNGC0Ywg0Y3QvNC+0YbQuNGO"))(),
        Values=emoteNames,
        Default=emoteNames[1] or loadstring(base64decode("RGVmYXVsdCBEYW5jZQ=="))(),
    })

    local currentTrack = nil
    local currentName = nil
    local stopCurrent = function()
        if currentTrack then
            pcall(function() currentTrack:Stop(0) end)
            pcall(function() currentTrack:Destroy() end)
            currentTrack = nil
        end
        currentName = nil
    end

    -- ФИКС: гарантированный Animator + fallback на Humanoid
    local function ensureAnimator(hum)
        local animator = hum:FindFirstChildOfClass(loadstring(base64decode("QW5pbWF0b3I="))())
        if not animator then
            animator = Instance.new(loadstring(base64decode("QW5pbWF0b3I="))())
            animator.Parent = hum
        end
        return animator
    end
    local function normalizeAnimId(id)
        if not id then return nil end
        local s = tostring(id)
        -- если уже rbxassetid:// или http:// — оставляем
        if s:find(loadstring(base64decode("Oi8v"))()) then return s end
        -- чистим всё кроме цифр
        local digits = s:gsub(loadstring(base64decode("JUQ="))(), loadstring(base64decode(""))())
        if digits == loadstring(base64decode(""))() then return nil end
        return loadstring(base64decode("cmJ4YXNzZXRpZDovLw=="))() .. digits
    end
    local function playEmoteByName(name)
        local id = EMOTE_LIST[name]
        if not id then
            Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("0K3QvNC+0YbQuNGPINC90LUg0L3QsNC50LTQtdC90LA6IA=="))()..tostring(name), 2)
            return
        end
        local c = LocalPlayer.Character
        local hum = c and c:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
        if not hum then
            Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0J/QtdGA0YHQvtC90LDQtiDQvdC1INC30LDQs9GA0YPQttC10L0="))(),2)
            return
        end

        local assetId = normalizeAnimId(id)
        if not assetId then
            Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0J3QtdC60L7RgNGA0LXQutGC0L3Ri9C5IElEOiA="))()..tostring(id), 3)
            return
        end

        stopCurrent()

        -- Останавливаем дефолтные playing-треки (walk/run/idle), чтобы не мешали
        local function stopDefaultTracks()
            local animator = hum:FindFirstChildOfClass(loadstring(base64decode("QW5pbWF0b3I="))())
            if not animator then return end
            local ok, tracks = pcall(function() return animator:GetPlayingAnimationTracks() end)
            if not ok or type(tracks) ~= loadstring(base64decode("dGFibGU="))() then return end
            for _, tr in ipairs(tracks) do
                pcall(function()
                    local a = tr.Animation
                    local aid = a and a.AnimationId or loadstring(base64decode(""))()
                    -- не трогаем только что загруженную
                    if aid ~= assetId then
                        tr:Stop(0.15)
                    end
                end)
            end
        end

        local anim = Instance.new(loadstring(base64decode("QW5pbWF0aW9u"))())
        anim.AnimationId = assetId

        local animator = ensureAnimator(hum)

        local okLoad, track = pcall(function() return animator:LoadAnimation(anim) end)
        -- fallback: если Animator не смог, пробуем через Humanoid напрямую (устаревший, но иногда единственный путь)
        if not okLoad or not track then
            local okH, trackH = pcall(function() return hum:LoadAnimation(anim) end)
            if okH and trackH then
                track = trackH
                okLoad = true
            end
        end

        if not okLoad or not track then
            anim:Destroy()
            Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("0J3QtSDRg9C00LDQu9C+0YHRjCDQt9Cw0LPRgNGD0LfQuNGC0Yw6IA=="))()..name, 3)
            return
        end

        track.Priority = Enum.AnimationPriority.Action4
        track.Looped = true

        local played = false
        pcall(function()
            track:Play(0.1, 1, 1)
            played = true
        end)
        if not played then
            pcall(function()
                track:Play()
                played = true
            end)
        end

        anim:Destroy()

        if played then
            currentTrack = track
            currentName = name
            stopDefaultTracks()
            Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("0K3QvNC+0YbQuNGPOiA="))()..name, 2)
        else
            Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("0J3QtSDRg9C00LDQu9C+0YHRjCDQv9GA0L7QuNCz0YDQsNGC0Yw6IA=="))()..name, 3)
        end
    end

    emoteSec:AddButton({Title=loadstring(base64decode("0JfQsNC/0YPRgdGC0LjRgtGMINGN0LzQvtGG0LjRjg=="))(), Callback=function()
        local v = drop.Value
        if type(v) == loadstring(base64decode("dGFibGU="))() then v = v[1] end
        if type(v) == loadstring(base64decode("c3RyaW5n"))() then playEmoteByName(v) end
    end})
    emoteSec:AddButton({Title=loadstring(base64decode("0J7RgdGC0LDQvdC+0LLQuNGC0Ywg0Y3QvNC+0YbQuNGO"))(), Callback=function()
        stopCurrent()
        Notify(loadstring(base64decode("Rkg="))(),loadstring(base64decode("0K3QvNC+0YbQuNGPINC+0YHRgtCw0L3QvtCy0LvQtdC90LA="))(), 2)
    end})

    local favorites = {}
    local favFile = loadstring(base64decode("Rm9ydG5pSHViX0NvbmZpZ3MvZW1vdGVfZmF2b3JpdGVzLnR4dA=="))()
    local function saveFav()
        if type(writefile) ~= loadstring(base64decode("ZnVuY3Rpb24="))() then return end
        local lines = {}
        for k in pairs(favorites) do lines[#lines+1] = k end
        pcall(writefile, favFile, table.concat(lines, loadstring(base64decode("XG4="))()))
    end
    local function loadFav()
        if type(readfile) ~= loadstring(base64decode("ZnVuY3Rpb24="))() or type(isfile) ~= loadstring(base64decode("ZnVuY3Rpb24="))() then return end
        if not pcall(isfile, favFile) then return end
        local ok, data = pcall(readfile, favFile)
        if not ok or type(data) ~= loadstring(base64decode("c3RyaW5n"))() then return end
        for line in data:gmatch(loadstring(base64decode("W15cclxuXSs="))()) do
            if line ~= loadstring(base64decode(""))() then favorites[line] = true end
        end
    end
    loadFav()
    emoteSec:AddButton({Title=loadstring(base64decode("0JTQvtCx0LDQstC40YLRjC/Rg9Cx0YDQsNGC0Ywg0LjQtyDQuNC30LHRgNCw0L3QvdC+0LPQvg=="))(), Callback=function()
        local v = drop.Value
        if type(v)==loadstring(base64decode("dGFibGU="))() then v=v[1] end
        if type(v)~=loadstring(base64decode("c3RyaW5n"))() or v==loadstring(base64decode(""))() then return end
        favorites[v] = not favorites[v] or nil
        saveFav()
        Notify(loadstring(base64decode("Rkg="))(), favorites[v] and (loadstring(base64decode("0JTQvtCx0LDQstC70LXQvdC+OiA="))()..v) or (loadstring(base64decode("0KPQtNCw0LvQtdC90L46IA=="))()..v), 2)
    end})
    emoteSec:AddButton({Title=loadstring(base64decode("0J/QvtC60LDQt9Cw0YLRjCDQuNC30LHRgNCw0L3QvdC+0LU="))(), Callback=function()
        local list = {}
        for k in pairs(favorites) do list[#list+1] = k end
        if #list == 0 then
            Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("0JjQt9Cx0YDQsNC90L3QvtC1INC/0YPRgdGC0L4="))(), 2)
        else
            table.sort(list)
            pcall(function() drop:SetValues(list); drop:Generate() end)
            Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("0J/QvtC60LDQt9Cw0L3QviA="))()..#list..loadstring(base64decode("INC40LfQsdGA0LDQvdC90YvRhQ=="))(), 2)
        end
    end})
end

-- ============================================================
-- 3. WATER PROTECTION
-- ============================================================
do
    local offDamageWater = false
    local disabledConnections = {}
    local modifiedWaterParts = {}

    local function isWater(instance)
        if not instance then return false end
        local n = instance.Name:lower()
        if n:find(loadstring(base64decode("d2F0ZXI="))()) or n:find(loadstring(base64decode("cml2ZXI="))()) or n:find(loadstring(base64decode("b2NlYW4="))()) then return true end
        if instance:FindFirstChild(loadstring(base64decode("U3BsYXNo"))()) or instance:FindFirstChild(loadstring(base64decode("SGl0V2F0ZXI="))()) then return true end
        return false
    end
    local function neutralize(instance)
        if not instance or not instance:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then return end
        if modifiedWaterParts[instance] == nil then
            modifiedWaterParts[instance] = instance.CanTouch
        end
        instance.CanTouch = false
        if getconnections then
            pcall(function()
                for _, c in ipairs(getconnections(instance.Touched)) do
                    c:Disable()
                    table.insert(disabledConnections, c)
                end
            end)
        end
    end
    local function applyAll()
        for _, d in ipairs(Workspace:GetDescendants()) do
            if d:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
                local p = d
                while p and p ~= Workspace do
                    if isWater(p) then
                        neutralize(d)
                        break
                    end
                    p = p.Parent
                end
            end
        end
    end
    local function restoreAll()
        for part, ct in pairs(modifiedWaterParts) do
            if part and part.Parent then
                pcall(function() part.CanTouch = ct end)
            end
        end
        table.clear(modifiedWaterParts)
        for _, c in ipairs(disabledConnections) do
            pcall(function() c:Enable() end)
        end
        table.clear(disabledConnections)
    end
    Workspace.DescendantAdded:Connect(function(d)
        if offDamageWater and d:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
            task.spawn(function()
                task.wait()
                local p = d
                while p and p ~= Workspace do
                    if isWater(p) then neutralize(d); break end
                    p = p.Parent
                end
            end)
        end
    end)

    local utilsSec = Tabs.Utility:AddSection({Name=loadstring(base64decode("V2F0ZXIgUHJvdGVjdGlvbg=="))()})
    _addOpt(utilsSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("V2F0ZXJQcm90T24="))(), {Title=loadstring(base64decode("T2ZmIERhbWFnZSBXYXRlcg=="))(), Default=false}, function(v)
        offDamageWater = v
        if v then
            applyAll()
            Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("0JfQsNGJ0LjRgtCwINC+0YIg0LLQvtC00Ysg0JLQmtCb"))(), 2)
        else
            restoreAll()
            Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("0JfQsNGJ0LjRgtCwINC+0YIg0LLQvtC00Ysg0JLQq9Ca0Js="))(), 2)
        end
    end)
end

-- ============================================================
-- 4. FADE DISABLER
-- ============================================================
do
    local savedFadeGuis = ReplicatedStorage:FindFirstChild(loadstring(base64decode("RkhfU2F2ZWRGYWRlR3Vpcw=="))())
    if not savedFadeGuis then
        savedFadeGuis = Instance.new(loadstring(base64decode("Rm9sZGVy"))())
        savedFadeGuis.Name = loadstring(base64decode("RkhfU2F2ZWRGYWRlR3Vpcw=="))()
        savedFadeGuis.Parent = ReplicatedStorage
    end
    local fadeNames = {CameraFade=true, Fade=true, SpawnFade=true, DeathFade=true}
    local tracked = {}
    local conn = nil

    local function handle(obj)
        if not obj or not obj:IsDescendantOf(game) then return end
        if obj:IsDescendantOf(savedFadeGuis) then return end
        if fadeNames[obj.Name] then
            if not tracked[obj] then tracked[obj] = obj.Parent end
            obj.Parent = savedFadeGuis
        end
    end
    local function apply()
        local pg = LocalPlayer:FindFirstChild(loadstring(base64decode("UGxheWVyR3Vp"))())
        if not pg then return end
        for _, d in ipairs(pg:GetDescendants()) do handle(d) end
        if not conn then
            conn = pg.DescendantAdded:Connect(handle)
        end
    end
    local function restore()
        if conn then conn:Disconnect(); conn = nil end
        for obj, parent in pairs(tracked) do
            if obj and obj.Parent == savedFadeGuis then
                if parent and parent:IsDescendantOf(game) then
                    obj.Parent = parent
                else
                    local pg = LocalPlayer:FindFirstChild(loadstring(base64decode("UGxheWVyR3Vp"))())
                    if pg then obj.Parent = pg end
                end
            end
        end
        table.clear(tracked)
    end

    local utilsSec = Tabs.Utility:AddSection({Name=loadstring(base64decode("RmFkZSBEaXNhYmxlcg=="))()})
    _addOpt(utilsSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("RmFkZURpc2FibGVyT24="))(), {Title=loadstring(base64decode("0KPQsdGA0LDRgtGMINGH0ZHRgNC90YvQuSDRjdC60YDQsNC9ICjRgNCw0YHRiNC40YDQtdC90L3Ri9C5KQ=="))(), Default=false}, function(v)
        if v then
            apply()
            Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("RmFkZSBEaXNhYmxlciDQktCa0Js="))(), 2)
        else
            restore()
            Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("RmFkZSBEaXNhYmxlciDQktCr0JrQmw=="))(), 2)
        end
    end)
end

-- ============================================================
-- 5. ANTI-COIN
-- ============================================================
do
    local antiCoinOn = false
    local saved = {}
    local function hideCoin(part)
        if not saved[part] then
            saved[part] = {CanTouch = part.CanTouch, CanCollide = part.CanCollide, Transparency = part.Transparency}
        end
        part.CanTouch = false
        part.CanCollide = false
        part.Transparency = 1
    end
    local function scan()
        local m2 = Workspace:FindFirstChild(loadstring(base64decode("TWFuc2lvbjI="))())
        if m2 then m2 = m2:FindFirstChild(loadstring(base64decode("Q29pbkNvbnRhaW5lcg=="))()) end
        if not m2 then
            for _, d in ipairs(Workspace:GetDescendants()) do
                if d:IsA(loadstring(base64decode("TW9kZWw="))()) and d.Name:lower():find(loadstring(base64decode("Y29pbg=="))()) then
                    for _, p in ipairs(d:GetDescendants()) do
                        if p:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then hideCoin(p) end
                    end
                end
            end
        else
            for _, d in ipairs(m2:GetDescendants()) do
                if d:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then hideCoin(d) end
            end
        end
    end
    local function restore()
        for part, o in pairs(saved) do
            if part and part.Parent then
                pcall(function()
                    part.CanTouch = o.CanTouch
                    part.CanCollide = o.CanCollide
                    part.Transparency = o.Transparency
                end)
            end
        end
        table.clear(saved)
    end

    local utilsSec = Tabs.Utility:AddSection({Name=loadstring(base64decode("QW50aS1Db2lu"))()})
    _addOpt(utilsSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("QW50aUNvaW5Pbg=="))(), {Title=loadstring(base64decode("0KHQutGA0YvRgtGMINC80L7QvdC10YLRiw=="))(), Default=false}, function(v)
        antiCoinOn = v
        if v then
            task.spawn(function()
                while antiCoinOn do
                    pcall(scan)
                    task.wait(0.5)
                end
            end)
            Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("QW50aS1Db2luINCS0JrQmw=="))(), 2)
        else
            restore()
            Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("QW50aS1Db2luINCS0KvQmtCb"))(), 2)
        end
    end)
end

-- ============================================================
-- 6. CUSTOM GUN MODELS
-- ============================================================
do
    local gunModelCache = {}
    local customModelEnabled = false
    local selectedModelName = loadstring(base64decode("QVdQ"))()
    local Models = {}

    do local a={id=loadstring(base64decode("NDUzMTM5NTI3NQ=="))()} a.rot=CFrame.Angles(0,0,0) a.pos=CFrame.new(0,0,-0.5) Models.AWP=a end
    do local a={id=loadstring(base64decode("NTEwMjcxNDAzOQ=="))()} a.rot=CFrame.Angles(0,math.pi,0) a.pos=CFrame.new(0,0,0.5) Models.Pistol=a end
    do local a={id=loadstring(base64decode("NTI5NDEzMTI0Mw=="))()} a.rot=CFrame.Angles(0,math.pi,0) a.pos=CFrame.new(0,0,0.8) Models.Shotgun=a end
    do local a={id=loadstring(base64decode("NTQyNjk5NzAz"))()} a.rot=CFrame.Angles(0,math.pi,0) a.pos=CFrame.new(0,0,0.2) Models.RayGun=a end
    do local a={id=loadstring(base64decode("MTI3MjAwNzk4Mjc5ODEy"))()} a.rot=CFrame.Angles(math.pi/2,0,-math.pi/2) a.pos=CFrame.new(0,-0.3,0.3) Models[loadstring(base64decode("QUstNDc="))()]=a end
    do local a={id=loadstring(base64decode("MTg2MTA5Nzg3MDk="))()} a.rot=CFrame.Angles(0,0,0) a.pos=CFrame.new(0,0,-0.3) Models.PinkGun=a end
    do local a={id=loadstring(base64decode("MTA2NTY4MDYwOTY="))()} a.rot=CFrame.Angles(-math.pi/2,math.pi/2,math.pi/2) a.pos=CFrame.new(2.1,0,-0.3) Models.FlameGun=a end
    do local a={id=loadstring(base64decode("NjI5MzI2MjI="))()} a.rot=CFrame.Angles(math.pi/2,0,0) a.pos=CFrame.new(0,0,0) Models.MiniBlackGun=a end
    do local a={id=loadstring(base64decode("ODc1OTQxNDM4MDQzMDA="))()} a.rot=CFrame.Angles(-math.pi/2,math.pi/2,math.pi/2) a.pos=CFrame.new(0,-0.3,0.5) Models.BlueGun=a end
    do local a={id=loadstring(base64decode("MTI4OTkyOTY2MTM="))()} a.rot=CFrame.Angles(0,0,0) a.pos=CFrame.new(0,0,-1.3) Models[loadstring(base64decode("QmlnVVNQLVM="))()]=a end
    do local a={id=loadstring(base64decode("MTI5Nzg1NjgzOA=="))()} a.rot=CFrame.Angles(math.pi/2,0,0) a.pos=CFrame.new(0,-0.3,0) Models.GreenGun=a end

    local MODEL_LIST = {
        loadstring(base64decode("QVdQ"))(), loadstring(base64decode("UGlzdG9s"))(), loadstring(base64decode("U2hvdGd1bg=="))(), loadstring(base64decode("UmF5R3Vu"))(), loadstring(base64decode("QUstNDc="))(),
        loadstring(base64decode("UGlua0d1bg=="))(), loadstring(base64decode("RmxhbWVHdW4="))(), loadstring(base64decode("TWluaUJsYWNrR3Vu"))(), loadstring(base64decode("Qmx1ZUd1bg=="))(),
        loadstring(base64decode("QmlnVVNQLVM="))(), loadstring(base64decode("R3JlZW5HdW4="))(),
    }

    local function fetchModel(id)
        local key = tostring(id)
        if gunModelCache[key] then return gunModelCache[key]:Clone() end
        local ok, objs = pcall(function() return game:GetObjects(loadstring(base64decode("cmJ4YXNzZXRpZDovLw=="))()..key) end)
        if ok and type(objs) == loadstring(base64decode("dGFibGU="))() and #objs > 0 then
            gunModelCache[key] = objs[1]
            return objs[1]:Clone()
        end
        return nil
    end
    local function restoreGun(tool)
        if not tool or not tool:IsA(loadstring(base64decode("VG9vbA=="))()) or tool.Name ~= loadstring(base64decode("R3Vu"))() then return end
        local custom = tool:FindFirstChild(loadstring(base64decode("RkhfQ3VzdG9tR3VuTW9kZWw="))())
        if custom then custom:Destroy() end
        for _, d in ipairs(tool:GetDescendants()) do
            if d:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then d.Transparency = 0
            elseif d:IsA(loadstring(base64decode("RGVjYWw="))()) or d:IsA(loadstring(base64decode("VGV4dHVyZQ=="))()) then d.Transparency = 0 end
        end
    end
    local function applyGun(tool)
        if not tool or not tool:IsA(loadstring(base64decode("VG9vbA=="))()) or tool.Name ~= loadstring(base64decode("R3Vu"))() then return end
        if not customModelEnabled then restoreGun(tool) return end
        local preset = Models[selectedModelName]
        if not preset then return end
        local char = LocalPlayer.Character
        if not char or tool.Parent ~= char then return end
        local rightHand = char:FindFirstChild(loadstring(base64decode("UmlnaHRIYW5k"))()) or char:FindFirstChild(loadstring(base64decode("UmlnaHQgQXJt"))())
        if not rightHand then return end
        local old = tool:FindFirstChild(loadstring(base64decode("RkhfQ3VzdG9tR3VuTW9kZWw="))())
        if old then old:Destroy() end
        local model = fetchModel(preset.id)
        if not model then return end
        model.Name = loadstring(base64decode("RkhfQ3VzdG9tR3VuTW9kZWw="))()
        for _, d in ipairs(tool:GetDescendants()) do
            if d:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) and not d:IsDescendantOf(model) then d.Transparency = 1
            elseif (d:IsA(loadstring(base64decode("RGVjYWw="))()) or d:IsA(loadstring(base64decode("VGV4dHVyZQ=="))())) and not d:IsDescendantOf(model) then d.Transparency = 1 end
        end
        local anchorPart = nil
        if model:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then anchorPart = model
        elseif model.PrimaryPart then anchorPart = model.PrimaryPart
        elseif model:FindFirstChild(loadstring(base64decode("SGFuZGxl"))()) then anchorPart = model.Handle
        else anchorPart = model:FindFirstChildWhichIsA(loadstring(base64decode("QmFzZVBhcnQ="))(), true) end
        if not anchorPart then model:Destroy() return end
        for _, d in ipairs(model:GetDescendants()) do
            if d:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
                d.CanCollide = false
                d.Anchored = false
                d.Massless = true
            end
        end
        local isR15 = char:FindFirstChild(loadstring(base64decode("VXBwZXJUb3Jzbw=="))()) ~= nil
        local baseOffset
        if isR15 then
            baseOffset = CFrame.new(0, -0.25, -0.1) * CFrame.Angles(-math.pi/2, 0, 0)
        else
            baseOffset = CFrame.new(0, -1, -0.1) * CFrame.Angles(-math.pi/2, 0, 0)
        end
        local targetCF = rightHand.CFrame * baseOffset * preset.rot * preset.pos
        if model:IsA(loadstring(base64decode("TW9kZWw="))()) then model:PivotTo(targetCF)
        elseif model:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then model.CFrame = targetCF end
        local weld = Instance.new(loadstring(base64decode("V2VsZENvbnN0cmFpbnQ="))())
        weld.Part0 = rightHand
        weld.Part1 = anchorPart
        weld.Parent = anchorPart
        for _, p in ipairs(model:GetDescendants()) do
            if p:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) and p ~= anchorPart then
                local w2 = Instance.new(loadstring(base64decode("V2VsZENvbnN0cmFpbnQ="))())
                w2.Part0 = anchorPart
                w2.Part1 = p
                w2.Parent = p
            end
        end
        model.Parent = tool
    end
    local function refreshAll()
        local bp = LocalPlayer:FindFirstChild(loadstring(base64decode("QmFja3BhY2s="))())
        if bp then
            local g = bp:FindFirstChild(loadstring(base64decode("R3Vu"))())
            if g then
                if customModelEnabled then applyGun(g) else restoreGun(g) end
            end
        end
        local char = LocalPlayer.Character
        if char then
            local g = char:FindFirstChild(loadstring(base64decode("R3Vu"))())
            if g then
                if customModelEnabled then applyGun(g) else restoreGun(g) end
            end
        end
    end
    local function hookContainer(cont)
        if not cont then return end
        cont.ChildAdded:Connect(function(child)
            if child:IsA(loadstring(base64decode("VG9vbA=="))()) and child.Name == loadstring(base64decode("R3Vu"))() then
                task.wait(0.05)
                child.Equipped:Connect(function()
                    if customModelEnabled then task.wait(0.02) applyGun(child) end
                end)
                child.Unequipped:Connect(function()
                    local old = child:FindFirstChild(loadstring(base64decode("RkhfQ3VzdG9tR3VuTW9kZWw="))())
                    if old then old:Destroy() end
                end)
                if customModelEnabled and child.Parent == LocalPlayer.Character then applyGun(child) end
            end
        end)
        local g = cont:FindFirstChild(loadstring(base64decode("R3Vu"))())
        if g then
            g.Equipped:Connect(function()
                if customModelEnabled then task.wait(0.02) applyGun(g) end
            end)
            g.Unequipped:Connect(function()
                local old = g:FindFirstChild(loadstring(base64decode("RkhfQ3VzdG9tR3VuTW9kZWw="))())
                if old then old:Destroy() end
            end)
            if customModelEnabled and g.Parent == LocalPlayer.Character then applyGun(g) end
        end
    end
    task.spawn(function()
        local bp = LocalPlayer:WaitForChild(loadstring(base64decode("QmFja3BhY2s="))())
        if bp then hookContainer(bp) end
        if LocalPlayer.Character then hookContainer(LocalPlayer.Character) end
        LocalPlayer.CharacterAdded:Connect(hookContainer)
    end)

    local sec = Tabs.Visual:AddSection({Name=loadstring(base64decode("Q3VzdG9tIEd1biBNb2RlbHM="))()})
    _addOpt(sec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("RkhHdW5Nb2RlbE9u"))(), {Title=loadstring(base64decode("0JfQsNC80LXQvdC40YLRjCDQvNC+0LTQtdC70Ywg0L7RgNGD0LbQuNGP"))(), Default=false}, function(v)
        customModelEnabled = v
        refreshAll()
        Notify(loadstring(base64decode("Rkg="))(), v and loadstring(base64decode("0JzQvtC00LXQu9GMINC+0YDRg9C20LjRjyDQktCa0Js="))() or loadstring(base64decode("0JzQvtC00LXQu9GMINC+0YDRg9C20LjRjyDQktCr0JrQmw=="))(), 2)
    end)
    _addOpt(sec, loadstring(base64decode("QWRkRHJvcGRvd24="))(), loadstring(base64decode("RkhHdW5Nb2RlbFBpY2s="))(), {Title=loadstring(base64decode("0JzQvtC00LXQu9GM"))(), Values=MODEL_LIST, Default=loadstring(base64decode("QVdQ"))()}, function(v)
        selectedModelName = v or loadstring(base64decode("QVdQ"))()
        if customModelEnabled then refreshAll() end
    end)
    sec:AddButton({Title=loadstring(base64decode("0J/RgNC40LzQtdC90LjRgtGMINC6INGC0LXQutGD0YnQtdC80YMg0L7RgNGD0LbQuNGO"))(), Callback=function()
        refreshAll()
        Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("0J7QsdC90L7QstC70LXQvdC+"))(), 2)
    end})
end

-- ============================================================
-- 7. SKYBOX MANAGER
-- ============================================================
do
    local skyboxEnabled = false
    local currentSkyId = nil
    local currentSkyName = nil

    local function destroySky()
        local sky = Lighting:FindFirstChild(loadstring(base64decode("RkhfU2t5Ym94TWFuYWdlZA=="))())
        if sky then sky:Destroy() end
    end
    local function applySkybox(id, name)
        task.spawn(function()
            local ok, objs = pcall(function() return game:GetObjects(loadstring(base64decode("cmJ4YXNzZXRpZDovLw=="))()..tostring(id)) end)
            if not ok or type(objs) ~= loadstring(base64decode("dGFibGU="))() or #objs == 0 then
                Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("0J3QtSDRg9C00LDQu9C+0YHRjCDQt9Cw0LPRgNGD0LfQuNGC0Ywgc2t5Ym94OiA="))()..tostring(name), 3)
                return
            end
            local first = objs[1]
            local sky = nil
            if first:IsA(loadstring(base64decode("U2t5"))()) then sky = first
            else
                sky = first:FindFirstChildOfClass(loadstring(base64decode("U2t5"))())
                if not sky then
                    local s = first:FindFirstChildWhichIsA(loadstring(base64decode("U2t5"))(), true)
                    if s then sky = s end
                end
            end
            if not sky then
                pcall(function() first:Destroy() end)
                Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("U2t5INC90LUg0L3QsNC50LTQtdC9INCyINC80L7QtNC10LvQuA=="))(), 3)
                return
            end
            local existing = Lighting:FindFirstChildOfClass(loadstring(base64decode("U2t5"))())
            if existing then existing:Destroy() end
            Lighting.ClockTime = 14
            Lighting.Brightness = 0.5
            sky.Name = loadstring(base64decode("RkhfU2t5Ym94TWFuYWdlZA=="))()
            sky.Parent = Lighting
            if first ~= sky then pcall(function() first:Destroy() end) end
            skyboxEnabled = true
            currentSkyId = id
            currentSkyName = name
            Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("U2t5Ym94OiA="))()..tostring(name), 2)
        end)
    end
    local function removeSky()
        destroySky()
        skyboxEnabled = false
        currentSkyId = nil
        currentSkyName = nil
        Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("U2t5Ym94INGD0LTQsNC70ZHQvQ=="))(), 2)
    end

    local sec = Tabs.Effects:AddSection({Name=loadstring(base64decode("U2t5Ym94IE1hbmFnZXI="))()})
    sec:AddButton({Title=loadstring(base64decode("0KPQsdGA0LDRgtGMINC90LXQsdC+"))(), Callback=removeSky})
    sec:AddButton({Title=loadstring(base64decode("U25vdyBTa3lib3g="))(), Callback=function() applySkybox(4604073339, loadstring(base64decode("U25vdw=="))()) end})
    sec:AddButton({Title=loadstring(base64decode("UmVhbGlzdGljIFNwYWNl"))(), Callback=function() applySkybox(136402262, loadstring(base64decode("UmVhbGlzdGljIFNwYWNl"))()) end})
    sec:AddButton({Title=loadstring(base64decode("UHVycGxlIE5lYnVsYQ=="))(), Callback=function() applySkybox(83555979203508, loadstring(base64decode("UHVycGxlIE5lYnVsYQ=="))()) end})
    sec:AddButton({Title=loadstring(base64decode("Qmx1ZSBOZWJ1bGE="))(), Callback=function() applySkybox(130093177270069, loadstring(base64decode("Qmx1ZSBOZWJ1bGE="))()) end})
    sec:AddButton({Title=loadstring(base64decode("U3BvbmdlQm9iIFNreQ=="))(), Callback=function() applySkybox(114523453023009, loadstring(base64decode("U3BvbmdlQm9i"))()) end})
    sec:AddButton({Title=loadstring(base64decode("TmlnaHQgU2t5IFZpYmU="))(), Callback=function() applySkybox(78613024128163, loadstring(base64decode("TmlnaHQgU2t5"))()) end})
    sec:AddButton({Title=loadstring(base64decode("R2VveiBTa3lib3g="))(), Callback=function() applySkybox(97573261671957, loadstring(base64decode("R2Vveg=="))()) end})
    sec:AddButton({Title=loadstring(base64decode("QXN0ZXJvaWQgU3BhY2U="))(), Callback=function() applySkybox(295604372, loadstring(base64decode("QXN0ZXJvaWQ="))()) end})
    local input = sec:AddInput(loadstring(base64decode("RkhTa3lib3hDdXN0b21JZA=="))(), {Title=loadstring(base64decode("0KHQstC+0LkgU2t5Ym94IElE"))(), Default=loadstring(base64decode(""))()})
    sec:AddButton({Title=loadstring(base64decode("0J/RgNC40LzQtdC90LjRgtGMINGB0LLQvtC5IElE"))(), Callback=function()
        local v = input.Value
        if type(v)==loadstring(base64decode("dGFibGU="))() then v=v[1] end
        local num = tonumber(v)
        if num then applySkybox(num, loadstring(base64decode("Q3VzdG9tICM="))()..num)
        else Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("0JLQstC10LTQuCDRh9C40YHQu9C+"))(), 2) end
    end})
end

-- ============================================================
-- 8. AURAS
-- ============================================================
do
    local AURAS = {
        {loadstring(base64decode("TWlkbmlnaHQgQmx1ZXM="))(), loadstring(base64decode("MTIwMDIyMDY2MTE="))()},
        {loadstring(base64decode("UmFpbmJvdyBFZmZlY3Q="))(), loadstring(base64decode("ODUwOTY5NTcxNA=="))()},
        {loadstring(base64decode("UmVkIFNoaWVsZA=="))(), loadstring(base64decode("MTQ1OTgzMzAxNjc="))()},
        {loadstring(base64decode("Q3JpbXNvbiBLaW5n"))(), loadstring(base64decode("MTE5NTUyMDg4MjA="))()},
        {loadstring(base64decode("RGFlbW9uIG9mIENhcmRz"))(), loadstring(base64decode("MTAzNzMzNTk5MTg="))()},
        {loadstring(base64decode("QW5nZWwgV2luZ3M="))(), loadstring(base64decode("OTc2NTgxMzA5MTc1OTM="))()},
        {loadstring(base64decode("U3RhcmxpZ2h0"))(), loadstring(base64decode("MTM0NjQ1MjE2NjEzMTA3"))()},
        {loadstring(base64decode("SGVhdmVubHk="))(), loadstring(base64decode("MTM5MzAwODk3NTIwOTYx"))()},
        {loadstring(base64decode("UmliYm9u"))(), loadstring(base64decode("MTMyMDY5NTA3NjMyMTYx"))()},
        {loadstring(base64decode("U2FrdXJh"))(), loadstring(base64decode("ODE3NTU3Nzg2MTk0MDQ="))()},
        {loadstring(base64decode("V2luZA=="))(), loadstring(base64decode("ODA2OTQwODE4NTA4Nzc="))()},
        {loadstring(base64decode("Rmxvdw=="))(), loadstring(base64decode("MTE5OTEzNTMzNzI1NjQ4"))()},
        {loadstring(base64decode("U3Rhcg=="))(), loadstring(base64decode("NzM3NTQ1NjM3NDA2ODA="))()},
    }

    local auraSec = Tabs.Effects:AddSection({Name=loadstring(base64decode("QXVyYXM="))()})
    local activeAuraName = nil
    local activeAuraId = nil
    local activeAuraColor = Color3.fromRGB(255,255,255)
    local useCustomColor = false
    local tracked = {}
    local changingAura = false

    local function clearAura()
        for _, obj in ipairs(tracked) do
            if obj and obj.Parent then pcall(function() obj:Destroy() end) end
        end
        tracked = {}
    end

    local function colorAuraModel(model, color)
        local seq = ColorSequence.new(color)
        for _, d in ipairs(model:GetDescendants()) do
            if d:IsA(loadstring(base64decode("UG9pbnRMaWdodA=="))()) or d:IsA(loadstring(base64decode("U3BvdExpZ2h0"))()) or d:IsA(loadstring(base64decode("U3VyZmFjZUxpZ2h0"))()) then
                pcall(function() d.Color = color end)
            elseif d:IsA(loadstring(base64decode("UGFydGljbGVFbWl0dGVy"))()) or d:IsA(loadstring(base64decode("QmVhbQ=="))()) or d:IsA(loadstring(base64decode("VHJhaWw="))()) then
                pcall(function() d.Color = seq end)
            elseif d:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) and d.Material == Enum.Material.Neon then
                pcall(function() d.Color = color end)
            end
        end
    end

    local function applyAuraModel(assetId, name)
        clearAura()
        local ok, objs = pcall(function() return game:GetObjects(loadstring(base64decode("cmJ4YXNzZXRpZDovLw=="))()..tostring(assetId)) end)
        if not ok or type(objs) ~= loadstring(base64decode("dGFibGU="))() or #objs == 0 then
            Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("0J3QtSDRg9C00LDQu9C+0YHRjCDQt9Cw0LPRgNGD0LfQuNGC0Ywg0LDRg9GA0YM6IA=="))()..name, 3)
            return false
        end
        local model = objs[1]
        local char = LocalPlayer.Character
        if not char then
            Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("0J/QtdGA0YHQvtC90LDQtiDQvdC1INC30LDQs9GA0YPQttC10L0="))(), 2)
            return false
        end
        local torso = char:FindFirstChild(loadstring(base64decode("VXBwZXJUb3Jzbw=="))()) or char:FindFirstChild(loadstring(base64decode("VG9yc28="))())
        local head = char:FindFirstChild(loadstring(base64decode("SGVhZA=="))())
        if not torso or not head then
            Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("0KfQsNGB0YLQuCDQv9C10YDRgdC+0L3QsNC20LAg0L3QtSDQvdCw0LnQtNC10L3Riw=="))(), 2)
            return false
        end
        if useCustomColor then colorAuraModel(model, activeAuraColor) end
        local nameMap = {
            Torso = torso.Name, Head = loadstring(base64decode("SGVhZA=="))(),
            [loadstring(base64decode("TGVmdCBBcm0="))()] = loadstring(base64decode("TGVmdFVwcGVyQXJt"))(), [loadstring(base64decode("UmlnaHQgQXJt"))()] = loadstring(base64decode("UmlnaHRVcHBlckFybQ=="))(),
            [loadstring(base64decode("TGVmdCBMZWc="))()] = loadstring(base64decode("TGVmdFVwcGVyTGVn"))(), [loadstring(base64decode("UmlnaHQgTGVn"))()] = loadstring(base64decode("UmlnaHRVcHBlckxlZw=="))(),
        }
        for _, part in ipairs(model:GetDescendants()) do
            if part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
                part.Anchored = false
                part.CanCollide = false
            elseif part:IsA(loadstring(base64decode("V2VsZA=="))()) or part:IsA(loadstring(base64decode("V2VsZENvbnN0cmFpbnQ="))()) or part:IsA(loadstring(base64decode("TW90b3I2RA=="))()) or part:IsA(loadstring(base64decode("U25hcA=="))()) then
                part:Destroy()
            end
        end
        local headPartsToAttach = {}
        local crownBase = nil
        for _, part in ipairs(model:GetChildren()) do
            if part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) and part.Name == loadstring(base64decode("QXVyYQ=="))() then
                part.Parent = char
                part.CFrame = torso.CFrame * CFrame.new(0, 0.5, 0)
                local w = Instance.new(loadstring(base64decode("V2VsZENvbnN0cmFpbnQ="))())
                w.Part0 = torso
                w.Part1 = part
                w.Parent = part
                table.insert(tracked, w)
                table.insert(tracked, part)
                for _, ch in ipairs(part:GetChildren()) do
                    if ch:IsA(loadstring(base64decode("UGFydGljbGVFbWl0dGVy"))()) or ch:IsA(loadstring(base64decode("QmVhbQ=="))()) or ch:IsA(loadstring(base64decode("SGlnaGxpZ2h0"))()) or ch:IsA(loadstring(base64decode("UG9pbnRMaWdodA=="))()) then
                        local cl = ch:Clone()
                        cl.Parent = torso
                        table.insert(tracked, cl)
                    end
                end
            elseif part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) and part.Name == loadstring(base64decode("Q3Jvd24gQmFzZQ=="))() then
                crownBase = part
            elseif part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
                table.insert(headPartsToAttach, part)
            end
        end
        for _, part in ipairs(headPartsToAttach) do
            local targetName = nameMap[part.Name] or part.Name
            local target = char:FindFirstChild(targetName)
            if target then
                for _, ch in ipairs(part:GetChildren()) do
                    if ch:IsA(loadstring(base64decode("UGFydGljbGVFbWl0dGVy"))()) or ch:IsA(loadstring(base64decode("QXR0YWNobWVudA=="))()) or ch:IsA(loadstring(base64decode("SGlnaGxpZ2h0"))())
                       or ch:IsA(loadstring(base64decode("QmVhbQ=="))()) or ch:IsA(loadstring(base64decode("UG9pbnRMaWdodA=="))()) then
                        local cl = ch:Clone()
                        cl.Parent = target
                        table.insert(tracked, cl)
                    end
                end
            end
        end
        if crownBase and name == loadstring(base64decode("Q3JpbXNvbiBLaW5n"))() then
            crownBase.Parent = char
            local headTopOffset = (head.Size.Y * 0.5) + (crownBase.Size.Y * 0.5) - 0.1
            crownBase.CFrame = head.CFrame * CFrame.new(0, headTopOffset, 0)
            local w = Instance.new(loadstring(base64decode("V2VsZENvbnN0cmFpbnQ="))())
            w.Part0 = head
            w.Part1 = crownBase
            w.Parent = crownBase
            table.insert(tracked, w)
            table.insert(tracked, crownBase)
            local cb = crownBase:FindFirstChild(loadstring(base64decode("Q3Jvd24gQmVhbXM="))())
            if cb then
                for _, d in ipairs(cb:GetDescendants()) do
                    if d:IsA(loadstring(base64decode("QmVhbQ=="))()) then
                        local cl = d:Clone()
                        if cl.Attachment0 and crownBase:FindFirstChild(cl.Attachment0.Name) then
                            cl.Attachment0 = crownBase[cl.Attachment0.Name]
                        end
                        if cl.Attachment1 and crownBase:FindFirstChild(cl.Attachment1.Name) then
                            cl.Attachment1 = crownBase[cl.Attachment1.Name]
                        end
                        cl.Parent = torso
                        table.insert(tracked, cl)
                    end
                end
            end
        end
        model:Destroy()
        return true
    end

    local auraToggles = {}

    local function setActiveAura(name, id)
        changingAura = true
        for _, a in ipairs(AURAS) do
            local otherName = a[1]
            if otherName ~= name then
                local optName = loadstring(base64decode("RkhfQXVyYV8="))()..otherName:gsub(loadstring(base64decode("W14ld10="))(), loadstring(base64decode("Xw=="))())
                local opt = Options[optName]
                if opt and opt.Value then
                    pcall(function() opt:SetValue(false) end)
                end
            end
        end
        changingAura = false

        if name and id then
            local success = applyAuraModel(id, name)
            if success then
                activeAuraName = name
                activeAuraId = id
                Notify(loadstring(base64decode("Rkg="))(), name..loadstring(base64decode("INCy0LrQu9GO0YfQtdC90LA="))(), 2)
            else
                activeAuraName = nil
                activeAuraId = nil
            end
        end
    end
    local function clearActiveAura()
        clearAura()
        activeAuraName = nil
        activeAuraId = nil
    end

    for _, a in ipairs(AURAS) do
        local auraName = a[1]
        local auraId = a[2]
        local optName = loadstring(base64decode("RkhfQXVyYV8="))()..auraName:gsub(loadstring(base64decode("W14ld10="))(), loadstring(base64decode("Xw=="))())
        local toggle = _addOpt(auraSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), optName, {Title=auraName, Default=false}, function(v)
            if changingAura then return end
            if v then setActiveAura(auraName, auraId)
            else
                if activeAuraName == auraName then
                    clearActiveAura()
                    Notify(loadstring(base64decode("Rkg="))(), auraName..loadstring(base64decode("INCy0YvQutC70Y7Rh9C10L3QsA=="))(), 2)
                end
            end
        end)
        auraToggles[auraName] = toggle
    end

    _addOpt(auraSec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("RkhfQXVyYUNvbG9y"))(), {
        Title = loadstring(base64decode("0KbQstC10YIg0LDRg9GA0Ys="))(), Default = Color3.fromRGB(255, 255, 255),
    }, function(c)
        activeAuraColor = c
        useCustomColor = true
        if activeAuraName and activeAuraId then
            local success = applyAuraModel(activeAuraId, activeAuraName)
            if not success then Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("0J7RiNC40LHQutCwINC/0LXRgNC10LrRgNCw0YHQutC4INCw0YPRgNGL"))(), 2) end
        end
    end)
    _addOpt(auraSec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("RkhfQXVyYVVzZUNvbG9y"))(), {
        Title = loadstring(base64decode("0JjRgdC/0L7Qu9GM0LfQvtCy0LDRgtGMINGB0LLQvtC5INGG0LLQtdGC"))(), Default = false,
    }, function(v)
        useCustomColor = v
        if activeAuraName and activeAuraId then
            applyAuraModel(activeAuraId, activeAuraName)
        end
    end)

    LocalPlayer.CharacterAdded:Connect(function()
        if activeAuraName and activeAuraId then
            local savedName = activeAuraName
            local savedId = activeAuraId
            task.wait(0.6)
            tracked = {}
            local success = applyAuraModel(savedId, savedName)
            if not success then
                activeAuraName = nil
                activeAuraId = nil
            end
        end
    end)
end

-- ============================================================
-- 9. ANTI-AIM
-- ============================================================
do
    local enabled = false
    local token = 0
    local savedCollide = {}
    local stepConn = nil
    local dieConn = nil

    local function getRoot(char)
        if not char then return nil end
        local hum = char:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
        if hum and hum.RootPart then return hum.RootPart end
        return char:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
            or char:FindFirstChild(loadstring(base64decode("VG9yc28="))())
            or char:FindFirstChild(loadstring(base64decode("VXBwZXJUb3Jzbw=="))())
    end

    local function stop()
        enabled = false
        token = token + 1
        if stepConn then pcall(function() stepConn:Disconnect() end); stepConn = nil end
        if dieConn then pcall(function() dieConn:Disconnect() end); dieConn = nil end
        local char = LocalPlayer.Character
        if char then
            for part, ct in pairs(savedCollide) do
                if part and part.Parent then pcall(function() part.CanCollide = ct end) end
            end
            local root = getRoot(char)
            if root and root.Parent then
                pcall(function()
                    root.Velocity = Vector3.zero
                    root.AssemblyLinearVelocity = Vector3.zero
                    root.AssemblyAngularVelocity = Vector3.zero
                end)
            end
        end
        table.clear(savedCollide)
    end

    local function start()
        stop()
        enabled = true
        token = token + 1
        local myToken = token

        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
        if hum then
            dieConn = hum.Died:Connect(function()
                if token == myToken then
                    stop()
                    pcall(function()
                        local o = Options.FHAntiAimOn
                        if o then o:SetValue(false) end
                    end)
                    local cam = workspace.CurrentCamera
                    if cam then cam.CameraType = Enum.CameraType.Custom end
                end
            end)
        end

        stepConn = RunService.Stepped:Connect(function()
            if not enabled or token ~= myToken then return end
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
            if not c or not c.Parent or not h or h.Health <= 0 then
                stop()
                return
            end
            for _, d in ipairs(c:GetDescendants()) do
                if d:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
                    if savedCollide[d] == nil then savedCollide[d] = d.CanCollide end
                    d.CanCollide = false
                end
            end
        end)

        task.spawn(function()
            local wobble = 0.1
            while enabled and token == myToken do
                RunService.Heartbeat:Wait()
                if not enabled or token ~= myToken then break end
                local c = LocalPlayer.Character
                local h = c and c:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
                local root = getRoot(c)
                if c and c.Parent and h and h.Health > 0 and root and root.Parent then
                    local oldVel = root.Velocity
                    local push = oldVel * 10000
                    root.Velocity = push + Vector3.new(0, 10000, 0)
                    RunService.RenderStepped:Wait()
                    if enabled and token == myToken and c.Parent and h.Health > 0 and root.Parent then
                        root.Velocity = oldVel
                    end
                    RunService.Stepped:Wait()
                    if enabled and token == myToken and c.Parent and h.Health > 0 and root.Parent then
                        root.Velocity = oldVel + Vector3.new(0, wobble, 0)
                        wobble = wobble * -1
                    end
                end
            end
        end)
    end

    local sec = Tabs.Utility:AddSection({Name=loadstring(base64decode("QW50aS1BaW0="))()})
    _addOpt(sec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("RkhBbnRpQWltT24="))(), {Title=loadstring(base64decode("0JDQvdGC0Lgt0LDQuNC8ICjQvdC10YPRj9C30LLQuNC80L7RgdGC0Ywg0L7RgiDQsNC40LzQsCk="))(), Default=false}, function(v)
        if v then start() Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("QW50aS1BaW0g0JLQmtCb"))(), 2)
        else stop() Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("QW50aS1BaW0g0JLQq9Ca0Js="))(), 2) end
    end)
    getgenv().FH_AntiAimCleanup = stop
end

-- ============================================================
-- 10. CUSTOM PNG AVATARS
-- ============================================================
do
    getgenv().FH_CustomAvatarsEnabled = true
    local avatarUrls = {
        loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL1JveWFsLVNjcmlwdC1odWIvbWlta2EvbWFpbi9hdmEvMS5wbmc="))(),
        loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL1JveWFsLVNjcmlwdC1odWIvbWlta2EvbWFpbi9hdmEvMi5wbmc="))(),
        loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL1JveWFsLVNjcmlwdC1odWIvbWlta2EvbWFpbi9hdmEvMy5wbmc="))(),
        loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL1JveWFsLVNjcmlwdC1odWIvbWlta2EvbWFpbi9hdmEvNC5wbmc="))(),
        loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL1JveWFsLVNjcmlwdC1odWIvbWlta2EvbWFpbi9hdmEvNS5wbmc="))(),
        loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL1JveWFsLVNjcmlwdC1odWIvbWlta2EvbWFpbi9hdmEvNi5wbmc="))(),
        loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL1JveWFsLVNjcmlwdC1odWIvbWlta2EvbWFpbi9hdmEvNy5wbmc="))(),
        loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL1JveWFsLVNjcmlwdC1odWIvbWlta2EvbWFpbi9hdmEvOC5wbmc="))(),
        loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL1JveWFsLVNjcmlwdC1odWIvbWlta2EvbWFpbi9hdmEvOS5wbmc="))(),
        loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL1JveWFsLVNjcmlwdC1odWIvbWlta2EvbWFpbi9hdmEvMTAucG5n"))(),
        loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL1JveWFsLVNjcmlwdC1odWIvbWlta2EvbWFpbi9hdmEvMTEucG5n"))(),
        loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL1JveWFsLVNjcmlwdC1odWIvbWlta2EvbWFpbi9hdmEvMTIucG5n"))(),
    }
    local avatarCache = {}
    local userToUrl = {}
    local folder = loadstring(base64decode("Rm9ydG5pSHViX0NvbmZpZ3MvYXZhdGFycw=="))()
    if type(makefolder) == loadstring(base64decode("ZnVuY3Rpb24="))() and type(isfolder) == loadstring(base64decode("ZnVuY3Rpb24="))() then
        if not isfolder(folder) then pcall(makefolder, folder) end
    end
    local function resolveLocal(url, idx)
        if avatarCache[url] then return avatarCache[url] end
        if type(getcustomasset) ~= loadstring(base64decode("ZnVuY3Rpb24="))() or type(writefile) ~= loadstring(base64decode("ZnVuY3Rpb24="))() then return url end
        local path = folder .. loadstring(base64decode("L2F2YXRhcl8="))()..tostring(idx or 1)..loadstring(base64decode("LnBuZw=="))()
        if type(isfile) == loadstring(base64decode("ZnVuY3Rpb24="))() and not isfile(path) then
            local ok, data = pcall(function() return game:HttpGet(url) end)
            if ok and type(data) == loadstring(base64decode("c3RyaW5n"))() and #data > 0 then pcall(writefile, path, data) end
        end
        local okA, asset = pcall(getcustomasset, path)
        if okA and asset then
            avatarCache[url] = asset
            return asset
        end
        return url
    end
    local function getAvatarFor(player)
        if not getgenv().FH_CustomAvatarsEnabled then
            if not player then return loadstring(base64decode(""))() end
            local ok, img = pcall(function()
                return Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
            end)
            return ok and img or loadstring(base64decode(""))()
        end
        if not player then
            return resolveLocal(avatarUrls[math.random(1, #avatarUrls)], math.random(1, #avatarUrls))
        end
        if userToUrl[player.UserId] then
            local idx = nil
            for uSCGtGib, u in ipairs(avatarUrls) do if u == userToUrl[player.UserId] then idx = uSCGtGib; break end end
            return resolveLocal(userToUrl[player.UserId], idx)
        end
        local used = {}
        for _, u in pairs(userToUrl) do used[u] = true end
        local pool = {}
        for _, u in ipairs(avatarUrls) do if not used[u] then table.insert(pool, u) end end
        local pick = pool[math.random(1, #pool)] or avatarUrls[math.random(1, #avatarUrls)]
        userToUrl[player.UserId] = pick
        local idx = nil
        for uSCGtGib, u in ipairs(avatarUrls) do if u == pick then idx = uSCGtGib; break end end
        return resolveLocal(pick, idx)
    end
    getgenv().FH_GetAvatarFor = getAvatarFor
    getgenv().FH_RefreshAvatars = function() end
end

-- ============================================================
-- 11. CUSTOM GAME SOUNDS
-- ============================================================
do
    local GameSounds = {
        [loadstring(base64decode("UnVzdCBIZWFkc2hvdA=="))()] = loadstring(base64decode("MTM4NzUwMzMxMzg3MDY0"))(), [loadstring(base64decode("TmV2ZXJsb3Nl"))()] = loadstring(base64decode("MTEwMTY4NzIzNDQ3MTUz"))(),
        [loadstring(base64decode("QnViYmxl"))()] = loadstring(base64decode("NjUzNDk0NzU4OA=="))(), [loadstring(base64decode("U3RldmU="))()] = loadstring(base64decode("NDk2NTA4Mzk5Nw=="))(),
        [loadstring(base64decode("Q2FsbCBvZiBEdXR5"))()] = loadstring(base64decode("NTk1MjEyMDMwMQ=="))(), [loadstring(base64decode("QmF0"))()] = loadstring(base64decode("MzMzMzkwNzM0Nw=="))(),
        [loadstring(base64decode("VEYyIENyaXRpY2Fs"))()] = loadstring(base64decode("Mjk2MTAyNzM0"))(), [loadstring(base64decode("U2FiZXI="))()] = loadstring(base64decode("ODQxNTY3ODgxMw=="))(),
        [loadstring(base64decode("QmFtZXdhcmU="))()] = loadstring(base64decode("MzEyNDMzMTgyMA=="))(), [loadstring(base64decode("TW9uZXk="))()] = loadstring(base64decode("MTM5NTYwMTMwNDE="))(),
        [loadstring(base64decode("Tm90aWY="))()] = loadstring(base64decode("NjY5NjQ2OTE5MA=="))(), [loadstring(base64decode("U2h1dHRlcg=="))()] = loadstring(base64decode("MTAwNjY5MjE1MTY="))(),
        [loadstring(base64decode("UklGSzc="))()] = loadstring(base64decode("OTEwMjA4MDU1Mg=="))(), [loadstring(base64decode("TGF6ZXJCZWFt"))()] = loadstring(base64decode("MTMwNzkxMDQz"))(),
        [loadstring(base64decode("V2luZG93c1hQRXJyb3I="))()] = loadstring(base64decode("MTYwNzE1MzU3"))(), [loadstring(base64decode("VEYySGl0c291bmQ="))()] = loadstring(base64decode("MzQ1NTE0NDk4MQ=="))(),
        [loadstring(base64decode("VEYyQmF0"))()] = loadstring(base64decode("MzMzMzkwNzM0Nw=="))(), [loadstring(base64decode("Qm93SGl0"))()] = loadstring(base64decode("MTA1MzI5NjkxNQ=="))(),
        [loadstring(base64decode("Qm93"))()] = loadstring(base64decode("MzQ0MjY4MzcwNw=="))(), [loadstring(base64decode("T1NV"))()] = loadstring(base64decode("NzE0NzQ1NDMyMg=="))(),
        [loadstring(base64decode("T25lTk4="))()] = loadstring(base64decode("NzM0OTA1NTY1NA=="))(), [loadstring(base64decode("VEYyUGFu"))()] = loadstring(base64decode("MzQzMTc0OTQ3OQ=="))(),
        [loadstring(base64decode("TWFyaW8="))()] = loadstring(base64decode("NTcwOTQ1NjU1NA=="))(), [loadstring(base64decode("QmVsbA=="))()] = loadstring(base64decode("NjUzNDk0NzI0MA=="))(),
        [loadstring(base64decode("UGljaw=="))()] = loadstring(base64decode("MTM0NzE0MDAyNw=="))(), [loadstring(base64decode("RmFydA=="))()] = loadstring(base64decode("MTMwODMzNjc3"))(),
        [loadstring(base64decode("Qmln"))()] = loadstring(base64decode("NTMzMjAwNTA1Mw=="))(), [loadstring(base64decode("VmluZQ=="))()] = loadstring(base64decode("NTMzMjY4MDgxMA=="))(),
        [loadstring(base64decode("QnJ1aA=="))()] = loadstring(base64decode("NDU3ODc0MDU2OA=="))(), [loadstring(base64decode("U2tlZXQ="))()] = loadstring(base64decode("NTYzMzY5NTY3OQ=="))(),
        [loadstring(base64decode("RmF0YWxpdHk="))()] = loadstring(base64decode("NjUzNDk0Nzg2OQ=="))(), [loadstring(base64decode("Qm9uaw=="))()] = loadstring(base64decode("NTc2Njg5ODE1OQ=="))(),
        [loadstring(base64decode("TWluZWNyYWZ0"))()] = loadstring(base64decode("NTg2OTQyMjQ1MQ=="))(), [loadstring(base64decode("R2FtZXNlbnNl"))()] = loadstring(base64decode("NDgxNzgwOTE4OA=="))(),
        [loadstring(base64decode("QmFtYm9v"))()] = loadstring(base64decode("Mzc2OTQzNDUxOQ=="))(), [loadstring(base64decode("V2VlYg=="))()] = loadstring(base64decode("NjQ0Mjk2NTAxNg=="))(),
        [loadstring(base64decode("QmVlcA=="))()] = loadstring(base64decode("ODE3NzI1NjAxNQ=="))(), [loadstring(base64decode("QmFtYmk="))()] = loadstring(base64decode("ODQzNzIwMzgyMQ=="))(),
        [loadstring(base64decode("U3RvbmU="))()] = loadstring(base64decode("MzU4MTM4MzQwOA=="))(), [loadstring(base64decode("T2xkIEZhdGFsaXR5"))()] = loadstring(base64decode("NjYwNzE0MjAzNg=="))(),
        [loadstring(base64decode("Q2xpY2s="))()] = loadstring(base64decode("ODA1MzcwNDQzNw=="))(), [loadstring(base64decode("RGluZw=="))()] = loadstring(base64decode("NzE0OTUxNjk5NA=="))(),
        [loadstring(base64decode("U25vdw=="))()] = loadstring(base64decode("NjQ1NTUyNzYzMg=="))(), [loadstring(base64decode("T3N1"))()] = loadstring(base64decode("NzE0OTI1NTU1MQ=="))(),
        [loadstring(base64decode("VEYy"))()] = loadstring(base64decode("Mjg2ODMzMTY4NA=="))(), [loadstring(base64decode("U2xpbWU="))()] = loadstring(base64decode("NjkxNjM3MTgwMw=="))(),
        [loadstring(base64decode("QW1vbmcgVXM="))()] = loadstring(base64decode("NTcwMDE4MzYyNg=="))(), [loadstring(base64decode("T25l"))()] = loadstring(base64decode("NzM4MDUwMjM0NQ=="))(),
        [loadstring(base64decode("QnVsbGV0RGVmbGVjdA=="))()] = loadstring(base64decode("MTY1NzE1NzY2Ng=="))(), [loadstring(base64decode("RGVmYXVsdCBTb3VuZA=="))()] = loadstring(base64decode("MzMwNTk1Mjkz"))(),
        [loadstring(base64decode("VXdV"))()] = loadstring(base64decode("ODY3OTY1OTc0NA=="))(), [loadstring(base64decode("Q29k"))()] = loadstring(base64decode("MTYwNDMyMzM0"))(),
        [loadstring(base64decode("Qmxvb2QgU0ZY"))()] = loadstring(base64decode("ODE2NDk1MTE4MQ=="))(), [loadstring(base64decode("Qmxvb2QgQnVyc3Q="))()] = loadstring(base64decode("Mzc4MTQ3OTkwOQ=="))(),
    }
    local list = {loadstring(base64decode("RGVmYXVsdA=="))()}
    for k in pairs(GameSounds) do table.insert(list, k) end
    table.sort(list, function(a, b)
        if a == loadstring(base64decode("RGVmYXVsdA=="))() then return true end
        if b == loadstring(base64decode("RGVmYXVsdA=="))() then return false end
        return a:lower() < b:lower()
    end)

    local cfg = {
        SheriffKill = loadstring(base64decode("RGVmYXVsdA=="))(), MurderKill = loadstring(base64decode("RGVmYXVsdA=="))(),
        KnifeKill = loadstring(base64decode("RGVmYXVsdA=="))(), Gunshot = loadstring(base64decode("RGVmYXVsdA=="))(),
        Shoot = loadstring(base64decode("RGVmYXVsdA=="))(), MutedReload = false,
    }
    getgenv().FH_GameSoundCfg = cfg

    local function play(name)
        local id = GameSounds[name]
        if not id then return end
        pcall(function()
            local s = Instance.new(loadstring(base64decode("U291bmQ="))())
            s.SoundId = loadstring(base64decode("cmJ4YXNzZXRpZDovLw=="))()..id
            s.Volume = 1
            s.Parent = SoundService
            s:Play()
            Debris:AddItem(s, 5)
        end)
    end

    local tracked = {}
    local function hookSound(snd)
        if not snd:IsA(loadstring(base64decode("U291bmQ="))()) or tracked[snd] then return end
        tracked[snd] = true
        snd.Played:Connect(function()
            local n = snd.Name
            local map = nil
            if n == loadstring(base64decode("R3VuS2lsbA=="))() or n == loadstring(base64decode("U2hlcmlmZktpbGw="))() then map = cfg.SheriffKill
            elseif n == loadstring(base64decode("S2lsbA=="))() then map = cfg.KnifeKill
            elseif n == loadstring(base64decode("R3Vuc2hvdA=="))() or n == loadstring(base64decode("U2hvb3Q="))() then map = cfg.Gunshot end
            if n == loadstring(base64decode("UmVsb2Fk"))() and cfg.MutedReload then
                snd.Volume = 0
                snd:Stop()
                return
            end
            if map and map ~= loadstring(base64decode("RGVmYXVsdA=="))() and GameSounds[map] then
                snd.SoundId = loadstring(base64decode("cmJ4YXNzZXRpZDovLw=="))()..GameSounds[map]
                snd.TimePosition = 0
                snd:Play()
            end
        end)
    end
    Workspace.DescendantAdded:Connect(function(d)
        if d:IsA(loadstring(base64decode("U291bmQ="))()) and (d.Name == loadstring(base64decode("R3VuS2lsbA=="))() or d.Name == loadstring(base64decode("U2hlcmlmZktpbGw="))() or d.Name == loadstring(base64decode("S2lsbA=="))() or d.Name == loadstring(base64decode("R3Vuc2hvdA=="))() or d.Name == loadstring(base64decode("U2hvb3Q="))() or d.Name == loadstring(base64decode("UmVsb2Fk"))()) then
            hookSound(d)
        end
    end)
    for _, d in ipairs(Workspace:GetDescendants()) do
        if d:IsA(loadstring(base64decode("U291bmQ="))()) and (d.Name == loadstring(base64decode("R3VuS2lsbA=="))() or d.Name == loadstring(base64decode("U2hlcmlmZktpbGw="))() or d.Name == loadstring(base64decode("S2lsbA=="))() or d.Name == loadstring(base64decode("R3Vuc2hvdA=="))() or d.Name == loadstring(base64decode("U2hvb3Q="))() or d.Name == loadstring(base64decode("UmVsb2Fk"))()) then
            hookSound(d)
        end
    end

    local sec = Tabs.Utility:AddSection({Name=loadstring(base64decode("R2FtZSBTb3VuZHM="))()})
    _addOpt(sec, loadstring(base64decode("QWRkRHJvcGRvd24="))(), loadstring(base64decode("RkhfU2hlcmlmZktpbGw="))(), {Title = loadstring(base64decode("0JzRiyDRg9Cx0LjQu9C4INGD0LHQuNC50YbRgw=="))(), Values = list, Default = loadstring(base64decode("RGVmYXVsdA=="))()}, function(v) cfg.SheriffKill = v or loadstring(base64decode("RGVmYXVsdA=="))() end)
    _addOpt(sec, loadstring(base64decode("QWRkRHJvcGRvd24="))(), loadstring(base64decode("RkhfTXVyZGVyS2lsbA=="))(), {Title = loadstring(base64decode("0KPQsdC40LnRhtCwINC60L7Qs9C+LdGC0L4g0YPQsdC40Ls="))(), Values = list, Default = loadstring(base64decode("RGVmYXVsdA=="))()}, function(v) cfg.MurderKill = v or loadstring(base64decode("RGVmYXVsdA=="))() end)
    _addOpt(sec, loadstring(base64decode("QWRkRHJvcGRvd24="))(), loadstring(base64decode("RkhfS25pZmVLaWxs"))(), {Title = loadstring(base64decode("0KPQsdC40LnRgdGC0LLQviDQvdC+0LbQvtC8"))(), Values = list, Default = loadstring(base64decode("RGVmYXVsdA=="))()}, function(v) cfg.KnifeKill = v or loadstring(base64decode("RGVmYXVsdA=="))() end)
    _addOpt(sec, loadstring(base64decode("QWRkRHJvcGRvd24="))(), loadstring(base64decode("RkhfR3Vuc2hvdA=="))(), {Title = loadstring(base64decode("0JLRi9GB0YLRgNC10Ls="))(), Values = list, Default = loadstring(base64decode("RGVmYXVsdA=="))()}, function(v) cfg.Gunshot = v or loadstring(base64decode("RGVmYXVsdA=="))() end)
    _addOpt(sec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("RkhfTXV0ZVJlbG9hZA=="))(), {Title = loadstring(base64decode("0JfQsNCz0LvRg9GI0LjRgtGMINC/0LXRgNC10LfQsNGA0Y/QtNC60YM="))(), Default = false}, function(v) cfg.MutedReload = v end)
    sec:AddButton({Title=loadstring(base64decode("0J/RgNC+0LLQtdGA0LjRgtGMICjRgtC10LrRg9GJ0LjQuSk="))(), Callback=function() play(cfg.SheriffKill) end})
end

-- ============================================================
-- 12. JUMP CIRCLE
-- ============================================================
do
    local settings = getgenv().FH_JumpCircleSettings or {enabled = false, color = Color3.fromRGB(255, 105, 180)}
    getgenv().FH_JumpCircleSettings = settings

    local image = loadstring(base64decode("cmJ4YXNzZXRpZDovLzEzMzIzODQyNTc3Mzc2MA=="))()
    local conn = nil

    local function spawnCircle(pos)
        if not settings.enabled then return end
        local part = Instance.new(loadstring(base64decode("UGFydA=="))())
        part.Name = loadstring(base64decode("RkhfSnVtcENpcmNsZQ=="))()
        part.Anchored = true
        part.CanCollide = false
        part.CanTouch = false
        part.CanQuery = false
        part.CastShadow = false
        part.Size = Vector3.new(0.5, 0.05, 0.5)
        part.CFrame = CFrame.new(pos + Vector3.new(0, 0.05, 0))
        part.Transparency = 1
        part.Parent = Workspace
        local sg = Instance.new(loadstring(base64decode("U3VyZmFjZUd1aQ=="))())
        sg.Face = Enum.NormalId.Top
        sg.AlwaysOnTop = true
        sg.LightInfluence = 0
        sg.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
        sg.PixelsPerStud = 100
        sg.Parent = part
        local img = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
        img.BackgroundTransparency = 1
        img.Size = UDim2.fromScale(1, 1)
        img.Image = image
        img.ImageColor3 = settings.color
        img.ImageTransparency = 0
        img.Parent = sg
        local info = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        TweenService:Create(part, info, {Size = Vector3.new(7, 0.05, 7)}):Play()
        TweenService:Create(img, info, {ImageTransparency = 1}):Play()
        Debris:AddItem(part, 0.9)
    end

    local function bind(char)
        if conn then conn:Disconnect(); conn = nil end
        if not char then return end
        local hum = char:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
        local hrp = char:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
        if not hum or not hrp then return end
        conn = hum.StateChanged:Connect(function(_, newState)
            if newState == Enum.HumanoidStateType.Jumping and settings.enabled then
                spawnCircle(hrp.Position - Vector3.new(0, 2.8, 0))
            end
        end)
    end
    LocalPlayer.CharacterAdded:Connect(bind)
    if LocalPlayer.Character then bind(LocalPlayer.Character) end

    local sec = Tabs.Visual:AddSection({Name=loadstring(base64decode("SnVtcCBDaXJjbGU="))()})
    _addOpt(sec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("RkhfSnVtcENpcmNsZU9u"))(), {Title = loadstring(base64decode("0JrRgNGD0LMg0L/RgNC4INC/0YDRi9C20LrQtQ=="))(), Default = false}, function(v)
        settings.enabled = v
        if v and LocalPlayer.Character then bind(LocalPlayer.Character) end
    end)
    _addOpt(sec, loadstring(base64decode("QWRkQ29sb3JQaWNrZXI="))(), loadstring(base64decode("RkhfSnVtcENpcmNsZUNvbA=="))(), {Title = loadstring(base64decode("0KbQstC10YI="))(), Default = Color3.fromRGB(255, 105, 180)}, function(c) settings.color = c end)
end

-- ============================================================
-- 13. RTX SHADER
-- ============================================================
do
    local rtxOn = false
    local saved = {}
    local savedChildren = {}
    local addedFx = {}
    local vignette = nil

    local function enable()
        if rtxOn then return end
        rtxOn = true
        local props = {
            loadstring(base64decode("QW1iaWVudA=="))(),loadstring(base64decode("QnJpZ2h0bmVzcw=="))(),loadstring(base64decode("Q29sb3JTaGlmdF9Cb3R0b20="))(),loadstring(base64decode("Q29sb3JTaGlmdF9Ub3A="))(),
            loadstring(base64decode("RW52aXJvbm1lbnREaWZmdXNlU2NhbGU="))(),loadstring(base64decode("RW52aXJvbm1lbnRTcGVjdWxhclNjYWxl"))(),loadstring(base64decode("R2xvYmFsU2hhZG93cw=="))(),
            loadstring(base64decode("T3V0ZG9vckFtYmllbnQ="))(),loadstring(base64decode("U2hhZG93U29mdG5lc3M="))(),loadstring(base64decode("Q2xvY2tUaW1l"))(),loadstring(base64decode("R2VvZ3JhcGhpY0xhdGl0dWRl"))(),
            loadstring(base64decode("RXhwb3N1cmVDb21wZW5zYXRpb24="))(),
        }
        for _, p in ipairs(props) do pcall(function() saved[p] = Lighting[p] end) end
        savedChildren = {}
        for _, ch in ipairs(Lighting:GetChildren()) do
            if ch:IsA(loadstring(base64decode("UG9zdEVmZmVjdA=="))()) or ch:IsA(loadstring(base64decode("U2t5"))()) or ch:IsA(loadstring(base64decode("QXRtb3NwaGVyZQ=="))()) then
                ch.Parent = nil
                table.insert(savedChildren, ch)
            end
        end
        local bloom = Instance.new(loadstring(base64decode("Qmxvb21FZmZlY3Q="))())
        bloom.Intensity = 0.35; bloom.Size = 20; bloom.Threshold = 0.85
        local cc = Instance.new(loadstring(base64decode("Q29sb3JDb3JyZWN0aW9uRWZmZWN0"))())
        cc.Brightness = 0.05; cc.Contrast = 0.25; cc.Saturation = 0.15
        cc.TintColor = Color3.fromRGB(255, 245, 230)
        local sr = Instance.new(loadstring(base64decode("U3VuUmF5c0VmZmVjdA=="))())
        sr.Intensity = 0.12; sr.Spread = 0.8
        local sky = Instance.new(loadstring(base64decode("U2t5"))())
        sky.SkyboxBk = loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0xNTExNjUyMTQ="))()
        sky.SkyboxDn = loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0xNTExNjUxOTc="))()
        sky.SkyboxFt = loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0xNTExNjUyMjQ="))()
        sky.SkyboxLf = loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0xNTExNjUxOTE="))()
        sky.SkyboxRt = loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0xNTExNjUyMDY="))()
        sky.SkyboxUp = loadstring(base64decode("aHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0xNTExNjUyMjc="))()
        sky.SunAngularSize = 11
        local atm = Instance.new(loadstring(base64decode("QXRtb3NwaGVyZQ=="))())
        atm.Density = 0.3; atm.Offset = 0.25
        atm.Color = Color3.fromRGB(199, 175, 166)
        atm.Decay = Color3.fromRGB(44, 39, 33)
        atm.Glare = 0.35; atm.Haze = 1.2
        addedFx = {bloom, cc, sr, sky, atm}
        for _, fx in ipairs(addedFx) do fx.Parent = Lighting end
        pcall(function() Lighting.Technology = Enum.Technology.Future end)
        Lighting.Ambient = Color3.fromRGB(70, 70, 70)
        Lighting.Brightness = 2
        Lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
        Lighting.ColorShift_Top = Color3.fromRGB(0, 0, 0)
        Lighting.EnvironmentDiffuseScale = 1
        Lighting.EnvironmentSpecularScale = 1
        Lighting.GlobalShadows = true
        Lighting.OutdoorAmbient = Color3.fromRGB(100, 100, 100)
        Lighting.ShadowSoftness = 0.15
        Lighting.ClockTime = 14
        Lighting.GeographicLatitude = 45
        Lighting.ExposureCompensation = 0.1
        vignette = Instance.new(loadstring(base64decode("U2NyZWVuR3Vp"))())
        vignette.Name = loadstring(base64decode("RkhfUlRYVmlnbmV0dGU="))()
        vignette.IgnoreGuiInset = true
        vignette.ResetOnSpawn = false
        vignette.Parent = LocalPlayer:WaitForChild(loadstring(base64decode("UGxheWVyR3Vp"))())
        local img = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
        img.AnchorPoint = Vector2.new(0.5, 1)
        img.Position = UDim2.new(0.5, 0, 1, 0)
        img.Size = UDim2.new(1, 0, 1.05, 0)
        img.BackgroundTransparency = 1
        img.Image = loadstring(base64decode("cmJ4YXNzZXRpZDovLzQ1NzY0NzU0NDY="))()
        img.ImageTransparency = 0.35
        img.ZIndex = 10
        img.Parent = vignette
    end
    local function disable()
        if not rtxOn then return end
        rtxOn = false
        for _, fx in ipairs(addedFx) do pcall(function() fx:Destroy() end) end
        addedFx = {}
        for _, ch in ipairs(savedChildren) do pcall(function() ch.Parent = Lighting end) end
        savedChildren = {}
        for k, v in pairs(saved) do pcall(function() Lighting[k] = v end) end
        saved = {}
        if vignette then pcall(function() vignette:Destroy() end); vignette = nil end
    end

    local sec = Tabs.Effects:AddSection({Name=loadstring(base64decode("UlRYIFNoYWRlcg=="))()})
    _addOpt(sec, loadstring(base64decode("QWRkVG9nZ2xl"))(), loadstring(base64decode("RkhfUlRYT24="))(), {Title = loadstring(base64decode("0JLQutC70Y7Rh9C40YLRjCBSVFg="))(), Default = false}, function(v)
        if v then enable() else disable() end
        Notify(loadstring(base64decode("Rkg="))(), loadstring(base64decode("UlRYIA=="))()..(v and loadstring(base64decode("0JLQmtCb"))() or loadstring(base64decode("0JLQq9Ca0Js="))()), 2)
    end)
end

pcall(function() Window:SelectTab(1) end)

print(loadstring(base64decode("W0ZIXSA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ=="))())
print(loadstring(base64decode("W0ZIXSBQYXJ0IDIvMiDigJQgRXh0cmEgRmVhdHVyZXMgdjIwLjMg4oCUIA=="))()..CREDITS)
print(loadstring(base64decode("W0ZIXSBUcmFkZUhlbHBlciwgRW1vdGVzIChGSVhFRCksIFdhdGVyUHJvdCwgRmFkZURpc2FibGVyLCBBbnRpQ29pbg=="))())
print(loadstring(base64decode("W0ZIXSBHdW5Nb2RlbHMsIFNreWJveCwgQXVyYXMsIEFudGlBaW0sIEF2YXRhcnM="))())
print(loadstring(base64decode("W0ZIXSBHYW1lU291bmRzLCBKdW1wQ2lyY2xlLCBSVFg="))())
print(loadstring(base64decode("W0ZIXSA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ=="))())
end
cDp19HRZ(AqXPo)
end)(...)
