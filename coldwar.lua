local a=game:GetService"UserInputService"
local b=game:GetService"Players"
local c=game:GetService"Workspace"
local d=game:GetService"ReplicatedStorage"
local e=game:GetService"HttpService"
local f=game:GetService"GuiService"
local g=game:GetService"Lighting"
local h=game:GetService"RunService"
local i=game:GetService"Stats"
local j=game:GetService"CoreGui"
local k=game:GetService"Debris"
local l=game:GetService"TweenService"
local m=game:GetService"SoundService"

local n=Vector2.new local o=
Vector3.new
local p=UDim2.new
local q=UDim.new local r=
Rect.new
local s=CFrame.new
local t=s()local u=
t.PointToObjectSpace local v=
CFrame.Angles
local w=UDim2.fromOffset

local x=Color3.new
local y=Color3.fromRGB
local z=Color3.fromHex local A=
Color3.fromHSV
local B=ColorSequence.new
local C=ColorSequenceKeypoint.new
local D=NumberSequence.new
local E=NumberSequenceKeypoint.new

local F=c.CurrentCamera or c:FindFirstChildOfClass"Camera"
c:GetPropertyChangedSignal"CurrentCamera":Connect(function()
local G=c.CurrentCamera
if G then
F=G
end
end)
local G=b.LocalPlayer
local H=G:GetMouse()
local I=f:GetGuiInset().Y

G:GetPropertyChangedSignal"Team":Connect(function()
if esp then
esp.refresh_elements()
end
end)

local J=math.max
local K=math.floor
local L=math.min
local M=math.abs local N=
math.noise
local O=math.rad local P=
math.random local Q=
math.pow local R=
math.sin local S=
math.pi
local T=math.tan
local U=math.atan2
local V=math.clamp

local W=table.insert
local X=table.find
local Y=table.remove
local Z=table.concat

local _={}

do
local aa=math.pi
local ab=math.abs
local ac=math.clamp
local ad=math.exp
local ae=math.rad
local af=math.sign
local ag=math.sqrt
local ah=math.tan

local ai=game:GetService"ContextActionService"
local aj=game:GetService"Players"
local ak=game:GetService"RunService"
local al=game:GetService"StarterGui"
local am=game:GetService"UserInputService"
local an=game:GetService"Workspace"

local ao=aj.LocalPlayer
if not ao then
aj:GetPropertyChangedSignal"LocalPlayer":Wait()
ao=aj.LocalPlayer
end

local ap=an.CurrentCamera
an:GetPropertyChangedSignal"CurrentCamera":Connect(function()
local aq=an.CurrentCamera
if aq then
ap=aq
end
end)local aq=

Enum.ContextActionPriority.Low.Value
local ar=Enum.ContextActionPriority.High.Value local as=
{Enum.KeyCode.LeftShift,Enum.KeyCode.P}

local at=Vector3.new(1,1,1)*64
local au=Vector2.new(0.75,1)*8
local av=300

local aw=ae(90)

local ax=10
local ay=10
local az=10

local aA={}do
aA.__index=aA

function aA.new(aB,aC)
local aD=setmetatable({},aA)
aD.f=aB
aD.p=aC
aD.v=aC*0
return aD
end

function aA.Update(aB,aC,aD)
local aE=aB.f*2*aa
local aF=aB.p
local aG=aB.v

local aH=aD-aF
local aI=ad(-aE*aC)

local aJ=aD+(aG*aC-aH*(aE*aC+1))*aI
local aK=(aE*aC*(aH*aE-aG)+aG)*aI

aB.p=aJ
aB.v=aK

return aJ
end

function aA.Reset(aB,aC)
aB.p=aC
aB.v=aC*0
end
end

local aB=Vector3.new()
local aC=Vector2.new()
local aD=0

local aE

local aF=aA.new(ax,Vector3.new())
local aG=aA.new(ay,Vector2.new())
local aH=aA.new(az,0)

local aI={}do
local aJ do
local aK=2.0
local aL=0.15

local function fCurve(aM)
return(ad(aK*aM)-1)/(ad(aK)-1)
end

local function fDeadzone(aM)
return fCurve((aM-aL)/(1-aL))
end

function aJ(aM)
return af(aM)*ac(fDeadzone(ab(aM)),0,1)
end
end

local aK={
ButtonX=0,
ButtonY=0,
DPadDown=0,
DPadUp=0,
ButtonL2=0,
ButtonR2=0,
Thumbstick1=Vector2.new(),
Thumbstick2=Vector2.new(),
}

local aL={
W=0,
A=0,
S=0,
D=0,
E=0,
Q=0,
U=0,
H=0,
J=0,
K=0,
I=0,
Y=0,
Up=0,
Down=0,
LeftShift=0,
RightShift=0,
}

local aM={
Delta=Vector2.new(),
MouseWheel=0,
}

local aN=Vector3.new(1,1,1)
local aO=Vector3.new(1,1,1)
local aP=Vector2.new(1,1)*(aa/64)
local aQ=Vector2.new(1,1)*(aa/8)
local aR=1.0
local aS=0.25
local aT=0.75
local aU=0.25

local aV=1

function aI.Vel(aW)
aV=ac(aV+aW*(aL.Up-aL.Down)*aT,0.01,4)

local aX=Vector3.new(
aJ(aK.Thumbstick1.X),
aJ(aK.ButtonR2)-aJ(aK.ButtonL2),
aJ(-aK.Thumbstick1.Y)
)*aN

local aY=Vector3.new(
aL.D-aL.A+aL.K-aL.H,
aL.E-aL.Q+aL.I-aL.Y,
aL.S-aL.W+aL.J-aL.U
)*aO

local aZ=am:IsKeyDown(Enum.KeyCode.LeftShift)or am:IsKeyDown(Enum.KeyCode.RightShift)

return(aX+aY)*(aV*(aZ and aU or 1))
end

function aI.Pan(aW)
local aX=Vector2.new(
aJ(aK.Thumbstick2.Y),
aJ(-aK.Thumbstick2.X)
)*aQ
local aY=aM.Delta*aP
aM.Delta=Vector2.new()
return aX+aY
end

function aI.Fov(aW)
local aX=(aK.ButtonX-aK.ButtonY)*aS
local aY=aM.MouseWheel*aR
aM.MouseWheel=0
return aX+aY
end

do
local function Keypress(aW,aX,aY)
aL[aY.KeyCode.Name]=aX==Enum.UserInputState.Begin and 1 or 0
return Enum.ContextActionResult.Sink
end

local function GpButton(aW,aX,aY)
aK[aY.KeyCode.Name]=aX==Enum.UserInputState.Begin and 1 or 0
return Enum.ContextActionResult.Sink
end

local function MousePan(aW,aX,aY)
local aZ=aY.Delta
aM.Delta=Vector2.new(-aZ.y,-aZ.x)
return Enum.ContextActionResult.Sink
end

local function Thumb(aW,aX,aY)
aK[aY.KeyCode.Name]=aY.Position
return Enum.ContextActionResult.Sink
end

local function Trigger(aW,aX,aY)
aK[aY.KeyCode.Name]=aY.Position.z
return Enum.ContextActionResult.Sink
end

local function MouseWheel(aW,aX,aY)
aM[aY.UserInputType.Name]=-aY.Position.z
return Enum.ContextActionResult.Sink
end

local function Zero(aW)
for aX,aY in pairs(aW)do
aW[aX]=aY*0
end
end

function aI.StartCapture()
ai:BindActionAtPriority("FreecamKeyboard",Keypress,false,ar,
Enum.KeyCode.W,Enum.KeyCode.U,
Enum.KeyCode.A,Enum.KeyCode.H,
Enum.KeyCode.S,Enum.KeyCode.J,
Enum.KeyCode.D,Enum.KeyCode.K,
Enum.KeyCode.E,Enum.KeyCode.I,
Enum.KeyCode.Q,Enum.KeyCode.Y,
Enum.KeyCode.Up,Enum.KeyCode.Down
)
ai:BindActionAtPriority("FreecamMousePan",MousePan,false,ar,Enum.UserInputType.MouseMovement)
ai:BindActionAtPriority("FreecamMouseWheel",MouseWheel,false,ar,Enum.UserInputType.MouseWheel)
ai:BindActionAtPriority("FreecamGamepadButton",GpButton,false,ar,Enum.KeyCode.ButtonX,Enum.KeyCode.ButtonY)
ai:BindActionAtPriority("FreecamGamepadTrigger",Trigger,false,ar,Enum.KeyCode.ButtonR2,Enum.KeyCode.ButtonL2)
ai:BindActionAtPriority("FreecamGamepadThumbstick",Thumb,false,ar,Enum.KeyCode.Thumbstick1,Enum.KeyCode.Thumbstick2)
end

function aI.StopCapture()
aV=1
Zero(aK)
Zero(aL)
Zero(aM)
ai:UnbindAction"FreecamKeyboard"
ai:UnbindAction"FreecamMousePan"
ai:UnbindAction"FreecamMouseWheel"
ai:UnbindAction"FreecamGamepadButton"
ai:UnbindAction"FreecamGamepadTrigger"
ai:UnbindAction"FreecamGamepadThumbstick"
end
end
end

local function GetFocusDistance(aJ)
local aK=0.1
local aL=ap.ViewportSize
local aM=2*ah(aD/2)
local aN=aL.x/aL.y*aM
local aO=aJ.rightVector
local aP=aJ.upVector
local aQ=aJ.lookVector

local aR=Vector3.new()
local aS=512

for aT=0,1,0.5 do
for aU=0,1,0.5 do
local aV=(aT-0.5)*aN
local aW=(aU-0.5)*aM
local aX=aO*aV-aP*aW+aQ
local aY=aJ.p+aX*aK local
aZ, a_=an:FindPartOnRay(Ray.new(aY,aX.unit*aS))
local a0=(a_-aY).magnitude
if aS>a0 then
aS=a0
aR=aX.unit
end
end
end

return aQ:Dot(aR)*aS
end

local function StepFreecam(aJ)

if aE then
local aK=aF:Update(aJ,aI.Vel(aJ))
local aL=aH:Update(aJ,aI.Fov(aJ))

local aM=ag(ah(ae(35))/ah(ae(aD/2)))
aD=ac(aD+aL*av*(aJ/aM),1,120)

local aN=aE*CFrame.new(aK*at*aJ)
aB=aN.Position
aC=Vector2.new(aN:toEulerAnglesYXZ())

ap.CFrame=aN
ap.Focus=aN*CFrame.new(0,0,-GetFocusDistance(aN))
ap.FieldOfView=aD
return
end

local aK=aF:Update(aJ,aI.Vel(aJ))
local aL=aG:Update(aJ,aI.Pan(aJ))
local aM=aH:Update(aJ,aI.Fov(aJ))

local aN=ag(ah(ae(35))/ah(ae(aD/2)))

aD=ac(aD+aM*av*(aJ/aN),1,120)
aC=aC+aL*au*(aJ/aN)
aC=Vector2.new(ac(aC.x,-aw,aw),aC.y%(2*aa))

local aO=CFrame.new(aB)*CFrame.fromOrientation(aC.x,aC.y,0)*CFrame.new(aK*at*aJ)
aB=aO.p

ap.CFrame=aO
ap.Focus=aO*CFrame.new(0,0,-GetFocusDistance(aO))
ap.FieldOfView=aD
end

local aJ={}do
local aK
local aL
local aM
local aN
local aO
local aP
local aQ={}
local aR={
Backpack=true,
Chat=true,
Health=true,
PlayerList=true,
}
local aS={
BadgesNotificationsActive=true,
PointsNotificationsActive=true,
}

function aJ.Push()

aP=ap.FieldOfView
ap.FieldOfView=70

aM=ap.CameraType
ap.CameraType=Enum.CameraType.Custom

aO=ap.CFrame
aN=ap.Focus

aL=am.MouseIconEnabled
am.MouseIconEnabled=true

aK=am.MouseBehavior
am.MouseBehavior=Enum.MouseBehavior.Default
end

function aJ.Pop()
for aT,aU in pairs(aR)do
al:SetCoreGuiEnabled(Enum.CoreGuiType[aT],aU)
end
for aT,aU in pairs(aS)do
al:SetCore(aT,aU)
end
for aT,aU in pairs(aQ)do
if aU.Parent then
aU.Enabled=true
end
end

ap.FieldOfView=aP
aP=nil

ap.CameraType=aM
aM=nil

ap.CFrame=aO
aO=nil

ap.Focus=aN
aN=nil

am.MouseIconEnabled=true
am.MouseBehavior=Enum.MouseBehavior.Default
aK=nil
aL=nil
end
end

local function StartFreecam()
local aK=ap.CFrame
aC=Vector2.new(aK:toEulerAnglesYXZ())
aB=aK.p
aD=ap.FieldOfView

aF:Reset(Vector3.new())
aG:Reset(Vector2.new())
aH:Reset(0)

aJ.Push()
ak:BindToRenderStep("Freecam",Enum.RenderPriority.Camera.Value,StepFreecam)
aI.StartCapture()
end

local function StopFreecam()
aI.StopCapture()
ak:UnbindFromRenderStep"Freecam"
aJ.Pop()

task.spawn(function()
for aK=1,45 do
task.wait()
am.MouseBehavior=Enum.MouseBehavior.Default
am.MouseIconEnabled=true
end
end)
end

function _.EnableFreecam(aK)
StartFreecam()
end

function _.StopFreecam(aK)
StopFreecam()
end

local aK=false

function _.IsActive(aL)
return aK
end

function _.SetOverride(aL,aM)
aE=aM
end

function _.ClearOverride(aL)
aE=nil
end

function _.set_active(aL)
aL=not not aL

if aL==aK then
return
end

aK=aL

if aL then
_:EnableFreecam()
else
_:StopFreecam()
end

if library.freecam_keybind then
library.freecam_keybind.set(aL)
end
end

am.InputBegan:Connect(function(aL,aM)
if aM then return end
if aL.KeyCode==Enum.KeyCode.P then
local aN=am:IsKeyDown(Enum.KeyCode.LeftShift)or
am:IsKeyDown(Enum.KeyCode.RightShift)
if aN then
_.set_active(not aK)
end
end
end)
end

getgenv().library={
directory="priv9",
folders={
"/fonts",
"/configs",
},
flags={},
config_flags={},

connections={},
notifications={},
playerlist_data={
players={},
player={},
},
colorpicker_open=false;
gui;
}

local aa={
preset={
outline=y(10,10,10),
inline=y(35,35,35),
text=y(180,180,180),
text_outline=y(0,0,0),
background=y(20,20,20),
["1"]=z"#245771",
["2"]=z"#215D63",
["3"]=z"#1E6453",
},

utility={
inline={
BackgroundColor3={}
},
text={
TextColor3={}
},
text_outline={
Color={}
},
["1"]={
BackgroundColor3={},
TextColor3={},
ImageColor3={},
ScrollBarImageColor3={},
BorderColor3={},
},
["2"]={
BackgroundColor3={},
TextColor3={},
ImageColor3={},
ScrollBarImageColor3={},
BorderColor3={},
},
["3"]={
BackgroundColor3={},
TextColor3={},
ImageColor3={},
ScrollBarImageColor3={},
BorderColor3={},
},
}
}

local ab={
[Enum.KeyCode.LeftShift]="LShift",
[Enum.KeyCode.RightShift]="RShift",
[Enum.KeyCode.LeftControl]="LCtrl",
[Enum.KeyCode.RightControl]="RCtrl",
[Enum.KeyCode.Insert]="INSERT",
[Enum.KeyCode.Backspace]="BACK",
[Enum.KeyCode.Return]="Enter",
[Enum.KeyCode.LeftAlt]="LAlt",
[Enum.KeyCode.RightAlt]="RAlt",
[Enum.KeyCode.CapsLock]="CAPS",
[Enum.KeyCode.One]="1",
[Enum.KeyCode.Two]="2",
[Enum.KeyCode.Three]="3",
[Enum.KeyCode.Four]="4",
[Enum.KeyCode.Five]="5",
[Enum.KeyCode.Six]="6",
[Enum.KeyCode.Seven]="7",
[Enum.KeyCode.Eight]="8",
[Enum.KeyCode.Nine]="9",
[Enum.KeyCode.Zero]="0",
[Enum.KeyCode.KeypadOne]="Num1",
[Enum.KeyCode.KeypadTwo]="Num2",
[Enum.KeyCode.KeypadThree]="Num3",
[Enum.KeyCode.KeypadFour]="Num4",
[Enum.KeyCode.KeypadFive]="Num5",
[Enum.KeyCode.KeypadSix]="Num6",
[Enum.KeyCode.KeypadSeven]="Num7",
[Enum.KeyCode.KeypadEight]="Num8",
[Enum.KeyCode.KeypadNine]="Num9",
[Enum.KeyCode.KeypadZero]="Num0",
[Enum.KeyCode.Minus]="-",
[Enum.KeyCode.Equals]="=",
[Enum.KeyCode.Tilde]="~",
[Enum.KeyCode.LeftBracket]="[",
[Enum.KeyCode.RightBracket]="]",
[Enum.KeyCode.RightParenthesis]=")",
[Enum.KeyCode.LeftParenthesis]="(",
[Enum.KeyCode.Semicolon]=",",
[Enum.KeyCode.Quote]="'",
[Enum.KeyCode.BackSlash]="\\",
[Enum.KeyCode.Comma]=",",
[Enum.KeyCode.Period]=".",
[Enum.KeyCode.Slash]="/",
[Enum.KeyCode.Asterisk]="*",
[Enum.KeyCode.Plus]="+",
[Enum.KeyCode.Period]=".",
[Enum.KeyCode.Backquote]="`",
[Enum.UserInputType.MouseButton1]="MB1",
[Enum.UserInputType.MouseButton2]="MB2",
[Enum.UserInputType.MouseButton3]="MB3",
[Enum.KeyCode.Escape]="ESCAPE",
[Enum.KeyCode.Space]="SPACE",
}

library.__index=library

for ac,ad in next,library.folders do
makefolder(library.directory..ad)
end

local ac=library.flags
local ad=library.config_flags
library.keybinds={}

local ae={};do
function Register_Font(af,ag,ah,ai)
if not isfile(ai.Id)then
writefile(ai.Id,ai.Font)
end

if isfile(af..".font")then
delfile(af..".font")
end

local aj={
name=af,
faces={
{
name="Regular",
weight=ag,
style=ah,
assetId=getcustomasset(ai.Id),
},
},
}

writefile(af..".font",game:GetService"HttpService":JSONEncode(aj))

return getcustomasset(af..".font")
end

local af=Register_Font("Tahoma",200,"Normal",{
Id="Tahoma.ttf",
Font=game:HttpGet"https://github.com/i77lhm/storage/raw/refs/heads/main/fonts/tahoma_bold.ttf",
})

local ag=Register_Font("ProggyClean",200,"normal",{
Id="ProggyClean.ttf",
Font=game:HttpGet"https://github.com/i77lhm/storage/raw/refs/heads/main/fonts/ProggyClean.ttf"
})

local ah=Register_Font("SmallestPixel",400,"Normal",{
Id="SmallestPixel.ttf",
Font=game:HttpGet"https://github.com/i77lhm/storage/raw/refs/heads/main/fonts/smallest_pixel-7.ttf",
})

ae={TahomaBold=
Font.new(af,Enum.FontWeight.Regular,Enum.FontStyle.Normal);ProggyClean=
Font.new(ag,Enum.FontWeight.Regular,Enum.FontStyle.Normal);SmallestPixel=
Font.new(ah,Enum.FontWeight.Regular,Enum.FontStyle.Normal);
}
end

function library.tween(af,ag,ah)
local ai=l:Create(ag,TweenInfo.new(0.25,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut,0,false,0),ah):Play()

return ai
end

function library.close_current_element(af,ag)
local ah=library.current_element_open

if ah then
ah.set_visible(false)
ah.open=false
end
end

function library.resizify(af,ag)
local ah=Instance.new"TextButton"
ah.Position=p(1,-10,1,-10)
ah.BorderColor3=y(0,0,0)
ah.Size=p(0,10,0,10)
ah.BorderSizePixel=0
ah.BackgroundColor3=y(255,255,255)
ah.Parent=ag
ah.BackgroundTransparency=1
ah.Text=""

local ai=false
local aj
local ak
local al=ag.Size

ah.InputBegan:Connect(function(am)
if am.UserInputType==Enum.UserInputType.MouseButton1 then
ai=true
ak=am.Position
aj=ag.Size
end
end)

ah.InputEnded:Connect(function(am)
if am.UserInputType==Enum.UserInputType.MouseButton1 then
ai=false
end
end)

library:connection(a.InputChanged,function(am,an)
if ai and am.UserInputType==Enum.UserInputType.MouseMovement then
local ao=F.ViewportSize.X
local ap=F.ViewportSize.Y

local ar=p(
aj.X.Scale,
math.clamp(
aj.X.Offset+(am.Position.X-ak.X),
al.X.Offset,
ao
),
aj.Y.Scale,
math.clamp(
aj.Y.Offset+(am.Position.Y-ak.Y),
al.Y.Offset,
ap
)
)
ag.Size=ar
end
end)
end

function library.mouse_in_frame(af,ag)
local ah=ag.AbsolutePosition.Y<=H.Y and H.Y<=ag.AbsolutePosition.Y+ag.AbsoluteSize.Y
local ai=ag.AbsolutePosition.X<=H.X and H.X<=ag.AbsolutePosition.X+ag.AbsoluteSize.X

return(ah and ai)
end

library.lerp=function(af,ag,ah)
ah=ah or 0.125

return af*(1-ah)+ag*ah
end

function library.draggify(af,ag)
local ah=false
local ai=ag.Position
local aj

ag.InputBegan:Connect(function(ak)
if ak.UserInputType==Enum.UserInputType.MouseButton1 then
ah=true
aj=ak.Position
ai=ag.Position
end
end)

ag.InputEnded:Connect(function(ak)
if ak.UserInputType==Enum.UserInputType.MouseButton1 then
ah=false
end
end)

library:connection(a.InputChanged,function(ak,al)
if ah and ak.UserInputType==Enum.UserInputType.MouseMovement then
local am=F.ViewportSize.X
local an=F.ViewportSize.Y

local ao=p(
0,
V(
ai.X.Offset+(ak.Position.X-aj.X),
0,
am-ag.Size.X.Offset
),
0,
math.clamp(
ai.Y.Offset+(ak.Position.Y-aj.Y),
0,
an-ag.Size.Y.Offset
)
)

ag.Position=ao
end
end)
end

function library.convert(af,ag)
local ah={}

for ai in string.gmatch(ag,"[^,]+")do
W(ah,tonumber(ai))
end

if#ah==4 then
return unpack(ah)
else
return
end
end

function library.convert_enum(af,ag)
local ah={}

for ai in string.gmatch(ag,"[%w_]+")do
W(ah,ai)
end

local ai=Enum
for aj=2,#ah do
local ak=ai[ah[aj] ]

ai=ak
end

return ai
end

local af;
function library.update_config_list(ag)
if not af then
return
end

local ah={}

for ai,aj in listfiles(library.directory.."/configs")do
local ak=aj:gsub(library.directory.."/configs\\",""):gsub(".cfg",""):gsub(library.directory.."\\configs\\","")
ah[#ah+1]=ak
end

af.refresh_options(ah)
end

function library.get_config(ag)
local ah={}

for ai,aj in ac do
if type(aj)=="table"and aj.key then
ah[ai]={active=aj.active,mode=aj.mode,key=tostring(aj.key)}
elseif type(aj)=="table"and aj.Transparency and aj.Color then
ah[ai]={Transparency=aj.Transparency,Color=aj.Color:ToHex()}
else
ah[ai]=aj
end
end

return e:JSONEncode(ah)
end

function library.load_config(ag,ah)
local ai=e:JSONDecode(ah)

for aj,ak in next,ai do
local al=library.config_flags[aj]

if aj=="config_name_list"then
continue
end

if al then
if type(ak)=="table"and ak.Transparency and ak.Color then
al(z(ak.Color),ak.Transparency)
print"set cp!"
elseif type(ak)=="table"and ak.active then
al(ak)
else
al(ak)
end
end
end
end

function library.round(ag,ah,ai)
local aj=1/(ai or 1)

return K(ah*aj+0.5)/aj
end

function library.apply_theme(ag,ah,ai,aj)
W(aa.utility[ai][aj],ah)
end

function library.update_theme(ag,ah,ai)
for aj,ak in next,aa.utility[ah]do
for al,am in next,ak do
if am:GetAttribute"PrivToggleState"==false and aj=="BackgroundColor3"then

am[aj]=aa.preset.inline
else
am[aj]=ai
end
end
end

aa.preset[ah]=ai
end

function library.create_visuals_selection_box(ag,ah)
local ai=library:create("Frame",{
Parent=ah.elements;
BorderColor3=aa.preset[tostring(ah.count)];
BorderSizePixel=1;
BackgroundColor3=y(35,35,35);
Size=p(1,0,0,0);
AutomaticSize=Enum.AutomaticSize.Y;
})
library:apply_theme(ai,tostring(ah.count),"BorderColor3")

library:create("UIPadding",{
Parent=ai;
PaddingTop=q(0,4);
PaddingBottom=q(0,4);
PaddingLeft=q(0,6);
PaddingRight=q(0,6);
})

library:create("UIListLayout",{
Parent=ai;
Padding=q(0,4);
SortOrder=Enum.SortOrder.LayoutOrder;
})

return ai
end

function library.create_visuals_page(ag,ah,ai,aj)
local ak=aj.center_label or aj.label
local al=aj.right_label or(aj.label.." options")

local am=aj.auto_fill~=false

