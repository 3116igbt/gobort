-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local movieclip=require("movieclip")--画像変更用(Eggbrakerからライブラリを引用)
--物理library設定
local physics = require("physics")
--rcoronaまわり
if system.getInfo("environment") == "simulator" then
	local rcorona = require("rcorona")
	rcorona.startServer(8181)
end





physics.start()
physics.setGravity(0,0)
--マスタカメラグループの設定
local camera=display.newGroup()
camera.x=0
camera.y=0
--
--共通パラメータ(速度)
local toChVelo=0
--BGMの設定
local playBGM=audio.loadSound("playbgm.mp3")
--背景の設定------------------------------------------ここから-----------------------
--
local back=display.newImage("sea.png")
camera:insert(back)
back.x=display.contentWidth/2
back.y=display.contentHeight*0.5
--
local back2=display.newImage("sea.png")
camera:insert(back2)
back2.x=display.contentWidth/2
back2.y=display.contentHeight*-0.5

local back3=display.newImage("sea.png")
camera:insert(back3)
back3.x=display.contentWidth/2
back3.y=display.contentHeight*-1.5

local back4=display.newImage("sea.png")
camera:insert(back4)
back4.x=display.contentWidth/2
back4.y=display.contentHeight*-2.5

local back5=display.newImage("sea.png")
camera:insert(back5)
back5.x=display.contentWidth/2
back5.y=display.contentHeight*-3.5

local back6=display.newImage("sea.png")
camera:insert(back6)
back6.x=display.contentWidth/2
back6.y=display.contentHeight*-4.5

local back7=display.newImage("sea.png")
camera:insert(back7)
back7.x=display.contentWidth/2
back7.y=display.contentHeight*-5.5

local back8=display.newImage("sea.png")
camera:insert(back8)
back8.x=display.contentWidth/2
back8.y=display.contentHeight*-6.5

local back9=display.newImage("sea.png")
camera:insert(back9)
back9.x=display.contentWidth/2
back9.y=display.contentHeight*-7.5

local back10=display.newImage("sea.png")
camera:insert(back10)
back10.x=display.contentWidth/2
back10.y=display.contentHeight*-8.5

local back11=display.newImage("sea.png")
camera:insert(back11)
back11.x=display.contentWidth/2
back11.y=display.contentHeight*-9.5

local back12=display.newImage("sea.png")
camera:insert(back12)
back12.x=display.contentWidth/2
back12.y=display.contentHeight*-10.5

local back13=display.newImage("sea.png")
camera:insert(back13)
back13.x=display.contentWidth/2
back13.y=display.contentHeight*-11.5

local back14=display.newImage("sea.png")
camera:insert(back14)
back14.x=display.contentWidth/2
back14.y=display.contentHeight*-12.5

local back15=display.newImage("sea.png")
camera:insert(back15)
back15.x=display.contentWidth/2
back15.y=display.contentHeight*-13.5

local back16=display.newImage("sea.png")
camera:insert(back16)
back16.x=display.contentWidth/2
back16.y=display.contentHeight*-14.5
--背景の設定------------------------------------------ここまで-----------------------

--タイマーテキスト、時間
local time=0
local Ticon=display.newImage("stopwatch.png")
Ticon.x,Ticon.y=display.contentWidth/2+10,0
local DropLabel=display.newText( "0.00", display.contentWidth/2-19, -16, native.systemFont, 28 )--ドロップシャドウ用
local TimeLabel=display.newText( "0.00", display.contentWidth/2-20, -17, native.systemFont, 28 )
local Dseclabel=display.newText( "sec", display.contentWidth/2+39, -16, native.systemFont, 28 )--ドロップシャドウ用
local Tseclabel=display.newText( "sec", display.contentWidth/2+40, -17, native.systemFont, 28 )--ドロップシャドウ用
DropLabel:setTextColor(0,0,0)
Dseclabel:setTextColor(0,0,0)

--スタート、ゴールテープ
local Stline=display.newImage("line.png")
Stline.x,Stline.y=display.contentWidth-150,display.contentHeight/2
camera:insert(Stline)
physics.addBody(Stline,{isSensor=true})

local Glline=display.newImage("line.png")
Glline.x,Glline.y=display.contentWidth-150,display.contentHeight*-13.5
camera:insert(Glline)
physics.addBody(Glline,{isSensor=true})

--操作パネルのセット
local contPanel=display.newImage("panel.png") --(display.contentWidth-50,80,50,340)
contPanel.x,contPanel.y=display.contentWidth-25,220
contPanel:setFillColor(127,127,127)
local contBar=display.newImage("lever.png")  --(display.contentWidth-45,305,40,40)
contBar.x,contBar.y=display.contentWidth-25,325
contBar:setFillColor(255,255,255)
local brakeBtn=movieclip.newAnim{ "stop2.png", "stop2_on.png" }
brakeBtn.x,brakeBtn.y=display.contentWidth-25,385


--レバーの移動
contBar.move = function (self,y)
	if y < 65 then
		self.y = 65
		return false
	elseif y >325 then
		self.y =325
		return false
	else
		self.y=y
		return true
	end
end


--ゲームパーツのセット
--ボート
local userBort = display.newImage("boat.png")
camera:insert(userBort)
userBort.x=display.contentWidth/2
userBort.y=display.contentHeight-30
physics.addBody(userBort,{density=0.9, friction=0,radius=35})



--障害物-------------------------------------ここから----------------------
local syougai11 =display.newImage("obstacle.png")
camera:insert(syougai11)
syougai11.x=math.random(35,295)
syougai11.y=math.random(400,6500)*-1
physics.addBody(syougai11,"static",{radius=35})

local syougai12 =display.newImage("obstacle.png")
camera:insert(syougai12)
syougai12.x=math.random(35,295)
syougai12.y=math.random(400,6500)*-1
physics.addBody(syougai12,"static",{radius=35})

local syougai13 =display.newImage("obstacle.png")
camera:insert(syougai13)
syougai13.x=math.random(35,295)
syougai13.y=math.random(400,6500)*-1
physics.addBody(syougai13,"static",{radius=35})

local syougai14 =display.newImage("obstacle.png")
camera:insert(syougai14)
syougai14.x=math.random(35,295)
syougai14.y=math.random(400,6500)*-1
physics.addBody(syougai14,"static",{radius=35})

local syougai15 =display.newImage("obstacle.png")
camera:insert(syougai15)
syougai15.x=math.random(35,295)
syougai15.y=math.random(400,6500)*-1
physics.addBody(syougai15,"static",{radius=35})

local syougai21 =display.newImage("obstacle2.png")
camera:insert(syougai21)
syougai21.x=math.random(35,295)
syougai21.y=math.random(400,6500)*-1
physics.addBody(syougai21,"static",{radius=20})

local syougai22 =display.newImage("obstacle2.png")
camera:insert(syougai22)
syougai22.x=math.random(35,295)
syougai22.y=math.random(400,6500)*-1
physics.addBody(syougai22,"static",{radius=20})

local syougai23 =display.newImage("obstacle2.png")
camera:insert(syougai23)
syougai23.x=math.random(35,295)
syougai23.y=math.random(400,6500)*-1
physics.addBody(syougai23,"static",{radius=20})

local syougai24 =display.newImage("obstacle2.png")
camera:insert(syougai24)
syougai24.x=math.random(35,295)
syougai24.y=math.random(400,6500)*-1
physics.addBody(syougai24,"static",{radius=20})

local syougai25 =display.newImage("obstacle2.png")
camera:insert(syougai25)
syougai25.x=math.random(35,295)
syougai25.y=math.random(400,6500)*-1
physics.addBody(syougai25,"static",{radius=20})

local syougai26 =display.newImage("obstacle2.png")
camera:insert(syougai26)
syougai26.x=math.random(35,295)
syougai26.y=math.random(400,6500)*-1
physics.addBody(syougai26,"static",{radius=20})

local syougai27 =display.newImage("obstacle2.png")
camera:insert(syougai27)
syougai27.x=math.random(35,295)
syougai27.y=math.random(400,6500)*-1
physics.addBody(syougai27,"static",{radius=20})

local syougai28 =display.newImage("obstacle2.png")
camera:insert(syougai28)
syougai28.x=math.random(35,295)
syougai28.y=math.random(400,6500)*-1
physics.addBody(syougai28,"static",{radius=20})

local syougai31 =display.newImage("obstacle3.png")
camera:insert(syougai31)
syougai31.x=math.random(35,295)
syougai31.y=math.random(400,6500)*-1
physics.addBody(syougai31,"static",{radius=48})

local syougai32 =display.newImage("obstacle3.png")
camera:insert(syougai32)
syougai32.x=math.random(35,295)
syougai32.y=math.random(400,6500)*-1
physics.addBody(syougai32,"static",{radius=48})

local syougai33 =display.newImage("obstacle3.png")
camera:insert(syougai33)
syougai33.x=math.random(35,295)
syougai33.y=math.random(400,6500)*-1
physics.addBody(syougai33,"static",{radius=48})
--障害物---------------------------------ここまで---------------
--ボートの速度変化
local function changeVelo(self,event)
	local Ox , Oy=userBort:getLinearVelocity()
	local vy=toChVelo
	print("Oy:"..Oy)
	if Oy-vy <= -250 then
		userBort:setLinearVelocity(0,-250)
	elseif Oy-vy<=0 then
		userBort:setLinearVelocity(0,Oy-vy)
	else
		userBort:setLinearVelocity(0,0)
	end
end

--ボートの横移動
local function slideBort(event)
	local slideValue=event.xGravity*35
	userBort.x=userBort.x+slideValue
	if userBort.x<25 then
		userBort.x=25
	elseif userBort.x>295 then
		userBort.x=295
	end
end

--レバーを戻す
local function returnBar()
	Runtime:removeEventListener("enterFrame",changeVelo)--速度変化リスナーを止める(なぜかここだとうまくいく・・・なぜに？)
	if contBar.y < 325 then
		contBar.y=contBar.y+15
	end
end

--バーをタッチしたら
local  function accelCont (event)
	if event.phase=="began" then
		Runtime:addEventListener("enterFrame",changeVelo)
	end
	if not(event.phase=="ended")then
		Runtime:removeEventListener("enterFrame",returnBar)
		local OKf=contBar:move(event.y)
		if OKf==true then
			toChVelo=math.abs((event.y-325)/100)
		end
	end
end

--ブレーキを押したら
local function PushBrake(event)
	if event.phase=="began" then
		toChVelo=-2
		print("began")
		brakeBtn:stopAtFrame(2)
		Runtime:removeEventListener("enterFrame",returnBar)
		Runtime:addEventListener("enterFrame",changeVelo)
	end
end

--カメラの移動
local function moveCamera()
	if userBort.y < display.contentHeight-80 then
		camera.y=display.contentHeight-userBort.y-80
	end
end


--操作パネルのタッチが終わった時にレバーを戻す
local function Barback(event)
	if event.phase=="ended" then
		Runtime:addEventListener("enterFrame",returnBar)
		brakeBtn:stopAtFrame(1)
	end
end


--回転抑止用
local function stopRota(event)
	--if event.phase=="ended" then
		userBort.angularVelocity=0
		userBort.rotation=0
	--end
end

--タイマー周り
local Stopwatch
--ゴールライン通過後
local function allstop(event)
	toChVelo=0
	local Ox , Oy=userBort:getLinearVelocity()
	if Oy<0 then
		userBort:setLinearVelocity(0,Oy+5)
	else
		userBort:setLinearVelocity(0,0)
	end
end
--タイマーを止める(終了処理)
local function stopTimer(event)
	if event.phase=="began" then
		Runtime:addEventListener("enterFrame",allstop)
		timer.pause(Stopwatch)
		audio.stop()
		toChVelo=10
	end
end
--計測
local function mejourTimer()
	time=time+0.01
	TimeLabel.text=string.format("%.2f",time)
	DropLabel.text=string.format("%.2f",time)
end

--タイマスタート
local  function startTimer(event)
	if event.phase=="began" then
		print("coll")
		Stopwatch=timer.performWithDelay( 10, mejourTimer, 0 )
		audio.play(playBGM,{loops=-1})
	end
end



userBort:addEventListener("collision",stopRota)
brakeBtn:addEventListener("touch",PushBrake)
contBar:addEventListener("touch",accelCont)
Stline:addEventListener("collision",startTimer)
Glline:addEventListener("collision",stopTimer)
Runtime:addEventListener("touch",Barback)
Runtime:addEventListener("enterFrame",moveCamera)
--加速度センサーで船の移動
Runtime:addEventListener ("accelerometer", slideBort);

--[[
--rcorona周り
if system.getInfo("environment") == "simulator" then
	-- Register object to rcorona
	rcorona.registerTouch(contBar)
	rcorona.registerTouch(brakeBtn)

end]]--