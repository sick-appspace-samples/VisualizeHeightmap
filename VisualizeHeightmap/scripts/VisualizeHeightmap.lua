--[[----------------------------------------------------------------------------
  Application Name:
  VisualizeHeightmap

  Description:
  Visualizing heightmaps in 3D viewer

  How to Run:
  Starting this sample is possible either by running the app (F5) or
  debugging (F7+F10). Setting breakpoint on the first row inside the 'main'
  function allows debugging step-by-step after 'Engine.OnStarted' event.
  Results can be seen in the 3D viewer on the DevicePage.
  Restarting the Sample may be necessary to show images after loading the webpage.
  To run this Sample a device with SICK Algorithm API and AppEngine >= V2.5.0 is
  required. For example SIM4000 with latest firmware. Alternatively the Emulator
  on AppStudio 2.3 or higher can be used.

------------------------------------------------------------------------------]]
local viewer = View.create('viewer3D1')
local imgDeco = View.ImageDecoration.create()

--Start of Function and Event Scope---------------------------------------------

local function main()
  -- Loading the image from the resources folder
  local data = Object.load('resources/image_21.json')

  -- Extracting the heightmap, intensity map and sensor data
  local hMap = data[1]
  local iMap = data[2]
  local sensorData = data[3] -- Use debug mode to see its content
  local _ = sensorData -- necessary to calm down luacheck
  -- Set color range for optimized height visualization
  local min = hMap:getMin()
  local max = hMap:getMax()
  imgDeco:setRange(min, max)

  -- Adding the heightmap and the intensity map to the viewer
  viewer:addHeightmap({hMap, iMap}, imgDeco, {'Reflectance'})

  -- Presenting the data to the viewer
  viewer:present()
end

-- Serve API in global scope
Script.register('Engine.OnStarted', main)
