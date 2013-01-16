if not initialized then
  MOAISim.openWindow("Live coding", 320, 480)
  local viewport = MOAIViewport.new()
  local gfxQuad = MOAIGfxQuad2D.new()
  prop1 = MOAIProp2D.new()
  prop2 = MOAIProp2D.new()
  prop2:setDeck(gfxQuad)
  
  local layer = MOAILayer2D.new()
  layer:setViewport(viewport)
  layer:insertProp(prop1)
  MOAISim.pushRenderPass(layer)

  local thread = MOAIThread.new()
  thread:run(function()
      while true do
        update()
        coroutine.yield()
      end
    end)
  initialized = true
end

function update()
  prop1:setLoc(40, 80)
  prop2:setLoc(-40, -120)
  MOAIGfxDevice.setClearColor(0.80,0.80,0.90,1)
end