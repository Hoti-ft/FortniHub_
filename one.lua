--[[
███████╗██╗   ██╗██╗██╗         █████╗ ██╗  ██╗███████╗
██╔════╝██║   ██║██║██║        ██╔══██╗╚██╗██╔╝██╔════╝
█████╗  ██║   ██║██║██║        ███████║ ╚███╔╝ █████╗
██╔══╝  ╚██╗ ██╔╝██║██║        ██╔══██║ ██╔██╗ ██╔══╝
███████╗ ╚████╔╝ ██║███████╗   ██║  ██║██╔╝ ██╗███████╗
╚══════╝  ╚═══╝  ╚═╝╚══════╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝

        STUDIOS V2 OBFUSCATOR By MAX
        https://eaxe.net

        Sponsored by
        https://BloxDen.com
--]]

local x = game:GetService("Players");
local p = game:GetService("RunService");
local k = game:GetService("UserInputService");
local Y = game:GetService("VirtualInputManager");
local g = game:GetService("CoreGui");
local M = game:GetService("Workspace");
local m = game:GetService("Lighting");
local l = game:GetService("HttpService");
local i = game:GetService("TeleportService");
local N = game:GetService("ReplicatedStorage");
local C = game:GetService("VirtualUser");
local E = game:GetService("TweenService");
local F = game:GetService("Stats");
local c = game:GetService("CollectionService");
local z = game:GetService("SoundService");
local v = x.LocalPlayer;
local R = M.CurrentCamera;
local a = "18.4.0";
local d = "by HOTI and Ve315";
local P = { frozen = false, freezeUpKey = Enum.KeyCode.Space, freezeDownKey = Enum.KeyCode.LeftAlt };
local I = {
		enabled = false,
		predict = true,
		force = false,
		bindKey = Enum.KeyCode.E,
		standoff = 15,
		lastShot = 0,
	};
local D = {
		enabled = false,
		bindKey = Enum.KeyCode.R,
		radius = 20,
		fov = 120,
		showFov = true,
		checkWalls = false,
		instaKill = true,
		predict = true,
	};
local J = { on = false, dist = 30, lastHit = 0 };
local K = { on = false, dist = 30, lastHit = 0 };
local X = "v2";
local b = {};
local function h(x, p)
	if b[x] then
		pcall(function()
			b[x]:Disconnect();
		end);
	end;
	b[x] = p;
end;
local Q = { hrp = nil, hum = nil, cacheTime = 0 };
local function f()
	if tick() - Q.cacheTime < .5 then
		return;
	end;
	Q.cacheTime = tick();
	local x = v.Character;
	if x then
		Q.hrp = x:FindFirstChild("HumanoidRootPart");
		Q.hum = x:FindFirstChildOfClass("Humanoid");
	else
		Q.hrp, Q.hum = nil, nil;
	end;
end;
local function H()
	f();
	return Q.hrp;
end;
local function w()
	f();
	return Q.hum;
end;
local function s()
	local x, p = pcall(function()
			return require((N:WaitForChild("Modules")):WaitForChild("CurrentRoundClient"));
		end);
	if x and type(p) == "table" then
		return p.PlayerData;
	end;
	return nil;
end;
local function U(x)
	if not x then
		return "lobby";
	end;
	local p, k = pcall(function()
			return require((N:WaitForChild("Modules")):WaitForChild("CurrentRoundClient"));
		end);
	if p and (type(k) == "table" and type(k.PlayerData) == "table") then
		local p = k.PlayerData[x.Name];
		if p and not p.Dead then
			if p.Role == "Murderer" then
				return "murderer";
			end;
			if p.Role == "Sheriff" then
				return "sheriff";
			end;
			if p.Role == "Hero" then
				return "hero";
			end;
			return "innocent";
		end;
	end;
	local Y = x.Character;
	if Y then
		local p = x:FindFirstChild("Backpack");
		if Y:FindFirstChild("Knife") or (p and p:FindFirstChild("Knife")) then
			return "murderer";
		end;
		if Y:FindFirstChild("Gun") or (p and p:FindFirstChild("Gun")) then
			local x = s();
			if x then
				for x, p in pairs(x) do
					if type(p) == "table" and (p.Role == "Sheriff" and p.Dead) then
						return "hero";
					end;
				end;
			end;
			return "sheriff";
		end;
	end;
	return "innocent";
end;
local function n()
	for x, p in ipairs(x:GetPlayers()) do
		if p ~= v and U(p) == "murderer" then
			return p;
		end;
	end;
	return nil;
end;
local function q(x, p)
	local k = math.random;
	if x == nil then
		return k();
	end;
	if p == nil then
		if type(x) ~= "number" or x ~= x or x < 1 then
			x = 1;
		end;
		if x > 2147483647 then
			x = 2147483647;
		end;
		return k(math.floor(x));
	end;
	x, p = tonumber(x) or 0, tonumber(p) or 0;
	if p < x then
		x, p = p, x;
	end;
	if x == p then
		return x;
	end;
	return k(math.floor(x), math.floor(p));
end;
local Z;
do
	print("[FH] \208\151\208\176\208\179\209\128\209\131\208\182\208\176\209\142 Fluent UI...");
	local x = { "https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua", "https://raw.githubusercontent.com/dawid-scripts/Fluent/main/src/init.lua", "https://raw.githubusercontent.com/dawid-scripts/Fluent/master/src/init.lua" };
	local p;
	for x, k in ipairs(x) do
		local Y, g = pcall(function()
				return game:HttpGet(k, true);
			end);
		if Y and (type(g) == "string" and (#g > 1000 and not g:find("<html"))) then
			p = g;
			break;
		end;
	end;
	if not p then
		error("[FH] \208\157\208\181 \209\131\208\180\208\176\208\187\208\190\209\129\209\140 \208\183\208\176\208\179\209\128\209\131\208\183\208\184\209\130\209\140 Fluent UI");
	end;
	local k = loadstring(p, "@Fluent");
	Z = k and k();
	if type(Z) ~= "table" then
		error("[FH] Fluent \208\189\208\181 \209\130\208\176\208\177\208\187\208\184\209\134\208\176");
	end;
	print("[FH] Fluent \208\183\208\176\208\179\209\128\209\131\208\182\208\181\208\189");
end;
local function W(x)
	if not x then
		return x;
	end;
	for p, k in ipairs({
		"AddToggle",
		"AddSlider",
		"AddDropdown",
		"AddInput",
		"AddButton",
		"AddLabel",
		"AddKeybind",
		"AddColorpicker",
		"AddColorPicker",
	}) do
		local Y = x[k];
		if type(Y) == "function" and not rawget(x, "__" .. k) then
			rawset(x, "__" .. k, true);
			x[k] = function(x, ...)
					local p = Y(x, ...);
					if type(p) == "table" and p.Option == nil then
						p.Option = p;
					end;
					return p;
				end;
		end;
	end;
	if type(x.AddColorpicker) == "function" and type(x.AddColorPicker) ~= "function" then
		x.AddColorPicker = x.AddColorpicker;
	end;
	if type(x.AddSection) == "function" and not rawget(x, "__AS") then
		rawset(x, "__AS", true);
		local p = x.AddSection;
		x.AddSection = function(x, k)
				if type(k) == "table" then
					k = k.Name or k.name or "\208\161\208\181\208\186\209\134\208\184\209\143";
				end;
				if k == nil then
					k = "\208\161\208\181\208\186\209\134\208\184\209\143";
				end;
				local Y = p(x, k);
				if Y then
					if Y.Option == nil then
						Y.Option = Y;
					end;
					W(Y);
				end;
				return Y;
			end;
	end;
	return x;
end;
local A, y = nil, nil;
do
	A = Z:CreateWindow({
			Title = "FortniHub MM2",
			SubTitle = "v" .. (a .. (" \226\128\148 " .. d)),
			TabWidth = 130,
			Size = UDim2.fromOffset(620, 700),
			Theme = "Darker",
			MinimizeKey = Enum.KeyCode.P,
		});
	y = Z.Options;
	(getgenv()).FH_Window = A;
	local x = A.AddTab;
	A.AddTab = function(p, ...)
			local k = x(p, ...);
			return W(k);
		end;
end;
local L = {};
(getgenv()).FH_Tabs = L;
L.Combat = A:AddTab({ Title = "\208\145\208\190\208\185" });
L.Movement = A:AddTab({ Title = "\208\148\208\178\208\184\208\182\208\181\208\189\208\184\208\181" });
L.Binds = A:AddTab({ Title = "\208\145\208\184\208\189\208\180\209\139" });
L.Visual = A:AddTab({ Title = "\208\146\208\184\208\183\209\131\208\176\208\187" });
L.Effects = A:AddTab({ Title = "\208\173\209\132\209\132\208\181\208\186\209\130\209\139" });
L.Farm = A:AddTab({ Title = "\208\164\208\176\209\128\208\188" });
L.Animations = A:AddTab({ Title = "\208\144\208\189\208\184\208\188\208\176\209\134\208\184\208\184" });
L.Utility = A:AddTab({ Title = "\208\163\209\130\208\184\208\187\208\184\209\130\209\139" });
L.Troll = A:AddTab({ Title = "\208\162\209\128\208\190\208\187\208\187\208\184\208\189\208\179" });
L.Settings = A:AddTab({ Title = "\208\157\208\176\209\129\209\130\209\128\208\190\208\185\208\186\208\184" });
local t = {};
local function V(x, p, k)
	local Y = tostring(x) .. ("|" .. tostring(p));
	if t[Y] and (tick() - t[Y]) < .5 then
		return;
	end;
	t[Y] = tick();
	pcall(function()
		Z:Notify({ Title = x, Content = p, Duration = k or 3 });
	end);
end;
(getgenv()).FH_Notify = V;
local O, r, T, e;
do
	pcall(function()
		for x, p in ipairs({
			"FH_HUD_v18",
			"FH_HUD",
			"FH_HUD_v182",
			"FH_HUD_v1821",
			"FH_HUD_v183",
		}) do
			local k = g:FindFirstChild(p);
			if k then
				k:Destroy();
			end;
		end;
	end);
	O = Instance.new("ScreenGui");
	O.Name = "FH_HUD_v184";
	O.ResetOnSpawn = false;
	O.IgnoreGuiInset = true;
	O.DisplayOrder = 500;
	O.Parent = g;
	e = Instance.new("Frame");
	e.Name = "Pill";
	e.AnchorPoint = Vector2.new(.5, 0);
	e.Position = UDim2.new(.5, 0, 0, 12);
	e.Size = UDim2.fromOffset(400, 40);
	e.BackgroundColor3 = Color3.fromRGB(15, 15, 20);
	e.BorderSizePixel = 0;
	e.Active = true;
	e.Parent = O;
	(Instance.new("UICorner", e)).CornerRadius = UDim.new(1, 0);
	local x = Instance.new("UIStroke", e);
	x.Color = Color3.fromRGB(138, 92, 246);
	x.Thickness = 1;
	x.Transparency = .5;
	local M = Instance.new("UIGradient", e);
	M.Rotation = 45;
	M.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 30, 60)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(20, 20, 28)), ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 30, 60)) });
	local m, l, i, N = false, nil, nil, false;
	local C = 6;
	local function E()
		local x = (getgenv()).FH_Window;
		if x and type(x.Toggle) == "function" then
			local p = pcall(function()
					x:Toggle();
				end);
			if p then
				return;
			end;
		end;
		pcall(function()
			Y:SendKeyEvent(true, Enum.KeyCode.P, false, game);
			task.wait(.02);
			Y:SendKeyEvent(false, Enum.KeyCode.P, false, game);
		end);
	end;
	e.InputBegan:Connect(function(x)
		if x.UserInputType == Enum.UserInputType.MouseButton1 or x.UserInputType == Enum.UserInputType.Touch then
			m = true;
			N = false;
			l = x.Position;
			i = e.Position;
		end;
	end);
	k.InputChanged:Connect(function(x)
		if not m then
			return;
		end;
		if x.UserInputType == Enum.UserInputType.MouseMovement or x.UserInputType == Enum.UserInputType.Touch then
			local p = x.Position - l;
			if math.abs(p.X) > C or math.abs(p.Y) > C then
				N = true;
			end;
			if N then
				e.Position = UDim2.new(i.X.Scale, i.X.Offset + p.X, i.Y.Scale, i.Y.Offset + p.Y);
			end;
		end;
	end);
	k.InputEnded:Connect(function(x)
		if x.UserInputType ~= Enum.UserInputType.MouseButton1 and x.UserInputType ~= Enum.UserInputType.Touch then
			return;
		end;
		if not m then
			return;
		end;
		local p = not N;
		m = false;
		if p then
			E();
		end;
	end);
	local function F(x, p)
		local k = Instance.new("Frame");
		k.BackgroundTransparency = 1;
		k.Position = UDim2.fromOffset(x, 0);
		k.Size = UDim2.fromOffset(p, 40);
		k.Parent = e;
		return k;
	end;
	local function c(x)
		local p = Instance.new("Frame");
		p.BackgroundColor3 = Color3.fromRGB(70, 70, 85);
		p.BorderSizePixel = 0;
		p.Position = UDim2.new(0, x, .5, -10);
		p.Size = UDim2.fromOffset(1, 20);
		p.Parent = e;
	end;
	local z = F(8, 130);
	local R = Instance.new("TextLabel");
	R.BackgroundTransparency = 1;
	R.Size = UDim2.fromOffset(120, 40);
	R.Position = UDim2.fromOffset(12, 0);
	R.Font = Enum.Font.GothamBold;
	R.Text = "FH";
	R.TextSize = 20;
	R.TextColor3 = Color3.fromRGB(178, 152, 255);
	R.TextXAlignment = Enum.TextXAlignment.Left;
	R.Parent = z;
	c(142);
	local a = F(146, 120);
	local d = Instance.new("TextLabel");
	d.BackgroundTransparency = 1;
	d.Size = UDim2.fromOffset(40, 40);
	d.Position = UDim2.fromOffset(6, 0);
	d.Font = Enum.Font.GothamBold;
	d.Text = "FPS";
	d.TextSize = 13;
	d.TextColor3 = Color3.fromRGB(140, 140, 160);
	d.TextXAlignment = Enum.TextXAlignment.Left;
	d.Parent = a;
	r = Instance.new("TextLabel");
	r.BackgroundTransparency = 1;
	r.Size = UDim2.fromOffset(60, 40);
	r.Position = UDim2.fromOffset(46, 0);
	r.Font = Enum.Font.GothamBold;
	r.Text = "60";
	r.TextSize = 15;
	r.TextColor3 = Color3.fromRGB(80, 240, 120);
	r.TextXAlignment = Enum.TextXAlignment.Left;
	r.Parent = a;
	c(270);
	local P = F(274, 110);
	local I = Instance.new("TextLabel");
	I.BackgroundTransparency = 1;
	I.Size = UDim2.fromOffset(30, 40);
	I.Position = UDim2.fromOffset(6, 0);
	I.Font = Enum.Font.GothamBold;
	I.Text = "ms";
	I.TextSize = 13;
	I.TextColor3 = Color3.fromRGB(140, 140, 160);
	I.TextXAlignment = Enum.TextXAlignment.Left;
	I.Parent = P;
	T = Instance.new("TextLabel");
	T.BackgroundTransparency = 1;
	T.Size = UDim2.fromOffset(60, 40);
	T.Position = UDim2.fromOffset(36, 0);
	T.Font = Enum.Font.GothamBold;
	T.Text = "0";
	T.TextSize = 15;
	T.TextColor3 = Color3.fromRGB(80, 240, 120);
	T.TextXAlignment = Enum.TextXAlignment.Left;
	T.Parent = P;
	local function D()
		if r and r.Parent then
			local x, p = pcall(function()
					return r.Text;
				end);
			if not x or type(p) ~= "string" or not tonumber(p) then
				r.Text = "60";
			end;
		end;
		if T and T.Parent then
			local x, p = pcall(function()
					return T.Text;
				end);
			if not x or type(p) ~= "string" or not tonumber(p) then
				T.Text = "0";
			end;
		end;
	end;
	local J, K = 0, os.clock();
	h("HUD_FPS", p.Heartbeat:Connect(function()
		J = J + 1;
		local x = os.clock();
		if x - K >= 1 then
			local p = J;
			J = 0;
			K = x;
			local k = p < 30 and Color3.fromRGB(255, 80, 80) or (p < 60 and Color3.fromRGB(255, 200, 80) or Color3.fromRGB(80, 240, 120));
			if r and r.Parent then
				r.Text = tostring(p);
				r.TextColor3 = k;
			end;
		end;
	end));
	local X = 0;
	h("HUD_PING", p.Heartbeat:Connect(function()
		local x = os.clock();
		if x - X < .4 then
			return;
		end;
		X = x;
		local p, k = pcall(function()
				local x = v:GetNetworkPing() * 1000;
				if x ~= x or x < 0 then
					x = 0;
				end;
				return math.floor(x);
			end);
		if p and (T and T.Parent) then
			local x = k < 60 and Color3.fromRGB(80, 240, 120) or (k < 120 and Color3.fromRGB(255, 200, 80) or Color3.fromRGB(255, 80, 80));
			T.Text = tostring(k);
			T.TextColor3 = x;
		end;
	end));
	task.spawn(function()
		while true do
			task.wait(.5);
			D();
		end;
	end);
	task.delay(.5, D);
end;
do
	local Y = 300;
	local g = table.create(48, 0);
	local m = table.create(48, Vector3.zero);
	local l, i = 0, 0;
	local C = {
			target = nil,
			char = nil,
			part = nil,
			hum = nil,
			pos = nil,
			time = 0,
			vel = Vector3.zero,
			gap = 0,
			ready = false,
			fresh = Vector3.zero,
			air = false,
			air_since = 0,
			jumping = false,
			jump_v = 0,
			fresh_ok = false,
			turn = 0,
			spoof = 0,
			clr = 0,
			air_edge = 0,
			jump_fresh = false,
		};
	local E = {
			vt = table.create(48, 0),
			dx = table.create(48, 0),
			dz = table.create(48, 0),
			vn = 0,
			vi = 0,
		};
	local z = {
			ping = 0,
			rtt = 0,
			jitter = 0,
			seen = false,
			step = 0,
			step_seen = false,
		};
	local R = {
			snap = 48,
			ring = 48,
			hit_r = 2.1,
			pad = 2.6,
			min_span = 5,
			max_span = 90,
			acc_t = .15,
			acc_max = 280,
			acc_min = 40,
			speed_floor = 26,
			speed_head = 1.3,
		};
	local a = {
			ok = false,
			ax = 0,
			az = 0,
			smax = 0,
		};
	local d = { base = 0, seen = false };
	local P = { v = 0, seen = false };
	local b = {
			pos = {},
			w = {},
			n = 0,
			weight = 0,
			primary = nil,
			stamp = 0,
			conf = 0,
		};
	local function Q(x)
		if x <= 0 or x > .5 then
			return;
		end;
		if z.step_seen then
			z.step = z.step * .85 + x * .15;
		else
			z.step = x;
			z.step_seen = true;
		end;
	end;
	local function f()
		local x = math.max(z.step, C.gap);
		if x <= 0 then
			return 0;
		end;
		return x;
	end;
	local function H(x, p)
		i = i % R.snap + 1;
		g[i] = x;
		m[i] = p;
		if l < R.snap then
			l = l + 1;
		end;
	end;
	local function w(x)
		local p = (((i - x) - 1)) % R.snap + 1;
		return g[p], m[p];
	end;
	local function q()
		if l < 3 then
			return nil, 0;
		end;
		local x = select(1, w(0));
		local p, k = 0, 0;
		local Y = math.max(f() * 4, .08);
		for g = 0, l - 1, 1 do
			local M = select(1, w(g));
			if x - M > Y then
				break;
			end;
			p = p + 1;
			k = k + ((M - x));
		end;
		if p < 3 then
			return nil, 0;
		end;
		local g = k / p;
		local M, m = Vector3.zero, 0;
		for p = 0, p - 1, 1 do
			local k, Y = w(p);
			local l = ((k - x)) - g;
			M = M + Y * l;
			m = m + l * l;
		end;
		if m < 1e-08 then
			return nil, 0;
		end;
		return M / m, -g;
	end;
	local function Z()
		if l < 2 then
			return nil, nil;
		end;
		local x, p = w(0);
		local k, Y = nil, nil;
		local g = f() * 2;
		local M = g * 2;
		for m = 1, l - 1, 1 do
			local l, i = w(m);
			local N = x - l;
			if N > M then
				break;
			end;
			if N > 0 then
				k = ((p - i)) / N;
				Y = N * .5;
				if N >= g then
					return k, Y;
				end;
			end;
		end;
		return k, Y;
	end;
	local function W()
		if l < 5 then
			return nil;
		end;
		local x = w(0);
		local p = math.max(f() * 5, .12);
		local k = p;
		local Y, g, M, m, i = 0, 0, 0, 0, 0;
		local N, C, E = 0, 0, 0;
		local F, c, z = 0, 0, 0;
		for l = 0, l - 1, 1 do
			local v, R = w(l);
			local a = x - v;
			if a > p then
				break;
			end;
			local d = -a / k;
			local P = d * d;
			Y = Y + 1;
			g = g + d;
			M = M + P;
			m = m + P * d;
			i = i + P * P;
			N = N + R.X;
			C = C + R.X * d;
			E = E + R.X * P;
			F = F + R.Z;
			c = c + R.Z * d;
			z = z + R.Z * P;
		end;
		if Y < 5 then
			return nil;
		end;
		local v = (Y * ((M * i - m * m)) - g * ((g * i - m * M))) + M * ((g * m - M * M));
		if math.abs(v) < 1e-09 then
			return nil;
		end;
		local function R(x, p, k)
			local l = (Y * ((p * i - m * k)) - x * ((g * i - m * M))) + M * ((g * k - p * M));
			local N = (Y * ((M * k - p * m)) - g * ((g * k - p * M))) + x * ((g * m - M * M));
			return l / v, N / v;
		end;
		local a, d = R(N, C, E);
		local P, I = R(F, c, z);
		local D, J = a / k, P / k;
		local K, X = (2 * d) / ((k * k)), (2 * I) / ((k * k));
		if D ~= D or J ~= J or K ~= K or X ~= X then
			return nil;
		end;
		return Vector3.new(D, 0, J), Vector3.new(K, 0, X);
	end;
	local function A()
		local x, p = W();
		if not x then
			a.ok = false;
			a.ax = 0;
			a.az = 0;
			return nil;
		end;
		a.ok = true;
		local k = math.sqrt(x.X * x.X + x.Z * x.Z);
		if k > a.smax then
			a.smax = k;
		else
			a.smax = a.smax * .985 + k * .015;
		end;
		if p and not C.air then
			local x = math.sqrt(p.X * p.X + p.Z * p.Z);
			local k, Y = p.X, p.Z;
			if x > R.acc_max and x > 0 then
				k = (k * R.acc_max) / x;
				Y = (Y * R.acc_max) / x;
			end;
			a.ax = a.ax * .5 + k * .5;
			a.az = a.az * .5 + Y * .5;
		else
			a.ax = a.ax * .5;
			a.az = a.az * .5;
		end;
		return x;
	end;
	local function t(x)
		local p, k = w(x);
		local Y, g = w(x + 1);
		local M = p - Y;
		if M <= 0 then
			return nil;
		end;
		return ((k - g)) / M, M;
	end;
	local function O()
		if l < 3 then
			return nil;
		end;
		local x, p = t(0);
		local k, Y = t(1);
		if not x or not k then
			return nil;
		end;
		local g = ((p + Y)) * .5;
		if g <= .0001 then
			return nil;
		end;
		return ((x.Y - k.Y)) / g;
	end;
	local function r()
		local x, p = pcall(function()
				return M.Gravity;
			end);
		if x and (type(p) == "number" and p > 0) then
			return p;
		end;
		return 0;
	end;
	local function T()
		if l < 2 then
			return nil;
		end;
		local x = C.air_edge;
		if x <= 0 then
			return nil;
		end;
		local p = r();
		local k, Y = w(0);
		local g = f() * 2;
		local M = nil;
		for m = 1, l - 1, 1 do
			local l, i = w(m);
			if l < x then
				break;
			end;
			local N = k - l;
			if N > .0001 then
				M = ((Y.Y - i.Y)) / N - (.5 * p) * N;
				if N >= g then
					break;
				end;
			end;
		end;
		return M;
	end;
	local function e()
		local x = C.part;
		local p = C.hum;
		if not x or not p then
			return 0;
		end;
		local k, Y = pcall(function()
				return x.Size.Y * .5 + p.HipHeight;
			end);
		if k and (type(Y) == "number" and Y > 0) then
			return Y;
		end;
		return 0;
	end;
	local function G()
		if d.seen then
			return d.base;
		end;
		return e();
	end;
	local function o(x)
		local p, k = pcall(function()
				return x.AssemblyLinearVelocity;
			end);
		if not p or typeof(k) ~= "Vector3" then
			p, k = pcall(function()
					return x.Velocity;
				end);
		end;
		if not p or typeof(k) ~= "Vector3" then
			return nil;
		end;
		if k.Magnitude ~= k.Magnitude then
			return nil;
		end;
		return k;
	end;
	local function j(x, p)
		if not x or not p then
			return 0;
		end;
		local k = Vector3.new(x.X, 0, x.Z);
		local Y = Vector3.new(p.X, 0, p.Z);
		local g, M = k.Magnitude, Y.Magnitude;
		if g < 1 and M < 1 then
			return 1;
		end;
		if g < 1 or M < 1 then
			return 0;
		end;
		local m = M / g;
		if m > 1.5 or m < .6 then
			return 0;
		end;
		local l = k.Unit:Dot(Y.Unit);
		if l < .7 then
			return 0;
		end;
		local i = math.clamp(((l - .7)) / .25, 0, 1);
		local N = 1 - math.clamp(math.abs(m - 1) / .4, 0, 1);
		return i * N;
	end;
	local function B(x, p, k)
		if not x then
			return nil;
		end;
		local Y = 0;
		if k then
			Y = x.Y - r() * math.clamp(p or 0, 0, f() * 4);
		end;
		return Vector3.new(x.X, Y, x.Z);
	end;
	local function S(x, p, k, Y, g, M, m)
		local l = B(x, p, m);
		local i = B(k, Y, m);
		local N = 0;
		if l and i then
			local x = Vector3.new(l.X, 0, l.Z);
			local p = Vector3.new(i.X, 0, i.Z);
			if x.Magnitude > 1 and p.Magnitude > 1 then
				N = math.acos(math.clamp(x.Unit:Dot(p.Unit), -1, 1)) / math.pi;
			end;
		end;
		local C = i or l;
		if not C then
			return Vector3.zero, 0, nil, 0;
		end;
		if l and i then
			local x = math.clamp(N * 2.2, 0, 1);
			C = l:Lerp(i, .4 + .6 * x);
		end;
		local E = 0;
		if g then
			local x = B(g, M, m);
			E = j(C, x);
			if E > 0 and m then
				C = (Vector3.new(C.X, C.Y, C.Z)):Lerp(Vector3.new(C.X, x.Y, C.Z), E * .35);
			end;
		end;
		return C, N, i or l, E;
	end;
	local function u(x, p, k)
		E.vi = E.vi % R.ring + 1;
		E.vt[E.vi] = x;
		E.dx[E.vi] = p;
		E.dz[E.vi] = k;
		if E.vn < R.ring then
			E.vn = E.vn + 1;
		end;
	end;
	local function xo()
		C.part = nil;
		C.pos = nil;
		C.vel = Vector3.zero;
		C.gap = 0;
		C.ready = false;
		C.fresh = Vector3.zero;
		C.air = false;
		C.jumping = false;
		C.jump_v = 0;
		C.fresh_ok = false;
		C.turn = 0;
		C.spoof = 0;
		C.clr = 0;
		C.air_edge = 0;
		C.jump_fresh = false;
		d.base = 0;
		d.seen = false;
		P.v = 0;
		P.seen = false;
		l, i = 0, 0;
		E.vn, E.vi = 0, 0;
		a.ok = false;
		a.ax = 0;
		a.az = 0;
		a.smax = 0;
	end;
	local function po(x, p, k)
		C.part = x;
		C.pos = p;
		C.time = k;
		C.vel = Vector3.zero;
		C.fresh = Vector3.zero;
		C.fresh_ok = false;
		C.turn = 0;
		C.jump_v = 0;
		C.gap = 0;
		C.ready = false;
		C.spoof = 0;
		C.air_edge = 0;
		C.jump_fresh = false;
		d.base = 0;
		d.seen = false;
		l, i = 0, 0;
		a.ok = false;
		a.ax = 0;
		a.az = 0;
		H(k, p);
	end;
	local ko = RaycastParams.new();
	ko.FilterType = Enum.RaycastFilterType.Exclude;
	ko.IgnoreWater = true;
	local Yo = {};
	local function go(x, p)
		table.clear(Yo);
		local k = 0;
		local Y = C.char;
		if Y then
			k = k + 1;
			Yo[k] = Y;
		end;
		local g = v.Character;
		if g then
			k = k + 1;
			Yo[k] = g;
		end;
		ko.FilterDescendantsInstances = Yo;
		local m = M:Raycast(x, Vector3.new(0, -p, 0), ko);
		if m then
			return m.Position.Y;
		end;
		return nil;
	end;
	local function Mo(x)
		local p = C.part;
		if not p or not p.Parent then
			C.fresh_ok = false;
			return;
		end;
		local k = p.Position;
		local Y = r();
		local g = t(0);
		local M = g and g.Y or 0;
		local m = O();
		local l = m ~= nil and m < -Y * .5;
		local i = G();
		local N = (i + 6) + (math.abs(M) * f()) * 4;
		local E;
		local F = go(k, N);
		if F then
			local x = k.Y - F;
			C.clr = x;
			if math.abs(M) < 1 and not l then
				if d.seen then
					if x < d.base then
						d.base = d.base * .7 + x * .3;
					else
						d.base = d.base * .98 + x * .02;
					end;
				else
					d.base = x;
					d.seen = true;
				end;
			end;
			local p = d.seen and d.base or i;
			local Y = math.max(p * .35, 1);
			E = x > p + Y;
			if not E and (l and (math.abs(M) > 4 and x > p + .35)) then
				E = true;
			end;
		else
			E = true;
		end;
		if E ~= C.air then
			C.air_edge = x;
			if E then
				C.air_since = x;
				C.jump_fresh = true;
				C.jump_v = P.seen and P.v or math.max(M, 0);
			else
				C.jump_fresh = false;
				C.jump_v = 0;
			end;
		end;
		local c = C.jump_v - Y * math.max(0, x - C.air_since);
		C.air = E;
		C.jumping = E and ((M > 1 or c > 1));
	end;
	local function mo(x)
		local p = C.part;
		if not p or not p.Parent then
			if C.part then
				xo();
			end;
			return;
		end;
		Mo(x);
		local k = p.Position;
		if p ~= C.part or not C.pos then
			po(p, k, x);
			return;
		end;
		local Y = x - C.time;
		if Y > .75 or ((k - C.pos)).Magnitude > 140 then
			po(p, k, x);
			return;
		end;
		if Y <= 0 then
			return;
		end;
		if ((k - C.pos)).Magnitude == 0 then
			if C.gap > 0 and Y >= C.gap then
				C.vel = Vector3.zero;
				C.fresh = Vector3.zero;
			end;
			return;
		end;
		Q(Y);
		C.gap = Y;
		H(x, k);
		C.pos = k;
		C.time = x;
		local g, M = q();
		local m, l = Z();
		local i = o(p);
		local N, E, F, c = S(g, M, m, l, i, f() * .5, C.air);
		local z = A();
		if z then
			N = Vector3.new(z.X, N.Y, z.Z);
		end;
		if i and c <= 0 then
			if C.spoof < 20 then
				C.spoof = C.spoof + 1;
			end;
		elseif C.spoof > 0 then
			C.spoof = C.spoof - 1;
		end;
		if C.air then
			local p = T();
			if p then
				N = Vector3.new(N.X, p, N.Z);
				local k = math.max(0, x - C.air_edge);
				if C.jump_fresh and k <= .2 then
					local x = p + r() * k;
					if x > 1 then
						if P.seen then
							P.v = P.v * .7 + x * .3;
						else
							P.v = x;
							P.seen = true;
						end;
						if x > C.jump_v then
							C.jump_v = x;
						end;
					end;
				else
					C.jump_fresh = false;
				end;
			end;
		end;
		C.vel = N;
		C.ready = g ~= nil or m ~= nil;
		C.fresh = C.vel;
		C.fresh_ok = C.ready;
		C.turn = E;
		local v = F or N;
		u(x, v.X, v.Z);
	end;
	local function lo()
		local x, p;
		local k, Y = pcall(function()
				return F.Network.ServerStatsItem["Data Ping"]:GetValue();
			end);
		if k and (type(Y) == "number" and (Y == Y and (Y > 4 and Y < 800))) then
			x = Y / 1000;
		end;
		local g, M = pcall(function()
				return v:GetNetworkPing();
			end);
		if g and (type(M) == "number" and (M == M and M > 0)) then
			local x = M * 2;
			if x > .004 and x < .8 then
				p = x;
			end;
		end;
		if x and p then
			return ((x + p)) * .5;
		end;
		return x or p;
	end;
	local function io()
		local x = lo();
		if not x or x ~= x then
			return;
		end;
		x = math.clamp(x, 0, 1);
		if z.seen then
			z.jitter = z.jitter * .9 + math.abs(x - z.rtt) * .1;
			z.rtt = z.rtt * .82 + x * .18;
		else
			z.rtt = x;
			z.jitter = 0;
			z.seen = true;
		end;
		z.ping = z.rtt;
	end;
	local function No()
		if not z.seen then
			return 0;
		end;
		local x = 0;
		if C.time > 0 and z.step_seen then
			x = math.clamp(os.clock() - C.time, 0, z.step);
		end;
		return math.clamp((z.rtt + z.jitter * .5) + x, 0, 1);
	end;
	local function Co(x, p)
		local k, Y = math.cos(p), math.sin(p);
		return Vector3.new(x.X * k - x.Z * Y, x.Y, x.X * Y + x.Z * k);
	end;
	local function Eo(x)
		if E.vn < 4 then
			return 1, 0;
		end;
		x = math.max(x, f() * 3);
		local p = E.vt[E.vi];
		local k, Y, g = 0, 0, 0;
		local M = nil;
		local m, l = 0, 0;
		local i = p;
		for N = 0, E.vn - 1, 1 do
			local C = (((E.vi - N) - 1)) % R.ring + 1;
			local F = E.vt[C];
			if p - F > x then
				break;
			end;
			local c, z = E.dx[C], E.dz[C];
			local v = math.sqrt(c * c + z * z);
			if v > 0 then
				k = k + c / v;
				Y = Y + z / v;
				g = g + 1;
				local x = math.atan2(z, c);
				if M then
					local p = x - M;
					while p > math.pi do
						p = p - 6.2831853;
					end;
					while p < -math.pi do
						p = p + 6.2831853;
					end;
					m = m + p;
					l = l + 1;
				end;
				M = x;
				i = F;
			end;
		end;
		if g < 2 then
			return 1, 0;
		end;
		local N = math.clamp(math.sqrt(k * k + Y * Y) / g, 0, 1);
		local C = 0;
		local F = p - i;
		if l >= 1 and F > .001 then
			C = -m / F;
		end;
		return N, C;
	end;
	local function Fo(x, p, k, Y, g)
		local M = math.max(0, p + k);
		local m = r();
		local l = Y;
		if l.Magnitude == 0 then
			l = Vector3.new(C.vel.X, 0, C.vel.Z);
		end;
		local i, N;
		if M > 0 and a.ok then
			local p = math.clamp(g - C.time, 0, f() * 2);
			local k, Y = a.ax, a.az;
			if C.air or math.sqrt(k * k + Y * Y) < R.acc_min then
				k, Y = 0, 0;
			end;
			local m = l.X + k * p;
			local E = l.Z + Y * p;
			local F = math.min(M, R.acc_t);
			local c = m * M + ((.5 * k) * F) * F;
			local z = E * M + ((.5 * Y) * F) * F;
			local v = math.sqrt(c * c + z * z);
			local d = math.max(a.smax * R.speed_head, R.speed_floor) * M;
			if v > d and v > 1e-06 then
				c = (c * d) / v;
				z = (z * d) / v;
			end;
			i = x.X + c;
			N = x.Z + z;
		else
			local p = M;
			if M > 0 and (l.Magnitude > 0 and not C.air) then
				local x, k = Eo(M);
				local Y = math.clamp(x, 0, 1) * ((1 - math.clamp(C.turn, 0, 1) * .5));
				if k ~= 0 then
					l = Co(l, math.clamp(((k * M) * .5) * Y, -0.6, .6));
				end;
				p = M * ((.85 + .15 * Y));
			end;
			i = x.X + l.X * p;
			N = x.Z + l.Z * p;
		end;
		local E = x.Y;
		if C.air and M > 0 then
			local p = C.vel.Y;
			local k = math.max(0, g - C.air_since);
			local Y = C.jump_v - m * k;
			if C.jumping and (C.jump_v > 0 and (m > 0 and (k <= C.jump_v / m and Y > p))) then
				p = Y;
			end;
			E = (x.Y + p * M) - ((.5 * m) * M) * M;
			if E < x.Y then
				local p = G();
				local k = (x.Y - E) + p;
				local Y = go(Vector3.new(i, x.Y, N), k);
				if Y then
					local x = Y + p;
					if E < x then
						E = x;
					end;
				end;
			end;
		end;
		return Vector3.new(i, E, N);
	end;
	local function co(x, p)
		table.clear(b.pos);
		table.clear(b.w);
		local k = I.predict and (C.ready and No()) or 0;
		local Y = Vector3.new(C.fresh.X, 0, C.fresh.Z);
		b.primary = Fo(x, 0, k, Y, p);
		b.n = 1;
		b.pos[1] = b.primary;
		b.w[1] = 1;
		b.weight = 1;
		b.stamp = p;
	end;
	local zo = {};
	local function vo(x)
		table.clear(zo);
		local p = 0;
		local function k(x)
			if typeof(x) ~= "Vector3" or x.Magnitude < .0001 then
				return;
			end;
			local k = x.Unit;
			for x = 1, p, 1 do
				if zo[x]:Dot(k) > .985 then
					return;
				end;
			end;
			p = p + 1;
			zo[p] = k;
		end;
		local Y = Vector3.new(C.fresh.X, 0, C.fresh.Z);
		if C.air then
			k(C.fresh);
		end;
		k(Y);
		for p = 1, b.n, 1 do
			k(b.pos[p] - x);
		end;
		k(C.fresh);
		k(Vector3.new(0, 1, 0));
		return p;
	end;
	local function Ro(x, p)
		local k = 0;
		local Y, g = 0, 0;
		for M = 1, b.n, 1 do
			local m = b.pos[M] - x;
			local l = m:Dot(p);
			local i = ((m - p * l)).Magnitude;
			if i <= R.hit_r then
				k = k + b.w[M];
				if l < Y then
					Y = l;
				end;
				if l > g then
					g = l;
				end;
			end;
		end;
		return k, Y, g;
	end;
	local function ao(x)
		local p = C.part;
		if not p or not p.Parent then
			return nil;
		end;
		local k = p.Position;
		co(k, x);
		local Y = b.primary or k;
		local g = vo(Y);
		local M, m, l, i = nil, -1, 0, 0;
		for x = 1, g, 1 do
			local p = zo[x];
			local k, g, N = Ro(Y, p);
			if k > m then
				M, m, l, i = p, k, g, N;
			end;
		end;
		if not M then
			return nil;
		end;
		b.conf = b.weight > 0 and m / b.weight or 0;
		local N = R.pad;
		local E = Y + M * ((l - N));
		local F = Y + M * ((i + N));
		if ((F - E)).Magnitude < 4 then
			E = Y - M * 4;
			F = Y + M * 4;
		end;
		return E, F, b.conf, Y;
	end;
	local function Po()
		local x = C.part;
		if not x or not x.Parent then
			return Vector3.zero;
		end;
		if not I.predict or not C.ready then
			return Vector3.zero;
		end;
		local p = x.Position;
		local k = os.clock();
		local Y = Vector3.new(C.fresh.X, 0, C.fresh.Z);
		local g = Fo(p, 0, No(), Y, k);
		return g - p;
	end;
	local Io = RaycastParams.new();
	Io.FilterType = Enum.RaycastFilterType.Exclude;
	Io.IgnoreWater = false;
	local Do, Jo = {}, {};
	local function Ko()
		table.clear(Do);
		local x = v.Character;
		if x then
			Do[1] = x;
		end;
		local p, k = pcall(function()
				return c:GetTagged("WeaponPassthrough");
			end);
		if p and type(k) == "table" then
			for x = 1, #k, 1 do
				Do[#Do + 1] = k[x];
			end;
		end;
	end;
	local function Xo(x, p)
		Ko();
		table.clear(Jo);
		for x = 1, #Do, 1 do
			Jo[x] = Do[x];
		end;
		local k = nil;
		for Y = 1, 6, 1 do
			Io.FilterDescendantsInstances = Jo;
			k = M:Raycast(x, p, Io);
			if not k then
				break;
			end;
			local g = k.Instance;
			if not g then
				break;
			end;
			local m, l = pcall(function()
					return g.Transparency;
				end);
			if not m or l ~= 1 then
				break;
			end;
			Jo[#Jo + 1] = g;
		end;
		return k;
	end;
	local function bo(x, p)
		if not x or not p then
			return false;
		end;
		local k = p - x;
		local g = k.Magnitude;
		if g < .5 then
			return true;
		end;
		if g > Y then
			return false;
		end;
		local M = Xo(x, k);
		if not M then
			return true;
		end;
		local m = M.Instance;
		local l = C.char;
		if m and (l and ((m == l or m:IsDescendantOf(l)))) then
			return true;
		end;
		return ((M.Position - x)).Magnitude >= g - .75;
	end;
	local ho = {
			"HumanoidRootPart",
			"UpperTorso",
			"Torso",
			"LowerTorso",
			"Head",
			"RightUpperArm",
			"LeftUpperArm",
			"Right Arm",
			"Left Arm",
			"RightUpperLeg",
			"LeftUpperLeg",
			"Right Leg",
			"Left Leg",
			"RightLowerLeg",
			"LeftLowerLeg",
		};
	local Qo, fo, Ho = {}, 0, nil;
	local function wo()
		local x = C.char;
		if x == Ho then
			return;
		end;
		table.clear(Qo);
		fo = 0;
		Ho = x;
		if not x then
			return;
		end;
		for p = 1, #ho, 1 do
			local k = x:FindFirstChild(ho[p]);
			if k and k:IsA("BasePart") then
				fo = fo + 1;
				Qo[fo] = k;
			end;
		end;
	end;
	local function so()
		local x = v.Character;
		if not x then
			return nil;
		end;
		local p = x:FindFirstChild("HumanoidRootPart");
		if not p then
			return nil;
		end;
		local k = p:FindFirstChild("GunRaycastAttachment");
		if k then
			return k.WorldCFrame;
		end;
		return p.CFrame;
	end;
	local function Uo(x, p)
		wo();
		if fo == 0 then
			return nil;
		end;
		local k = Po();
		local Y = nil;
		for p = 1, fo, 1 do
			local g = Qo[p];
			if not g.Parent then
				Ho = nil;
			else
				local p = g.Position + k;
				if not x then
					return p;
				end;
				if not Y then
					Y = p;
				end;
				if bo(x, p) then
					return p;
				end;
			end;
		end;
		if p then
			return nil;
		end;
		return Y;
	end;
	local no, qo, Zo = nil, nil, 0;
	local function Wo()
		local x = no;
		if not x then
			return;
		end;
		local p = qo;
		no, qo = nil, nil;
		if p then
			pcall(function()
				if x.Parent then
					x.CFrame = p;
				end;
			end);
		end;
	end;
	local function Ao(x)
		local p = v.Character;
		if not p then
			return false;
		end;
		local k = p:FindFirstChild("HumanoidRootPart");
		if not k then
			return false;
		end;
		local Y = k:FindFirstChild("GunRaycastAttachment");
		if not Y then
			return false;
		end;
		if no and no ~= Y then
			Wo();
		end;
		if not no then
			local x, p = pcall(function()
					return Y.CFrame;
				end);
			if not x or typeof(p) ~= "CFrame" then
				return false;
			end;
			no = Y;
			qo = p;
		end;
		Zo = os.clock();
		local g = pcall(function()
				Y.WorldCFrame = x;
			end);
		if not g then
			Wo();
			return false;
		end;
		task.defer(Wo);
		return true;
	end;
	local function yo(x, p)
		local k = Xo(x, p - x);
		if not k then
			return false;
		end;
		local Y = C.char;
		if not Y then
			return false;
		end;
		return k.Instance == Y or k.Instance:IsDescendantOf(Y);
	end;
	local function Lo()
		if C.fresh_ok and C.fresh.Magnitude > .5 then
			return C.fresh;
		end;
		if C.ready and C.vel.Magnitude > .5 then
			return C.vel;
		end;
		return Vector3.zero;
	end;
	local function to()
		local x = C.part;
		if not x or not x.Parent then
			return nil;
		end;
		local p = x.Position;
		local k = os.clock();
		local Y, g, M, m = ao(k);
		if Y and g then
			local x = g - Y;
			local k = x.Magnitude;
			if k > .001 then
				local l = x / k;
				local i = m or p;
				local N = ((i - Y)):Dot(l);
				if N < R.pad then
					Y = Y - l * ((R.pad - N));
				end;
				local C = ((g - i)):Dot(l);
				if C < R.min_span then
					g = i + l * R.min_span;
				end;
				local E = I.standoff;
				while E > 0 do
					local x = Y - l * E;
					if ((g - x)).Magnitude <= R.max_span and (bo(x, i) and bo(x, p)) then
						Y = x;
						break;
					end;
					E = E - 3;
				end;
				if ((g - Y)).Magnitude > R.max_span then
					Y = g - l * R.max_span;
				end;
				return CFrame.new(Y, g), CFrame.new(g), M or 0, i;
			end;
		end;
		local l = Lo();
		local i = Vector3.new(0, -1, 0);
		if l.Magnitude > 3 then
			i = l.Unit;
		else
			local x = so();
			if x then
				local k = p - x.Position;
				if k.Magnitude > 2 then
					i = k.Unit;
				end;
			end;
		end;
		local N = p - i * 6;
		local E = p + i * math.max(R.min_span, l.Magnitude * No() + 8);
		if not yo(N, E) then
			N = p - i * 2.5;
		end;
		return CFrame.new(N, E), CFrame.new(E), 0, p;
	end;
	local function Vo(x)
		if not I.predict or not C.ready or x <= 0 then
			return Vector3.zero;
		end;
		local p = Vector3.new(C.vel.X * x, 0, C.vel.Z * x);
		if C.air then
			local k = r();
			local Y = No();
			local g = C.vel.Y;
			local M = math.max(0, os.clock() - C.air_since);
			local m = C.jump_v - k * M;
			if C.jumping and (C.jump_v > 0 and (k > 0 and (M <= C.jump_v / k and m > g))) then
				g = m;
			end;
			p = Vector3.new(p.X, (g * x - (k * Y) * x) - ((.5 * k) * x) * x, p.Z);
		end;
		return p;
	end;
	local function Oo()
		if not I.enabled then
			return nil;
		end;
		if not C.part or not C.part.Parent then
			return nil;
		end;
		if C.hum and C.hum.Health <= 0 then
			return nil;
		end;
		if I.force then
			local x, p = to();
			if x and p then
				if Ao(x) then
					return p;
				end;
			end;
		end;
		local x = so();
		local p = Uo(x and x.Position or nil, false);
		if not p then
			return nil;
		end;
		return CFrame.new(p);
	end;
	local ro, To, eo;
	local function Go()
		if ro then
			return ro;
		end;
		local x, p = pcall(function()
				return require((N:WaitForChild("ClientServices")):WaitForChild("WeaponService"));
			end);
		if x and type(p) == "table" then
			ro = p;
		end;
		return ro;
	end;
	local function oo()
		local x = Go();
		if not x then
			return;
		end;
		pcall(function()
			setreadonly(x, false);
		end);
		if type(x.GetMouseTargetCFrame) == "function" and not To then
			To = x.GetMouseTargetCFrame;
			local p = To;
			x.GetMouseTargetCFrame = function(x, ...)
					io();
					if I.enabled then
						local x, p = pcall(Oo);
						if x and p then
							return p;
						end;
					end;
					return p(x, ...);
				end;
		end;
		if type(x.GetTargetPosition) == "function" and not eo then
			eo = x.GetTargetPosition;
			local p = eo;
			x.GetTargetPosition = function(x, k, Y, ...)
					io();
					if I.enabled then
						local x, p = pcall(Oo);
						if x and p then
							return p;
						end;
					end;
					return p(x, k, Y, ...);
				end;
		end;
	end;
	local function jo()
		if not ro then
			return;
		end;
		pcall(function()
			setreadonly(ro, false);
		end);
		if To then
			pcall(function()
				ro.GetMouseTargetCFrame = To;
			end);
		end;
		if eo then
			pcall(function()
				ro.GetTargetPosition = eo;
			end);
		end;
	end;
	local function Bo()
		local p = s();
		if type(p) == "table" then
			for p, k in pairs(p) do
				if type(k) == "table" and (k.Role == "Murderer" and not k.Dead) then
					local k = x:FindFirstChild(p);
					if k then
						return k;
					end;
				end;
			end;
		end;
		return n();
	end;
	local function So()
		local x = Bo();
		if x ~= C.target then
			C.target = x;
			C.char = x and x.Character or nil;
			C.part = nil;
			C.hum = nil;
			C.ready = false;
			l, i = 0, 0;
		end;
		if not x or not x.Character then
			return;
		end;
		if x.Character ~= C.char then
			C.char = x.Character;
			C.part = nil;
			C.hum = nil;
		end;
		if not C.part or not C.part.Parent then
			C.part = x.Character:FindFirstChild("HumanoidRootPart") or x.Character:FindFirstChild("UpperTorso") or x.Character:FindFirstChild("Torso");
		end;
		if not C.hum or not C.hum.Parent then
			C.hum = x.Character:FindFirstChildOfClass("Humanoid");
		end;
	end;
	h("SilentTick", p.Heartbeat:Connect(function()
		if not I.enabled then
			return;
		end;
		local x = os.clock();
		pcall(So);
		pcall(mo, x);
	end));
	(getgenv()).FH_ShootSilent = function()
			if not I.enabled then
				return;
			end;
			local x = v.Character;
			if not x then
				return;
			end;
			local p = x:FindFirstChild("Gun");
			if not p then
				local x = v:FindFirstChildOfClass("Backpack");
				p = x and x:FindFirstChild("Gun");
			end;
			if not p then
				return;
			end;
			if p.Parent ~= x then
				local k = x:FindFirstChildOfClass("Humanoid");
				if k then
					k:EquipTool(p);
				end;
				task.wait(.05);
			end;
			pcall(function()
				p:Activate();
			end);
		end;
	task.spawn(function()
		task.wait(1);
		pcall(oo);
	end);
	h("SilentHookRetry", p.Heartbeat:Connect(function()
		if I.enabled and not To then
			pcall(oo);
		end;
	end));
	local uo = L.Combat;
	local xS = uo:AddSection({ Name = "\208\162\208\184\209\133\208\184\208\185 \208\178\209\139\209\129\209\130\209\128\208\181\208\187" });
	(xS:AddToggle("SilentEnabled", { Title = "\208\146\208\186\208\187\209\142\209\135\208\184\209\130\209\140 \209\130\208\184\209\133\208\184\208\185 \208\178\209\139\209\129\209\130\209\128\208\181\208\187", Default = false })):OnChanged(function(x)
		I.enabled = x;
		if x then
			task.spawn(function()
				pcall(oo);
				pcall(So);
			end);
		else
			pcall(jo);
		end;
		V("FH", "Silent " .. ((x and "\208\146\208\154\208\155" or "\208\146\208\171\208\154\208\155")), 1.5);
	end);
	(xS:AddToggle("SilentPredict", { Title = "\208\159\209\128\208\181\208\180\209\129\208\186\208\176\208\183\208\176\208\189\208\184\208\181", Default = true })):OnChanged(function(x)
		I.predict = x;
	end);
	(xS:AddToggle("SilentForce", { Title = "\208\161\209\130\209\128\208\181\208\187\209\140\208\177\208\176 \209\135\208\181\209\128\208\181\208\183 \209\129\209\130\208\181\208\189\209\139", Default = false })):OnChanged(function(x)
		I.force = x;
	end);
	(xS:AddSlider("SilentStandoff", {
		Title = "\208\158\209\130\209\129\209\130\209\131\208\191 (\209\129\209\130\209\131\208\180\209\139)",
		Min = 0,
		Max = 40,
		Default = 15,
		Rounding = 0,
	})):OnChanged(function(x)
		I.standoff = tonumber(x) or 15;
	end);
	local pS = xS:AddKeybind("SilentBind", { Title = "\208\154\208\189\208\190\208\191\208\186\208\176 \208\178\209\139\209\129\209\130\209\128\208\181\208\187\208\176", Default = "E" });
	pS:OnChanged(function(x)
		if typeof(x) == "EnumItem" then
			I.bindKey = x;
			V("FH", "\208\154\208\189\208\190\208\191\208\186\208\176: " .. tostring(x), 2);
		end;
	end);
	k.InputBegan:Connect(function(x, p)
		if p then
			return;
		end;
		if x.UserInputType == Enum.UserInputType.Keyboard and x.KeyCode == I.bindKey then
			if I.enabled and (getgenv()).FH_ShootSilent then
				pcall((getgenv()).FH_ShootSilent);
			end;
		end;
	end);
	local kS = uo:AddSection({ Name = "\208\162\208\184\209\133\208\184\208\185 \208\177\209\128\208\190\209\129\208\190\208\186 \208\189\208\190\208\182\208\176" });
	(kS:AddToggle("KnifeSilentOn", { Title = "\208\146\208\186\208\187\209\142\209\135\208\184\209\130\209\140", Default = false })):OnChanged(function(x)
		D.enabled = x;
		V("FH", "Knife Silent " .. ((x and "\208\146\208\154\208\155" or "\208\146\208\171\208\154\208\155")), 1.5);
	end);
	(kS:AddToggle("KnifeInsta", { Title = "Insta Kill", Default = true })):OnChanged(function(x)
		D.instaKill = x;
	end);
	(kS:AddToggle("KnifePredict", { Title = "\208\159\209\128\208\181\208\180\209\129\208\186\208\176\208\183\208\176\208\189\208\184\208\181", Default = true })):OnChanged(function(x)
		D.predict = x;
	end);
	(kS:AddSlider("KnifeRadius", {
		Title = "\208\160\208\176\208\180\208\184\209\131\209\129 (\209\129\209\130\209\131\208\180\209\139)",
		Min = 5,
		Max = 60,
		Default = 20,
		Rounding = 0,
	})):OnChanged(function(x)
		D.radius = tonumber(x) or 20;
	end);
	(kS:AddSlider("KnifeFov", {
		Title = "FOV",
		Min = 10,
		Max = 360,
		Default = 120,
		Rounding = 0,
	})):OnChanged(function(x)
		D.fov = tonumber(x) or 120;
	end);
	(kS:AddToggle("KnifeShowFov", { Title = "\208\159\208\190\208\186\208\176\208\183\209\139\208\178\208\176\209\130\209\140 \208\186\209\128\209\131\208\179 FOV", Default = true })):OnChanged(function(x)
		D.showFov = x;
	end);
	(kS:AddToggle("KnifeCheckWalls", { Title = "\208\159\209\128\208\190\208\178\208\181\209\128\209\143\209\130\209\140 \209\129\209\130\208\181\208\189\209\139", Default = false })):OnChanged(function(x)
		D.checkWalls = x;
	end);
	local YS = kS:AddKeybind("KnifeBind", { Title = "\208\154\208\189\208\190\208\191\208\186\208\176 \208\177\209\128\208\190\209\129\208\186\208\176", Default = "R" });
	YS:OnChanged(function(x)
		if typeof(x) == "EnumItem" then
			D.bindKey = x;
			V("FH", "\208\157\208\190\208\182: " .. tostring(x), 2);
		end;
	end);
	local function gS()
		if not D.enabled then
			V("FH", "\208\146\208\186\208\187\209\142\209\135\208\184 \209\130\208\184\209\133\208\184\208\185 \208\177\209\128\208\190\209\129\208\190\208\186 \208\189\208\190\208\182\208\176", 2);
			return;
		end;
		local p = v.Character;
		if not p then
			return;
		end;
		local k = p:FindFirstChild("Knife");
		if not k then
			local x = v:FindFirstChildOfClass("Backpack");
			k = x and x:FindFirstChild("Knife");
			if k then
				local x = p:FindFirstChildOfClass("Humanoid");
				if x then
					x:EquipTool(k);
				end;
				task.wait(.05);
			end;
		end;
		if not k then
			V("FH", "\208\157\209\131\208\182\208\181\208\189 \208\189\208\190\208\182", 2);
			return;
		end;
		local Y = p:FindFirstChild("HumanoidRootPart");
		if not Y then
			return;
		end;
		local g, m = nil, math.huge;
		local l = Y.Position;
		local i = M.CurrentCamera;
		for x, k in ipairs(x:GetPlayers()) do
			if k ~= v and k.Character then
				local x = k.Character:FindFirstChild("HumanoidRootPart");
				local Y = k.Character:FindFirstChildOfClass("Humanoid");
				if x and (Y and Y.Health > 0) then
					local Y = ((x.Position - l)).Magnitude;
					if Y <= D.radius then
						if i then
							local N, C = i:WorldToViewportPoint(x.Position);
							if C then
								local C = Vector2.new(i.ViewportSize.X / 2, i.ViewportSize.Y / 2);
								local E = math.deg(math.atan2(N.Y - C.Y, N.X - C.X));
								if math.abs(E) <= D.fov / 2 then
									if D.checkWalls then
										local i = Ray.new(l, ((x.Position - l)).Unit * Y);
										local N = M:FindPartOnRay(i, p);
										if N and (N:IsDescendantOf(k.Character) and Y < m) then
											m = Y;
											g = x;
										end;
									elseif Y < m then
										m = Y;
										g = x;
									end;
								end;
							end;
						elseif Y < m then
							m = Y;
							g = x;
						end;
					end;
				end;
			end;
		end;
		if not g then
			V("FH", "\208\166\208\181\208\187\209\140 \208\189\208\181 \208\189\208\176\208\185\208\180\208\181\208\189\208\176", 2);
			return;
		end;
		local N = k:FindFirstChild("Events");
		if N then
			local x = N:FindFirstChild("KnifeThrown") or N:FindFirstChild("Throw");
			if x then
				pcall(function()
					x:FireServer(g);
				end);
			end;
		end;
		pcall(function()
			k:Activate();
		end);
		V("FH", "\208\157\208\190\208\182 \208\177\209\128\208\190\209\136\208\181\208\189!", 1.5);
	end;
	(getgenv()).FH_ThrowKnife = gS;
	k.InputBegan:Connect(function(x, p)
		if p then
			return;
		end;
		if x.UserInputType == Enum.UserInputType.Keyboard and x.KeyCode == D.bindKey then
			gS();
		end;
	end);
	local MS = Drawing.new("Circle");
	MS.Thickness = 1;
	MS.Color = Color3.fromRGB(255, 255, 255);
	MS.Transparency = .7;
	MS.NumSides = 64;
	MS.Radius = D.fov;
	MS.Filled = false;
	MS.Visible = false;
	h("KnifeFovTick", p.RenderStepped:Connect(function()
		if D.showFov and D.enabled then
			MS.Visible = true;
			MS.Position = k:GetMouseLocation();
			MS.Radius = D.fov;
		else
			MS.Visible = false;
		end;
	end));
	local mS = uo:AddSection({ Name = "\208\154\208\184\208\187\208\187 \208\144\209\131\209\128\208\176" });
	(mS:AddDropdown("KAVersion", { Title = "\208\146\208\181\209\128\209\129\208\184\209\143", Values = { "v1", "v2" }, Default = "v2" })):OnChanged(function(x)
		X = x;
		J.on = false;
		K.on = false;
		if y.KAOn and y.KAOn.Value then
			J.on = x == "v1";
			K.on = x == "v2";
		end;
	end);
	(mS:AddToggle("KAOn", { Title = "\208\146\208\186\208\187\209\142\209\135\208\184\209\130\209\140", Default = false })):OnChanged(function(x)
		J.on = x and X == "v1";
		K.on = x and X == "v2";
	end);
	(mS:AddSlider("KADist", {
		Title = "\208\160\208\176\208\180\208\184\209\131\209\129",
		Min = 5,
		Max = 60,
		Default = 30,
		Rounding = 0,
	})):OnChanged(function(x)
		local p = tonumber(x) or 30;
		J.dist = p;
		K.dist = p;
	end);
	h("KAv1Tick", p.Heartbeat:Connect(function()
		if not J.on then
			return;
		end;
		if tick() - J.lastHit < .05 then
			return;
		end;
		local p = v.Character;
		if not p then
			return;
		end;
		local k = p:FindFirstChild("Knife");
		if not k then
			return;
		end;
		local Y = k:FindFirstChild("Events");
		if not Y then
			return;
		end;
		local g = Y:FindFirstChild("KnifeStabbed");
		local M = Y:FindFirstChild("HandleTouched");
		if not g or not M then
			return;
		end;
		local m = p:FindFirstChild("HumanoidRootPart");
		if not m then
			return;
		end;
		local l = {};
		for x, p in ipairs(x:GetPlayers()) do
			if p ~= v then
				local x = p.Character;
				if x then
					local p = x:FindFirstChildOfClass("Humanoid");
					local k = x:FindFirstChild("HumanoidRootPart");
					if p and (p.Health > 0 and (k and ((k.Position - m.Position)).Magnitude <= J.dist)) then
						l[#l + 1] = k;
					end;
				end;
			end;
		end;
		if #l > 0 then
			pcall(function()
				g:FireServer();
			end);
			for x, p in ipairs(l) do
				pcall(function()
					M:FireServer(p);
				end);
			end;
			J.lastHit = tick();
		end;
	end));
	h("KAv2Tick", p.Heartbeat:Connect(function()
		if not K.on then
			return;
		end;
		if tick() - K.lastHit < .05 then
			return;
		end;
		local p = v.Character;
		if not p then
			return;
		end;
		local k = p:FindFirstChild("Knife");
		if not k then
			local x = p:FindFirstChildOfClass("Humanoid");
			local k = v.Backpack and v.Backpack:FindFirstChild("Knife");
			if x and k then
				x:EquipTool(k);
			end;
			return;
		end;
		local Y = k:FindFirstChild("Events");
		if not Y then
			return;
		end;
		local g = Y:FindFirstChild("KnifeStabbed");
		local M = Y:FindFirstChild("HandleTouched");
		if not g or not M then
			return;
		end;
		local m = p:FindFirstChild("HumanoidRootPart");
		if not m then
			return;
		end;
		local l = {};
		for x, p in ipairs(x:GetPlayers()) do
			if p ~= v then
				local x = p.Character;
				if x then
					local p = x:FindFirstChildOfClass("Humanoid");
					local k = x:FindFirstChild("HumanoidRootPart");
					if p and (p.Health > 0 and (k and ((k.Position - m.Position)).Magnitude <= K.dist)) then
						l[#l + 1] = k;
					end;
				end;
			end;
		end;
		if #l > 0 then
			pcall(function()
				g:FireServer();
			end);
			for x, p in ipairs(l) do
				pcall(function()
					M:FireServer(p);
				end);
			end;
			K.lastHit = tick();
		end;
	end));
	local lS, iS = false, false;
	local NS = tick();
	local CS = {};
	for x, p in ipairs(M:GetDescendants()) do
		if p.Name == "GunDrop" then
			CS[p] = true;
		end;
	end;
	h("GunCacheAdd", M.DescendantAdded:Connect(function(x)
		if x.Name == "GunDrop" then
			CS[x] = true;
		end;
	end));
	h("GunCacheRem", M.DescendantRemoving:Connect(function(x)
		if x.Name == "GunDrop" then
			CS[x] = nil;
		end;
	end));
	task.spawn(function()
		local x, p = pcall(function()
				return ((N:WaitForChild("Remotes", 15)):WaitForChild("Gameplay", 15)):WaitForChild("CoinsStarted", 15);
			end);
		if x and p then
			p.OnClientEvent:Connect(function()
				lS = false;
				iS = false;
				NS = tick();
			end);
		end;
	end);
	local function ES(x)
		local p, k = nil, math.huge;
		for Y in pairs(CS) do
			if Y.Parent and Y:IsA("BasePart") then
				local g = ((Y.Position - x.Position)).Magnitude;
				if g < k then
					k = g;
					p = Y;
				end;
			end;
		end;
		return p;
	end;
	local FS = false;
	(uo:AddToggle("AutoGrabGun", { Title = "\208\144\208\178\209\130\208\190-\208\191\208\190\208\180\208\177\208\190\209\128 \208\191\208\184\209\129\209\130\208\190\208\187\208\181\209\130\208\176", Default = false })):OnChanged(function(x)
		FS = x;
	end);
	h("AutoGrabTick", p.Heartbeat:Connect(function()
		if not FS then
			return;
		end;
		if (getgenv()).FH_INVIS_ACTIVE then
			return;
		end;
		if U(v) == "murderer" then
			return;
		end;
		if lS or iS then
			return;
		end;
		local x = v.Character;
		if not x then
			return;
		end;
		if x:FindFirstChild("Gun") then
			return;
		end;
		local p = v:FindFirstChildOfClass("Backpack");
		if p and p:FindFirstChild("Gun") then
			return;
		end;
		local k = x:FindFirstChild("HumanoidRootPart");
		if not k then
			return;
		end;
		local Y = ES(k);
		if not Y then
			return;
		end;
		iS = true;
		task.spawn(function()
			local x = k.CFrame;
			local p = false;
			for x = 1, 3, 1 do
				if (getgenv()).FH_INVIS_ACTIVE then
					break;
				end;
				if k and k.Parent then
					k.CFrame = Y.CFrame;
				end;
				task.wait(.04);
				pcall(function()
					firetouchinterest(k, Y, 0);
					task.wait(.02);
					firetouchinterest(k, Y, 1);
				end);
				local g = v.Character;
				if g and g:FindFirstChild("Gun") then
					p = true;
					break;
				end;
				local M = v:FindFirstChildOfClass("Backpack");
				if M and M:FindFirstChild("Gun") then
					p = true;
					break;
				end;
			end;
			if k and k.Parent then
				k.CFrame = x;
				k.AssemblyLinearVelocity = Vector3.zero;
				k.AssemblyAngularVelocity = Vector3.zero;
			end;
			if not p then
				lS = true;
				V("FH", "\208\159\208\184\209\129\209\130\208\190\208\187\208\181\209\130 \208\189\208\181 \208\191\208\190\208\180\208\190\208\177\209\128\208\176\208\189.", 4);
			end;
			iS = false;
		end);
	end));
	h("AutoGrabReset", v.CharacterAdded:Connect(function()
		iS = false;
	end));
	(getgenv()).SILENT_UNLOAD = function()
			I.enabled = false;
			I.predict = false;
			I.force = false;
			Wo();
			xo();
			pcall(jo);
		end;
end;
do
	local x = L.Movement;
	local Y = x:AddSection({ Name = "\208\158\209\129\208\189\208\190\208\178\208\189\208\190\208\181" });
	Y:AddToggle("SpeedToggle", { Title = "\208\161\208\186\208\190\209\128\208\190\209\129\209\130\209\140", Default = false });
	Y:AddSlider("SpeedValue", {
		Title = "\208\161\208\186\208\190\209\128\208\190\209\129\209\130\209\140 \209\133\208\190\208\180\209\140\208\177\209\139",
		Min = 16,
		Max = 500,
		Default = 32,
		Rounding = 0,
	});
	Y:AddToggle("Noclip", { Title = "Noclip", Default = false });
	Y:AddToggle("Spinbot", { Title = "Spinbot", Default = false });
	Y:AddSlider("SpinSpeed", {
		Title = "\208\161\208\186\208\190\209\128\208\190\209\129\209\130\209\140 \208\186\209\128\209\131\209\135\208\181\208\189\208\184\209\143",
		Min = 1,
		Max = 50,
		Default = 8,
		Rounding = 0,
	});
	Y:AddToggle("InfJump", { Title = "\208\145\208\181\209\129\208\186\208\190\208\189\208\181\209\135\208\189\209\139\208\185 \208\191\209\128\209\139\208\182\208\190\208\186", Default = false });
	Y:AddToggle("JumpPowerToggle", { Title = "\208\161\208\178\208\190\209\143 \209\129\208\184\208\187\208\176 \208\191\209\128\209\139\208\182\208\186\208\176", Default = false });
	Y:AddSlider("JumpPowerVal", {
		Title = "\208\161\208\184\208\187\208\176 \208\191\209\128\209\139\208\182\208\186\208\176",
		Min = 50,
		Max = 500,
		Default = 100,
		Rounding = 0,
	});
	Y:AddToggle("FlyToggle", { Title = "\208\159\208\190\208\187\209\145\209\130", Default = false });
	Y:AddSlider("FlySpeed", {
		Title = "\208\161\208\186\208\190\209\128\208\190\209\129\209\130\209\140 \208\191\208\190\208\187\209\145\209\130\208\176",
		Min = 20,
		Max = 500,
		Default = 60,
		Rounding = 0,
	});
	Y:AddToggle("BhopOn", { Title = "\208\145\208\176\208\189\208\184\209\133\208\190\208\191", Default = false });
	Y:AddSlider("BhopPower", {
		Title = "\208\161\208\184\208\187\208\176 \208\177\208\176\208\189\208\184\209\133\208\190\208\191\208\176",
		Min = 10,
		Max = 150,
		Default = 40,
		Rounding = 0,
	});
	Y:AddToggle("BhopStrafe", { Title = "\208\161\209\130\209\128\208\181\208\185\209\132", Default = false });
	Y:AddToggle("BhopAuto", { Title = "\208\144\208\178\209\130\208\190-\209\129\209\130\209\128\208\181\208\185\209\132", Default = false });
	local g, m, l, i = false, 40, false, false;
	local N, C, E = 0, false, false;
	local F, c = nil, 0;
	if y.BhopOn then
		y.BhopOn:OnChanged(function(x)
			g = x;
		end);
	end;
	if y.BhopPower then
		y.BhopPower:OnChanged(function(x)
			m = tonumber(x) or 40;
		end);
	end;
	if y.BhopStrafe then
		y.BhopStrafe:OnChanged(function(x)
			l = x;
		end);
	end;
	if y.BhopAuto then
		y.BhopAuto:OnChanged(function(x)
			i = x;
		end);
	end;
	k.JumpRequest:Connect(function()
		c = os.clock();
	end);
	local function z()
		if os.clock() - c < .2 then
			return true;
		end;
		return k:IsKeyDown(Enum.KeyCode.Space);
	end;
	local function a()
		local x = M.CurrentCamera;
		if not x then
			return nil;
		end;
		local p = x.CFrame.LookVector;
		return math.atan2(-p.X, -p.Z);
	end;
	h("BhopTick", p.Heartbeat:Connect(function()
		if not g then
			C = false;
			E = false;
			N = 0;
			F = nil;
			return;
		end;
		local x = v.Character;
		local p = x and x:FindFirstChildOfClass("Humanoid");
		local k = x and x:FindFirstChild("HumanoidRootPart");
		if not p or not k then
			return;
		end;
		local Y = p:GetState();
		local M = Y == Enum.HumanoidStateType.Jumping;
		local c = M or Y == Enum.HumanoidStateType.Freefall;
		if l or i then
			N = 0;
			if M and not C then
				local x = p.MoveDirection;
				if x.Magnitude < .1 then
					x = k.CFrame.LookVector;
				end;
				x = Vector3.new(x.X, 0, x.Z);
				if x.Magnitude > 0 then
					x = x.Unit;
					local p = k.AssemblyLinearVelocity;
					k.AssemblyLinearVelocity = Vector3.new(x.X * m, p.Y, x.Z * m);
					E = true;
				end;
			end;
			if E and c then
				if i then
					local x = a();
					if x and F then
						local p = x - F;
						while p > math.pi do
							p = p - math.pi * 2;
						end;
						while p < -math.pi do
							p = p + math.pi * 2;
						end;
						if math.abs(p) > .0005 then
							local x = k.AssemblyLinearVelocity;
							local Y = Vector3.new(x.X, 0, x.Z);
							if Y.Magnitude > 1 then
								local g = CFrame.fromEulerAnglesYXZ(0, p, 0) * Y;
								k.AssemblyLinearVelocity = Vector3.new(g.X, x.Y, g.Z);
							end;
						end;
					end;
				end;
				local x = p.MoveDirection;
				if x.Magnitude > .1 then
					x = (Vector3.new(x.X, 0, x.Z)).Unit;
					local p = k.AssemblyLinearVelocity;
					local Y = Vector3.new(p.X, 0, p.Z);
					local g = x * m;
					local M = Y:Lerp(g, .3);
					k.AssemblyLinearVelocity = Vector3.new(M.X, p.Y, M.Z);
				elseif i then
					local x = k.AssemblyLinearVelocity;
					local p = Vector3.new(x.X, 0, x.Z);
					if p.Magnitude > .1 and p.Magnitude < m then
						local Y = p.Unit * m;
						k.AssemblyLinearVelocity = Vector3.new(Y.X, x.Y, Y.Z);
					end;
				end;
			end;
			if not c then
				E = false;
			end;
		else
			local x = math.max(p.WalkSpeed, 1);
			local Y = math.max(m, x);
			local g = math.max(m * .1, 1);
			if N < x then
				N = x;
			end;
			if M and not C then
				N = math.min(N + g, Y);
				local x = k.AssemblyLinearVelocity;
				local M = Vector3.new(x.X, 0, x.Z);
				local m;
				if M.Magnitude > .1 then
					m = M.Unit;
				else
					local x = p.MoveDirection;
					if x.Magnitude > .1 then
						m = (Vector3.new(x.X, 0, x.Z)).Unit;
					else
						local x = k.CFrame.LookVector;
						m = Vector3.new(x.X, 0, x.Z);
						m = (m.Magnitude > 0) and m.Unit or Vector3.zero;
					end;
				end;
				if m.Magnitude > 0 then
					k.AssemblyLinearVelocity = Vector3.new(m.X * N, x.Y, m.Z * N);
					E = true;
				end;
			end;
			if c and E then
				local x = k.AssemblyLinearVelocity;
				local Y = Vector3.new(x.X, 0, x.Z);
				local g = p.MoveDirection;
				local M;
				if g.Magnitude > .1 then
					M = (Vector3.new(g.X, 0, g.Z)).Unit;
				elseif Y.Magnitude > .1 then
					M = Y.Unit;
				end;
				if M then
					local p = math.max(Y.Magnitude, N);
					k.AssemblyLinearVelocity = Vector3.new(M.X * p, x.Y, M.Z * p);
				end;
			end;
			if not c then
				E = false;
				if z() then
					p.Jump = true;
				else
					N = 0;
				end;
			end;
		end;
		F = a();
		C = M;
	end));
	local d, I, D, J = false, 90, .6, 16;
	(Y:AddToggle("SpeedGlitchOn", { Title = "\208\161\208\191\208\184\208\180\208\179\208\187\208\184\209\130\209\135", Default = false })):OnChanged(function(x)
		d = x;
	end);
	(Y:AddSlider("SpeedGlitchPower", {
		Title = "\208\161\208\186\208\190\209\128\208\190\209\129\209\130\209\140 \208\178 \208\191\209\128\209\139\208\182\208\186\208\181",
		Min = 30,
		Max = 250,
		Default = 90,
		Rounding = 0,
	})):OnChanged(function(x)
		I = tonumber(x) or 90;
	end);
	(Y:AddSlider("SpeedGlitchAccel", {
		Title = "\208\160\208\176\208\183\208\179\208\190\208\189 (0-1)",
		Min = .1,
		Max = 1,
		Default = .6,
		Rounding = 2,
	})):OnChanged(function(x)
		D = tonumber(x) or .6;
	end);
	h("SpeedGlitchTick", p.Heartbeat:Connect(function()
		if not d then
			return;
		end;
		local x = v.Character;
		local p = x and x:FindFirstChildOfClass("Humanoid");
		local k = x and x:FindFirstChild("HumanoidRootPart");
		if not p or not k then
			return;
		end;
		local Y = p:GetState();
		local g = Y == Enum.HumanoidStateType.Jumping or Y == Enum.HumanoidStateType.Freefall;
		if g then
			local x = k.AssemblyLinearVelocity;
			local p = Vector3.new(x.X, 0, x.Z);
			local Y = p.Magnitude > .1 and p.Unit or ((function()
					local x = k.CFrame.LookVector;
					return (Vector3.new(x.X, 0, x.Z)).Unit;
				end))();
			local g = p.Magnitude;
			local M = math.max(g, I);
			local m = g + ((M - g)) * D;
			k.AssemblyLinearVelocity = Vector3.new(Y.X * m, x.Y, Y.Z * m);
		else
			local x = k.AssemblyLinearVelocity;
			local p = Vector3.new(x.X, 0, x.Z);
			if p.Magnitude > J then
				local Y = p.Unit;
				k.AssemblyLinearVelocity = Vector3.new(Y.X * J, x.Y, Y.Z * J);
			end;
		end;
	end));
	local K = M.Gravity;
	if y.FlyToggle then
		y.FlyToggle:OnChanged(function(x)
			if x then
				K = M.Gravity;
				M.Gravity = 0;
			else
				M.Gravity = K;
				local x = H();
				if x then
					x.AssemblyLinearVelocity = Vector3.zero;
				end;
			end;
		end);
	end;
	h("FlyTick", p.RenderStepped:Connect(function()
		if not ((y.FlyToggle and y.FlyToggle.Value)) then
			return;
		end;
		local x = H();
		local p = w();
		if not x or not p then
			return;
		end;
		p.PlatformStand = true;
		local Y = (y.FlySpeed and tonumber(y.FlySpeed.Value)) or 60;
		local g = Vector3.zero;
		if k:IsKeyDown(Enum.KeyCode.W) then
			g = g + R.CFrame.LookVector;
		end;
		if k:IsKeyDown(Enum.KeyCode.S) then
			g = g - R.CFrame.LookVector;
		end;
		if k:IsKeyDown(Enum.KeyCode.A) then
			g = g - R.CFrame.RightVector;
		end;
		if k:IsKeyDown(Enum.KeyCode.D) then
			g = g + R.CFrame.RightVector;
		end;
		if k:IsKeyDown(Enum.KeyCode.Space) then
			g = g + Vector3.new(0, 1, 0);
		end;
		if k:IsKeyDown(Enum.KeyCode.LeftControl) then
			g = g - Vector3.new(0, 1, 0);
		end;
		x.Velocity = g.Magnitude > 0 and g.Unit * Y or Vector3.zero;
	end));
	h("MovementTick", p.Heartbeat:Connect(function()
		local x = w();
		if not x then
			return;
		end;
		if y.SpeedToggle and y.SpeedToggle.Value then
			x.WalkSpeed = (y.SpeedValue and tonumber(y.SpeedValue.Value)) or 32;
		end;
		if P.frozen then
			x.WalkSpeed = 0;
			local p = H();
			if p then
				if not p:FindFirstChild("FH_FreezeBV") then
					local x = Instance.new("BodyVelocity");
					x.Name = "FH_FreezeBV";
					x.MaxForce = Vector3.new(100000, 100000, 100000);
					x.Velocity = Vector3.zero;
					x.Parent = p;
				end;
				local x = (y.FreezeSpeed and tonumber(y.FreezeSpeed.Value)) or 60;
				local Y = Vector3.zero;
				if k:IsKeyDown(Enum.KeyCode.W) then
					Y = Y + R.CFrame.LookVector;
				end;
				if k:IsKeyDown(Enum.KeyCode.S) then
					Y = Y - R.CFrame.LookVector;
				end;
				if k:IsKeyDown(Enum.KeyCode.A) then
					Y = Y - R.CFrame.RightVector;
				end;
				if k:IsKeyDown(Enum.KeyCode.D) then
					Y = Y + R.CFrame.RightVector;
				end;
				if k:IsKeyDown(P.freezeUpKey) then
					Y = Y + Vector3.new(0, 1, 0);
				end;
				if k:IsKeyDown(P.freezeDownKey) then
					Y = Y - Vector3.new(0, 1, 0);
				end;
				local g = p:FindFirstChild("FH_FreezeBV");
				if g then
					g.Velocity = Y.Magnitude > 0 and Y.Unit * x or Vector3.zero;
				end;
			end;
		else
			local x = H();
			if x then
				local p = x:FindFirstChild("FH_FreezeBV");
				if p then
					p:Destroy();
				end;
			end;
		end;
		if y.JumpPowerToggle and y.JumpPowerToggle.Value then
			x.UseJumpPower = true;
			local p = (y.JumpPowerVal and tonumber(y.JumpPowerVal.Value)) or 100;
			if x.JumpPower ~= p then
				x.JumpPower = p;
			end;
		end;
		if y.Spinbot and y.Spinbot.Value then
			local x = H();
			if x then
				local p = (y.SpinSpeed and tonumber(y.SpinSpeed.Value)) or 8;
				x.CFrame = x.CFrame * CFrame.Angles(0, math.rad(p), 0);
			end;
		end;
	end));
	h("NoclipTick", p.Stepped:Connect(function()
		if y.Noclip and y.Noclip.Value then
			local x = v.Character;
			if x then
				for x, p in ipairs(x:GetDescendants()) do
					if p:IsA("BasePart") then
						p.CanCollide = false;
					end;
				end;
			end;
		end;
	end));
	h("InfJump", k.JumpRequest:Connect(function()
		if y.InfJump and y.InfJump.Value then
			local x = w();
			if x then
				x:ChangeState(Enum.HumanoidStateType.Jumping);
			end;
		end;
	end));
	local X = x:AddSection({ Name = "\208\151\208\176\208\188\208\190\209\128\208\190\208\183\208\186\208\176" });
	(X:AddToggle("FreezeToggle", { Title = "\208\146\208\186\208\187\209\142\209\135\208\184\209\130\209\140 \208\183\208\176\208\188\208\190\209\128\208\190\208\183\208\186\209\131", Default = false })):OnChanged(function(x)
		P.frozen = x;
	end);
	X:AddSlider("FreezeSpeed", {
		Title = "\208\161\208\186\208\190\209\128\208\190\209\129\209\130\209\140 \208\183\208\176\208\188\208\190\209\128\208\190\208\183\208\186\208\184",
		Min = 20,
		Max = 300,
		Default = 60,
		Rounding = 0,
	});
	local b = X:AddKeybind("FreezeUpKey", { Title = "\208\154\208\189\208\190\208\191\208\186\208\176 \208\146\208\146\208\149\208\160\208\165", Default = "Space" });
	b:OnChanged(function(x)
		if typeof(x) == "EnumItem" then
			P.freezeUpKey = x;
		end;
	end);
	local Q = X:AddKeybind("FreezeDownKey", { Title = "\208\154\208\189\208\190\208\191\208\186\208\176 \208\146\208\157\208\152\208\151", Default = "LeftAlt" });
	Q:OnChanged(function(x)
		if typeof(x) == "EnumItem" then
			P.freezeDownKey = x;
		end;
	end);
	(getgenv()).MOVE_UNLOAD = function()
			P.frozen = false;
			local x = H();
			if x then
				local p = x:FindFirstChild("FH_FreezeBV");
				if p then
					p:Destroy();
				end;
			end;
			M.Gravity = K;
		end;
end;
do
	local x = L.Binds;
	local p = {
			{
				id = "SilentEnabled",
				title = "\208\162\208\184\209\133\208\184\208\185 \208\178\209\139\209\129\209\130\209\128\208\181\208\187",
				cat = "\208\145\208\190\208\185",
				opt = "SilentEnabled",
			},
			{
				id = "SilentShoot",
				title = "\208\146\209\139\209\129\209\130\209\128\208\181\208\187 (Shoot)",
				cat = "\208\145\208\190\208\185",
				action = "ShootSilent",
			},
			{
				id = "KnifeSilentOn",
				title = "\208\162\208\184\209\133\208\184\208\185 \208\177\209\128\208\190\209\129\208\190\208\186 \208\189\208\190\208\182\208\176",
				cat = "\208\145\208\190\208\185",
				opt = "KnifeSilentOn",
			},
			{
				id = "KnifeThrow",
				title = "\208\145\209\128\208\190\209\129\208\190\208\186 \208\189\208\190\208\182\208\176",
				cat = "\208\145\208\190\208\185",
				action = "ThrowKnife",
			},
			{
				id = "KAOn",
				title = "\208\154\208\184\208\187\208\187 \208\144\209\131\209\128\208\176",
				cat = "\208\145\208\190\208\185",
				opt = "KAOn",
			},
			{
				id = "AutoGrabGun",
				title = "\208\144\208\178\209\130\208\190-\208\191\208\190\208\180\208\177\208\190\209\128 \208\191\208\184\209\129\209\130\208\190\208\187\208\181\209\130\208\176",
				cat = "\208\145\208\190\208\185",
				opt = "AutoGrabGun",
			},
			{
				id = "SpeedToggle",
				title = "\208\161\208\186\208\190\209\128\208\190\209\129\209\130\209\140",
				cat = "\208\148\208\178\208\184\208\182\208\181\208\189\208\184\208\181",
				opt = "SpeedToggle",
			},
			{
				id = "Noclip",
				title = "Noclip",
				cat = "\208\148\208\178\208\184\208\182\208\181\208\189\208\184\208\181",
				opt = "Noclip",
			},
			{
				id = "Spinbot",
				title = "\208\161\208\191\208\184\208\189\208\177\208\190\209\130",
				cat = "\208\148\208\178\208\184\208\182\208\181\208\189\208\184\208\181",
				opt = "Spinbot",
			},
			{
				id = "InfJump",
				title = "\208\145\208\181\209\129\208\186\208\190\208\189\208\181\209\135\208\189\209\139\208\185 \208\191\209\128\209\139\208\182\208\190\208\186",
				cat = "\208\148\208\178\208\184\208\182\208\181\208\189\208\184\208\181",
				opt = "InfJump",
			},
			{
				id = "JumpPowerToggle",
				title = "\208\161\208\178\208\190\209\143 \209\129\208\184\208\187\208\176 \208\191\209\128\209\139\208\182\208\186\208\176",
				cat = "\208\148\208\178\208\184\208\182\208\181\208\189\208\184\208\181",
				opt = "JumpPowerToggle",
			},
			{
				id = "SpeedGlitchOn",
				title = "\208\161\208\191\208\184\208\180\208\179\208\187\208\184\209\130\209\135",
				cat = "\208\148\208\178\208\184\208\182\208\181\208\189\208\184\208\181",
				opt = "SpeedGlitchOn",
			},
			{
				id = "FlyToggle",
				title = "\208\159\208\190\208\187\209\145\209\130",
				cat = "\208\148\208\178\208\184\208\182\208\181\208\189\208\184\208\181",
				opt = "FlyToggle",
			},
			{
				id = "BhopOn",
				title = "\208\145\208\176\208\189\208\184\209\133\208\190\208\191",
				cat = "\208\148\208\178\208\184\208\182\208\181\208\189\208\184\208\181",
				opt = "BhopOn",
			},
			{
				id = "FreezeToggle",
				title = "\208\151\208\176\208\188\208\190\209\128\208\190\208\183\208\186\208\176",
				cat = "\208\148\208\178\208\184\208\182\208\181\208\189\208\184\208\181",
				opt = "FreezeToggle",
			},
		};
	local Y = {};
	for x, p in ipairs(p) do
		Y[p.id] = {
				key = nil,
				touchOn = false,
				btn = nil,
				def = p,
			};
	end;
	local M = Instance.new("ScreenGui");
	M.Name = "FH_TouchBinds_v184";
	M.ResetOnSpawn = false;
	M.IgnoreGuiInset = true;
	M.DisplayOrder = 400;
	pcall(function()
		M.Parent = (gethui and gethui()) or g;
	end);
	if not M.Parent then
		M.Parent = g;
	end;
	local m = false;
	local l, i = 90, 16;
	local function N(x)
		local p = Y[x];
		if not p then
			return;
		end;
		local k = p.def;
		if k.opt then
			local x = y[k.opt];
			if x and x.Value ~= nil then
				x:SetValue(not x.Value);
				V("FH", k.title .. (": " .. tostring(x.Value)), 1.2);
			end;
		elseif k.action == "ShootSilent" then
			if (getgenv()).FH_ShootSilent then
				pcall((getgenv()).FH_ShootSilent);
			end;
		elseif k.action == "ThrowKnife" then
			if (getgenv()).FH_ThrowKnife then
				pcall((getgenv()).FH_ThrowKnife);
			end;
		end;
	end;
	local function C(x)
		local p = Y[x];
		if not p or p.btn then
			return;
		end;
		local g = p.def;
		local C = Instance.new("TextButton");
		C.Name = "FH_BTN_" .. x;
		C.Size = UDim2.fromOffset(150, 34);
		C.Position = UDim2.fromOffset(i, l);
		C.BackgroundColor3 = Color3.fromRGB(28, 22, 42);
		C.BorderSizePixel = 0;
		C.Text = g.title;
		C.TextColor3 = Color3.fromRGB(235, 225, 255);
		C.Font = Enum.Font.GothamSemibold;
		C.TextSize = 13;
		C.AutoButtonColor = true;
		C.Active = true;
		C.ZIndex = 3;
		C.Parent = M;
		(Instance.new("UICorner", C)).CornerRadius = UDim.new(0, 8);
		local E = Instance.new("UIStroke", C);
		E.Color = Color3.fromRGB(138, 92, 246);
		E.Thickness = 1;
		E.Transparency = .35;
		l = l + 40;
		if l > 700 then
			l = 90;
			i = i + 160;
		end;
		local F, c, z, v = false, nil, nil, false;
		C.InputBegan:Connect(function(x)
			if m then
				return;
			end;
			if x.UserInputType == Enum.UserInputType.MouseButton1 or x.UserInputType == Enum.UserInputType.Touch then
				F = true;
				v = false;
				c = x.Position;
				z = C.Position;
			end;
		end);
		k.InputChanged:Connect(function(x)
			if not F or m then
				return;
			end;
			if x.UserInputType == Enum.UserInputType.MouseMovement or x.UserInputType == Enum.UserInputType.Touch then
				local p = x.Position - c;
				if math.abs(p.X) > 4 or math.abs(p.Y) > 4 then
					v = true;
				end;
				if v then
					C.Position = UDim2.new(z.X.Scale, z.X.Offset + p.X, z.Y.Scale, z.Y.Offset + p.Y);
				end;
			end;
		end);
		k.InputEnded:Connect(function(p)
			if p.UserInputType ~= Enum.UserInputType.MouseButton1 and p.UserInputType ~= Enum.UserInputType.Touch then
				return;
			end;
			if not F then
				return;
			end;
			local k = not v;
			F = false;
			if k and not m then
				N(x);
			end;
		end);
		p.btn = C;
	end;
	local function E(x)
		local p = Y[x];
		if not p then
			return;
		end;
		if p.btn then
			pcall(function()
				p.btn:Destroy();
			end);
			p.btn = nil;
		end;
	end;
	local F = x:AddSection({ Name = "\208\156\208\190\208\180\209\131\208\187\208\184" });
	local c = nil;
	for x, p in ipairs(p) do
		if p.cat ~= c then
			c = p.cat;
			pcall(function()
				F:AddButton({ Title = "=== " .. (c .. " ==="), Callback = function()
 
					end });
			end);
		end;
		local k = Y[p.id];
		(F:AddKeybind("BIND_KEY_" .. p.id, { Title = p.title, Default = "Unknown" })):OnChanged(function(x)
			if typeof(x) == "EnumItem" then
				k.key = x;
				V("FH", "\208\145\208\184\208\189\208\180: " .. (p.title .. (" \226\134\146 " .. tostring(x))), 2);
			else
				k.key = nil;
			end;
		end);
		(F:AddToggle("BIND_TCH_" .. p.id, { Title = "  \208\154\208\189\208\190\208\191\208\186\208\176: " .. p.title, Default = false })):OnChanged(function(x)
			k.touchOn = x;
			if x then
				C(p.id);
			else
				E(p.id);
			end;
		end);
	end;
	k.InputBegan:Connect(function(x, p)
		if p then
			return;
		end;
		if x.UserInputType ~= Enum.UserInputType.Keyboard then
			return;
		end;
		for p, k in pairs(Y) do
			if k.key and x.KeyCode == k.key then
				N(p);
			end;
		end;
	end);
	local z = x:AddSection({ Name = "\208\157\208\176\209\129\209\130\209\128\208\190\208\185\208\186\208\184 \208\177\208\184\208\189\208\180\208\190\208\178" });
	(z:AddToggle("BIND_FREEZE", { Title = "\208\151\208\176\208\188\208\190\209\128\208\190\208\183\208\186\208\176 \208\186\208\189\208\190\208\191\208\190\208\186", Default = false })):OnChanged(function(x)
		m = x;
		V("FH", x and "\208\154\208\189\208\190\208\191\208\186\208\184 \208\183\208\176\208\188\208\190\209\128\208\190\208\182\208\181\208\189\209\139" or "\208\154\208\189\208\190\208\191\208\186\208\184 \209\128\208\176\208\183\208\188\208\190\209\128\208\190\208\182\208\181\208\189\209\139", 1.5);
	end);
	z:AddButton({ Title = "\208\161\208\177\209\128\208\190\209\129\208\184\209\130\209\140 \208\178\209\129\208\181 \208\177\208\184\208\189\208\180\209\139", Callback = function()
			for x, p in pairs(Y) do
				p.key = nil;
				if y["BIND_KEY_" .. x] then
					pcall(function()
						y["BIND_KEY_" .. x]:SetValue(nil);
					end);
				end;
			end;
			V("FH", "\208\146\209\129\208\181 \208\177\208\184\208\189\208\180\209\139 \209\129\208\177\209\128\208\190\209\136\208\181\208\189\209\139", 2);
		end });
	z:AddButton({ Title = "\208\163\208\180\208\176\208\187\208\184\209\130\209\140 \208\178\209\129\208\181 \208\186\208\189\208\190\208\191\208\186\208\184", Callback = function()
			for x, p in pairs(Y) do
				p.touchOn = false;
				if y["BIND_TCH_" .. x] then
					pcall(function()
						y["BIND_TCH_" .. x]:SetValue(false);
					end);
				end;
				E(x);
			end;
			V("FH", "\208\146\209\129\208\181 \208\186\208\189\208\190\208\191\208\186\208\184 \209\131\208\180\208\176\208\187\208\181\208\189\209\139", 2);
		end });
	(getgenv()).BINDS_UNLOAD = function()
			for x, p in pairs(Y) do
				E(x);
			end;
			pcall(function()
				M:Destroy();
			end);
		end;
end;
do
	local x = L.Settings;
	local p = x:AddSection({ Name = "\208\158\209\129\208\189\208\190\208\178\208\189\209\139\208\181" });
	(p:AddToggle("ShowHUD", { Title = "\208\159\208\190\208\186\208\176\208\183\209\139\208\178\208\176\209\130\209\140 HUD", Default = true })):OnChanged(function(x)
		if O then
			O.Enabled = x;
		end;
	end);
	(p:AddSlider("FPSCap", {
		Title = "\208\155\208\184\208\188\208\184\209\130 FPS (0 = \208\177\208\181\208\183 \208\187\208\184\208\188\208\184\209\130\208\176)",
		Min = 0,
		Max = 9999,
		Default = 0,
		Rounding = 0,
	})):OnChanged(function(x)
		pcall(function()
			if setfpscap then
				setfpscap(tonumber(x) or 0);
			end;
		end);
	end);
	p:AddButton({ Title = "\208\159\208\181\209\128\208\181\208\191\208\190\208\180\208\186\208\187\209\142\209\135\208\184\209\130\209\140\209\129\209\143 \208\186 \209\129\208\181\209\128\208\178\208\181\209\128\209\131", Callback = function()
			i:TeleportToPlaceInstance(game.PlaceId, game.JobId, v);
		end });
	p:AddButton({ Title = "\208\161\208\188\208\181\208\189\208\184\209\130\209\140 \209\129\208\181\209\128\208\178\208\181\209\128", Callback = function()
			pcall(function()
				local x = "https://games.roblox.com/v1/games/" .. (game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100");
				local p = game:HttpGet(x);
				local k = l:JSONDecode(p);
				for x, p in ipairs(k.data) do
					if p.playing < p.maxPlayers and p.id ~= game.JobId then
						i:TeleportToPlaceInstance(game.PlaceId, p.id, v);
						break;
					end;
				end;
			end);
		end });
	p:AddToggle("AntiAFK", { Title = "Anti-AFK", Default = true });
	h("AntiAFK", v.Idled:Connect(function()
		if y.AntiAFK and y.AntiAFK.Value then
			pcall(function()
				C:Button2Down(Vector2.new(0, 0), R.CFrame);
				task.wait(1);
				C:Button2Up(Vector2.new(0, 0), R.CFrame);
			end);
		end;
	end));
	p:AddButton({ Title = "\208\146\209\139\208\179\209\128\209\131\208\183\208\184\209\130\209\140 \209\129\208\186\209\128\208\184\208\191\209\130", Callback = function()
			for x, p in pairs(b) do
				pcall(function()
					p:Disconnect();
				end);
			end;
			b = {};
			if O then
				O:Destroy();
			end;
			if A then
				pcall(function()
					A:Destroy();
				end);
			end;
			V("FH", "\208\161\208\186\209\128\208\184\208\191\209\130 \208\178\209\139\208\179\209\128\209\131\208\182\208\181\208\189", 3);
		end });
	local k = x:AddSection({ Name = "\208\154\208\190\208\189\209\132\208\184\208\179\208\184" });
	local Y = "FortniHub_Configs/";
	local g = ".txt";
	local function M()
		if type(isfolder) ~= "function" or type(makefolder) ~= "function" then
			return false;
		end;
		local x, p = pcall(isfolder, Y);
		if not x then
			return false;
		end;
		if p then
			return true;
		end;
		return pcall(makefolder, Y) == true;
	end;
	local function m()
		local x = {};
		if type(listfiles) ~= "function" then
			return x;
		end;
		if not M() then
			return x;
		end;
		local p, k = pcall(listfiles, Y);
		if not p or type(k) ~= "table" then
			return x;
		end;
		for p, k in ipairs(k) do
			local Y = string.match(k, "([^/\\]+)" .. (g .. "$"));
			if Y then
				x[#x + 1] = Y;
			end;
		end;
		return x;
	end;
	local function N(x)
		if typeof(x) == "Color3" then
			return "C:" .. (tostring(x.R) .. ("," .. (tostring(x.G) .. ("," .. tostring(x.B)))));
		end;
		local p = type(x);
		if p == "number" then
			return "N:" .. tostring(x);
		end;
		if p == "boolean" then
			return "B:" .. tostring(x);
		end;
		if p == "string" then
			return "S:" .. x;
		end;
		if p == "table" then
			local p = true;
			for x in pairs(x) do
				if type(x) ~= "number" then
					p = false;
					break;
				end;
			end;
			if p then
				local p = {};
				for k = 1, #x, 1 do
					p[#p + 1] = tostring(x[k]);
				end;
				return "L:" .. table.concat(p, ",");
			else
				local p = {};
				for x, k in pairs(x) do
					p[#p + 1] = tostring(x) .. ("=" .. tostring(k));
				end;
				return "D:" .. table.concat(p, ";");
			end;
		end;
		return nil;
	end;
	local function E(x)
		local p, k = string.match(x, "^(%a):(.*)$");
		if not p then
			return nil;
		end;
		if p == "C" then
			local x, p, Y = string.match(k, "([^,]+),([^,]+),([^,]+)");
			if x and (p and Y) then
				return Color3.new(tonumber(x), tonumber(p), tonumber(Y));
			end;
			return nil;
		end;
		if p == "N" then
			return tonumber(k);
		end;
		if p == "B" then
			return k == "true";
		end;
		if p == "S" then
			return k;
		end;
		if p == "L" then
			local x = {};
			for p in string.gmatch(k, "[^,]+") do
				local k = tonumber(p);
				if k then
					x[#x + 1] = k;
				else
					x[#x + 1] = p;
				end;
			end;
			return x;
		end;
		if p == "D" then
			local x = {};
			for p in string.gmatch(k, "[^;]+") do
				local k, Y = string.match(p, "^(.-)=(.*)$");
				if k then
					local p = tonumber(Y);
					if p then
						x[k] = p;
					elseif Y == "true" then
						x[k] = true;
					elseif Y == "false" then
						x[k] = false;
					else
						x[k] = Y;
					end;
				end;
			end;
			return x;
		end;
		return nil;
	end;
	local function F(x)
		if type(writefile) ~= "function" then
			V("FH", "\208\157\208\181\209\130 writefile", 4);
			return false;
		end;
		if not M() then
			V("FH", "\208\157\208\181 \209\129\208\190\208\183\208\180\208\176\208\187 \208\191\208\176\208\191\208\186\209\131", 4);
			return false;
		end;
		local p = { "-- FortniHub Config: " .. tostring(x), "-- " .. os.date("%Y-%m-%d %H:%M:%S") };
		for x, k in pairs(y) do
			if k and k.Value ~= nil then
				local Y = N(k.Value);
				if Y then
					p[#p + 1] = x .. ("\009" .. Y);
				end;
			end;
		end;
		local k = Y .. (x .. g);
		local m = pcall(writefile, k, table.concat(p, "\n"));
		if m then
			V("FH", "\208\161\208\190\209\133\209\128\208\176\208\189\208\181\208\189\208\190: " .. x, 3);
			return true;
		end;
		V("FH", "\208\158\209\136\208\184\208\177\208\186\208\176 \209\129\208\190\209\133\209\128\208\176\208\189\208\181\208\189\208\184\209\143", 3);
		return false;
	end;
	local function c(x)
		if type(readfile) ~= "function" then
			V("FH", "\208\157\208\181\209\130 readfile", 4);
			return false;
		end;
		local p = Y .. (x .. g);
		local k, M = pcall(readfile, p);
		if not k or type(M) ~= "string" then
			V("FH", "\208\158\209\136\208\184\208\177\208\186\208\176 \209\135\209\130\208\181\208\189\208\184\209\143", 3);
			return false;
		end;
		local m = 0;
		for x in string.gmatch(M, "[^\r\n]+") do
			if x:sub(1, 2) ~= "--" then
				local p, k = string.match(x, "^([^\009]+)\009(.+)$");
				if p and k then
					local x = E(k);
					if x ~= nil and y[p] then
						pcall(function()
							y[p]:SetValue(x);
						end);
						m = m + 1;
					end;
				end;
			end;
		end;
		V("FH", "\208\151\208\176\208\179\209\128\209\131\208\182\208\181\208\189\208\190: " .. (x .. (" (" .. (m .. ")"))), 3);
		return true;
	end;
	local function z(x)
		if type(delfile) ~= "function" then
			V("FH", "\208\157\208\181\209\130 delfile", 4);
			return false;
		end;
		local p = pcall(delfile, Y .. (x .. g));
		if p then
			V("FH", "\208\163\208\180\208\176\208\187\208\181\208\189\208\190: " .. x, 2);
			return true;
		end;
		return false;
	end;
	local a = m();
	if #a == 0 then
		a = { "(\208\189\208\181\209\130 \208\186\208\190\208\189\209\132\208\184\208\179\208\190\208\178)" };
	end;
	local d = k:AddDropdown("ConfigPick", { Title = "\208\146\209\139\208\177\209\128\208\176\209\130\209\140 \208\186\208\190\208\189\209\132\208\184\208\179", Values = a, Default = a[1] });
	local function P()
		local x = m();
		if #x == 0 then
			x = { "(\208\189\208\181\209\130 \208\186\208\190\208\189\209\132\208\184\208\179\208\190\208\178)" };
		end;
		pcall(function()
			d:SetValues(x);
			if d.Generate then
				d:Generate();
			end;
		end);
	end;
	k:AddInput("ConfigName", { Title = "\208\152\208\188\209\143 \208\186\208\190\208\189\209\132\208\184\208\179\208\176", Default = "my_config" });
	k:AddButton({ Title = "\208\161\208\190\209\133\209\128\208\176\208\189\208\184\209\130\209\140 (Save)", Callback = function()
			local x = y.ConfigName;
			local p = x and x.Value or "my_config";
			if type(p) ~= "string" or p == "" then
				V("FH", "\208\146\208\178\208\181\208\180\208\184 \208\184\208\188\209\143", 3);
				return;
			end;
			if F(p) then
				P();
			end;
		end });
	k:AddButton({ Title = "\208\151\208\176\208\179\209\128\209\131\208\183\208\184\209\130\209\140 (Load)", Callback = function()
			local x = y.ConfigPick;
			local p = x and x.Value;
			if type(p) ~= "string" or p == "" or p == "(\208\189\208\181\209\130 \208\186\208\190\208\189\209\132\208\184\208\179\208\190\208\178)" then
				V("FH", "\208\146\209\139\208\177\208\181\209\128\208\184 \208\186\208\190\208\189\209\132\208\184\208\179", 3);
				return;
			end;
			c(p);
		end });
	k:AddButton({ Title = "\208\163\208\180\208\176\208\187\208\184\209\130\209\140", Callback = function()
			local x = y.ConfigPick;
			local p = x and x.Value;
			if type(p) ~= "string" or p == "" or p == "(\208\189\208\181\209\130 \208\186\208\190\208\189\209\132\208\184\208\179\208\190\208\178)" then
				V("FH", "\208\146\209\139\208\177\208\181\209\128\208\184 \208\186\208\190\208\189\209\132\208\184\208\179", 3);
				return;
			end;
			if z(p) then
				P();
			end;
		end });
	k:AddButton({ Title = "\208\158\208\177\208\189\208\190\208\178\208\184\209\130\209\140 \209\129\208\191\208\184\209\129\208\190\208\186", Callback = P });
	if O then
		O.Enabled = true;
	end;
end;
pcall(function()
	A:SelectTab(1);
end);
task.spawn(function()
	task.wait(1);
	V("FortniHub", "Part 1/2 v18.4.0 \208\183\208\176\208\179\209\128\209\131\208\182\208\181\208\189\208\176! 10 \208\178\208\186\208\187\208\176\208\180\208\190\208\186 \208\179\208\190\209\130\208\190\208\178\209\139. P \226\128\148 \208\188\208\181\208\189\209\142.", 6);
end);
print("[FH] ============================================");
print("[FH] Part 1/2 \226\128\148 FortniHub v18.4.0 \226\128\148 " .. d);
print("[FH] \208\146\209\129\208\181 10 \208\178\208\186\208\187\208\176\208\180\208\190\208\186 \209\129\208\190\208\183\208\180\208\176\208\189\209\139: \208\145\208\190\208\185, \208\148\208\178\208\184\208\182\208\181\208\189\208\184\208\181, \208\145\208\184\208\189\208\180\209\139, \208\146\208\184\208\183\209\131\208\176\208\187, \208\173\209\132\209\132\208\181\208\186\209\130\209\139, \208\164\208\176\209\128\208\188, \208\144\208\189\208\184\208\188\208\176\209\134\208\184\208\184, \208\163\209\130\208\184\208\187\208\184\209\130\209\139, \208\162\209\128\208\190\208\187\208\187\208\184\208\189\208\179, \208\157\208\176\209\129\209\130\209\128\208\190\208\185\208\186\208\184.");
print("[FH] ============================================");
local G = game:GetService("Players");
local o = game:GetService("RunService");
local j = game:GetService("UserInputService");
local B = game:GetService("Workspace");
local S = game:GetService("Lighting");
local u = game:GetService("CoreGui");
local xo = game:GetService("CollectionService");
local po = game:GetService("ReplicatedStorage");
local ko = game:GetService("TweenService");
local Yo = game:GetService("SoundService");
local go = game:GetService("TeleportService");
local Mo = game:GetService("Stats");
local mo = game:GetService("HttpService");
local lo = game:GetService("Debris");
local io = G.LocalPlayer;
local No = B.CurrentCamera;
if not ((A and (y and (V and (s and (U and (H and w))))))) then
	warn("[FH] Part 1 \208\189\208\181 \208\183\208\176\208\179\209\128\209\131\208\182\208\181\208\189\208\176.");
	return;
end;
local Co = (getgenv()).FH_Tabs;
if not Co then
	warn("[FH] FH_Tabs \208\189\208\181 \208\189\208\176\208\185\208\180\208\181\208\189. \208\161\208\189\208\176\209\135\208\176\208\187\208\176 \208\183\208\176\208\191\209\131\209\129\209\130\208\184 Part 1.");
	return;
end;
local function Eo()
	return (gethui and gethui()) or u;
end;
do
	local x = {
			enabled = false,
			box = false,
			boxCol = { Color3.fromRGB(255, 255, 255), 1 },
			boxType = "Static",
			boxGrd = false,
			boxGrd1 = Color3.fromRGB(255, 60, 60),
			boxGrd2 = Color3.fromRGB(255, 180, 60),
			boxFill = false,
			boxFillCol = { Color3.fromRGB(255, 60, 60), .5 },
			name = false,
			nameCol = { Color3.new(1, 1, 1), 1 },
			dist = false,
			distCol = { Color3.fromRGB(220, 220, 220), 1 },
			avatar = false,
			skel = false,
			skelCol = { Color3.new(1, 1, 1), 1 },
			chams = false,
			chamsFMur = { Color3.fromRGB(255, 60, 60), .55 },
			chamsOMur = { Color3.fromRGB(255, 60, 60), .15 },
			chamsFInno = { Color3.new(1, 1, 1), .55 },
			chamsOInno = { Color3.new(1, 1, 1), .15 },
			chamsFShf = { Color3.fromRGB(0, 153, 255), .55 },
			chamsOShf = { Color3.fromRGB(0, 153, 255), .15 },
			chamsFHero = { Color3.fromRGB(255, 215, 0), .55 },
			chamsOHero = { Color3.fromRGB(255, 215, 0), .15 },
			matChams = false,
			matType = "ForceField",
			matColMur = Color3.fromRGB(255, 60, 60),
			matColInno = Color3.new(1, 1, 1),
			matColShf = Color3.fromRGB(0, 153, 255),
			matColHero = Color3.fromRGB(255, 215, 0),
			flags = false,
			flagMur = { Color3.fromRGB(255, 60, 60), 1 },
			flagShf = { Color3.fromRGB(0, 153, 255), 1 },
			flagHero = { Color3.fromRGB(255, 215, 0), 1 },
			arrows = false,
			arrowMur = Color3.fromRGB(255, 60, 60),
			arrowInno = Color3.new(1, 1, 1),
			arrowShf = Color3.fromRGB(0, 153, 255),
			arrowHero = Color3.fromRGB(255, 215, 0),
			arrowSize = 42,
			arrowDist = 260,
			maxDist = 500,
			allowLocal = false,
			gunEspOn = false,
			gunTextOn = false,
			gunTextCol = Color3.new(1, 1, 1),
			gunHlOn = false,
			gunHlCol = Color3.new(1, 1, 1),
		};
	_G.FH_ESP = x;
	local p = {};
	local k = Instance.new("Folder");
	k.Name = "FH_Chams";
	k.Parent = B;
	local Y = Instance.new("Folder");
	Y.Name = "FH_GunChams";
	Y.Parent = B;
	local function g(x)
		local p = U(x);
		if p == "murderer" then
			return "Mur";
		end;
		if p == "sheriff" then
			return "Shf";
		end;
		if p == "hero" then
			return "Hero";
		end;
		return "Inno";
	end;
	local function M(x)
		if x == "Mur" then
			return Color3.fromRGB(255, 60, 60);
		end;
		if x == "Shf" then
			return Color3.fromRGB(0, 153, 255);
		end;
		if x == "Hero" then
			return Color3.fromRGB(255, 215, 0);
		end;
		return Color3.new(1, 1, 1);
	end;
	local function m(x)
		local k = p[x];
		if k then
			return k;
		end;
		k = {
				box = {},
				boxFill = nil,
				name = nil,
				dist = nil,
				avatar = nil,
				skel = {},
				flags = {},
				arrow = nil,
			};
		p[x] = k;
		return k;
	end;
	local function l(x, p)
		if x.box[p] then
			return x.box[p];
		end;
		local k = Drawing.new("Line");
		k.Thickness = 1.5;
		k.Transparency = 1;
		k.Visible = false;
		x.box[p] = k;
		return k;
	end;
	local function i(x, p)
		local k = math.sin(os.clock() * 3) * .5 + .5;
		return x:Lerp(p, k);
	end;
	local function N(x)
		for x, p in pairs(x.box) do
			pcall(function()
				p:Remove();
			end);
		end;
		if x.boxFill then
			pcall(function()
				x.boxFill:Remove();
			end);
		end;
		if x.name then
			pcall(function()
				x.name:Remove();
			end);
		end;
		if x.dist then
			pcall(function()
				x.dist:Remove();
			end);
		end;
		if x.avatar then
			pcall(function()
				x.avatar:Remove();
			end);
		end;
		for x, p in pairs(x.skel) do
			pcall(function()
				p:Remove();
			end);
		end;
		for x, p in pairs(x.flags) do
			pcall(function()
				p:Remove();
			end);
		end;
		if x.arrow then
			pcall(function()
				x.arrow:Remove();
			end);
		end;
	end;
	local C = {};
	local function E(x)
		local p = C[x];
		if p then
			pcall(function()
				p:Destroy();
			end);
			C[x] = nil;
		end;
	end;
	local function F(x, p)
		local Y = C[x];
		if Y and (Y.Parent and Y.Adornee == p) then
			return Y;
		end;
		if Y then
			pcall(function()
				Y:Destroy();
			end);
		end;
		Y = Instance.new("Highlight");
		Y.Name = "FH_" .. x.Name;
		Y.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
		Y.Adornee = p;
		Y.Parent = k;
		C[x] = Y;
		return Y;
	end;
	local c = {};
	local function z()
		for x, p in pairs(c) do
			if x.Parent then
				pcall(function()
					x.Material = p.m;
				end);
				pcall(function()
					x.Color = p.c;
				end);
			end;
		end;
		table.clear(c);
	end;
	local function v()
		if not x.matChams then
			if next(c) then
				z();
			end;
			return;
		end;
		local p = Enum.Material.ForceField;
		if x.matType == "Flat" then
			p = Enum.Material.SmoothPlastic;
		elseif x.matType == "Chromatic" then
			p = Enum.Material.Foil;
		end;
		for k, Y in ipairs(G:GetPlayers()) do
			if Y ~= io and Y.Character then
				local k = g(Y);
				local M;
				if k == "Mur" then
					M = x.matColMur;
				elseif k == "Shf" then
					M = x.matColShf;
				elseif k == "Hero" then
					M = x.matColHero;
				else
					M = x.matColInno;
				end;
				for x, k in ipairs(Y.Character:GetDescendants()) do
					if k:IsA("BasePart") and k.Name ~= "HumanoidRootPart" then
						if not c[k] then
							c[k] = { m = k.Material, c = k.Color };
						end;
						pcall(function()
							k.Material = p;
						end);
						pcall(function()
							k.Color = M;
						end);
					end;
				end;
			end;
		end;
	end;
	local R, a, d = {}, {}, 0;
	local function P(x)
		local p = x.Parent;
		while p and p ~= B do
			if p:IsA("Model") and G:GetPlayerFromCharacter(p) then
				return true;
			end;
			p = p.Parent;
		end;
		return false;
	end;
	local function I(x)
		if x:IsA("BasePart") then
			return x;
		end;
		if x:IsA("Model") then
			return x.PrimaryPart or x:FindFirstChildWhichIsA("BasePart", true);
		end;
		return x:FindFirstChild("Handle") or x:FindFirstChildWhichIsA("BasePart", true);
	end;
	local function D()
		local x = {};
		for p in pairs(a) do
			if p.Name == "GunDrop" and (p.Parent and not P(p)) then
				local k = I(p);
				if k then
					local Y = ((p:IsA("BasePart") or p:IsA("Model"))) and p or k;
					x[#x + 1] = { obj = p, part = k, adorn = Y };
				end;
			end;
		end;
		return x;
	end;
	local function J(x)
		local p = R[x];
		if p then
			if p.hl then
				pcall(function()
					p.hl:Destroy();
				end);
			end;
			if p.txt then
				pcall(function()
					p.txt:Remove();
				end);
			end;
			R[x] = nil;
		end;
	end;
	local function K()
		for x in pairs(R) do
			J(x);
		end;
	end;
	local X = {};
	local function b(p)
		if not x.gunEspOn then
			if next(R) then
				K();
			end;
			return;
		end;
		d = d + p;
		if d >= .25 then
			d = 0;
			X = D();
			local x = {};
			for p, k in ipairs(X) do
				x[k.obj] = true;
			end;
			for p in pairs(R) do
				if not x[p] then
					J(p);
				end;
			end;
		end;
		for p, k in ipairs(X) do
			local g, M = k.obj, k.part;
			if g.Parent and (M and M.Parent) then
				local p = R[g];
				if not p then
					p = {};
					R[g] = p;
				end;
				if x.gunHlOn then
					if not p.hl then
						local x = Instance.new("Highlight");
						x.FillTransparency = 1;
						x.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
						x.Parent = Y;
						p.hl = x;
					end;
					p.hl.Adornee = k.adorn;
					p.hl.OutlineColor = x.gunHlCol;
					p.hl.OutlineTransparency = 0;
					p.hl.Enabled = true;
				elseif p.hl then
					p.hl.Enabled = false;
				end;
				if x.gunTextOn then
					local k = No:WorldToViewportPoint(M.Position);
					if not p.txt then
						local x = Drawing.new("Text");
						x.Center = true;
						x.Outline = true;
						x.Size = 13;
						p.txt = x;
					end;
					if k.Z > 0 then
						p.txt.Position = Vector2.new(k.X, k.Y);
						p.txt.Text = "Gun";
						p.txt.Color = x.gunTextCol;
						p.txt.Visible = true;
					else
						p.txt.Visible = false;
					end;
				elseif p.txt then
					p.txt.Visible = false;
				end;
			else
				J(g);
			end;
		end;
	end;
	local function h()
		table.clear(a);
		for x, p in ipairs(B:GetDescendants()) do
			if p.Name == "GunDrop" and ((p:IsA("BasePart") or p:IsA("Model") or p:IsA("Tool"))) then
				a[p] = true;
			end;
		end;
	end;
	B.DescendantAdded:Connect(function(x)
		if x.Name == "GunDrop" and ((x:IsA("BasePart") or x:IsA("Model") or x:IsA("Tool"))) then
			a[x] = true;
		end;
	end);
	B.DescendantRemoving:Connect(function(x)
		if x.Name == "GunDrop" then
			a[x] = nil;
		end;
	end);
	o.RenderStepped:Connect(function(k)
		local Y = {};
		for k, N in ipairs(G:GetPlayers()) do
			if N == io and not x.allowLocal then
				E(N);
			else
				local k = N.Character;
				local C = k and ((k:FindFirstChild("HumanoidRootPart") or k:FindFirstChild("UpperTorso") or k:FindFirstChild("Torso")));
				local c = k and k:FindFirstChild("Head");
				local z = k and k:FindFirstChildOfClass("Humanoid");
				if k and (C and (c and (z and z.Health > 0))) then
					Y[N] = true;
					local v = g(N);
					local R = M(v);
					local a = ((No.CFrame.Position - C.Position)).Magnitude;
					local d = math.clamp(1 - a / x.maxDist, .15, 1);
					if x.enabled then
						local p = c.Position + Vector3.new(0, c.Size.Y * .5, 0);
						local Y = C.Position - Vector3.new(0, C.Size.Y * .5 + ((z.HipHeight or 0)), 0);
						local g, M = No:WorldToViewportPoint(p);
						local E, F = No:WorldToViewportPoint(Y);
						if M or F then
							local p = m(N);
							if x.box then
								local k = math.max(40, ((g.Y - E.Y)) * .5);
								local Y = ((g.X + E.X)) * .5;
								local M, m = g.Y, E.Y;
								local N, C = Y - k, Y + k;
								local F = x.boxGrd and i(x.boxGrd1, x.boxGrd2) or x.boxCol[1];
								local c = ((x.boxCol[2] or 1)) * d;
								if x.boxType == "Corners" then
									local x = math.min(k, m - M) * .25;
									local Y = {
											{
												N,
												M,
												N + x,
												M,
											},
											{
												N,
												M,
												N,
												M + x,
											},
											{
												C,
												M,
												C - x,
												M,
											},
											{
												C,
												M,
												C,
												M + x,
											},
											{
												N,
												m,
												N + x,
												m,
											},
											{
												N,
												m,
												N,
												m - x,
											},
											{
												C,
												m,
												C - x,
												m,
											},
											{
												C,
												m,
												C,
												m - x,
											},
										};
									for x, k in ipairs(Y) do
										local Y = l(p, x);
										Y.From = Vector2.new(k[1], k[2]);
										Y.To = Vector2.new(k[3], k[4]);
										Y.Color = F;
										Y.Transparency = c;
										Y.Visible = true;
									end;
									for x = #Y + 1, #p.box, 1 do
										p.box[x].Visible = false;
									end;
								else
									local x = {
											{
												N,
												M,
												C,
												M,
											},
											{
												C,
												M,
												C,
												m,
											},
											{
												C,
												m,
												N,
												m,
											},
											{
												N,
												m,
												N,
												M,
											},
										};
									for x, k in ipairs(x) do
										local Y = l(p, x);
										Y.From = Vector2.new(k[1], k[2]);
										Y.To = Vector2.new(k[3], k[4]);
										Y.Color = F;
										Y.Transparency = c;
										Y.Visible = true;
									end;
									for x = 5, #p.box, 1 do
										p.box[x].Visible = false;
									end;
								end;
								if x.boxFill then
									if not p.boxFill then
										p.boxFill = Drawing.new("Square");
										p.boxFill.Filled = true;
										p.boxFill.Thickness = 0;
									end;
									p.boxFill.Position = Vector2.new(N, M);
									p.boxFill.Size = Vector2.new(C - N, m - M);
									p.boxFill.Color = R;
									p.boxFill.Transparency = ((x.boxFillCol[2] or .5)) * d;
									p.boxFill.Visible = true;
								elseif p.boxFill then
									p.boxFill.Visible = false;
								end;
							else
								for x, p in pairs(p.box) do
									p.Visible = false;
								end;
								if p.boxFill then
									p.boxFill.Visible = false;
								end;
							end;
							if x.name then
								if not p.name then
									p.name = Drawing.new("Text");
									p.name.Size = 13;
									p.name.Center = true;
									p.name.Outline = true;
								end;
								p.name.Text = N.Name;
								p.name.Position = Vector2.new(((g.X + E.X)) * .5, g.Y - 18);
								p.name.Color = x.nameCol[1];
								p.name.Transparency = ((x.nameCol[2] or 1)) * d;
								p.name.Visible = true;
							elseif p.name then
								p.name.Visible = false;
							end;
							if x.dist then
								if not p.dist then
									p.dist = Drawing.new("Text");
									p.dist.Size = 12;
									p.dist.Center = true;
									p.dist.Outline = true;
								end;
								p.dist.Text = string.format("%d studs", math.floor(a));
								p.dist.Position = Vector2.new(((g.X + E.X)) * .5, E.Y + 4);
								p.dist.Color = x.distCol[1];
								p.dist.Transparency = ((x.distCol[2] or 1)) * d;
								p.dist.Visible = true;
							elseif p.dist then
								p.dist.Visible = false;
							end;
							if x.avatar then
								if not p.avatar then
									p.avatar = Drawing.new("Image");
									p.avatar.Size = Vector2.new(40, 40);
									pcall(function()
										p.avatar.Data = G:GetUserThumbnailAsync(N.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100);
									end);
								end;
								p.avatar.Position = Vector2.new(((g.X + E.X)) * .5 - 20, g.Y - 60);
								p.avatar.Transparency = d;
								p.avatar.Visible = true;
							elseif p.avatar then
								p.avatar.Visible = false;
							end;
							if x.skel then
								local Y = {
										{ "Head", "UpperTorso" },
										{ "UpperTorso", "LowerTorso" },
										{ "UpperTorso", "LeftUpperArm" },
										{ "LeftUpperArm", "LeftLowerArm" },
										{ "LeftLowerArm", "LeftHand" },
										{ "UpperTorso", "RightUpperArm" },
										{ "RightUpperArm", "RightLowerArm" },
										{ "RightLowerArm", "RightHand" },
										{ "LowerTorso", "LeftUpperLeg" },
										{ "LeftUpperLeg", "LeftLowerLeg" },
										{ "LeftLowerLeg", "LeftFoot" },
										{ "LowerTorso", "RightUpperLeg" },
										{ "RightUpperLeg", "RightLowerLeg" },
										{ "RightLowerLeg", "RightFoot" },
									};
								for Y, g in ipairs(Y) do
									local M = k:FindFirstChild(g[1]);
									local m = k:FindFirstChild(g[2]);
									if M and (m and (M:IsA("BasePart") and m:IsA("BasePart"))) then
										local k, g = No:WorldToViewportPoint(M.Position);
										local l, i = No:WorldToViewportPoint(m.Position);
										if not p.skel[Y] then
											local x = Drawing.new("Line");
											x.Thickness = 1;
											x.Transparency = 1;
											p.skel[Y] = x;
										end;
										local N = p.skel[Y];
										if g and i then
											N.From = Vector2.new(k.X, k.Y);
											N.To = Vector2.new(l.X, l.Y);
											N.Color = x.skelCol[1];
											N.Transparency = ((x.skelCol[2] or 1)) * d;
											N.Visible = true;
										else
											N.Visible = false;
										end;
									elseif p.skel[Y] then
										p.skel[Y].Visible = false;
									end;
								end;
								for x = #Y + 1, #p.skel, 1 do
									p.skel[x].Visible = false;
								end;
							else
								for x, p in pairs(p.skel) do
									p.Visible = false;
								end;
							end;
							if x.flags then
								local k = v == "Mur" and "[MURD]" or (v == "Shf" and "[SHF]" or (v == "Hero" and "[HERO]" or ""));
								if k ~= "" then
									if not p.flags[1] then
										p.flags[1] = Drawing.new("Text");
										p.flags[1].Size = 13;
										p.flags[1].Outline = true;
									end;
									local Y = p.flags[1];
									Y.Text = k;
									Y.Position = Vector2.new(g.X + 60, g.Y - 10);
									Y.Color = v == "Mur" and x.flagMur[1] or (v == "Hero" and x.flagHero[1] or x.flagShf[1]);
									Y.Transparency = d;
									Y.Visible = true;
								else
									for x, p in pairs(p.flags) do
										p.Visible = false;
									end;
								end;
							else
								for x, p in pairs(p.flags) do
									p.Visible = false;
								end;
							end;
							if x.arrows then
								local k = No.ViewportSize;
								local Y = g.X >= 0 and (g.X <= k.X and (g.Y >= 0 and g.Y <= k.Y));
								if Y then
									if p.arrow then
										p.arrow.Visible = false;
									end;
								else
									if not p.arrow then
										p.arrow = Drawing.new("Triangle");
										p.arrow.Filled = true;
									end;
									local Y, M = k.X * .5, k.Y * .5;
									local m = Vector2.new(g.X - Y, g.Y - M);
									if m.Magnitude < .01 then
										m = Vector2.new(0, 1);
									end;
									m = m.Unit;
									local l = Y + m.X * x.arrowDist;
									local i = M + m.Y * x.arrowDist;
									local N = x.arrowSize;
									local C = Vector2.new(-m.Y, m.X);
									p.arrow.PointA = Vector2.new(l + (m.X * N) * .5, i + (m.Y * N) * .5);
									p.arrow.PointB = Vector2.new((l - (m.X * N) * .5) + (C.X * N) * .5, (i - (m.Y * N) * .5) + (C.Y * N) * .5);
									p.arrow.PointC = Vector2.new((l - (m.X * N) * .5) - (C.X * N) * .5, (i - (m.Y * N) * .5) - (C.Y * N) * .5);
									p.arrow.Color = v == "Mur" and x.arrowMur or (v == "Shf" and x.arrowShf or (v == "Hero" and x.arrowHero or x.arrowInno));
									p.arrow.Transparency = d;
									p.arrow.Visible = true;
								end;
							elseif p.arrow then
								p.arrow.Visible = false;
							end;
						end;
					else
						local x = p[N];
						if x then
							for x, p in pairs(x.box) do
								p.Visible = false;
							end;
							if x.boxFill then
								x.boxFill.Visible = false;
							end;
							if x.name then
								x.name.Visible = false;
							end;
							if x.dist then
								x.dist.Visible = false;
							end;
							if x.avatar then
								x.avatar.Visible = false;
							end;
							for x, p in pairs(x.skel) do
								p.Visible = false;
							end;
							for x, p in pairs(x.flags) do
								p.Visible = false;
							end;
							if x.arrow then
								x.arrow.Visible = false;
							end;
						end;
					end;
					if x.chams then
						local p = F(N, k);
						local Y = x["chamsF" .. v] or x.chamsFInno;
						local g = x["chamsO" .. v] or x.chamsOInno;
						p.FillColor = Y[1];
						p.FillTransparency = Y[2];
						p.OutlineColor = g[1];
						p.OutlineTransparency = g[2];
					else
						E(N);
					end;
				else
					local x = p[N];
					if x then
						for x, p in pairs(x.box) do
							p.Visible = false;
						end;
						if x.boxFill then
							x.boxFill.Visible = false;
						end;
						if x.name then
							x.name.Visible = false;
						end;
						if x.dist then
							x.dist.Visible = false;
						end;
						if x.avatar then
							x.avatar.Visible = false;
						end;
						for x, p in pairs(x.skel) do
							p.Visible = false;
						end;
						for x, p in pairs(x.flags) do
							p.Visible = false;
						end;
						if x.arrow then
							x.arrow.Visible = false;
						end;
					end;
					E(N);
				end;
			end;
		end;
		for x, k in pairs(p) do
			if not Y[x] then
				N(k);
				p[x] = nil;
			end;
		end;
		v();
		b(k);
	end);
	G.PlayerRemoving:Connect(function(x)
		E(x);
	end);
	local Q = Co.Visual;
	local f = Q:AddSection({ Name = "ESP \208\152\208\179\209\128\208\190\208\186\208\190\208\178" });
	(f:AddToggle("ESPOn", { Title = "\208\146\208\186\208\187\209\142\209\135\208\184\209\130\209\140 ESP", Default = false })):OnChanged(function(k)
		x.enabled = k;
		if not k then
			for x, p in pairs(p) do
				N(p);
			end;
			p = {};
		end;
	end);
	(f:AddToggle("ESPBox", { Title = "\208\160\208\176\208\188\208\186\208\176", Default = false })):OnChanged(function(p)
		x.box = p;
	end);
	(f:AddColorPicker("ESPBoxCol", { Title = "\208\166\208\178\208\181\209\130 \209\128\208\176\208\188\208\186\208\184", Default = Color3.new(1, 1, 1) })):OnChanged(function(p)
		x.boxCol[1] = p;
	end);
	(f:AddSlider("ESPBoxAlpha", {
		Title = "\208\159\209\128\208\190\208\183\209\128\208\176\209\135\208\189\208\190\209\129\209\130\209\140 \209\128\208\176\208\188\208\186\208\184",
		Min = 0,
		Max = 1,
		Default = 1,
		Rounding = 2,
	})):OnChanged(function(p)
		x.boxCol[2] = tonumber(p) or 1;
	end);
	(f:AddDropdown("ESPBoxType", { Title = "\208\162\208\184\208\191 \209\128\208\176\208\188\208\186\208\184", Values = { "\208\159\209\128\209\143\208\188\208\190\209\131\208\179\208\190\208\187\209\140\208\189\208\184\208\186", "\208\163\208\179\208\190\208\187\208\186\208\184" }, Default = "\208\159\209\128\209\143\208\188\208\190\209\131\208\179\208\190\208\187\209\140\208\189\208\184\208\186" })):OnChanged(function(p)
		x.boxType = (p == "\208\163\208\179\208\190\208\187\208\186\208\184") and "Corners" or "Static";
	end);
	(f:AddToggle("ESPBoxGrd", { Title = "\208\147\209\128\208\176\208\180\208\184\208\181\208\189\209\130 \209\128\208\176\208\188\208\186\208\184", Default = false })):OnChanged(function(p)
		x.boxGrd = p;
	end);
	(f:AddColorPicker("ESPBoxGrd1", { Title = "\208\166\208\178\208\181\209\130 1", Default = Color3.fromRGB(255, 60, 60) })):OnChanged(function(p)
		x.boxGrd1 = p;
	end);
	(f:AddColorPicker("ESPBoxGrd2", { Title = "\208\166\208\178\208\181\209\130 2", Default = Color3.fromRGB(255, 180, 60) })):OnChanged(function(p)
		x.boxGrd2 = p;
	end);
	(f:AddToggle("ESPBoxFill", { Title = "\208\151\208\176\208\187\208\184\208\178\208\186\208\176", Default = false })):OnChanged(function(p)
		x.boxFill = p;
	end);
	(f:AddColorPicker("ESPBoxFillCol", { Title = "\208\166\208\178\208\181\209\130 \208\183\208\176\208\187\208\184\208\178\208\186\208\184", Default = Color3.fromRGB(255, 60, 60) })):OnChanged(function(p)
		x.boxFillCol[1] = p;
	end);
	(f:AddSlider("ESPBoxFillAlpha", {
		Title = "\208\159\209\128\208\190\208\183\209\128\208\176\209\135\208\189\208\190\209\129\209\130\209\140 \208\183\208\176\208\187\208\184\208\178\208\186\208\184",
		Min = 0,
		Max = 1,
		Default = .5,
		Rounding = 2,
	})):OnChanged(function(p)
		x.boxFillCol[2] = tonumber(p) or .5;
	end);
	(f:AddToggle("ESPName", { Title = "\208\152\208\188\209\143", Default = false })):OnChanged(function(p)
		x.name = p;
	end);
	(f:AddColorPicker("ESPNameCol", { Title = "\208\166\208\178\208\181\209\130 \208\184\208\188\208\181\208\189\208\184", Default = Color3.new(1, 1, 1) })):OnChanged(function(p)
		x.nameCol[1] = p;
	end);
	(f:AddToggle("ESPDist", { Title = "\208\148\208\184\209\129\209\130\208\176\208\189\209\134\208\184\209\143", Default = false })):OnChanged(function(p)
		x.dist = p;
	end);
	(f:AddColorPicker("ESPDistCol", { Title = "\208\166\208\178\208\181\209\130 \208\180\208\184\209\129\209\130\208\176\208\189\209\134\208\184\208\184", Default = Color3.fromRGB(220, 220, 220) })):OnChanged(function(p)
		x.distCol[1] = p;
	end);
	(f:AddToggle("ESPAvatar", { Title = "\208\144\208\178\208\176\209\130\208\176\209\128\208\186\208\176", Default = false })):OnChanged(function(p)
		x.avatar = p;
	end);
	(f:AddToggle("ESPSkel", { Title = "\208\161\208\186\208\181\208\187\208\181\209\130", Default = false })):OnChanged(function(p)
		x.skel = p;
	end);
	(f:AddColorPicker("ESPSkelCol", { Title = "\208\166\208\178\208\181\209\130 \209\129\208\186\208\181\208\187\208\181\209\130\208\176", Default = Color3.new(1, 1, 1) })):OnChanged(function(p)
		x.skelCol[1] = p;
	end);
	(f:AddToggle("ESPChams", { Title = "\208\161\208\178\208\181\209\135\208\181\208\189\208\184\208\181 (\209\129\208\186\208\178\208\190\208\183\209\140 \209\129\209\130\208\181\208\189\209\139)", Default = false })):OnChanged(function(p)
		x.chams = p;
	end);
	local function H(p, k, Y, g)
		(f:AddColorPicker("ChamsF" .. p, { Title = k .. " \208\183\208\176\208\187\208\184\208\178\208\186\208\176", Default = Y })):OnChanged(function(k)
			x["chamsF" .. p][1] = k;
		end);
		(f:AddSlider("ChamsFA" .. p, {
			Title = k .. " \208\191\209\128\208\190\208\183\209\128.",
			Min = 0,
			Max = 1,
			Default = .55,
			Rounding = 2,
		})):OnChanged(function(k)
			x["chamsF" .. p][2] = tonumber(k) or .55;
		end);
		(f:AddColorPicker("ChamsO" .. p, { Title = k .. " \208\190\208\177\208\178\208\190\208\180\208\186\208\176", Default = g })):OnChanged(function(k)
			x["chamsO" .. p][1] = k;
		end);
		(f:AddSlider("ChamsOA" .. p, {
			Title = k .. " \208\191\209\128\208\190\208\183\209\128. \208\190\208\177\208\178\208\190\208\180\208\186\208\184",
			Min = 0,
			Max = 1,
			Default = .15,
			Rounding = 2,
		})):OnChanged(function(k)
			x["chamsO" .. p][2] = tonumber(k) or .15;
		end);
	end;
	H("Mur", "\208\163\208\177\208\184\208\185\209\134\208\176", Color3.fromRGB(255, 60, 60), Color3.fromRGB(255, 120, 120));
	H("Inno", "\208\156\208\184\209\128\208\189\209\139\208\185", Color3.new(1, 1, 1), Color3.new(1, 1, 1));
	H("Shf", "\208\168\208\181\209\128\208\184\209\132", Color3.fromRGB(0, 153, 255), Color3.fromRGB(120, 200, 255));
	H("Hero", "\208\147\208\181\209\128\208\190\208\185", Color3.fromRGB(255, 215, 0), Color3.fromRGB(255, 240, 140));
	(f:AddToggle("ESPMatChams", { Title = "\208\156\208\176\209\130\208\181\209\128\208\184\208\176\208\187-\209\135\208\176\208\188\209\129\209\139", Default = false })):OnChanged(function(p)
		x.matChams = p;
	end);
	(f:AddDropdown("ESPMatType", { Title = "\208\156\208\176\209\130\208\181\209\128\208\184\208\176\208\187", Values = { "ForceField", "Flat", "Chromatic" }, Default = "ForceField" })):OnChanged(function(p)
		x.matType = p;
	end);
	(f:AddColorPicker("ESPMatMur", { Title = "\208\163\208\177\208\184\208\185\209\134\208\176", Default = Color3.fromRGB(255, 60, 60) })):OnChanged(function(p)
		x.matColMur = p;
	end);
	(f:AddColorPicker("ESPMatInno", { Title = "\208\156\208\184\209\128\208\189\209\139\208\185", Default = Color3.new(1, 1, 1) })):OnChanged(function(p)
		x.matColInno = p;
	end);
	(f:AddColorPicker("ESPMatShf", { Title = "\208\168\208\181\209\128\208\184\209\132", Default = Color3.fromRGB(0, 153, 255) })):OnChanged(function(p)
		x.matColShf = p;
	end);
	(f:AddColorPicker("ESPMatHero", { Title = "\208\147\208\181\209\128\208\190\208\185", Default = Color3.fromRGB(255, 215, 0) })):OnChanged(function(p)
		x.matColHero = p;
	end);
	(f:AddToggle("ESPFlags", { Title = "\208\156\208\181\209\130\208\186\208\184 \209\128\208\190\208\187\208\181\208\185", Default = false })):OnChanged(function(p)
		x.flags = p;
	end);
	(f:AddToggle("ESPArrows", { Title = "\208\161\209\130\209\128\208\181\208\187\208\186\208\184 \208\186 \208\184\208\179\209\128\208\190\208\186\208\176\208\188", Default = false })):OnChanged(function(p)
		x.arrows = p;
	end);
	(f:AddColorPicker("ESPArrMur", { Title = "\208\163\208\177\208\184\208\185\209\134\208\176", Default = Color3.fromRGB(255, 60, 60) })):OnChanged(function(p)
		x.arrowMur = p;
	end);
	(f:AddColorPicker("ESPArrInno", { Title = "\208\156\208\184\209\128\208\189\209\139\208\185", Default = Color3.new(1, 1, 1) })):OnChanged(function(p)
		x.arrowInno = p;
	end);
	(f:AddColorPicker("ESPArrShf", { Title = "\208\168\208\181\209\128\208\184\209\132", Default = Color3.fromRGB(0, 153, 255) })):OnChanged(function(p)
		x.arrowShf = p;
	end);
	(f:AddColorPicker("ESPArrHero", { Title = "\208\147\208\181\209\128\208\190\208\185", Default = Color3.fromRGB(255, 215, 0) })):OnChanged(function(p)
		x.arrowHero = p;
	end);
	(f:AddSlider("ESPArrSz", {
		Title = "\208\160\208\176\208\183\208\188\208\181\209\128 \209\129\209\130\209\128\208\181\208\187\208\190\208\186",
		Min = 16,
		Max = 96,
		Default = 42,
		Rounding = 0,
	})):OnChanged(function(p)
		x.arrowSize = tonumber(p) or 42;
	end);
	(f:AddSlider("ESPArrDist", {
		Title = "\208\148\208\184\209\129\209\130\208\176\208\189\209\134\208\184\209\143 \209\129\209\130\209\128\208\181\208\187\208\190\208\186",
		Min = 40,
		Max = 520,
		Default = 260,
		Rounding = 0,
	})):OnChanged(function(p)
		x.arrowDist = tonumber(p) or 260;
	end);
	(f:AddSlider("ESPMaxDist", {
		Title = "\208\156\208\176\208\186\209\129. \208\180\208\184\209\129\209\130\208\176\208\189\209\134\208\184\209\143 ESP",
		Min = 50,
		Max = 1000,
		Default = 500,
		Rounding = 0,
	})):OnChanged(function(p)
		x.maxDist = tonumber(p) or 500;
	end);
	(f:AddToggle("ESPAllowLocal", { Title = "\208\159\208\190\208\186\208\176\208\183\209\139\208\178\208\176\209\130\209\140 \209\129\208\181\208\177\209\143", Default = false })):OnChanged(function(p)
		x.allowLocal = p;
	end);
	local w = Q:AddSection({ Name = "ESP \208\159\208\184\209\129\209\130\208\190\208\187\208\181\209\130\208\176" });
	(w:AddToggle("GunEspOn", { Title = "ESP \208\191\208\184\209\129\209\130\208\190\208\187\208\181\209\130\208\176", Default = false })):OnChanged(function(p)
		x.gunEspOn = p;
		if p then
			h();
		else
			K();
		end;
	end);
	(w:AddToggle("GunTextOn", { Title = "\208\162\208\181\208\186\209\129\209\130", Default = false })):OnChanged(function(p)
		x.gunTextOn = p;
	end);
	(w:AddColorPicker("GunTextCol", { Title = "\208\166\208\178\208\181\209\130 \209\130\208\181\208\186\209\129\209\130\208\176", Default = Color3.new(1, 1, 1) })):OnChanged(function(p)
		x.gunTextCol = p;
	end);
	(w:AddToggle("GunHlOn", { Title = "\208\158\208\177\208\178\208\190\208\180\208\186\208\176", Default = false })):OnChanged(function(p)
		x.gunHlOn = p;
	end);
	(w:AddColorPicker("GunHlCol", { Title = "\208\166\208\178\208\181\209\130 \208\190\208\177\208\178\208\190\208\180\208\186\208\184", Default = Color3.new(1, 1, 1) })):OnChanged(function(p)
		x.gunHlCol = p;
	end);
	local s = Q:AddSection({ Name = "\208\154\208\176\208\188\208\181\209\128\208\176" });
	local n, q = false, 100;
	local Z = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1);
	o:BindToRenderStep("FH_aspect", Enum.RenderPriority.Camera.Value + 1, function()
		if not n then
			return;
		end;
		local x = B.CurrentCamera;
		if x then
			x.CFrame = x.CFrame * Z;
		end;
	end);
	(s:AddToggle("AspectOn", { Title = "Aspect ratio", Default = false })):OnChanged(function(x)
		n = x;
	end);
	(s:AddSlider("AspectVal", {
		Title = "\208\151\208\189\208\176\209\135\208\181\208\189\208\184\208\181",
		Min = 1,
		Max = 100,
		Default = 100,
		Rounding = 0,
	})):OnChanged(function(x)
		q = tonumber(x) or 100;
		Z = CFrame.new(0, 0, 0, 1, 0, 0, 0, q / 100, 0, 0, 0, 1);
	end);
	local W, A, y = false, 70, nil;
	o.RenderStepped:Connect(function()
		if not W then
			return;
		end;
		local x = B.CurrentCamera;
		if x and x.FieldOfView ~= A then
			x.FieldOfView = A;
		end;
	end);
	(s:AddToggle("FovOn", { Title = "\208\161\208\178\208\190\209\145 FOV", Default = false })):OnChanged(function(x)
		W = x;
		local p = B.CurrentCamera;
		if x then
			if p then
				y = p.FieldOfView;
				p.FieldOfView = A;
			end;
		else
			if p and y then
				p.FieldOfView = y;
			end;
		end;
	end);
	(s:AddSlider("FovVal", {
		Title = "FOV",
		Min = 30,
		Max = 120,
		Default = 70,
		Rounding = 0,
	})):OnChanged(function(x)
		A = tonumber(x) or 70;
		if W then
			local x = B.CurrentCamera;
			if x then
				x.FieldOfView = A;
			end;
		end;
	end);
end;
do
	local x = Co.Visual:AddSection({ Name = "\208\161\208\178\208\190\208\184 \208\178\208\184\208\183\209\131\208\176\208\187\209\139" });
	local p = Instance.new("ScreenGui");
	p.Name = "FH_ChinaHat_v184";
	p.ResetOnSpawn = false;
	p.IgnoreGuiInset = true;
	p.DisplayOrder = 999;
	p.Parent = Eo();
	local k = Instance.new("Frame");
	k.Size = UDim2.fromScale(1, 1);
	k.BackgroundTransparency = 1;
	k.BorderSizePixel = 0;
	k.Parent = p;
	local Y = {};
	local g, M = false, Color3.fromRGB(170, 85, 255);
	local m, l, i, N, C = 36, 1.6, .9, .02, .28;
	local E = 120;
	local function F(x)
		for x = #Y + 1, x, 1 do
			local p = Instance.new("Frame");
			p.BorderSizePixel = 0;
			p.BackgroundTransparency = C;
			p.Visible = false;
			p.ZIndex = 5;
			p.Parent = k;
			Y[x] = p;
		end;
	end;
	local function c()
		for x, p in ipairs(Y) do
			if p.Visible then
				p.Visible = false;
			end;
		end;
	end;
	local function z(x)
		local p, k = No:WorldToViewportPoint(x);
		if p.Z <= 0 then
			return nil, false;
		end;
		return Vector2.new(p.X, p.Y), true;
	end;
	local function v(x, p, k)
		return ((p.X - x.X)) * ((k.Y - x.Y)) - ((p.Y - x.Y)) * ((k.X - x.X));
	end;
	local function R(x)
		table.sort(x, function(x, p)
			if x.X == p.X then
				return x.Y < p.Y;
			end;
			return x.X < p.X;
		end);
		local p = {};
		for x, k in ipairs(x) do
			while #p >= 2 and v(p[#p - 1], p[#p], k) <= 0 do
				table.remove(p);
			end;
			p[#p + 1] = k;
		end;
		local k = {};
		for p = #x, 1, -1 do
			local Y = x[p];
			while #k >= 2 and v(k[#k - 1], k[#k], Y) <= 0 do
				table.remove(k);
			end;
			k[#k + 1] = Y;
		end;
		table.remove(p);
		table.remove(k);
		local Y = {};
		for x, p in ipairs(p) do
			Y[#Y + 1] = p;
		end;
		for x, p in ipairs(k) do
			Y[#Y + 1] = p;
		end;
		return Y;
	end;
	o.RenderStepped:Connect(function()
		if not g then
			c();
			return;
		end;
		local x = io.Character;
		local p = x and x:FindFirstChild("Head");
		if not p then
			c();
			return;
		end;
		local k = B.CurrentCamera;
		if not k then
			c();
			return;
		end;
		local C = Vector3.new(p.Position.X, (p.Position.Y + p.Size.Y * .5) - N, p.Position.Z);
		local v, a = z(C + Vector3.new(0, i, 0));
		if not a then
			c();
			return;
		end;
		local d = { v };
		for x = 1, m, 1 do
			local p = ((((x - 1)) / m) * math.pi) * 2;
			local k, Y = z(C + Vector3.new(math.cos(p) * l, 0, math.sin(p) * l));
			if not Y then
				c();
				return;
			end;
			d[#d + 1] = k;
		end;
		local P = R(d);
		if #P < 3 then
			c();
			return;
		end;
		local I, D = math.huge, -math.huge;
		for x, p in ipairs(P) do
			if p.Y < I then
				I = p.Y;
			end;
			if p.Y > D then
				D = p.Y;
			end;
		end;
		I = math.max(0, math.floor(I));
		D = math.min(k.ViewportSize.Y, math.ceil(D));
		if D - I < 2 then
			c();
			return;
		end;
		local J = math.max(1, D - I);
		local K = math.max(1, math.ceil(((D - I)) / E));
		F(E);
		local X = 0;
		for x = I, D - 1, K do
			local p = math.min(K, D - x);
			local k = x + p * .5;
			local g, m = math.huge, -math.huge;
			local l, i = P[#P].X, P[#P].Y;
			for x = 1, #P, 1 do
				local p, Y = P[x].X, P[x].Y;
				if (i <= k and Y > k) or (Y <= k and i > k) then
					local x = l + (((k - i)) * ((p - l))) / ((Y - i));
					if x < g then
						g = x;
					end;
					if x > m then
						m = x;
					end;
				end;
				l, i = p, Y;
			end;
			local N = m - g;
			if N >= 2 then
				X = X + 1;
				local m = ((k - I)) / J;
				local l = math.max(0, 1 - m * 1.35);
				local i = math.max(0, ((m - .58)) / .42);
				local C = (M:Lerp(Color3.new(1, 1, 1), l * .26)):Lerp(Color3.new(0, 0, 0), i * .12);
				local E = Y[X];
				E.Position = UDim2.fromOffset(g, x);
				E.Size = UDim2.fromOffset(N, p);
				E.BackgroundColor3 = C;
				E.Visible = true;
			end;
		end;
		for x = X + 1, #Y, 1 do
			if Y[x].Visible then
				Y[x].Visible = false;
			end;
		end;
	end);
	(x:AddToggle("ChinaHatOn", { Title = "\208\154\208\184\209\130\208\176\208\185\209\129\208\186\208\176\209\143 \209\136\208\187\209\143\208\191\208\176", Default = false })):OnChanged(function(x)
		g = x;
	end);
	(x:AddColorPicker("ChinaHatCol", { Title = "\208\166\208\178\208\181\209\130 \209\136\208\187\209\143\208\191\209\139", Default = Color3.fromRGB(170, 85, 255) })):OnChanged(function(x)
		M = x;
	end);
	local a, d = false, Color3.fromRGB(255, 60, 60);
	local P = nil;
	local I = {};
	local D = 256;
	local J = table.create(D);
	for x = 1, D, 1 do
		J[x] = { 0, CFrame.identity };
	end;
	local K, X = 1, 0;
	local b, h = .15, 0;
	local function Q()
		if P then
			pcall(function()
				P:Destroy();
			end);
			P = nil;
		end;
		I = {};
		K, X = 1, 0;
	end;
	local function f()
		Q();
		local x = io.Character;
		if not x then
			return;
		end;
		local p = x:FindFirstChild("HumanoidRootPart");
		if not p then
			return;
		end;
		x.Archivable = true;
		local k, Y = pcall(function()
				return x:Clone();
			end);
		x.Archivable = false;
		if not k or not Y then
			return;
		end;
		local g = {};
		for x, p in ipairs(x:GetDescendants()) do
			if p:IsA("BasePart") then
				g[#g + 1] = p;
			end;
		end;
		local M = 0;
		for x, p in ipairs(Y:GetDescendants()) do
			if p:IsA("Script") or p:IsA("LocalScript") then
				pcall(function()
					p:Destroy();
				end);
			elseif p:IsA("Decal") or p:IsA("Texture") or p:IsA("SurfaceAppearance") then
				pcall(function()
					p:Destroy();
				end);
			elseif p:IsA("ParticleEmitter") or p:IsA("Beam") or p:IsA("Trail") or p:IsA("PointLight") then
				pcall(function()
					p:Destroy();
				end);
			elseif p:IsA("BasePart") then
				p.Anchored = true;
				p.CanCollide = false;
				p.CanQuery = false;
				p.CastShadow = false;
				if p.Name == "HumanoidRootPart" then
					p.Transparency = 1;
				else
					p.Material = Enum.Material.ForceField;
					p.Color = d;
					p.Transparency = 0;
				end;
				M = M + 1;
				I[#I + 1] = { p, g[M] };
			end;
		end;
		local m = Y:FindFirstChildOfClass("Humanoid");
		if m then
			pcall(function()
				m:Destroy();
			end);
		end;
		Y.Parent = B;
		P = Y;
	end;
	local function H()
		local x = io.Character;
		local p = x and x:FindFirstChild("HumanoidRootPart");
		if not p then
			return;
		end;
		if not P then
			f();
			if not P then
				return;
			end;
		end;
		if not P.Parent then
			P.Parent = B;
		end;
		local k = os.clock();
		local Y = p.CFrame;
		if X < D then
			X = X + 1;
		else
			K = K % D + 1;
		end;
		local g = J[(((K + X) - 2)) % D + 1];
		g[1], g[2] = k, Y;
		if k - h >= .2 then
			h = k;
			local x, p = pcall(function()
					return Mo.Network.ServerStatsItem["Data Ping"]:GetValue() / 1000;
				end);
			b = math.clamp((x and p) or .15, .05, .6);
		end;
		local M = k - b;
		local m = Y;
		for x = X, 1, -1 do
			local p = J[(((K + x) - 2)) % D + 1];
			if p[1] <= M then
				m = p[2];
				break;
			end;
		end;
		local l = p.CFrame:Inverse();
		for x = 1, #I, 1 do
			local p, k = I[x][1], I[x][2];
			if p and (p.Parent and (k and k.Parent)) then
				p.CFrame = m * ((l * k.CFrame));
			end;
		end;
	end;
	(x:AddToggle("BacktrackOn", { Title = "\208\145\209\141\208\186\209\130\209\128\208\181\208\186", Default = false })):OnChanged(function(x)
		a = x;
		if x then
			if not _G.FH_BT_CONN then
				_G.FH_BT_CONN = o.Heartbeat:Connect(function()
						if a then
							H();
						end;
					end);
			end;
			if not P then
				f();
			end;
		else
			Q();
		end;
	end);
	(x:AddColorPicker("BacktrackCol", { Title = "\208\166\208\178\208\181\209\130", Default = Color3.fromRGB(255, 60, 60) })):OnChanged(function(x)
		d = x;
		if P then
			for p, k in ipairs(P:GetDescendants()) do
				if k:IsA("BasePart") and k.Name ~= "HumanoidRootPart" then
					k.Color = x;
				end;
			end;
		end;
	end);
	local w, s, U, n = false, Color3.new(1, 1, 1), 1, .82;
	local q;
	local function Z(x, p)
		local k = RaycastParams.new();
		k.FilterType = Enum.RaycastFilterType.Exclude;
		k.FilterDescendantsInstances = { x };
		k.IgnoreWater = true;
		local Y = B:Raycast(p.Position + Vector3.new(0, 1, 0), Vector3.new(0, -16, 0), k);
		if Y then
			return Y.Position, Y.Normal;
		end;
	end;
	local function W(x, p)
		local k = math.abs(p.Y) > .98 and Vector3.xAxis or Vector3.yAxis;
		local Y = (p:Cross(k)).Unit;
		local g = (Y:Cross(p)).Unit;
		local M = Instance.new("Part");
		M.Anchored = true;
		M.CanCollide = false;
		M.CanQuery = false;
		M.CanTouch = false;
		M.CastShadow = false;
		M.Transparency = 1;
		M.Size = Vector3.new(.3, .01, .3);
		M.CFrame = CFrame.fromMatrix(x + p * .012, Y, p, g);
		M.Parent = B;
		local m = Instance.new("SurfaceGui");
		m.Face = Enum.NormalId.Top;
		m.AlwaysOnTop = true;
		m.LightInfluence = 0;
		m.ZOffset = 4;
		m.CanvasSize = Vector2.new(1024, 1024);
		m.Parent = M;
		local l = Instance.new("ImageLabel");
		l.BackgroundTransparency = 1;
		l.Size = UDim2.fromScale(1, 1);
		l.Image = "rbxassetid://7185003058";
		l.ImageColor3 = s;
		l.ImageTransparency = 1 - U;
		l.ScaleType = Enum.ScaleType.Stretch;
		l.Parent = m;
		local i = TweenInfo.new(n, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
		(ko:Create(M, i, { Size = Vector3.new(6.4, .01, 6.4) })):Play();
		(ko:Create(l, i, { ImageTransparency = 1 })):Play();
		lo:AddItem(M, n + .2);
	end;
	local function A()
		if q then
			pcall(function()
				q:Disconnect();
			end);
			q = nil;
		end;
		if not w then
			return;
		end;
		local x = io.Character;
		local p = x and x:FindFirstChildOfClass("Humanoid");
		local k = x and x:FindFirstChild("HumanoidRootPart");
		if not p or not k then
			return;
		end;
		local Y = false;
		q = p.StateChanged:Connect(function(p, g)
				if g == Enum.HumanoidStateType.Jumping or g == Enum.HumanoidStateType.Freefall then
					Y = true;
				elseif g == Enum.HumanoidStateType.Landed and (Y and w) then
					Y = false;
					local p, g = Z(x, k);
					if p and g then
						W(p, g);
					end;
				end;
			end);
	end;
	(x:AddToggle("LandCircleOn", { Title = "\208\154\209\128\209\131\208\179 \208\191\208\176\208\180\208\181\208\189\208\184\209\143", Default = false })):OnChanged(function(x)
		w = x;
		if x then
			A();
		elseif q then
			pcall(function()
				q:Disconnect();
			end);
			q = nil;
		end;
	end);
	(x:AddColorPicker("LandCircleCol", { Title = "\208\166\208\178\208\181\209\130", Default = Color3.new(1, 1, 1) })):OnChanged(function(x)
		s = x;
	end);
	(x:AddSlider("LandCircleTr", {
		Title = "\208\159\209\128\208\190\208\183\209\128\208\176\209\135\208\189\208\190\209\129\209\130\209\140",
		Min = 0,
		Max = 1,
		Default = 1,
		Rounding = 2,
	})):OnChanged(function(x)
		U = tonumber(x) or 1;
	end);
	(x:AddSlider("LandCircleDur", {
		Title = "\208\148\208\187\208\184\209\130\208\181\208\187\209\140\208\189\208\190\209\129\209\130\209\140",
		Min = .1,
		Max = 3,
		Default = .82,
		Rounding = 2,
	})):OnChanged(function(x)
		n = tonumber(x) or .82;
	end);
	local y, L = false, Color3.fromRGB(242, 242, 242);
	local t, O, r = 280, 72, 180;
	local T, e = {}, {};
	local G = nil;
	local S, u, xo = {}, 0, 0;
	local po, Yo = 2.8, .022222222222222;
	local function go()
		local x = io.Character;
		local p = x and x:FindFirstChild("HumanoidRootPart");
		if not p then
			return 0;
		end;
		local k = p.AssemblyLinearVelocity;
		return (Vector3.new(k.X, 0, k.Z)).Magnitude;
	end;
	local function mo()
		local x = io.Character;
		local p = x and x:FindFirstChildOfClass("Humanoid");
		return math.max(1, (p and p.WalkSpeed) or 16);
	end;
	local function Fo()
		if G then
			pcall(function()
				G:Remove();
			end);
			G = nil;
		end;
		for x = 1, #T, 1 do
			pcall(function()
				T[x]:Remove();
			end);
			pcall(function()
				e[x]:Remove();
			end);
		end;
		T, e = {}, {};
		S = {};
		u = 0;
	end;
	local function co()
		Fo();
		xo = go();
		local x = os.clock();
		local p = math.ceil(po / Yo);
		for p = 0, p, 1 do
			S[#S + 1] = { t = (x - po) + p * Yo, v = xo };
		end;
		for x = 1, 300, 1 do
			local p = Drawing.new("Line");
			p.Color = Color3.new(0, 0, 0);
			p.Thickness = 3;
			p.Transparency = .4;
			p.Visible = false;
			e[#e + 1] = p;
			local k = Drawing.new("Line");
			k.Color = L;
			k.Thickness = 1.5;
			k.Transparency = 1;
			k.Visible = false;
			T[#T + 1] = k;
		end;
		o.RenderStepped:Connect(function(x)
			if not y then
				for x = 1, #T, 1 do
					T[x].Visible = false;
					e[x].Visible = false;
				end;
				if G then
					G.Visible = false;
				end;
				return;
			end;
			local p = go();
			xo = xo + ((p - xo)) * ((1 - math.exp(-x * 18)));
			u = u + x;
			local k = os.clock();
			if u >= Yo then
				u = u % Yo;
				S[#S + 1] = { t = k, v = xo };
				local x = k - po;
				while #S > 2 and S[2].t < x do
					table.remove(S, 1);
				end;
			end;
			local Y = No.ViewportSize;
			local g = math.min(t, math.max(120, Y.X - 48));
			local M = math.min(O, math.max(36, Y.Y - 32));
			local m = math.floor(Y.X * .5 - g * .5);
			local l = math.clamp(math.floor(Y.Y * .5 + r), M * .5 + 8, (Y.Y - M * .5) - 8);
			local i = mo();
			local N = k - po;
			local C = #S;
			for x = 1, C - 1, 1 do
				local p, k = S[x], S[x + 1];
				local Y = math.clamp(((p.t - N)) / po, 0, 1);
				local C = math.clamp(((k.t - N)) / po, 0, 1);
				local E = math.clamp(math.min(((Y + C)) * 6, (((2 - Y) - C)) * 5), 0, 1);
				local F = l - ((math.clamp(p.v / i - 1, -1, 1)) * M) * .44;
				local c = l - ((math.clamp(k.v / i - 1, -1, 1)) * M) * .44;
				local z = Vector2.new(m + Y * g, F);
				local v = Vector2.new(m + C * g, c);
				if T[x] then
					T[x].From = z;
					T[x].To = v;
					T[x].Transparency = E;
					T[x].Visible = E > .02;
					T[x].Color = L;
					e[x].From = z;
					e[x].To = v;
					e[x].Transparency = E * .42;
					e[x].Visible = E > .02;
				end;
			end;
			for x = C, #T, 1 do
				T[x].Visible = false;
				e[x].Visible = false;
			end;
			if not G then
				G = Drawing.new("Text");
				G.Center = false;
				G.Outline = true;
				G.Size = 12;
			end;
			G.Text = tostring(math.floor(xo + .5));
			G.Position = Vector2.new((m + g) + 5, l - 7);
			G.Color = L;
			G.Visible = true;
		end);
	end;
	(x:AddToggle("MovGraphOn", { Title = "\208\147\209\128\208\176\209\132\208\184\208\186 \209\129\208\186\208\190\209\128\208\190\209\129\209\130\208\184", Default = false })):OnChanged(function(x)
		y = x;
		if x then
			co();
		else
			Fo();
		end;
	end);
	(x:AddColorPicker("MovGraphCol", { Title = "\208\166\208\178\208\181\209\130", Default = Color3.fromRGB(242, 242, 242) })):OnChanged(function(x)
		L = x;
		for p = 1, #T, 1 do
			T[p].Color = x;
		end;
	end);
	(x:AddSlider("MovGraphW", {
		Title = "\208\168\208\184\209\128\208\184\208\189\208\176",
		Min = 180,
		Max = 420,
		Default = 280,
		Rounding = 0,
	})):OnChanged(function(x)
		t = tonumber(x) or 280;
	end);
	(x:AddSlider("MovGraphH", {
		Title = "\208\146\209\139\209\129\208\190\209\130\208\176",
		Min = 40,
		Max = 120,
		Default = 72,
		Rounding = 0,
	})):OnChanged(function(x)
		O = tonumber(x) or 72;
	end);
	(x:AddSlider("MovGraphY", {
		Title = "\208\161\208\188\208\181\209\137\208\181\208\189\208\184\208\181 Y",
		Min = -200,
		Max = 400,
		Default = 180,
		Rounding = 0,
	})):OnChanged(function(x)
		r = tonumber(x) or 180;
	end);
	local zo, vo = false, Color3.new(1, 1, 1);
	local Ro = {};
	for x = 1, 4, 1 do
		local p = Drawing.new("Line");
		p.Thickness = 2;
		p.Color = vo;
		p.Visible = false;
		Ro[x] = p;
	end;
	o.RenderStepped:Connect(function()
		if not zo then
			for x = 1, #Ro, 1 do
				Ro[x].Visible = false;
			end;
			return;
		end;
		local x = j:GetMouseLocation();
		local p, k = 4, 8;
		local Y, g = x.X, x.Y;
		local M = {
				{
					Y,
					g - p,
					Y,
					(g - p) - k,
				},
				{
					Y,
					g + p,
					Y,
					(g + p) + k,
				},
				{
					Y - p,
					g,
					(Y - p) - k,
					g,
				},
				{
					Y + p,
					g,
					(Y + p) + k,
					g,
				},
			};
		for x = 1, 4, 1 do
			local p = M[x];
			Ro[x].From = Vector2.new(p[1], p[2]);
			Ro[x].To = Vector2.new(p[3], p[4]);
			Ro[x].Color = vo;
			Ro[x].Visible = true;
		end;
	end);
	(x:AddToggle("CrosshairOn", { Title = "\208\159\209\128\208\184\209\134\208\181\208\187", Default = false })):OnChanged(function(x)
		zo = x;
		pcall(function()
			j.MouseIconEnabled = not x;
		end);
	end);
	(x:AddColorPicker("CrosshairCol", { Title = "\208\166\208\178\208\181\209\130 \208\191\209\128\208\184\209\134\208\181\208\187\208\176", Default = Color3.new(1, 1, 1) })):OnChanged(function(x)
		vo = x;
	end);
	local ao, Po, Io = false, "ForceField", Color3.fromRGB(0, 200, 255);
	local Do = {};
	local function Jo()
		for x, p in pairs(Do) do
			if x and x.Parent then
				pcall(function()
					x.Material = p[1];
				end);
				pcall(function()
					x.Color = p[2];
				end);
			end;
		end;
		Do = {};
	end;
	local function Ko()
		local x = io.Character;
		if not x then
			return;
		end;
		for x, p in ipairs(x:GetDescendants()) do
			if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
				if not Do[p] then
					Do[p] = { p.Material, p.Color };
				end;
				if Po == "ForceField" then
					pcall(function()
						p.Material = Enum.Material.ForceField;
					end);
					pcall(function()
						p.Color = Io;
					end);
				elseif Po == "Flat" then
					pcall(function()
						p.Material = Enum.Material.SmoothPlastic;
					end);
					pcall(function()
						p.Color = Io;
					end);
				elseif Po == "Chromatic" then
					pcall(function()
						p.Material = Enum.Material.Foil;
					end);
					pcall(function()
						p.Color = Io;
					end);
				end;
			end;
		end;
	end;
	(x:AddToggle("SelfChamsOn", { Title = "\208\167\208\176\208\188\209\129\209\139 \208\189\208\176 \209\129\208\181\208\177\208\181", Default = false })):OnChanged(function(x)
		ao = x;
		if x then
			o.Heartbeat:Connect(function()
				if ao then
					Ko();
				end;
			end);
		else
			Jo();
		end;
	end);
	(x:AddDropdown("SelfChamsType", { Title = "\208\159\209\128\208\181\209\129\208\181\209\130", Values = { "ForceField", "Flat", "Chromatic" }, Default = "ForceField" })):OnChanged(function(x)
		Po = x;
	end);
	(x:AddColorPicker("SelfChamsCol", { Title = "\208\166\208\178\208\181\209\130", Default = Color3.fromRGB(0, 200, 255) })):OnChanged(function(x)
		Io = x;
	end);
	local Xo, bo, ho = false, "ForceField", Color3.fromRGB(255, 200, 0);
	local Qo = {};
	local function fo()
		for x, p in pairs(Qo) do
			if x and x.Parent then
				pcall(function()
					x.Material = p[1];
				end);
				pcall(function()
					x.Color = p[2];
				end);
			end;
		end;
		Qo = {};
	end;
	local function Ho()
		local x = io.Character;
		if not x then
			return;
		end;
		for x, p in ipairs(x:GetChildren()) do
			if p:IsA("Tool") then
				for x, p in ipairs(p:GetDescendants()) do
					if p:IsA("BasePart") then
						if not Qo[p] then
							Qo[p] = { p.Material, p.Color };
						end;
						if bo == "ForceField" then
							pcall(function()
								p.Material = Enum.Material.ForceField;
							end);
							pcall(function()
								p.Color = ho;
							end);
						elseif bo == "Flat" then
							pcall(function()
								p.Material = Enum.Material.SmoothPlastic;
							end);
							pcall(function()
								p.Color = ho;
							end);
						elseif bo == "Chromatic" then
							pcall(function()
								p.Material = Enum.Material.Foil;
							end);
							pcall(function()
								p.Color = ho;
							end);
						end;
					end;
				end;
			end;
		end;
	end;
	(x:AddToggle("ToolChamsOn", { Title = "\208\167\208\176\208\188\209\129\209\139 \208\190\209\128\209\131\208\182\208\184\209\143", Default = false })):OnChanged(function(x)
		Xo = x;
		if x then
			o.Heartbeat:Connect(function()
				if Xo then
					Ho();
				end;
			end);
		else
			fo();
		end;
	end);
	(x:AddDropdown("ToolChamsType", { Title = "\208\159\209\128\208\181\209\129\208\181\209\130", Values = { "ForceField", "Flat", "Chromatic" }, Default = "ForceField" })):OnChanged(function(x)
		bo = x;
	end);
	(x:AddColorPicker("ToolChamsCol", { Title = "\208\166\208\178\208\181\209\130", Default = Color3.fromRGB(255, 200, 0) })):OnChanged(function(x)
		ho = x;
	end);
	local wo = Co.Visual:AddSection({ Name = "\208\164\208\181\208\185\208\186-\208\178\208\189\208\181\209\136\208\189\208\190\209\129\209\130\209\140" });
	local so = false;
	local Uo = {};
	local function no()
		local x = io.Character;
		if not x then
			Uo = {};
			return;
		end;
		local p = x:FindFirstChild("RightUpperLeg") or x:FindFirstChild("Right Leg");
		local k = x:FindFirstChild("RightLowerLeg");
		local Y = x:FindFirstChild("RightFoot");
		if p and Uo.RU then
			pcall(function()
				p.TextureID = Uo.RU.TextureID or "";
				p.MeshId = Uo.RU.MeshId or "";
			end);
		end;
		if k and Uo.RL then
			pcall(function()
				k.MeshId = Uo.RL.MeshId or "";
				k.Transparency = Uo.RL.Transparency or 0;
			end);
		end;
		if Y and Uo.RF then
			pcall(function()
				Y.MeshId = Uo.RF.MeshId or "";
				Y.Transparency = Uo.RF.Transparency or 0;
			end);
		end;
		Uo = {};
	end;
	local function qo()
		if not so then
			return;
		end;
		local x = io.Character;
		if not x then
			return;
		end;
		local p = x:FindFirstChild("RightUpperLeg") or x:FindFirstChild("Right Leg");
		local k = x:FindFirstChild("RightLowerLeg");
		local Y = x:FindFirstChild("RightFoot");
		if not p then
			return;
		end;
		Uo = {};
		if p then
			Uo.RU = { MeshId = p.MeshId, TextureID = p.TextureID };
			pcall(function()
				p.MeshId = "rbxassetid://902942096";
				p.TextureID = "rbxassetid://902843398";
			end);
		end;
		if k then
			Uo.RL = { MeshId = k.MeshId, Transparency = k.Transparency };
			pcall(function()
				k.MeshId = "rbxassetid://902942093";
				k.Transparency = 1;
			end);
		end;
		if Y then
			Uo.RF = { MeshId = Y.MeshId, Transparency = Y.Transparency };
			pcall(function()
				Y.MeshId = "rbxassetid://902942089";
				Y.Transparency = 1;
			end);
		end;
	end;
	(wo:AddToggle("KorbloxOn", { Title = "Fake Korblox", Default = false })):OnChanged(function(x)
		so = x;
		if x then
			qo();
		else
			no();
		end;
		V("FH", "Korblox " .. ((x and "\208\146\208\154\208\155" or "\208\146\208\171\208\154\208\155")), 1.5);
	end);
	local Zo = false;
	local Wo = {};
	local function Ao()
		local x = io.Character;
		if not x then
			Wo = {};
			return;
		end;
		local p = x:FindFirstChild("Head");
		if p and Wo.Head then
			pcall(function()
				p.Transparency = Wo.Head.Transparency;
			end);
			pcall(function()
				p.LocalTransparencyModifier = Wo.Head.LTM;
			end);
			pcall(function()
				p.Size = Wo.Head.Size;
			end);
			pcall(function()
				p.MeshId = Wo.Head.MeshId;
			end);
		end;
		if p then
			for x, p in ipairs(p:GetDescendants()) do
				if Wo[p] then
					if p:IsA("Decal") or p:IsA("Texture") then
						pcall(function()
							p.Transparency = Wo[p];
						end);
					elseif p:IsA("Accessory") or p:IsA("Accoutrement") then
						local x = p:FindFirstChild("Handle");
						if x and Wo[x] then
							pcall(function()
								x.Transparency = Wo[x];
							end);
						end;
					end;
				end;
			end;
		end;
		Wo = {};
	end;
	local function yo()
		if not Zo then
			return;
		end;
		local x = io.Character;
		if not x then
			return;
		end;
		local p = x:FindFirstChild("Head");
		if not p then
			return;
		end;
		Wo = {};
		Wo.Head = {
				Transparency = p.Transparency,
				LTM = p.LocalTransparencyModifier,
				Size = p.Size,
				MeshId = p.MeshId,
			};
		pcall(function()
			p.Transparency = 1;
		end);
		pcall(function()
			p.LocalTransparencyModifier = 1;
		end);
		for x, p in ipairs(p:GetDescendants()) do
			if p:IsA("Decal") or p:IsA("Texture") then
				Wo[p] = p.Transparency;
				pcall(function()
					p.Transparency = 1;
				end);
			elseif p:IsA("Accessory") or p:IsA("Accoutrement") then
				local x = p:FindFirstChild("Handle");
				if x then
					Wo[x] = x.Transparency;
					pcall(function()
						x.Transparency = 1;
					end);
				end;
				for x, p in ipairs(p:GetDescendants()) do
					if p:IsA("Decal") or p:IsA("Texture") then
						Wo[p] = p.Transparency;
						pcall(function()
							p.Transparency = 1;
						end);
					end;
				end;
			end;
		end;
		for x, p in ipairs(x:GetChildren()) do
			if p:IsA("Accessory") or p:IsA("Accoutrement") then
				if p:FindFirstChild("Handle") and p.AccessoryType == Enum.AccessoryType.Hat then
					local x = p:FindFirstChild("Handle");
					Wo[x] = x.Transparency;
					pcall(function()
						x.Transparency = 1;
					end);
					for x, p in ipairs(p:GetDescendants()) do
						if p:IsA("Decal") or p:IsA("Texture") then
							Wo[p] = p.Transparency;
							pcall(function()
								p.Transparency = 1;
							end);
						end;
					end;
				end;
			end;
		end;
	end;
	(wo:AddToggle("HeadlessOn", { Title = "Fake Headless (\208\177\208\181\208\183 \208\179\208\190\208\187\208\190\208\178\209\139)", Default = false })):OnChanged(function(x)
		Zo = x;
		if x then
			yo();
		else
			Ao();
		end;
		V("FH", "Headless " .. ((x and "\208\146\208\154\208\155" or "\208\146\208\171\208\154\208\155")), 1.5);
	end);
	io.CharacterAdded:Connect(function()
		task.wait(1);
		if so then
			qo();
		end;
		if Zo then
			yo();
		end;
	end);
end;
do
	local x = Co.Effects;
	local p = x:AddSection({ Name = "\208\162\209\128\208\176\209\129\209\129\208\181\209\128 \208\191\209\131\208\187\208\184" });
	local k, Y, g = false, Color3.fromRGB(133, 220, 255), 1;
	local function M(x, p)
		local k = Instance.new("Part");
		k.Transparency = 1;
		k.Anchored = true;
		k.CanCollide = false;
		k.CanQuery = false;
		k.Size = Vector3.new(1, 1, 1);
		k.CFrame = CFrame.new(x);
		Instance.new("Attachment", k);
		k.Parent = B;
		lo:AddItem(k, p);
		return k;
	end;
	local function m(x)
		if typeof(x) == "Vector3" then
			return x;
		end;
		if typeof(x) == "CFrame" then
			return x.Position;
		end;
		if typeof(x) == "Instance" then
			if x:IsA("Attachment") then
				return x.WorldPosition;
			end;
			if x:IsA("BasePart") then
				return x.Position;
			end;
		end;
	end;
	local function l(x, p)
		local k, l = m(x), m(p);
		if not k or not l then
			return;
		end;
		local i = M(k, g + .5);
		local N = M(l, g + .5);
		local C = Instance.new("Beam");
		C.FaceCamera = true;
		C.TextureSpeed = 1.5;
		C.TextureLength = 2;
		C.Width0 = .25;
		C.Width1 = .25;
		C.LightEmission = 3;
		C.LightInfluence = 0;
		C.Brightness = 2.5;
		C.Texture = "rbxassetid://12781800668";
		C.Color = ColorSequence.new(Y);
		C.Transparency = NumberSequence.new(.1);
		C.Attachment0 = i:FindFirstChildOfClass("Attachment");
		C.Attachment1 = N:FindFirstChildOfClass("Attachment");
		C.Parent = i;
		task.delay(g, function()
			if C.Parent then
				(ko:Create(C, TweenInfo.new(.2), { Width0 = 0, Width1 = 0 })):Play();
			end;
		end);
	end;
	local i;
	local function N()
		if i then
			return;
		end;
		local x, p = pcall(function()
				return ((po:WaitForChild("ClientServices")):WaitForChild("WeaponService")):WaitForChild("GunFired");
			end);
		if not x or not p then
			return;
		end;
		i = p.OnClientEvent:Connect(function(x, p, Y)
				if not k then
					return;
				end;
				local g = io.Character;
				if not g then
					return;
				end;
				if not ((typeof(x) == "Instance" and x:IsDescendantOf(g))) then
					return;
				end;
				l(p, Y);
			end);
	end;
	(p:AddToggle("TracerOn", { Title = "\208\146\208\186\208\187\209\142\209\135\208\184\209\130\209\140 \209\130\209\128\208\176\209\129\209\129\208\181\209\128", Default = false })):OnChanged(function(x)
		k = x;
		if x then
			N();
		end;
	end);
	(p:AddColorPicker("TracerCol", { Title = "\208\166\208\178\208\181\209\130", Default = Color3.fromRGB(133, 220, 255) })):OnChanged(function(x)
		Y = x;
	end);
	(p:AddSlider("TracerDur", {
		Title = "\208\148\208\187\208\184\209\130\208\181\208\187\209\140\208\189\208\190\209\129\209\130\209\140",
		Min = .1,
		Max = 5,
		Default = 1,
		Rounding = 1,
	})):OnChanged(function(x)
		g = tonumber(x) or 1;
	end);
	local C = x:AddSection({ Name = "\208\144\209\131\209\128\208\176" });
	local E, F, c = false, "angel", Color3.fromRGB(133, 220, 255);
	local z = {
			angel = "97658130917593",
			starlight = "134645216613107",
			heavenly = "139300897520961",
			ribbon = "132069507632161",
			sakura = "81755778619404",
			wind = "80694081850877",
			flow = "119913533725648",
			star = "73754563740680",
		};
	local v, R, a = {}, {}, nil;
	local function d(x)
		if v[x] then
			return v[x];
		end;
		local p = z[x];
		if not p then
			return nil;
		end;
		local k, Y = pcall(game.GetObjects, game, "rbxassetid://" .. p);
		if k and (Y and Y[1]) then
			v[x] = Y[1];
			return Y[1];
		end;
	end;
	local function P(x, p)
		local k = ColorSequence.new(p);
		for x, Y in ipairs(x:GetDescendants()) do
			if Y:IsA("PointLight") then
				Y.Color = p;
			elseif Y:IsA("ParticleEmitter") or Y:IsA("Beam") or Y:IsA("Trail") then
				Y.Color = k;
			end;
		end;
	end;
	local function I()
		for x = #R, 1, -1 do
			pcall(function()
				R[x]:Destroy();
			end);
			R[x] = nil;
		end;
	end;
	local function D()
		I();
		local x = io.Character;
		if not x then
			return;
		end;
		local p = d(F);
		if not p then
			return;
		end;
		P(p, c);
		local k = p:Clone();
		for p, k in ipairs(k:GetChildren()) do
			local Y = x:FindFirstChild(k.Name);
			if Y and Y:IsA("BasePart") then
				for x, p in ipairs(k:GetChildren()) do
					p.Parent = Y;
					R[#R + 1] = p;
				end;
			end;
		end;
		k:Destroy();
	end;
	local function J()
		if a then
			return;
		end;
		a = io.CharacterAdded:Connect(function()
				task.wait(.5);
				if E then
					D();
				end;
			end);
		task.spawn(D);
	end;
	local function K()
		if a then
			pcall(function()
				a:Disconnect();
			end);
			a = nil;
		end;
		I();
	end;
	(C:AddToggle("AuraOn", { Title = "\208\146\208\186\208\187\209\142\209\135\208\184\209\130\209\140 \208\176\209\131\209\128\209\131", Default = false })):OnChanged(function(x)
		E = x;
		if x then
			J();
		else
			K();
		end;
	end);
	(C:AddDropdown("AuraType", { Title = "\208\162\208\184\208\191", Values = {
			"angel",
			"starlight",
			"heavenly",
			"ribbon",
			"sakura",
			"wind",
			"flow",
			"star",
		}, Default = "angel" })):OnChanged(function(x)
		F = x;
		if E then
			task.spawn(D);
		end;
	end);
	(C:AddColorPicker("AuraCol", { Title = "\208\166\208\178\208\181\209\130", Default = Color3.fromRGB(133, 220, 255) })):OnChanged(function(x)
		c = x;
		for p, k in pairs(v) do
			P(k, x);
		end;
		if E then
			task.spawn(D);
		end;
	end);
	local X = x:AddSection({ Name = "\208\173\209\132\209\132\208\181\208\186\209\130\209\139 \208\188\208\184\209\128\208\176" });
	local b, h, Q, f = false, "Snow", Color3.fromRGB(150, 200, 255), 250;
	local H, w, s = nil, nil, nil;
	local function U()
		local x = w;
		if not x then
			return;
		end;
		x.Texture = "rbxasset://textures/particles/smoke_main.dds";
		x.LightInfluence = 0;
		x.LightEmission = .4;
		x.EmissionDirection = Enum.NormalId.Bottom;
		x.Rate = f;
		x.Color = ColorSequence.new(Q);
		if h == "Snow" then
			x.Lifetime = NumberRange.new(4, 6);
			x.Speed = NumberRange.new(6, 12);
			x.Acceleration = Vector3.new(2, -6, 1);
			x.SpreadAngle = Vector2.new(35, 35);
			x.Rotation = NumberRange.new(0, 360);
			x.RotSpeed = NumberRange.new(-40, 40);
			x.Size = NumberSequence.new(.55);
			x.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, .2), NumberSequenceKeypoint.new(.8, .3), NumberSequenceKeypoint.new(1, 1) });
		else
			x.Lifetime = NumberRange.new(5, 7);
			x.Speed = NumberRange.new(5, 10);
			x.Acceleration = Vector3.new(4, -5, 2);
			x.SpreadAngle = Vector2.new(40, 40);
			x.Rotation = NumberRange.new(0, 360);
			x.RotSpeed = NumberRange.new(-80, 80);
			x.Size = NumberSequence.new(.5);
			x.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, .15), NumberSequenceKeypoint.new(.85, .25), NumberSequenceKeypoint.new(1, 1) });
		end;
	end;
	local function n()
		if s then
			pcall(function()
				s:Disconnect();
			end);
			s = nil;
		end;
		if H then
			pcall(function()
				H:Destroy();
			end);
			H = nil;
		end;
		w = nil;
	end;
	local function q()
		n();
		H = Instance.new("Part");
		H.Name = "FH_WORLD_FX";
		H.Anchored = true;
		H.CanCollide = false;
		H.CanQuery = false;
		H.CanTouch = false;
		H.Transparency = 1;
		H.Size = Vector3.new(260, 140, 260);
		H.Parent = B;
		w = Instance.new("ParticleEmitter");
		pcall(function()
			w.Shape = Enum.ParticleEmitterShape.Box;
			w.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume;
		end);
		w.Parent = H;
		U();
		s = o.RenderStepped:Connect(function()
				local x = B.CurrentCamera;
				if not x then
					return;
				end;
				local p = x.CFrame;
				local k = p.LookVector;
				local Y = Vector3.new(k.X, 0, k.Z);
				if Y.Magnitude < .05 then
					Y = Vector3.new(0, 0, -1);
				else
					Y = Y.Unit;
				end;
				H.CFrame = CFrame.new((p.Position + Y * 57) + Vector3.new(0, 44, 0));
			end);
	end;
	(X:AddToggle("FXOn", { Title = "\208\146\208\186\208\187\209\142\209\135\208\184\209\130\209\140 \209\141\209\132\209\132\208\181\208\186\209\130\209\139", Default = false })):OnChanged(function(x)
		b = x;
		if x then
			q();
		else
			n();
		end;
	end);
	(X:AddDropdown("FXType", { Title = "\208\162\208\184\208\191", Values = { "\208\161\208\189\208\181\208\179", "\208\161\208\176\208\186\209\131\209\128\208\176" }, Default = "\208\161\208\189\208\181\208\179" })):OnChanged(function(x)
		h = (x == "\208\161\208\176\208\186\209\131\209\128\208\176") and "Sakura" or "Snow";
		if b then
			U();
		end;
	end);
	(X:AddColorPicker("FXCol", { Title = "\208\166\208\178\208\181\209\130", Default = Color3.fromRGB(150, 200, 255) })):OnChanged(function(x)
		Q = x;
		if w then
			w.Color = ColorSequence.new(x);
		end;
	end);
	(X:AddSlider("FXRate", {
		Title = "\208\152\208\189\209\130\208\181\208\189\209\129\208\184\208\178\208\189\208\190\209\129\209\130\209\140",
		Min = 20,
		Max = 900,
		Default = 250,
		Rounding = 1,
	})):OnChanged(function(x)
		f = tonumber(x) or 250;
		if w then
			U();
		end;
	end);
	local Z = x:AddSection({ Name = "\208\156\208\184\209\128" });
	local W = {
			Amb = S.Ambient,
			Br = S.Brightness,
			CT = S.ClockTime,
			CSB = S.ColorShift_Bottom,
			CST = S.ColorShift_Top,
			Exp = S.ExposureCompensation,
			FC = S.FogColor,
			FS = S.FogStart,
			FE = S.FogEnd,
			OA = S.OutdoorAmbient,
			GS = S.GlobalShadows,
		};
	(Z:AddToggle("FBOn", { Title = "Fullbright", Default = false })):OnChanged(function(x)
		if x then
			S.Brightness = 2;
			S.ClockTime = 14;
			S.GlobalShadows = false;
			S.OutdoorAmbient = Color3.fromRGB(128, 128, 128);
			S.FogEnd = 100000;
		else
			S.Brightness = W.Br;
			S.ClockTime = W.CT;
			S.GlobalShadows = W.GS;
			S.OutdoorAmbient = W.OA;
			S.FogEnd = W.FE;
		end;
	end);
	local A, y = false, 12;
	(Z:AddToggle("TimeOn", { Title = "\208\161\208\178\208\190\209\145 \208\178\209\128\208\181\208\188\209\143", Default = false })):OnChanged(function(x)
		A = x;
		S.ClockTime = x and y or W.CT;
	end);
	(Z:AddSlider("TimeVal", {
		Title = "\208\167\208\176\209\129",
		Min = 0,
		Max = 24,
		Default = 12,
		Rounding = 0,
	})):OnChanged(function(x)
		y = tonumber(x) or 12;
		if A then
			S.ClockTime = y;
		end;
	end);
	local L, t = false, 0;
	(Z:AddToggle("ExpOn", { Title = "\208\173\208\186\209\129\208\191\208\190\208\183\208\184\209\134\208\184\209\143", Default = false })):OnChanged(function(x)
		L = x;
		S.ExposureCompensation = x and t or W.Exp;
	end);
	(Z:AddSlider("ExpVal", {
		Title = "\208\151\208\189\208\176\209\135\208\181\208\189\208\184\208\181",
		Min = -5,
		Max = 5,
		Default = 0,
		Rounding = 2,
	})):OnChanged(function(x)
		t = tonumber(x) or 0;
		if L then
			S.ExposureCompensation = t;
		end;
	end);
	local V, O, r, T = false, Color3.fromRGB(192, 192, 192), 0, 1000;
	(Z:AddToggle("FogOn", { Title = "\208\161\208\178\208\190\208\185 \209\130\209\131\208\188\208\176\208\189", Default = false })):OnChanged(function(x)
		V = x;
		if x then
			S.FogColor = O;
			S.FogStart = r;
			S.FogEnd = T;
		else
			S.FogColor = W.FC;
			S.FogStart = W.FS;
			S.FogEnd = W.FE;
		end;
	end);
	(Z:AddColorPicker("FogCol", { Title = "\208\166\208\178\208\181\209\130 \209\130\209\131\208\188\208\176\208\189\208\176", Default = Color3.fromRGB(192, 192, 192) })):OnChanged(function(x)
		O = x;
		if V then
			S.FogColor = x;
		end;
	end);
	(Z:AddSlider("FogStart", {
		Title = "\208\157\208\176\209\135\208\176\208\187\208\190",
		Min = 0,
		Max = 1000,
		Default = 0,
		Rounding = 0,
	})):OnChanged(function(x)
		r = tonumber(x) or 0;
		if V then
			S.FogStart = r;
		end;
	end);
	(Z:AddSlider("FogEnd", {
		Title = "\208\154\208\190\208\189\208\181\209\134",
		Min = 0,
		Max = 1000,
		Default = 1000,
		Rounding = 0,
	})):OnChanged(function(x)
		T = tonumber(x) or 1000;
		if V then
			S.FogEnd = T;
		end;
	end);
	local e, G = false, Color3.fromRGB(128, 128, 128);
	(Z:AddToggle("AmbOn", { Title = "\208\161\208\178\208\190\208\185 ambient", Default = false })):OnChanged(function(x)
		e = x;
		if x then
			S.Ambient = G;
			S.OutdoorAmbient = G;
		else
			S.Ambient = W.Amb;
			S.OutdoorAmbient = W.OA;
		end;
	end);
	(Z:AddColorPicker("AmbCol", { Title = "\208\166\208\178\208\181\209\130 ambient", Default = Color3.fromRGB(128, 128, 128) })):OnChanged(function(x)
		G = x;
		if e then
			S.Ambient = x;
			S.OutdoorAmbient = x;
		end;
	end);
	local j, u = false, "Jungle";
	local xo, Yo, go = nil, nil, nil;
	local Mo = {
			Jungle = {
				SkyboxBk = "http://www.roblox.com/asset/?id=214399891",
				SkyboxDn = "http://www.roblox.com/asset/?id=214399887",
				SkyboxFt = "http://www.roblox.com/asset/?id=214399894",
				SkyboxLf = "http://www.roblox.com/asset/?id=214405668",
				SkyboxRt = "http://www.roblox.com/asset/?id=214399899",
				SkyboxUp = "http://www.roblox.com/asset/?id=214399889",
			},
			Blossom = {
				SkyboxBk = "http://www.roblox.com/asset/?id=271042516",
				SkyboxDn = "http://www.roblox.com/asset/?id=271077243",
				SkyboxFt = "http://www.roblox.com/asset/?id=271042556",
				SkyboxLf = "http://www.roblox.com/asset/?id=271042310",
				SkyboxRt = "http://www.roblox.com/asset/?id=271042467",
				SkyboxUp = "http://www.roblox.com/asset/?id=271077958",
			},
			["Red night"] = {
				SkyboxBk = "http://www.roblox.com/Asset/?ID=401664839",
				SkyboxDn = "http://www.roblox.com/Asset/?ID=401664862",
				SkyboxFt = "http://www.roblox.com/Asset/?ID=401664960",
				SkyboxLf = "http://www.roblox.com/Asset/?ID=401664881",
				SkyboxRt = "http://www.roblox.com/Asset/?ID=401664901",
				SkyboxUp = "http://www.roblox.com/Asset/?ID=401664936",
			},
			Purple = {
				SkyboxBk = "http://www.roblox.com/asset/?id=13694952867",
				SkyboxDn = "http://www.roblox.com/asset/?id=13694968325",
				SkyboxFt = "http://www.roblox.com/asset/?id=13694980654",
				SkyboxLf = "http://www.roblox.com/asset/?id=13694998113",
				SkyboxRt = "http://www.roblox.com/asset/?id=13695002700",
				SkyboxUp = "http://www.roblox.com/asset/?id=13695007103",
			},
			Foggy = {
				SkyboxBk = "rbxassetid://1370717244",
				SkyboxDn = "rbxassetid://1370717336",
				SkyboxFt = "rbxassetid://1370717438",
				SkyboxLf = "rbxassetid://1370717567",
				SkyboxRt = "rbxassetid://1370717698",
				SkyboxUp = "rbxassetid://1370717782",
			},
		};
	local mo = { Galaxy = 15983996673, Anime = 13107361022, Minecraft = 2758029221 };
	local function No()
		if xo then
			pcall(function()
				xo:Destroy();
			end);
			xo = nil;
		end;
	end;
	local function Eo(x)
		if not Yo then
			local x = S:FindFirstChildOfClass("Sky");
			if x and x ~= xo then
				Yo = x;
				go = x.Parent;
				pcall(function()
					x.Parent = nil;
				end);
			end;
		end;
		No();
		if Mo[x] then
			local p = Instance.new("Sky");
			p.Name = "FH_CustomSky";
			for x, k in pairs(Mo[x]) do
				pcall(function()
					p[x] = k;
				end);
			end;
			p.Parent = S;
			xo = p;
		elseif mo[x] then
			task.spawn(function()
				local p, k = pcall(game.GetObjects, game, "rbxassetid://" .. mo[x]);
				if not p or type(k) ~= "table" then
					return;
				end;
				local Y;
				for x, p in ipairs(k) do
					if p:IsA("Sky") then
						Y = p;
						break;
					end;
					local k = p:FindFirstChildWhichIsA("Sky", true);
					if k then
						Y = k;
						break;
					end;
				end;
				if not Y or not j then
					return;
				end;
				No();
				Y.Name = "FH_CustomSky";
				Y.Parent = S;
				xo = Y;
			end);
		end;
	end;
	local function Fo()
		No();
		if Yo then
			pcall(function()
				Yo.Parent = go or S;
			end);
			Yo, go = nil, nil;
		end;
	end;
	(Z:AddToggle("SkyOn", { Title = "\208\157\208\181\208\177\208\190", Default = false })):OnChanged(function(x)
		j = x;
		if x then
			Eo(u);
		else
			Fo();
		end;
	end);
	(Z:AddDropdown("SkyName", { Title = "\208\159\209\128\208\181\209\129\208\181\209\130", Values = {
			"Jungle",
			"Blossom",
			"Red night",
			"Purple",
			"Foggy",
			"Galaxy",
			"Anime",
			"Minecraft",
		}, Default = "Jungle" })):OnChanged(function(x)
		u = x;
		if j then
			Eo(x);
		end;
	end);
	(getgenv()).EFFECTS_UNLOAD = function()
			k = false;
			if i then
				pcall(function()
					i:Disconnect();
				end);
			end;
			E = false;
			K();
			n();
			Fo();
			S.Ambient = W.Amb;
			S.Brightness = W.Br;
			S.ClockTime = W.CT;
			S.ColorShift_Bottom = W.CSB;
			S.ColorShift_Top = W.CST;
			S.ExposureCompensation = W.Exp;
			S.FogColor = W.FC;
			S.FogStart = W.FS;
			S.FogEnd = W.FE;
			S.OutdoorAmbient = W.OA;
			S.GlobalShadows = W.GS;
		end;
end;
do
	local x = Co.Effects:AddSection({ Name = "\208\173\209\132\209\132\208\181\208\186\209\130 \208\191\209\128\208\184 \209\129\208\188\208\181\209\128\209\130\208\184 \209\131\208\177\208\184\208\185\209\134\209\139" });
	local p, k, Y, g = false, false, false, false;
	local M = Color3.fromRGB(255, 0, 0);
	local m = Color3.fromRGB(255, 0, 0);
	local l = Color3.fromRGB(255, 100, 100);
	local i, N = 3, 1.2;
	local C, E, F = {}, {}, {};
	local c, z = nil, nil;
	local v = {};
	local function R(x)
		for p = 1, #v, 1 do
			if v[p] == x then
				v[p] = v[#v];
				v[#v] = nil;
				break;
			end;
		end;
		if x.part and x.part.Parent then
			x.part:Destroy();
		end;
	end;
	local function a(x, p, k, Y)
		if not x or not x.Parent then
			return;
		end;
		if #v >= 3 then
			R(v[1]);
		end;
		k = math.max(k, .2);
		local g = {};
		for x, p in ipairs(x:GetChildren()) do
			if p:IsA("BasePart") and (p.Name ~= "HumanoidRootPart" and #g < 15) then
				g[#g + 1] = p;
			end;
		end;
		if #g == 0 then
			return;
		end;
		local M = Instance.new("Folder");
		M.Name = "FH_MurderFX";
		M.Parent = B;
		local m = { part = M, balls = {}, channel = Y };
		v[#v + 1] = m;
		local l = q;
		local i = math.pi * ((3 - math.sqrt(5)));
		local function N(x, p, k, Y, g)
			local M = x.Size;
			local m = p * .92;
			if x.Name == "Head" then
				local p = 1 - 2 * ((((k - .5)) / Y));
				local l = k * i + g;
				local N = math.sqrt(math.max(0, 1 - p * p));
				local C = Vector3.new(N * math.cos(l), p, N * math.sin(l));
				local E = M * .5;
				return x.CFrame:PointToWorldSpace(Vector3.new(C.X * ((E.X + m)), C.Y * ((E.Y + m)), C.Z * ((E.Z + m))));
			end;
			local N = M.Y * M.Z;
			local C = M.X * M.Z;
			local E = M.X * M.Y;
			local F = l() * (((N + C) + E));
			local c;
			if F < N then
				local x = l() < .5 and -1 or 1;
				c = Vector3.new(x * ((M.X * .5 + m)), ((l() - .5)) * M.Y, ((l() - .5)) * M.Z);
			elseif F < N + C then
				local x = l() < .5 and -1 or 1;
				c = Vector3.new(((l() - .5)) * M.X, x * ((M.Y * .5 + m)), ((l() - .5)) * M.Z);
			else
				local x = l() < .5 and -1 or 1;
				c = Vector3.new(((l() - .5)) * M.X, ((l() - .5)) * M.Y, x * ((M.Z * .5 + m)));
			end;
			return x.CFrame:PointToWorldSpace(c);
		end;
		local C, E = math.huge, -math.huge;
		for x, p in ipairs(g) do
			local k = p.Size.Y * .5;
			C = math.min(C, p.Position.Y - k);
			E = math.max(E, p.Position.Y + k);
		end;
		local F = 8;
		local c = {};
		for x = 1, F, 1 do
			c[x] = {};
		end;
		local z = (l() * math.pi) * 2;
		local a = math.max(E - C, .01);
		local d = 0;
		for x, k in ipairs(g) do
			local Y = k.Size;
			local g = 2 * (((Y.X * Y.Y + Y.X * Y.Z) + Y.Y * Y.Z));
			local i = k.Name == "Head" and 24 or math.clamp(math.floor(g * .65 + .5), 7, 12);
			i = math.min(i, 140 - d);
			for x = 1, i, 1 do
				local Y = k.Name == "Head" and (.115 + l() * .045) or (.13 + l() * .06);
				local g = Vector3.new(Y, Y, Y);
				local E = N(k, Y * .5, x, i, z);
				local v = Instance.new("Part");
				v.Shape = Enum.PartType.Ball;
				v.Material = Enum.Material.Neon;
				v.Color = p;
				v.Size = Vector3.new(.015, .015, .015);
				v.Position = E;
				v.Anchored = true;
				v.CanCollide = false;
				v.CanQuery = false;
				v.CanTouch = false;
				v.CastShadow = false;
				v.Massless = true;
				v.Transparency = 1;
				v.Parent = M;
				m.balls[#m.balls + 1] = v;
				d = d + 1;
				local R = math.clamp(((E.Y - C)) / a, 0, 1);
				local P = math.clamp(math.floor(R * ((F - 1)) + 1.5) + l(-1, 1), 1, F);
				c[P][#c[P] + 1] = { ball = v, size = g };
			end;
			if d >= 140 then
				break;
			end;
		end;
		local P = math.min(.34, k * .26);
		local I = math.min(.2, k * .18);
		local D = math.max((P + I) + .06, k * .42);
		local J = math.min(.28, k * .18);
		local K = math.max((k - D) - J, .1);
		for x = 1, F, 1 do
			local p = ((x - 1)) / ((F - 1));
			local k = c[x];
			task.delay(P * p, function()
				if not M.Parent then
					return;
				end;
				for x, p in ipairs(k) do
					if p.ball.Parent then
						(ko:Create(p.ball, TweenInfo.new(I, Enum.EasingStyle.Sine), { Size = p.size, Transparency = .05 })):Play();
					end;
				end;
			end);
			task.delay(D + J * p, function()
				if not M.Parent then
					return;
				end;
				for x, p in ipairs(k) do
					if p.ball.Parent then
						(ko:Create(p.ball, TweenInfo.new(K, Enum.EasingStyle.Sine), { Size = p.size * .58, Transparency = 1 })):Play();
					end;
				end;
			end);
		end;
		task.delay(k + .12, function()
			R(m);
		end);
	end;
	local function d(x)
		local p, k = pcall(function()
				return x:Clone();
			end);
		if not p or not k then
			return;
		end;
		for x, p in ipairs(k:GetDescendants()) do
			if p:IsA("BasePart") then
				p.Anchored = true;
				p.CanCollide = false;
				p.CanQuery = false;
				p.CanTouch = false;
				if p.Name == "HumanoidRootPart" then
					p.Transparency = 1;
				else
					p.Material = Enum.Material.ForceField;
					p.Color = M;
				end;
			elseif p:IsA("Humanoid") or p:IsA("Script") or p:IsA("LocalScript") or p:IsA("ModuleScript") or p:IsA("Sound") or p:IsA("SurfaceAppearance") or p:IsA("ParticleEmitter") or p:IsA("Trail") or p:IsA("Beam") or p:IsA("PointLight") or p:IsA("SpotLight") or p:IsA("SurfaceLight") or p:IsA("Highlight") then
				pcall(function()
					p:Destroy();
				end);
			end;
		end;
		k.Name = "FH_MurderClone";
		k.Parent = B;
		C[#C + 1] = k;
		task.delay(i, function()
			if not k.Parent then
				return;
			end;
			for x, p in ipairs(k:GetDescendants()) do
				if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
					(ko:Create(p, TweenInfo.new(1.5), { Transparency = 1 })):Play();
				end;
			end;
			task.delay(1.6, function()
				for x = #C, 1, -1 do
					if C[x] == k then
						table.remove(C, x);
					end;
				end;
				if k.Parent then
					k:Destroy();
				end;
			end);
		end);
	end;
	local function P(x)
		if k then
			d(x);
		end;
		if Y then
			a(x, m, 1.2, "particle");
		end;
		if g then
			a(x, l, N, "emitter");
		end;
	end;
	local function I(x)
		local function k(k)
			local Y = k:WaitForChild("Humanoid", 5);
			if not Y then
				return;
			end;
			E[#E + 1] = Y.Died:Connect(function()
					if p and F[x.Name] == "Murderer" then
						P(k);
					end;
				end);
		end;
		if x.Character then
			task.spawn(k, x.Character);
		end;
		E[#E + 1] = x.CharacterAdded:Connect(k);
	end;
	local function D()
		for x, p in ipairs(E) do
			pcall(function()
				p:Disconnect();
			end);
		end;
		E = {};
		for x = 1, #v, 1 do
			local p = v[x];
			if p then
				pcall(function()
					p.part:Destroy();
				end);
			end;
		end;
		v = {};
		if z then
			pcall(function()
				z:Disconnect();
			end);
			z = nil;
		end;
		for x, p in ipairs(C) do
			pcall(function()
				p:Destroy();
			end);
		end;
		C = {};
	end;
	(x:AddToggle("MEOn", { Title = "\208\146\208\186\208\187\209\142\209\135\208\184\209\130\209\140 \209\141\209\132\209\132\208\181\208\186\209\130", Default = false })):OnChanged(function(x)
		p = x;
		if x then
			c = task.spawn(function()
					while p do
						pcall(function()
							local x = s();
							if type(x) == "table" then
								local p = {};
								for x, k in pairs(x) do
									if type(k) == "table" and k.Role then
										p[x] = k.Role;
									end;
								end;
								F = p;
							end;
						end);
						task.wait(1);
					end;
				end);
			for x, p in ipairs(G:GetPlayers()) do
				if p ~= io then
					I(p);
				end;
			end;
			z = G.PlayerAdded:Connect(function(x)
					if x ~= io then
						I(x);
					end;
				end);
		else
			D();
			if c then
				pcall(function()
					task.cancel(c);
				end);
				c = nil;
			end;
		end;
	end);
	(x:AddToggle("MEClone", { Title = "\208\154\208\187\208\190\208\189", Default = false })):OnChanged(function(x)
		k = x;
	end);
	(x:AddColorPicker("MECloneCol", { Title = "\208\166\208\178\208\181\209\130 \208\186\208\187\208\190\208\189\208\176", Default = Color3.fromRGB(255, 0, 0) })):OnChanged(function(x)
		M = x;
	end);
	(x:AddSlider("MECloneDur", {
		Title = "\208\148\208\187\208\184\209\130\208\181\208\187\209\140\208\189\208\190\209\129\209\130\209\140 \208\186\208\187\208\190\208\189\208\176",
		Min = 1,
		Max = 5,
		Default = 3,
		Rounding = 1,
	})):OnChanged(function(x)
		i = tonumber(x) or 3;
	end);
	(x:AddToggle("MEPart", { Title = "\208\167\208\176\209\129\209\130\208\184\209\134\209\139", Default = false })):OnChanged(function(x)
		Y = x;
	end);
	(x:AddColorPicker("MEPartCol", { Title = "\208\166\208\178\208\181\209\130 \209\135\208\176\209\129\209\130\208\184\209\134", Default = Color3.fromRGB(255, 0, 0) })):OnChanged(function(x)
		m = x;
	end);
	(x:AddToggle("MEEmit", { Title = "Neverlose emitter", Default = false })):OnChanged(function(x)
		g = x;
	end);
	(x:AddColorPicker("MEEmitCol", { Title = "\208\166\208\178\208\181\209\130 emitter", Default = Color3.fromRGB(255, 100, 100) })):OnChanged(function(x)
		l = x;
		for p = 1, #v, 1 do
			local k = v[p];
			if k and k.channel == "emitter" then
				for p, k in ipairs(k.balls) do
					if k.Parent then
						k.Color = x;
					end;
				end;
			end;
		end;
	end);
	(x:AddSlider("MEEmitDur", {
		Title = "\208\148\208\187\208\184\209\130\208\181\208\187\209\140\208\189\208\190\209\129\209\130\209\140 emitter",
		Min = 1,
		Max = 5,
		Default = 1,
		Rounding = 1,
	})):OnChanged(function(x)
		N = tonumber(x) or 1;
	end);
	(getgenv()).MURDER_UNLOAD = function()
			p = false;
			D();
			if c then
				pcall(function()
					task.cancel(c);
				end);
				c = nil;
			end;
		end;
end;
do
	local x = Co.Farm;
	local p = x:AddSection({ Name = "\208\144\208\178\209\130\208\190\209\132\208\176\209\128\208\188 v3" });
	local k = false;
	local Y = "Basic";
	local g = 23;
	local M = false;
	local m = false;
	local l = {};
	local i = nil;
	local N, C = false, false;
	local E, F = false, nil;
	local c = 0;
	local z, v, R, a = 14, 4, 40, 20;
	local function d()
		local x = io.Character;
		return x and x:FindFirstChild("HumanoidRootPart");
	end;
	local function P()
		local x = io.Character;
		local p = x and x:FindFirstChildOfClass("Humanoid");
		if not p or p.Health <= 0 then
			return false;
		end;
		local k = s();
		if type(k) == "table" then
			local x = k[io.Name];
			if not x or not x.Role or x.Dead then
				return false;
			end;
		end;
		return true;
	end;
	local function I()
		local x = io:FindFirstChild("PlayerGui");
		local p = x and x:FindFirstChild("MainGUI");
		local k = p and p:FindFirstChild("Game");
		local Y = k and k:FindFirstChild("CoinBags");
		local g = Y and Y:FindFirstChild("Container");
		if not g then
			return false;
		end;
		local M = false;
		for x, p in ipairs(g:GetChildren()) do
			if p:IsA("Frame") and p.Visible then
				M = true;
				local x = p:FindFirstChild("Full");
				if not ((x and x.Visible)) then
					return false;
				end;
			end;
		end;
		return M;
	end;
	local function D()
		N = false;
		C = false;
		i = nil;
	end;
	task.spawn(function()
		local x, p = pcall(function()
				return ((po:WaitForChild("Remotes")):WaitForChild("Gameplay")):WaitForChild("CoinsStarted", 15);
			end);
		if x and p then
			p.OnClientEvent:Connect(D);
		end;
	end);
	io.CharacterAdded:Connect(D);
	local function J(x)
		return x and (x.Parent and (x:IsA("BasePart") and (not x:GetAttribute("Collected") and not x:GetAttribute("Delete"))));
	end;
	local function K()
		local x = {};
		for p, k in ipairs(xo:GetTagged("CoinVisual")) do
			if J(k) then
				x[#x + 1] = k;
			end;
		end;
		return x;
	end;
	local function X(x, p)
		local k, Y = nil, math.huge;
		for p, g in ipairs(p) do
			local M = ((g.Position - x)).Magnitude;
			if M < Y then
				Y = M;
				k = g;
			end;
		end;
		return k;
	end;
	local function b(x)
		local p = io.Character;
		local k = p and p:FindFirstChildOfClass("Humanoid");
		if x then
			if not p then
				return;
			end;
			if k then
				pcall(function()
					k.PlatformStand = true;
				end);
			end;
			for x, p in ipairs(p:GetDescendants()) do
				if p:IsA("BasePart") and p.CanCollide then
					if l[p] == nil then
						l[p] = p.CanCollide;
					end;
					p.CanCollide = false;
				end;
			end;
		else
			if k then
				pcall(function()
					k.PlatformStand = false;
				end);
			end;
			for x, p in pairs(l) do
				if x and x.Parent then
					pcall(function()
						x.CanCollide = p;
					end);
				end;
			end;
			l = {};
		end;
	end;
	local h, Q = nil, 0;
	local function f()
		local x = os.clock();
		if x - Q < .25 then
			return h;
		end;
		Q = x;
		h = nil;
		local p = s();
		if type(p) ~= "table" then
			return nil;
		end;
		for x, p in pairs(p) do
			if type(p) == "table" and (p.Role == "Murderer" and (not p.Dead and x ~= io.Name)) then
				local p = G:FindFirstChild(x);
				local k = p and p.Character;
				local Y = k and k:FindFirstChild("HumanoidRootPart");
				local g = k and k:FindFirstChildOfClass("Humanoid");
				if Y and ((not g or g.Health > 0)) then
					h = Y;
				end;
				break;
			end;
		end;
		return h;
	end;
	local function H(x, p)
		return (Vector3.new(x.X - p.X, 0, x.Z - p.Z)).Magnitude;
	end;
	local function w(x)
		if type(firetouchinterest) ~= "function" then
			return;
		end;
		if not x or not x.Parent then
			return;
		end;
		local p = os.clock();
		if p - c < .05 then
			return;
		end;
		c = p;
		local k = d();
		if not k then
			return;
		end;
		local Y = { x };
		for x, p in ipairs(x:GetChildren()) do
			if p:IsA("BasePart") then
				Y[#Y + 1] = p;
			end;
		end;
		for x, p in ipairs(Y) do
			pcall(firetouchinterest, k, p, 0);
			pcall(firetouchinterest, k, p, 1);
		end;
	end;
	local function U(x, p, k)
		if not ((M and k)) then
			return X(x, p);
		end;
		local Y, g = nil, math.huge;
		local m, l = nil, -1;
		for p, M in ipairs(p) do
			local i = H(M.Position, k);
			if i > l then
				l = i;
				m = M;
			end;
			if i >= R then
				local p = ((M.Position - x)).Magnitude;
				if p < g then
					g = p;
					Y = M;
				end;
			end;
		end;
		return Y or (l >= R * .6 and m or nil);
	end;
	local function n(x, p)
		if not J(x) then
			return false;
		end;
		if M and (p and H(x.Position, p) < R * .6) then
			return false;
		end;
		return true;
	end;
	local function q(x, p, k)
		if not ((M and k)) then
			return p;
		end;
		local Y = H(x, k);
		if Y >= R then
			return p;
		end;
		local g = Vector3.new(x.X - k.X, 0, x.Z - k.Z);
		if g.Magnitude < .1 then
			g = Vector3.new(1, 0, 0);
		end;
		g = g.Unit;
		local m = Vector3.new(p.X - x.X, 0, p.Z - x.Z);
		local l = m.Magnitude;
		if l < .1 then
			return p;
		end;
		local i = 1 + ((1 - Y / R)) * 2;
		local N = (m.Unit + g * i);
		if N.Magnitude < .1 then
			N = g;
		else
			N = N.Unit;
		end;
		local C = x + N * l;
		return Vector3.new(C.X, p.Y, C.Z);
	end;
	local function Z(x, p, k)
		local M = p - x.Position;
		local m = M.Magnitude;
		local l = p;
		if m > .1 then
			l = x.Position + M.Unit * math.min(g * k, m);
		end;
		local i = CFrame.new(l);
		if Y == "Down" then
			i = i * CFrame.Angles(-math.pi * .5, 0, 0);
			E = true;
		end;
		pcall(function()
			x.CFrame = i;
			x.AssemblyLinearVelocity = Vector3.zero;
			x.AssemblyAngularVelocity = Vector3.zero;
		end);
	end;
	local W = RaycastParams.new();
	W.FilterType = Enum.RaycastFilterType.Exclude;
	W.IgnoreWater = true;
	local function A()
		local x = d();
		if not x then
			return;
		end;
		local p = x.Position;
		W.FilterDescendantsInstances = { io.Character };
		local k = B:Raycast(p, Vector3.new(0, 400, 0), W);
		local Y = k and (k.Position.Y + 5) or (F and F + 5 or nil);
		if not Y then
			return;
		end;
		pcall(function()
			x.CFrame = CFrame.new(p.X, Y, p.Z);
			x.AssemblyLinearVelocity = Vector3.zero;
			x.AssemblyAngularVelocity = Vector3.zero;
		end);
	end;
	local function L()
		if E then
			E = false;
			A();
		end;
		b(false);
	end;
	o.Stepped:Connect(function(x, p)
		if not k then
			return;
		end;
		if not P() then
			i = nil;
			E = false;
			b(false);
			return;
		end;
		local g = d();
		if not g then
			return;
		end;
		local l = K();
		local function c()
			i = nil;
			L();
			if not N then
				N = true;
				if m then
					local x = io.Character and io.Character:FindFirstChildOfClass("Humanoid");
					if x then
						pcall(function()
							x.Health = 0;
						end);
					end;
				end;
			end;
		end;
		if C and I() then
			c();
			return;
		end;
		if #l > 0 then
			C = true;
			if N then
				N = false;
			end;
			local x = M and f() or nil;
			local k = x and x.Position or nil;
			if not n(i, k) then
				i = U(g.Position, l, k);
			end;
			if i then
				b(true);
				local x = i.Position;
				F = x.Y;
				local M = x;
				if Y == "Down" then
					local p = H(g.Position, x);
					local Y = (not k) or H(g.Position, k) > a;
					if p <= v and Y then
						M = x;
						w(i);
					else
						M = Vector3.new(x.X, x.Y - z, x.Z);
					end;
				elseif ((x - g.Position)).Magnitude <= 6 then
					w(i);
				end;
				M = q(g.Position, M, k);
				Z(g, M, p);
			elseif k then
				b(true);
				local x = Vector3.new(g.Position.X - k.X, 0, g.Position.Z - k.Z);
				if x.Magnitude < .1 then
					x = Vector3.new(1, 0, 0);
				end;
				x = x.Unit;
				local M = g.Position.Y;
				if Y == "Down" and F then
					M = F - z;
				end;
				Z(g, (g.Position + x * 40) + Vector3.new(0, M - g.Position.Y, 0), p);
			end;
		else
			i = nil;
			L();
			if C and not N then
				c();
			end;
		end;
	end);
	(p:AddToggle("FarmV3On", { Title = "\208\146\208\186\208\187\209\142\209\135\208\184\209\130\209\140 \208\176\208\178\209\130\208\190\209\132\208\176\209\128\208\188 v3", Default = false })):OnChanged(function(x)
		k = x;
		if x and (y.FarmOn and y.FarmOn.Value) then
			pcall(function()
				y.FarmOn:SetValue(false);
			end);
		end;
		D();
		if not x then
			L();
		end;
	end);
	(p:AddDropdown("FarmV3Mode", { Title = "\208\162\208\184\208\191", Values = { "Basic", "Down" }, Default = "Basic" })):OnChanged(function(x)
		Y = x or "Basic";
		i = nil;
		if Y == "Basic" and E then
			E = false;
			A();
		end;
	end);
	(p:AddSlider("FarmV3Speed", {
		Title = "\208\161\208\186\208\190\209\128\208\190\209\129\209\130\209\140",
		Min = 5,
		Max = 60,
		Default = 23,
		Rounding = 1,
	})):OnChanged(function(x)
		g = tonumber(x) or 23;
	end);
	(p:AddToggle("FarmV3Avoid", { Title = "\208\152\208\183\208\177\208\181\208\179\208\176\209\130\209\140 \208\188\208\176\208\189\209\140\209\143\208\186\208\176", Default = false })):OnChanged(function(x)
		M = x;
		i = nil;
	end);
	(p:AddToggle("FarmV3Reset", { Title = "\208\144\208\178\209\130\208\190-\209\128\208\181\209\129\208\181\209\130 \208\191\209\128\208\184 \208\191\208\190\208\187\208\189\209\139\209\133 \208\188\208\181\209\136\208\186\208\176\209\133", Default = false })):OnChanged(function(x)
		m = x;
	end);
	(getgenv()).FARMV3_UNLOAD = function()
			k = false;
			i = nil;
			L();
		end;
end;
do
	local x = Co.Animations;
	local p = {
			{ "Salute", "12888162088" },
			{ "Applaud", "12888160997" },
			{ "Tilt", "12888159317" },
			{ "Griddy", "129149402922241" },
			{ "Floss", "129149402922241" },
			{ "Dab", "11953266178" },
			{ "Default Dance", "10272060486" },
			{ "Kazotsky Kick", "11397105951" },
			{ "Robot", "11953266178" },
			{ "Orange Justice", "11970665200" },
			{ "Take the L", "12327207789" },
		};
	local k, Y = {}, {};
	for x, p in ipairs(p) do
		if not k[p[1]] then
			k[p[1]] = p[2];
			Y[#Y + 1] = p[1];
		end;
	end;
	local g, M = nil, nil;
	local m = false;
	local l = {};
	local function i()
		local x = io.Character;
		return x and x:FindFirstChildOfClass("Humanoid");
	end;
	local function N()
		if g then
			pcall(function()
				g:Stop();
			end);
			g = nil;
		end;
	end;
	local function C(x)
		if l[x] then
			return l[x];
		end;
		if x:find("://") then
			l[x] = x;
			return x;
		end;
		local p = x:gsub("%D", "");
		local k, Y = pcall(game.GetObjects, game, "rbxassetid://" .. p);
		if k and type(Y) == "table" then
			local p;
			local function k(x)
				if p then
					return;
				end;
				if x:IsA("Animation") and x.AnimationId ~= "" then
					p = x.AnimationId;
					return;
				end;
				for x, p in ipairs(x:GetChildren()) do
					k(p);
				end;
			end;
			for x, p in ipairs(Y) do
				k(p);
				pcall(function()
					p:Destroy();
				end);
			end;
			if p then
				l[x] = p;
				return p;
			end;
		end;
		local g = "rbxassetid://" .. p;
		l[x] = g;
		return g;
	end;
	local function E(x)
		local p = i();
		if not p or not x then
			return;
		end;
		N();
		local k = Instance.new("Animation");
		k.AnimationId = C(x);
		local Y, M = pcall(function()
				return p:LoadAnimation(k);
			end);
		k:Destroy();
		if Y and M then
			M.Priority = Enum.AnimationPriority.Action;
			M.Looped = true;
			M:Play();
			g = M;
		else
			V("FH", "\208\157\208\181 \209\131\208\180\208\176\208\187\208\190\209\129\209\140 \208\183\208\176\208\191\209\131\209\129\209\130\208\184\209\130\209\140 \209\141\208\188\208\190\209\134\208\184\209\142", 2);
		end;
	end;
	local F = x:AddSection({ Name = "\208\173\208\188\208\190\209\134\208\184\208\184" });
	local c = (F:AddDropdown("EmoteList", { Title = "\208\146\209\139\208\177\209\128\208\176\209\130\209\140 \209\141\208\188\208\190\209\134\208\184\209\142", Values = Y, Default = Y[1] })):OnChanged(function(x)
			M = k[x];
		end);
	F:AddButton({ Title = "\208\144\208\186\209\130\208\184\208\178\208\184\209\128\208\190\208\178\208\176\209\130\209\140 \209\141\208\188\208\190\209\134\208\184\209\142", Callback = function()
			if M then
				E(M);
				V("FH", "\208\173\208\188\208\190\209\134\208\184\209\143 \208\183\208\176\208\191\209\131\209\137\208\181\208\189\208\176", 2);
			else
				V("FH", "\208\146\209\139\208\177\208\181\209\128\208\184 \209\141\208\188\208\190\209\134\208\184\209\142", 2);
			end;
		end });
	F:AddButton({ Title = "\208\158\209\129\209\130\208\176\208\189\208\190\208\178\208\184\209\130\209\140 \209\141\208\188\208\190\209\134\208\184\209\142", Callback = function()
			N();
			V("FH", "\208\173\208\188\208\190\209\134\208\184\209\143 \208\190\209\129\209\130\208\176\208\189\208\190\208\178\208\187\208\181\208\189\208\176", 2);
		end });
	(F:AddToggle("EmoteAuto", { Title = "\208\144\208\178\209\130\208\190-\208\184\209\129\208\191\208\190\208\187\209\140\208\183\208\190\208\178\208\176\208\189\208\184\208\181 \208\191\208\190\209\129\208\187\208\181 \209\128\208\181\209\129\208\191\208\176\208\178\208\189\208\176", Default = false })):OnChanged(function(x)
		m = x;
		if x and M then
			task.wait(1);
			E(M);
		end;
	end);
	io.CharacterAdded:Connect(function()
		task.wait(1.5);
		if m and M then
			E(M);
		end;
	end);
	task.spawn(function()
		local x, p = pcall(function()
				local x = game:HttpGet("https://raw.githubusercontent.com/7yd7/sniper-Emote/refs/heads/test/EmoteSniper.json");
				return x ~= "" and mo:JSONDecode(x) or nil;
			end);
		if x and type(p) == "table" then
			local x = p.data or p;
			local g = {};
			for x, p in pairs(x) do
				if #Y >= 200 then
					break;
				end;
				local M = tonumber(p.id);
				if M and (M > 0 and not g[M]) then
					g[M] = true;
					local x = tostring(p.name or ("Emote_" .. M));
					if not k[x] then
						k[x] = tostring(M);
						Y[#Y + 1] = x;
					end;
				end;
			end;
			pcall(function()
				c:SetValues(Y);
				c:Generate();
			end);
		end;
	end);
	local z = x:AddSection({ Name = "\208\144\208\189\208\184\208\188\208\176\209\134\208\184\208\184" });
	local v = {
			{ "Ninja", 656118852 },
			{ "Zombie", 616006778 },
			{ "Levitate", 616008936 },
			{ "Astronaut", 891603798 },
			{ "Cartwheel", 129423030 },
			{ "T-pose", 4680610777 },
			{ "Sneaky", 4830543155 },
			{ "Old School", 3333499706 },
			{ "Kick", 5435202357 },
			{ "Dance", 1824359985 },
			{ "Griddy", 1.2914940292224e+14 },
			{ "Salute", 12888162088 },
			{ "Applaud", 12888160997 },
			{ "Tilt", 12888159317 },
		};
	local R, a = {}, {};
	for x, p in ipairs(v) do
		R[p[1]] = p[2];
		a[#a + 1] = p[1];
	end;
	local d, P = nil, nil;
	local function I()
		if d then
			pcall(function()
				d:Stop();
			end);
			d = nil;
		end;
	end;
	local function D(x)
		local p = R[x];
		if not p then
			V("FH", "\208\144\208\189\208\184\208\188\208\176\209\134\208\184\209\143 \208\189\208\181 \208\189\208\176\208\185\208\180\208\181\208\189\208\176", 2);
			return;
		end;
		local k = io.Character;
		local Y = k and k:FindFirstChildOfClass("Humanoid");
		if not Y then
			V("FH", "\208\159\208\181\209\128\209\129\208\190\208\189\208\176\208\182 \208\189\208\181 \208\183\208\176\208\179\209\128\209\131\208\182\208\181\208\189", 2);
			return;
		end;
		I();
		local g = Instance.new("Animation");
		g.AnimationId = "rbxassetid://" .. tostring(p);
		local M, m = pcall(function()
				return Y:LoadAnimation(g);
			end);
		g:Destroy();
		if M and m then
			m.Priority = Enum.AnimationPriority.Action;
			m.Looped = true;
			pcall(function()
				m:Play();
			end);
			d = m;
			P = x;
			V("FH", "\208\152\208\179\209\128\208\176\209\142: " .. x, 2);
		else
			V("FH", "\208\157\208\181 \209\131\208\180\208\176\208\187\208\190\209\129\209\140 \208\183\208\176\208\191\209\131\209\129\209\130\208\184\209\130\209\140: " .. x, 2);
		end;
	end;
	local J = z:AddDropdown("AnimPick", { Title = "\208\146\209\139\208\177\209\128\208\176\209\130\209\140 \208\176\208\189\208\184\208\188\208\176\209\134\208\184\209\142", Values = a, Default = "Ninja" });
	z:AddButton({ Title = "? \208\151\208\176\208\191\209\131\209\129\209\130\208\184\209\130\209\140", Callback = function()
			local x = J and J.Value;
			if type(x) == "table" then
				x = x[1];
			end;
			if type(x) == "string" and x ~= "" then
				D(x);
			end;
		end });
	z:AddButton({ Title = "\194\166 \208\158\209\129\209\130\208\176\208\189\208\190\208\178\208\184\209\130\209\140", Callback = function()
			I();
			V("FH", "\208\158\209\129\209\130\208\176\208\189\208\190\208\178\208\187\208\181\208\189\208\190", 2);
		end });
	z:AddToggle("AnimAuto", { Title = "\208\144\208\178\209\130\208\190-\208\178\208\190\209\129\208\191\209\128\208\190\208\184\208\183\208\178\208\181\208\180\208\181\208\189\208\184\208\181 \208\191\208\190\209\129\208\187\208\181 \209\128\208\181\209\129\208\191\208\176\208\178\208\189\208\176", Default = false });
	io.CharacterAdded:Connect(function()
		task.wait(1.5);
		if y.AnimAuto and (y.AnimAuto.Value and P) then
			D(P);
		end;
	end);
	(getgenv()).ANIM_UNLOAD = function()
			N();
			I();
		end;
end;
do
	local x = Co.Utility;
	local p = x:AddSection({ Name = "\208\163\208\178\208\181\208\180\208\190\208\188\208\187\208\181\208\189\208\184\209\143" });
	local k, Y = false, false;
	local g = nil;
	task.spawn(function()
		while task.wait(.5) do
			if k and Y then
				local x = s();
				local p = x and (x[io.Name] and x[io.Name].Role);
				if p and p ~= g then
					g = p;
					local x = (p == "Sheriff" and "\208\168\208\181\209\128\208\184\209\132") or (p == "Hero" and "\208\147\208\181\209\128\208\190\208\185") or (p == "Murderer" and "\208\156\208\176\208\189\209\140\209\143\208\186") or (p == "Innocent" and "\208\156\208\184\209\128\208\189\209\139\208\185") or p;
					V("FH", "\208\160\208\190\208\187\209\140: " .. x, 4);
				elseif not p then
					g = nil;
				end;
			end;
		end;
	end);
	(p:AddToggle("NotifyOn", { Title = "\208\146\208\186\208\187\209\142\209\135\208\184\209\130\209\140", Default = false })):OnChanged(function(x)
		k = x;
	end);
	(p:AddToggle("NotifyRoles", { Title = "\208\159\208\190\208\186\208\176\208\183\209\139\208\178\208\176\209\130\209\140 \209\128\208\190\208\187\209\140", Default = false })):OnChanged(function(x)
		Y = x;
	end);
	local M = x:AddSection({ Name = "\208\157\208\181\208\178\208\184\208\180\208\184\208\188\208\190\209\129\209\130\209\140" });
	local m = {
			active = false,
			realCF = nil,
			hbConn = nil,
			bindName = "FH_InvisClient",
			savedLTM = {},
			savedDecals = {},
			savedFallenHeight = nil,
		};
	local l = CFrame.new(0, -50000, 0);
	(getgenv()).FH_INVIS_ACTIVE = false;
	local function i()
		local x = io.Character;
		if x then
			for x, p in pairs(m.savedLTM) do
				if x and x.Parent then
					pcall(function()
						x.LocalTransparencyModifier = p;
					end);
				end;
			end;
			for x, p in pairs(m.savedDecals) do
				if x and x.Parent then
					pcall(function()
						x.Transparency = p;
					end);
				end;
			end;
		end;
		m.savedLTM = {};
		m.savedDecals = {};
	end;
	local function N()
		if m.active then
			return;
		end;
		local x = io.Character;
		if not x then
			V("FH", "\208\159\208\181\209\128\209\129\208\190\208\189\208\176\208\182 \208\189\208\181 \208\183\208\176\208\179\209\128\209\131\208\182\208\181\208\189", 2);
			return;
		end;
		local p = x:FindFirstChild("HumanoidRootPart");
		local k = x:FindFirstChildOfClass("Humanoid");
		if not p or not k then
			V("FH", "\208\159\208\181\209\128\209\129\208\190\208\189\208\176\208\182 \208\189\208\181 \208\183\208\176\208\179\209\128\209\131\208\182\208\181\208\189", 2);
			return;
		end;
		m.savedLTM = {};
		m.savedDecals = {};
		m.realCF = p.CFrame;
		m.active = true;
		(getgenv()).FH_INVIS_ACTIVE = true;
		m.savedFallenHeight = B.FallenPartsDestroyHeight;
		pcall(function()
			B.FallenPartsDestroyHeight = -9000000000;
		end);
		for x, p in ipairs(x:GetDescendants()) do
			if p:IsA("BasePart") then
				m.savedLTM[p] = p.LocalTransparencyModifier;
				p.LocalTransparencyModifier = .5;
			elseif p:IsA("Decal") or p:IsA("Texture") then
				m.savedDecals[p] = p.Transparency;
				p.Transparency = .5;
			end;
		end;
		m.hbConn = o.Heartbeat:Connect(function()
				if not m.active then
					return;
				end;
				local x = io.Character;
				local p = x and x:FindFirstChild("HumanoidRootPart");
				if not p then
					return;
				end;
				m.realCF = p.CFrame;
				p.CFrame = l;
			end);
		o:BindToRenderStep(m.bindName, Enum.RenderPriority.Camera.Value - 1, function()
			if not m.active then
				return;
			end;
			local x = io.Character;
			local p = x and x:FindFirstChild("HumanoidRootPart");
			if p and m.realCF then
				p.CFrame = m.realCF;
			end;
		end);
		(getgenv()).FH_INVIS_ACTIVE = true;
		V("FH", "\208\157\208\181\208\178\208\184\208\180\208\184\208\188\208\190\209\129\209\130\209\140 \208\146\208\154\208\155 (\208\176\208\178\209\130\208\190-\208\191\208\190\208\180\208\177\208\190\209\128 \208\183\208\176\208\177\208\187\208\190\208\186\208\184\209\128\208\190\208\178\208\176\208\189)", 2);
	end;
	local function C()
		if not m.active then
			return;
		end;
		local x = io.Character;
		local p = x and x:FindFirstChild("HumanoidRootPart");
		local k = m.realCF;
		m.active = false;
		(getgenv()).FH_INVIS_ACTIVE = false;
		if m.hbConn then
			pcall(function()
				m.hbConn:Disconnect();
			end);
			m.hbConn = nil;
		end;
		pcall(function()
			o:UnbindFromRenderStep(m.bindName);
		end);
		if p and k then
			pcall(function()
				p.CFrame = k;
				p.AssemblyLinearVelocity = Vector3.zero;
				p.AssemblyAngularVelocity = Vector3.zero;
			end);
		end;
		i();
		if m.savedFallenHeight ~= nil then
			pcall(function()
				B.FallenPartsDestroyHeight = m.savedFallenHeight;
			end);
			m.savedFallenHeight = nil;
		end;
		m.realCF = nil;
		(getgenv()).FH_INVIS_ACTIVE = false;
		V("FH", "\208\157\208\181\208\178\208\184\208\180\208\184\208\188\208\190\209\129\209\130\209\140 \208\146\208\171\208\154\208\155 (\208\176\208\178\209\130\208\190-\208\191\208\190\208\180\208\177\208\190\209\128 \209\128\208\176\208\183\208\177\208\187\208\190\208\186\208\184\209\128\208\190\208\178\208\176\208\189)", 2);
	end;
	(M:AddToggle("InvisOn", { Title = "\208\146\208\186\208\187\209\142\209\135\208\184\209\130\209\140 \208\189\208\181\208\178\208\184\208\180\208\184\208\188\208\190\209\129\209\130\209\140", Default = false })):OnChanged(function(x)
		if x then
			N();
		else
			C();
		end;
	end);
	(getgenv()).INVIS_UNLOAD = function()
			if m.active then
				C();
			end;
		end;
	local E = x:AddSection({ Name = "\208\151\208\178\209\131\208\186\208\184 \209\131\208\177\208\184\208\185\209\129\209\130\208\178\208\176" });
	local F = "https://github.com/khenn791/lmao/raw/refs/heads/main/";
	local c = "shitaro_sounds/";
	local z = {
			"primordial",
			"neverlose",
			"sparkle",
			"mc bow",
			"skeet",
			"break",
			"rust",
			"applepay",
			"bubble",
			"combobreak",
			"killcard",
			"xp",
			"na naxuy",
			"stony",
			"hentai",
		};
	local v = { sheriff = { on = false, name = "mc bow", volume = 1 }, murder = { on = false, name = "skeet", volume = 1 } };
	local R, a = {}, { sheriff = 0, murder = 0 };
	local function d()
		return type(isfile) == "function" and (type(readfile) == "function" and (type(writefile) == "function" and type(getcustomasset) == "function"));
	end;
	local function P(x)
		local p, k = pcall(isfile, x);
		if not ((p and k)) then
			return nil;
		end;
		local Y, g = pcall(readfile, x);
		if not ((Y and (type(g) == "string" and #g > 0))) then
			return nil;
		end;
		local M = string.match(x, "(%.[^%./\\]+)$") or ".ogg";
		local m = "fh_snd_" .. (tostring(math.random(100000, 999999)) .. M);
		if not pcall(writefile, m, g) then
			return nil;
		end;
		local l, i = pcall(getcustomasset, m);
		if not ((l and (type(i) == "string" and i ~= ""))) then
			return nil;
		end;
		return i;
	end;
	local function I(x)
		local p = {
				"shitaroebet/",
				"assets/",
				"",
				c,
			};
		local k = {
				".ogg",
				".mp3",
				".wav",
				"",
			};
		for p, Y in ipairs(p) do
			for p, k in ipairs(k) do
				local g = P(Y .. (x .. k));
				if g then
					return g;
				end;
			end;
		end;
		if d() and type(makefolder) == "function" then
			if not isfolder(c) then
				pcall(makefolder, c);
			end;
			local p = c .. (x .. ".ogg");
			if not isfile(p) then
				local k = F .. ((x:gsub(" ", "%%20")) .. ".ogg");
				local Y, g = pcall(function()
						return game:HttpGet(k);
					end);
				if Y and (type(g) == "string" and #g > 1024) then
					pcall(writefile, p, g);
				end;
			end;
			if isfile(p) then
				local x, k = pcall(getcustomasset, p);
				if x and k then
					return k;
				end;
			end;
		end;
		return nil;
	end;
	local function D(x, p)
		local k = I(x);
		if not k then
			V("FH", "\208\157\208\181 \208\189\208\176\209\136\209\145\208\187: " .. x, 3);
			return;
		end;
		local Y = Instance.new("Sound");
		Y.SoundId = k;
		Y.Volume = p or 1;
		Y.Parent = Yo;
		Y:Play();
		task.delay(8, function()
			pcall(function()
				Y:Destroy();
			end);
		end);
	end;
	local function J(x, p)
		if R[x] then
			return;
		end;
		R[x] = { kind = p, vol = x.Volume };
		local function k()
			if not v[p].on then
				return;
			end;
			if os.clock() - a[p] < .15 then
				return;
			end;
			a[p] = os.clock();
			pcall(function()
				x:Stop();
			end);
			D(v[p].name, v[p].volume);
		end;
		x.Played:Connect(k);
	end;
	task.spawn(function()
		while task.wait(.5) do
			if v.sheriff.on or v.murder.on then
				for x, p in ipairs({ io.Character, io:FindFirstChildOfClass("Backpack") }) do
					if p then
						for x, p in ipairs(p:GetChildren()) do
							if p:IsA("Tool") then
								local x = p.Name == "Gun" and "sheriff" or p.Name == "Knife" and "murder" or nil;
								local k = p:FindFirstChild("Handle");
								if x and k then
									for p, k in ipairs(k:GetChildren()) do
										if k:IsA("Sound") and ((k.Name == "GunKill" or k.Name == "Kill")) then
											J(k, x);
										end;
									end;
								end;
							end;
						end;
					end;
				end;
			end;
		end;
	end);
	(E:AddToggle("SndSheriff", { Title = "\208\151\208\178\209\131\208\186 \209\131\208\177\208\184\208\185\209\129\209\130\208\178\208\176 \208\168\208\181\209\128\208\184\209\132\208\176", Default = false })):OnChanged(function(x)
		v.sheriff.on = x;
	end);
	(E:AddDropdown("SndSheriffName", { Title = "\208\151\208\178\209\131\208\186", Values = z, Default = "mc bow" })):OnChanged(function(x)
		v.sheriff.name = x;
	end);
	(E:AddSlider("SndSheriffVol", {
		Title = "\208\147\209\128\208\190\208\188\208\186\208\190\209\129\209\130\209\140",
		Min = .1,
		Max = 5,
		Default = 1,
		Rounding = 1,
	})):OnChanged(function(x)
		v.sheriff.volume = tonumber(x) or 1;
	end);
	E:AddButton({ Title = "? \208\159\209\128\208\190\209\129\208\187\209\131\209\136\208\176\209\130\209\140 \209\136\208\181\209\128\208\184\209\132", Callback = function()
			D(v.sheriff.name, v.sheriff.volume);
		end });
	(E:AddToggle("SndMurder", { Title = "\208\151\208\178\209\131\208\186 \209\131\208\177\208\184\208\185\209\129\209\130\208\178\208\176 \208\156\208\176\208\189\209\140\209\143\208\186\208\176", Default = false })):OnChanged(function(x)
		v.murder.on = x;
	end);
	(E:AddDropdown("SndMurderName", { Title = "\208\151\208\178\209\131\208\186", Values = z, Default = "skeet" })):OnChanged(function(x)
		v.murder.name = x;
	end);
	(E:AddSlider("SndMurderVol", {
		Title = "\208\147\209\128\208\190\208\188\208\186\208\190\209\129\209\130\209\140",
		Min = .1,
		Max = 5,
		Default = 1,
		Rounding = 1,
	})):OnChanged(function(x)
		v.murder.volume = tonumber(x) or 1;
	end);
	E:AddButton({ Title = "? \208\159\209\128\208\190\209\129\208\187\209\131\209\136\208\176\209\130\209\140 \208\188\208\176\208\189\209\140\209\143\208\186", Callback = function()
			D(v.murder.name, v.murder.volume);
		end });
	local K = x:AddSection({ Name = "\208\147\208\190\208\187\208\190\209\129\208\190\208\178\208\176\208\189\208\184\208\181 \208\183\208\176 \208\186\208\176\209\128\209\130\209\131" });
	local X = {};
	local b = 3;
	local function h()
		for x, p in ipairs({ "SummerLobby", "Lobby", "RegularLobby" }) do
			local k = B:FindFirstChild(p);
			local Y = k and k:FindFirstChild("VotePads");
			if Y then
				return Y;
			end;
		end;
		return nil;
	end;
	local function Q()
		local x, p = {}, h();
		if not p then
			return x;
		end;
		for p, k in ipairs(p:GetChildren()) do
			local Y = k:FindFirstChild("Pad");
			local g = k:FindFirstChild("MapInfoGui");
			local M = k:FindFirstChild("VoteInfoGui");
			local m = g and g:FindFirstChild("MapIcon");
			local l = M and M:FindFirstChild("Container");
			local i = l and l:FindFirstChild("MapName");
			if Y and (g and (m and i)) then
				x[#x + 1] = {
						pad = Y,
						info = g,
						icon = m,
						title = i,
					};
			end;
		end;
		return x;
	end;
	local function f(x)
		local p = RaycastParams.new();
		p.FilterType = Enum.RaycastFilterType.Exclude;
		p.FilterDescendantsInstances = { io.Character };
		local k = B:Raycast(x.Position + Vector3.new(0, 8, 0), Vector3.new(0, -40, 0), p);
		local Y = k and (k.Position.Y + 3.2) or x.Position.Y;
		return Vector3.new(x.Position.X, Y, x.Position.Z);
	end;
	local function U()
		local x = io.Character;
		local p = x and x:FindFirstChildOfClass("Humanoid");
		if p then
			pcall(function()
				p.Health = 0;
			end);
			pcall(function()
				p:ChangeState(Enum.HumanoidStateType.Dead);
			end);
		end;
		if x then
			pcall(function()
				x:BreakJoints();
			end);
		end;
	end;
	local function n(x)
		task.spawn(function()
			local p = io.Character;
			if not p or not p:FindFirstChild("HumanoidRootPart") then
				V("FH", "\208\161\208\189\208\176\209\135\208\176\208\187\208\176 \208\183\208\176\209\129\208\191\208\176\208\178\208\189\208\184\209\129\209\140", 3);
				return;
			end;
			local k = Q();
			if #k == 0 then
				V("FH", "\208\147\208\190\208\187\208\190\209\129\208\190\208\178\208\176\208\187\208\186\208\176 \208\189\208\181 \208\190\209\130\208\186\209\128\209\139\209\130\208\176", 3);
				return;
			end;
			local Y = nil;
			for x, p in ipairs(k) do
				if p.info.Enabled and (p.title.Text ~= "" and p.title.Text ~= "MAP NAME") then
					Y = p;
					break;
				end;
			end;
			if not Y then
				V("FH", "\208\157\208\181\209\130 \208\176\208\186\209\130\208\184\208\178\208\189\209\139\209\133 \208\186\208\176\209\128\209\130", 3);
				return;
			end;
			local g = f(Y.pad);
			V("FH", "\208\156\209\131\208\187\209\140\209\130\208\184-\208\179\208\190\208\187\208\190\209\129 \208\183\208\176 \194\171" .. (Y.title.Text .. ("\194\187 x" .. x)), 3);
			for p = 1, x, 1 do
				local k = io.Character;
				local Y = k and k:FindFirstChildOfClass("Humanoid");
				local M = k and k:FindFirstChild("HumanoidRootPart");
				if not ((Y and M)) then
					k = io.CharacterAdded:Wait();
					Y = k:WaitForChild("Humanoid", 5);
					M = k:WaitForChild("HumanoidRootPart", 5);
				end;
				if M and Y then
					pcall(function()
						M.CFrame = CFrame.new(g);
						M.AssemblyLinearVelocity = Vector3.zero;
						M.AssemblyAngularVelocity = Vector3.zero;
					end);
					task.wait(.35);
				end;
				if p < x then
					U();
					pcall(function()
						io.CharacterAdded:Wait();
					end);
					task.wait(.1);
				end;
			end;
			V("FH", "\208\156\209\131\208\187\209\140\209\130\208\184-\208\179\208\190\208\187\208\190\209\129 \208\183\208\176\208\178\208\181\209\128\209\136\209\145\208\189", 3);
		end);
	end;
	(K:AddSlider("MVDupeCap", {
		Title = "\208\154\208\190\208\187-\208\178\208\190 \208\179\208\190\208\187\208\190\209\129\208\190\208\178",
		Min = 1,
		Max = 10,
		Default = 3,
		Rounding = 0,
	})):OnChanged(function(x)
		b = tonumber(x) or 3;
	end);
	K:AddButton({ Title = "\208\148\209\142\208\191\208\189\209\131\209\130\209\140 \208\179\208\190\208\187\208\190\209\129", Callback = function()
			n(math.clamp(math.floor(b), 1, 10));
		end });
	local q = x:AddSection({ Name = "\208\144\208\189\209\130\208\184" });
	local Z = false;
	local W, A = {}, {};
	local function y(x)
		if not Z or not x then
			return;
		end;
		if A[x] or x == io.Character then
			return;
		end;
		A[x] = {};
		for p, k in ipairs(x:GetDescendants()) do
			if k:IsA("BasePart") then
				if W[k] == nil then
					W[k] = k.CanCollide;
				end;
				A[x][k] = true;
				pcall(function()
					k.CanCollide = false;
				end);
			end;
		end;
	end;
	local function L()
		for x, p in pairs(A) do
			for x in pairs(p) do
				if x.Parent and W[x] ~= nil then
					pcall(function()
						x.CanCollide = W[x];
					end);
				end;
			end;
		end;
		A, W = {}, {};
	end;
	o.Stepped:Connect(function()
		if not Z then
			return;
		end;
		for x, p in ipairs(G:GetPlayers()) do
			if p ~= io and p.Character then
				y(p.Character);
			end;
		end;
		local x = H();
		if x then
			local p = x.AssemblyLinearVelocity;
			if p.Magnitude > 250 then
				x.AssemblyLinearVelocity = Vector3.zero;
				x.AssemblyAngularVelocity = Vector3.zero;
			end;
		end;
	end);
	(q:AddToggle("AntiFling", { Title = "\208\144\208\189\209\130\208\184-\208\190\209\130\208\177\209\128\208\190\209\129", Default = false })):OnChanged(function(x)
		Z = x;
		if not x then
			L();
		end;
	end);
	local t = false;
	local O = B.FallenPartsDestroyHeight;
	o.Heartbeat:Connect(function()
		pcall(function()
			B.FallenPartsDestroyHeight = t and -9000000000 or O;
		end);
	end);
	(q:AddToggle("AntiVoid", { Title = "\208\144\208\189\209\130\208\184-\208\191\208\176\208\180\208\181\208\189\208\184\208\181", Default = false })):OnChanged(function(x)
		t = x;
	end);
	local r = false;
	local T, e = 16, 50;
	o.Heartbeat:Connect(function()
		if not r then
			return;
		end;
		local x = w();
		if not x then
			return;
		end;
		if x.WalkSpeed > 1 then
			T = x.WalkSpeed;
		end;
		if x.JumpPower > 1 then
			e = x.JumpPower;
		end;
		pcall(function()
			if x.WalkSpeed <= 1 then
				x.WalkSpeed = T;
			end;
			if x.JumpPower <= 1 then
				x.JumpPower = e;
			end;
		end);
		local p = io:FindFirstChild("PlayerGui");
		if p then
			for x, p in ipairs(p:GetChildren()) do
				if p.Name == "TrapGUI" then
					pcall(function()
						p:Destroy();
					end);
				end;
			end;
		end;
	end);
	(q:AddToggle("AntiTrap", { Title = "\208\144\208\189\209\130\208\184-\208\187\208\190\208\178\209\131\209\136\208\186\208\176", Default = false })):OnChanged(function(x)
		r = x;
	end);
	local j = false;
	local S, u = {}, {};
	local xo = {
			CameraFade = true,
			SpawnFade = true,
			Fade = true,
			DeathFade = true,
		};
	local function po(x)
		if not x or not x.Parent or not x:IsA("GuiObject") then
			return;
		end;
		if S[x] == nil then
			S[x] = x.Visible;
		end;
		if x.Visible then
			pcall(function()
				x.Visible = false;
			end);
		end;
		if not u[x] then
			u[x] = (x:GetPropertyChangedSignal("Visible")):Connect(function()
					if j and x.Visible then
						pcall(function()
							x.Visible = false;
						end);
					end;
				end);
		end;
	end;
	local function ko()
		local x = io:FindFirstChild("PlayerGui");
		if not x then
			return;
		end;
		for x, p in ipairs(x:GetChildren()) do
			if p:IsA("ScreenGui") and xo[p.Name] then
				for x, p in ipairs(p:GetChildren()) do
					if p:IsA("GuiObject") and ((p.Name == "Fade" or p.Name == "Frame")) then
						po(p);
					end;
				end;
			end;
		end;
		local p = x:FindFirstChild("MainGUI");
		local k = p and p:FindFirstChild("Game");
		local Y = k and k:FindFirstChild("Fade");
		if Y and Y:IsA("GuiObject") then
			po(Y);
		end;
	end;
	local function go()
		for x, p in pairs(u) do
			pcall(function()
				p:Disconnect();
			end);
		end;
		u = {};
		for x, p in pairs(S) do
			if x and x.Parent then
				pcall(function()
					x.Visible = p;
				end);
			end;
		end;
		S = {};
	end;
	(q:AddToggle("AntiFade", { Title = "\208\163\208\177\209\128\208\176\209\130\209\140 \209\135\209\145\209\128\208\189\209\139\208\185 \209\141\208\186\209\128\208\176\208\189", Default = false })):OnChanged(function(x)
		j = x;
		if x then
			ko();
		else
			go();
		end;
	end);
	(getgenv()).ANTI_UNLOAD = function()
			Z, t, r, j = false, false, false, false;
			L();
			go();
		end;
end;
do
	local x = Co.Troll;
	local p, k, Y = false, nil, nil;
	local function g()
		if not p then
			return;
		end;
		local x = io:FindFirstChildOfClass("Backpack");
		if not x then
			return;
		end;
		local g = x:FindFirstChild("tp");
		if not g and io.Character then
			g = io.Character:FindFirstChild("tp");
		end;
		if g then
			k = g;
			return;
		end;
		k = Instance.new("Tool");
		k.Name = "tp";
		k.RequiresHandle = false;
		k.CanBeDropped = false;
		k.Parent = x;
		Y = k.Activated:Connect(function()
				local x = H();
				local p = io:GetMouse();
				if not x or not p.Hit then
					return;
				end;
				x.CFrame = CFrame.new(p.Hit.X, p.Hit.Y + 3, p.Hit.Z);
			end);
	end;
	local function M()
		if Y then
			pcall(function()
				Y:Disconnect();
			end);
			Y = nil;
		end;
		if k then
			pcall(function()
				k:Destroy();
			end);
			k = nil;
		end;
		local x = io:FindFirstChildOfClass("Backpack");
		if x then
			local p = x:FindFirstChild("tp");
			if p then
				pcall(function()
					p:Destroy();
				end);
			end;
		end;
		local p = io.Character;
		if p then
			local x = p:FindFirstChild("tp");
			if x then
				pcall(function()
					x:Destroy();
				end);
			end;
		end;
	end;
	((x:AddSection({ Name = "\208\152\208\189\209\129\209\130\209\128\209\131\208\188\208\181\208\189\209\130\209\139" })):AddToggle("ToolTP", { Title = "\208\162\208\159-\209\130\209\131\208\187 (\208\191\208\190 \208\186\208\187\208\184\208\186\209\131)", Default = false })):OnChanged(function(x)
		p = x;
		if x then
			g();
		else
			M();
		end;
	end);
	io.CharacterAdded:Connect(function()
		task.wait(1);
		if p then
			g();
		end;
	end);
	local m, l, i = false, nil, nil;
	local function N()
		local x = io:GetMouse();
		local p = x.Target;
		if p then
			local x = p;
			while x and x ~= B do
				local p = G:GetPlayerFromCharacter(x);
				if p and p ~= io then
					return p;
				end;
				x = x.Parent;
			end;
		end;
		local k = B.CurrentCamera;
		local Y = Vector2.new(x.X, x.Y);
		local g, M = nil, 110;
		for x, p in ipairs(G:GetPlayers()) do
			if p ~= io and p.Character then
				local x = p.Character:FindFirstChild("HumanoidRootPart");
				if x then
					local m, l = k:WorldToViewportPoint(x.Position);
					if l then
						local x = ((Vector2.new(m.X, m.Y) - Y)).Magnitude;
						if x < M then
							M = x;
							g = p;
						end;
					end;
				end;
			end;
		end;
		return g;
	end;
	local function C(x)
		if not x or not x.Character then
			return;
		end;
		local p = H();
		if not p then
			return;
		end;
		local k = x.Character;
		local Y = k:FindFirstChild("HumanoidRootPart") or k:FindFirstChild("Head");
		if not Y then
			return;
		end;
		local g = p.CFrame;
		local M = B.CurrentCamera;
		M.CameraSubject = Y;
		local l = Instance.new("BodyVelocity");
		l.Parent = p;
		l.Velocity = Vector3.zero;
		l.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000);
		local i = tick();
		repeat
			if p and (p.Parent and (Y and Y.Parent)) then
				p.CFrame = CFrame.new(Y.Position) * CFrame.new(0, 1.5, 0);
				p.AssemblyLinearVelocity = Vector3.new(90000000, 900000000, 90000000);
				p.AssemblyAngularVelocity = Vector3.new(900000000, 900000000, 900000000);
			end;
			o.Heartbeat:Wait();
		until tick() - i > 1.5 or not m;
		if l then
			l:Destroy();
		end;
		local N = io.Character and io.Character:FindFirstChildOfClass("Humanoid");
		M.CameraSubject = N;
		if p then
			p.CFrame = g;
		end;
	end;
	local function E()
		if not m then
			return;
		end;
		local x = io:FindFirstChildOfClass("Backpack");
		if not x then
			return;
		end;
		local p = x:FindFirstChild("fling");
		if not p and io.Character then
			p = io.Character:FindFirstChild("fling");
		end;
		if p then
			l = p;
			return;
		end;
		l = Instance.new("Tool");
		l.Name = "fling";
		l.RequiresHandle = false;
		l.CanBeDropped = false;
		l.Parent = x;
		i = l.Activated:Connect(function()
				local x = N();
				if x then
					C(x);
				end;
			end);
	end;
	local function F()
		if i then
			pcall(function()
				i:Disconnect();
			end);
			i = nil;
		end;
		if l then
			pcall(function()
				l:Destroy();
			end);
			l = nil;
		end;
		local x = io:FindFirstChildOfClass("Backpack");
		if x then
			local p = x:FindFirstChild("fling");
			if p then
				pcall(function()
					p:Destroy();
				end);
			end;
		end;
		local p = io.Character;
		if p then
			local x = p:FindFirstChild("fling");
			if x then
				pcall(function()
					x:Destroy();
				end);
			end;
		end;
	end;
	((x:AddSection({ Name = "\208\158\209\130\208\177\209\128\208\190\209\129" })):AddToggle("ToolFling", { Title = "\208\162\209\131\208\187 \208\190\209\130\208\177\209\128\208\190\209\129\208\176 (\208\191\208\190 \208\186\208\187\208\184\208\186\209\131)", Default = false })):OnChanged(function(x)
		m = x;
		if x then
			E();
		else
			F();
		end;
	end);
	io.CharacterAdded:Connect(function()
		task.wait(1);
		if m then
			E();
		end;
	end);
	local function c(x)
		local p = x.Parent;
		while p and p ~= B do
			if p.Name == "RegularLobby" or p.Name == "Lobby" then
				return true;
			end;
			p = p.Parent;
		end;
		return false;
	end;
	local z = x:AddSection({ Name = "\208\162\208\181\208\187\208\181\208\191\208\190\209\128\209\130" });
	z:AddButton({ Title = "\208\162\208\159 \208\178 \208\187\208\190\208\177\208\177\208\184", Callback = function()
			local x = H();
			if not x then
				return;
			end;
			local p = B:FindFirstChild("RegularLobby") or B:FindFirstChild("Lobby");
			if not p then
				return;
			end;
			local k = {};
			for x, p in ipairs(p:GetDescendants()) do
				if p:IsA("SpawnLocation") or (p:IsA("BasePart") and p.Name == "Spawn") then
					k[#k + 1] = p;
				end;
			end;
			if #k > 0 then
				local p = k[math.random(1, #k)];
				x.CFrame = p.CFrame + Vector3.new(0, 3, 0);
			end;
		end });
	z:AddButton({ Title = "\208\162\208\159 \208\189\208\176 \208\186\208\176\209\128\209\130\209\131", Callback = function()
			local x = H();
			if not x then
				return;
			end;
			local p = {};
			for x, k in ipairs(B:GetDescendants()) do
				if ((k:IsA("SpawnLocation") or (k:IsA("BasePart") and k.Name == "Spawn"))) and not c(k) then
					p[#p + 1] = k;
				end;
			end;
			if #p > 0 then
				local k = p[math.random(1, #p)];
				x.CFrame = k.CFrame + Vector3.new(0, 5, 0);
			end;
		end });
	(getgenv()).TROLL_UNLOAD = function()
			p, m = false, false;
			M();
			F();
		end;
end;
task.spawn(function()
	task.wait(1);
	V("FortniHub", "Part 2/2 v18.4.0 \208\183\208\176\208\179\209\128\209\131\208\182\208\181\208\189\208\176! by HOTI and Ve315", 6);
end);
print("[FH] ============================================");
print("[FH] Part 2/2 \226\128\148 FortniHub v18.4.0 \226\128\148 " .. d);
print("[FH] ============================================");
task.wait(2);
do
	local x = game:GetService("Players");
	local p = game:GetService("RunService");
	local k = game:GetService("ReplicatedStorage");
	local Y = x.LocalPlayer;
	local g = (getgenv()).Options or ((getgenv()).FH_Window and (getgenv()).FH_Window.Options);
	local M = (getgenv()).FH_Notify or function()
 
		end;
	local m, l, i, N, C;
	local function E(x)
		if not x then
			return "lobby";
		end;
		local p, Y = pcall(function()
				return require((k:WaitForChild("Modules")):WaitForChild("CurrentRoundClient"));
			end);
		if p and (type(Y) == "table" and type(Y.PlayerData) == "table") then
			local p = Y.PlayerData[x.Name];
			if p and not p.Dead then
				if p.Role == "Murderer" then
					return "murderer";
				end;
				if p.Role == "Sheriff" then
					return "sheriff";
				end;
				if p.Role == "Hero" then
					return "hero";
				end;
				return "innocent";
			end;
		end;
		return "innocent";
	end;
	local function F()
		for x, p in ipairs(x:GetPlayers()) do
			if p ~= Y and E(p) == "murderer" then
				return p;
			end;
		end;
		return nil;
	end;
	local function c()
		local x = F();
		if not x or not x.Character then
			return nil;
		end;
		return x.Character:FindFirstChild("HumanoidRootPart") or x.Character:FindFirstChild("UpperTorso") or x.Character:FindFirstChild("Torso") or x.Character:FindFirstChild("Head");
	end;
	local function z()
		local x = Y.Character;
		if not x then
			return nil;
		end;
		local p = x:FindFirstChild("HumanoidRootPart");
		if not p then
			return nil;
		end;
		local k = p:FindFirstChild("GunRaycastAttachment");
		if k then
			return k.WorldPosition;
		end;
		return p.Position;
	end;
	local function v()
		if m then
			return m;
		end;
		local x, p = pcall(function()
				return require((k:WaitForChild("ClientServices")):WaitForChild("WeaponService"));
			end);
		if x and type(p) == "table" then
			m = p;
		end;
		return m;
	end;
	local function R()
		local x = c();
		if not x then
			return nil;
		end;
		local p = z();
		if not p then
			return nil;
		end;
		return CFrame.lookAt(p, x.Position), x.Position;
	end;
	local function a()
		local x = v();
		if not x then
			M("FH-PATCH", "WeaponService \208\189\208\181 \208\189\208\176\208\185\208\180\208\181\208\189", 4);
			return;
		end;
		pcall(function()
			setreadonly(x, false);
		end);
		if type(x.GetMouseTargetCFrame) == "function" then
			if not l then
				l = x.GetMouseTargetCFrame;
			end;
			local p = l;
			x.GetMouseTargetCFrame = function(x, ...)
					if g and (g.SilentEnabled and g.SilentEnabled.Value) then
						local x = R();
						if x then
							return x;
						end;
					end;
					return p(x, ...);
				end;
		end;
		if type(x.GetTargetPosition) == "function" then
			if not i then
				i = x.GetTargetPosition;
			end;
			local p = i;
			x.GetTargetPosition = function(x, ...)
					if g and (g.SilentEnabled and g.SilentEnabled.Value) then
						local x, p = R();
						if x and p then
							return p;
						end;
					end;
					return p(x, ...);
				end;
		end;
		if type(x.GetTargetCFrame) == "function" then
			if not N then
				N = x.GetTargetCFrame;
			end;
			local p = N;
			x.GetTargetCFrame = function(x, ...)
					if g and (g.SilentEnabled and g.SilentEnabled.Value) then
						local x = R();
						if x then
							return x;
						end;
					end;
					return p(x, ...);
				end;
		end;
		if type(x.GetAimPosition) == "function" then
			if not C then
				C = x.GetAimPosition;
			end;
			local p = C;
			x.GetAimPosition = function(x, ...)
					if g and (g.SilentEnabled and g.SilentEnabled.Value) then
						local x, p = R();
						if p then
							return p;
						end;
					end;
					return p(x, ...);
				end;
		end;
		M("FH-PATCH", "Silent hooks: mouse=" .. (tostring(l ~= nil) .. (" pos=" .. (tostring(i ~= nil) .. (" cf=" .. (tostring(N ~= nil) .. (" aim=" .. tostring(C ~= nil))))))), 5);
	end;
	task.spawn(function()
		task.wait(.5);
		a();
		while true do
			task.wait(3);
			if g and (g.SilentEnabled and g.SilentEnabled.Value) then
				a();
			end;
		end;
	end);
	(getgenv()).FH_PATCH_SilentFix = a;
	task.wait(1);
	local d = (getgenv()).FH_Tabs;
	if d and d.Binds then
		local x = g and g.BIND_KEY_InvisOn;
		if not x then
			local x = d.Binds:AddSection({ Name = "\208\163\209\130\208\184\208\187\208\184\209\130\209\139" });
			(x:AddKeybind("BIND_KEY_InvisOn", { Title = "\208\157\208\181\208\178\208\184\208\180\208\184\208\188\208\190\209\129\209\130\209\140", Default = "Unknown" })):OnChanged(function(x)
				if typeof(x) == "EnumItem" then
					M("FH-PATCH", "\208\157\208\181\208\178\208\184\208\180\208\184\208\188\208\190\209\129\209\130\209\140 \226\134\146 " .. tostring(x), 2);
				end;
			end);
			local p = (getgenv()).FH_TouchGui;
			local k = Instance.new("TextButton");
			k.Name = "FH_BTN_InvisOn";
			k.Size = UDim2.fromOffset(150, 34);
			k.Position = UDim2.fromOffset(200, 90);
			k.BackgroundColor3 = Color3.fromRGB(28, 22, 42);
			k.BorderSizePixel = 0;
			k.Text = "\208\157\208\181\208\178\208\184\208\180\208\184\208\188\208\190\209\129\209\130\209\140";
			k.TextColor3 = Color3.fromRGB(235, 225, 255);
			k.Font = Enum.Font.GothamSemibold;
			k.TextSize = 13;
			k.Active = true;
			k.ZIndex = 3;
			k.Visible = false;
			k.Parent = (gethui and gethui()) or game:GetService("CoreGui");
			(Instance.new("UICorner", k)).CornerRadius = UDim.new(0, 8);
			local Y = Instance.new("UIStroke", k);
			Y.Color = Color3.fromRGB(138, 92, 246);
			Y.Thickness = 1;
			Y.Transparency = .35;
			local function m()
				if g and g.InvisOn then
					g.InvisOn:SetValue(not g.InvisOn.Value);
					M("FH-PATCH", "\208\157\208\181\208\178\208\184\208\180\208\184\208\188\208\190\209\129\209\130\209\140: " .. tostring(g.InvisOn.Value), 1.5);
				elseif (getgenv()).FH_ToggleInvis then
					pcall((getgenv()).FH_ToggleInvis);
					M("FH-PATCH", "\208\157\208\181\208\178\208\184\208\180\208\184\208\188\208\190\209\129\209\130\209\140 \208\191\208\181\209\128\208\181\208\186\208\187\209\142\209\135\208\181\208\189\208\176", 1.5);
				else
					M("FH-PATCH", "\208\157\208\181\208\178\208\184\208\180\208\184\208\188\208\190\209\129\209\130\209\140 \208\181\209\137\209\145 \208\189\208\181 \208\183\208\176\208\179\209\128\209\131\208\182\208\181\208\189\208\176", 2);
				end;
			end;
			local l, i, N, C = false, nil, nil, false;
			k.InputBegan:Connect(function(x)
				if x.UserInputType == Enum.UserInputType.MouseButton1 or x.UserInputType == Enum.UserInputType.Touch then
					l = true;
					C = false;
					i = x.Position;
					N = k.Position;
				end;
			end);
			(game:GetService("UserInputService")).InputChanged:Connect(function(x)
				if not l then
					return;
				end;
				if x.UserInputType == Enum.UserInputType.MouseMovement or x.UserInputType == Enum.UserInputType.Touch then
					local p = x.Position - i;
					if math.abs(p.X) > 4 or math.abs(p.Y) > 4 then
						C = true;
					end;
					if C then
						k.Position = UDim2.new(N.X.Scale, N.X.Offset + p.X, N.Y.Scale, N.Y.Offset + p.Y);
					end;
				end;
			end);
			(game:GetService("UserInputService")).InputEnded:Connect(function(x)
				if x.UserInputType ~= Enum.UserInputType.MouseButton1 and x.UserInputType ~= Enum.UserInputType.Touch then
					return;
				end;
				if not l then
					return;
				end;
				local p = not C;
				l = false;
				if p then
					m();
				end;
			end);
			(x:AddToggle("BIND_TCH_InvisOn", { Title = "  \208\154\208\189\208\190\208\191\208\186\208\176: \208\157\208\181\208\178\208\184\208\180\208\184\208\188\208\190\209\129\209\130\209\140", Default = false })):OnChanged(function(x)
				k.Visible = x;
			end);
			M("FH-PATCH", "\208\157\208\181\208\178\208\184\208\180\208\184\208\188\208\190\209\129\209\130\209\140 \208\180\208\190\208\177\208\176\208\178\208\187\208\181\208\189\208\176 \208\178 \208\145\208\184\208\189\208\180\209\139", 3);
		end;
		local p = game:GetService("UserInputService");
		p.InputBegan:Connect(function(x, p)
			if p then
				return;
			end;
			if x.UserInputType ~= Enum.UserInputType.Keyboard then
				return;
			end;
			if g and (g.BIND_KEY_InvisOn and g.BIND_KEY_InvisOn.Value) then
				if x.KeyCode == g.BIND_KEY_InvisOn.Value then
					if g.InvisOn then
						g.InvisOn:SetValue(not g.InvisOn.Value);
					elseif (getgenv()).FH_ToggleInvis then
						pcall((getgenv()).FH_ToggleInvis);
					end;
				end;
			end;
		end);
	else
		M("FH-PATCH", "Tabs.Binds \208\189\208\181 \208\189\208\176\208\185\208\180\208\181\208\189", 4);
	end;
	M("FH-PATCH", "\208\159\208\176\209\130\209\135 \208\183\208\176\208\179\209\128\209\131\208\182\208\181\208\189: Silent fix + Invis bind", 5);
	print("[FH-PATCH] Silent Aim fix + Invis bind applied");
end;
