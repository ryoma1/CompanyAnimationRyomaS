-----------------------------------------------------------------------------------------
--
-- main.lua
-- Created by: Ryoma Scott
-- Date: April 19, 2018
-- Description: This calls the splash screen of the app to load itself.
-----------------------------------------------------------------------------------------

--hide status bar
display.setStatusBar(display.HiddenStatusBar)
-----------------------------------------------------------------------------------------


-- Use composer library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Go to the intro screen
composer.gotoScene( "splash_screen" )
