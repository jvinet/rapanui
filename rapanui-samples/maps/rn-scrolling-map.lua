------------------------------------------------------------------------------------------------------------------------
--
-- RapaNui
--
-- by Ymobe ltd  (http://ymobe.co.uk)
--
-- LICENSE:
--
-- RapaNui uses the Common Public Attribution License Version 1.0 (CPAL) http://www.opensource.org/licenses/cpal_1.0.
-- CPAL is an Open Source Initiative approved
-- license based on the Mozilla Public License, with the added requirement that you attribute
-- Moai (http://getmoai.com/) and RapaNui in the credits of your program.
--
------------------------------------------------------------------------------------------------------------------------
--
-- Tiles of the map from:
--
-- gfxlib
--
-- Product	: gfxlib-fuzed.zip
-- Website	: http://www.spicypixel.net
-- Author	: Marc Russell
-- Released: 10th January 2008
--
--
-- gfxlib is under Common Public License (http://www.opensource.org/licenses/cpl1.0.php)
--
------------------------------------------------------------------------------------------------------------------------

require("RNMapFactory")
require("RNMap")
require("RNMapLayer")
require("RNMapObject")
require("RNMapObjectGroup")
require("RNMapTileset")
require("RNUtil")


local background = RNFactory.createImage("rapanui-samples/maps/platformbck.png")


map = RNMapFactory.loadMap(RNMapFactory.TILED, "rapanui-samples/maps/platform.tmx")


aTileset = map:getTileset(0)

aTileset:updateImageSource("rapanui-samples/maps/platformtiles.png")


local layersSize = map:getLayersSize()

tilesCreated = 0
map:drawMapAt(0, 0, aTileset)

lastx = 0
delta = -32
function update(enterFrame)
    map:drawMapAt(lastx, 0, aTileset)
    lastx = lastx + delta

    if lastx <= -1280 then
        delta = 64
    end

    if lastx >= 0 then
        delta = -64
    end
end

RNListeners:addEventListener("enterFrame", update)