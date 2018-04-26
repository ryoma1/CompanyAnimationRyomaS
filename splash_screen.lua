-----------------------------------------------------------------------------------------
--hide status bar
display.setStatusBar(display.HiddenStatusBar)
-----------------------------------------------------------------------------------------
-- Use Composer Library
local composer = require( "composer" )

-- Name the Scene
sceneName = "splash_screen"

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
 
-- The local variables for this scene
local logo
local blipSounds = audio.loadSound("Sounds/blip.mp3")
local blipSoundsChannel

--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- set the background to be black
    display.setDefault("background", 0, 0, 0)

    -- Insert the logo image
    logo = display.newImageRect("Images/glowingLogo1.png", 500, 500)
    timer.performWithDelay(1000, afterTimer, 1)
end

function afterTimer()
logo.isVisible = false

end


 


    -- set the initial x and y position of the logo
    logo.x = 500
    logo.y = display.contentHeight/2

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( logo )
local image = display.newImage("logo.png")

local snapshot = display.newSnapshot( 800, 600 )
snapshot.x, snapshot.y = 400, 300

local snapshot2 = display.newSnapshot( 800, 600 )

snapshot.group:insert( snapshot2 )
snapshot2.group:insert( image )

--snapshot.fill = compositePaint

--image.fill.effect = "filter.blurGaussian"
--image.fill.effect.horizontal.blurSize = 38
--image.fill.effect.horizontal.sigma = 140
--image.fill.effect.vertical.blurSize = 38
--image.fill.effect.vertical.sigma = 140

snapshot2.fill.effect = "filter.bloom"
snapshot2.fill.effect.levels.white = 0.8
snapshot2.fill.effect.levels.black = 0.4
snapshot2.fill.effect.levels.gamma = 1
snapshot2.fill.effect.add.alpha = 0.8
snapshot2.fill.effect.blur.horizontal.blurSize = 40
snapshot2.fill.effect.blur.horizontal.sigma = 140
snapshot2.fill.effect.blur.vertical.blurSize = 40
snapshot2.fill.effect.blur.vertical.sigma = 140

--snapshot.fill.effect = "filter.exposure"
--snapshot.fill.effect.exposure = 2

local image2 = display.newImage("logo.png")
image2.x, image2.y = 400, 300

end -- function scene:create( event )

--------------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- start the splash screen music
        blipSoundsChannel = audio.play(blipSounds )

 

        -- Go to the main menu screen after the given time.
        timer.performWithDelay ( 3000, gotoMainMenu)          
        
    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is on screen (but is about to go off screen).
    -- Insert code here to "pause" the scene.
    -- Example: stop timers, stop animation, stop audio, etc.
    if ( phase == "will" ) then  

    -----------------------------------------------------------------------------------------

    -- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then
        
        -- stop the jungle sounds channel for this screen
        audio.stop(blipSoundsChannel)
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
