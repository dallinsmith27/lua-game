local function bookInit(book,x,y,other)
  book = world:newRectangleCollider(x ,y ,16,20)
  book.x = x
  book.y = y
  book.dead = false
  book.name = "book"
  book.touchInteraction = false
  book.animSpeed = .15
  book.color = other
  book.isOpen = false

  book.Sheet = love.graphics.newImage("sprites/book.png")
  book.animations = {}
  book.height = 32
  book.width = 32
  book.grid = anim8.newGrid(book.width, book.height, book.Sheet:getWidth(), book.Sheet:getHeight())
  book.anim = anim8.newAnimation(book.grid('1-8', 1), book.animSpeed)




  function book:load()
    
    if book.color == "red" then
      book.anim = anim8.newAnimation(book.grid('1-2', 1), book.animSpeed)
    elseif book.color == "blue" then
      book.anim = anim8.newAnimation(book.grid('3-4', 1), book.animSpeed)
    elseif book.color == "black" then
      book.anim = anim8.newAnimation(book.grid('5-6', 1), book.animSpeed)
    else
      book.anim = anim8.newAnimation(book.grid('7-8', 1), book.animSpeed)
    end

    book:setCollisionClass('item')
    book:setType("static")

  end

  function book:update(dt)

    if book.isOpen then
      book.anim:gotoFrame(2)
    else
      book.anim:gotoFrame(1)
    end

  end

  function book:draw()
    book.anim:draw(book.Sheet,book:getX() - 16 ,book:getY()-8)

  end


  return book

end

return bookInit
