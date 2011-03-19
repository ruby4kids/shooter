class Bomb
  def initialize(target)
    @target = target
    @dropped = false   
    @x = -1
    @y = -1
    @icon = Gosu::Image.new(@target.game_window, "media/bullet.png", false)
    @game_window = target.game_window
  end
  
  def update
   if dropped?
     @y = @y - 20
   end
  end
  
  def dropped?
   @dropped == true  
  end
  
  def unused?
    @dropped == false
  end
  
  def drop
    @dropped = true
    @x = @target.x
    @y = @target.y
  end
  
  def draw
    @icon.draw(@x, @y, 4)
  end

     
end 

