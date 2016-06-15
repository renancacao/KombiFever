-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local gPraia = display.newGroup()
gPraia.speed = 2

local ceu1 = display.newImageRect("ceu1.png",570,71)
ceu1.x=display.contentCenterX
ceu1.y= ceu1.height/2



local praia1 = display.newImageRect(gPraia, "praia1.png",570,71)
praia1.x=display.contentCenterX
praia1.y=ceu1.y+ ceu1.height/2 + praia1.height/2

local praia2 = display.newImageRect(gPraia, "praia1.png",570,71)
praia2.x=display.contentCenterX + praia1.width
praia2.y=ceu1.y+ ceu1.height/2 + praia2.height/2


local gPista = display.newGroup()
gPista.speed=5

local pista1 = display.newImageRect(gPista,"rodovia1.png",570,177)
pista1.x=display.contentCenterX
pista1.y=praia1.y + praia1.height/2 + pista1.height/2

local pista2 = display.newImageRect(gPista,"rodovia1.png",570,177)
pista2.x=display.contentCenterX + pista1.width
pista2.y=praia1.y + praia1.height/2 + pista2.height/2 

local options =
{
    width = 44*3,
    height = 31*3,
    numFrames = 4,
	sheetContentWidth = 176 *3 , -- width of original 1x size of entire sheet
    sheetContentHeight = 31*3   -- height of original 1x size of entire sheet
}
local sheet = graphics.newImageSheet( "kombiteste.png", options )

local sequenceData ={
{
    name="carro",
    start=1,
    count=4,
    time=200,
    loopCount = 0,   -- Optional ; default is 0 (loop indefinitely)
	loopDirection = "forward"

}}
local sprite = display.newSprite(sheet, sequenceData )
sprite.x=display.contentCenterX - 60
sprite.y=display.contentCenterY
sprite:play()



local function move(event)
	
	--praia
	
	praia1.x = praia1.x -gPraia.speed
	praia2.x = praia2.x -gPraia.speed
	
	if praia2.x == display.contentCenterX then
		praia1.x=display.contentCenterX+praia1.width
	end
	
	if praia1.x == display.contentCenterX then
		praia2.x=display.contentCenterX+praia2.width

	end
	



	
	--pista
	
	pista1.x = pista1.x -gPista.speed
	pista2.x = pista2.x -gPista.speed
	
	if pista2.x == display.contentCenterX then
		pista1.x=display.contentCenterX+pista1.width
		print("teste")
	end
	
	if pista1.x == display.contentCenterX then
		pista2.x=display.contentCenterX+pista2.width
	end

	
	
end

Runtime:addEventListener( "enterFrame", move )