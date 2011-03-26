class Bomb
  def initialize(target)
    @target = target
    @dropped = false   
    @x = -1
    @y = -1
    @icon = Gosu::Image.new(@target.game_window, "media/bullet.png", false)
    @game_window = target.game_window
  end
  
  def reset
    @dropped = false
    @x = -1
    @y = -1
  end
  
  def hit_player?(player)
    hit = Gosu::distance(center_x, center_y, player.center_x, player.center_y) < 20
    hit
  end
  
  def center_x
    (@x + @icon.width)/2.0
  end
  
  def center_y
    (@y + @icon.height)/2.0
  end
  
  def update
   if dropped?
     @y = @y + 5
   end
  end
  
  def dropped?
   @dropped == true  
  end
  
  def unused?
    @dropped == false
  end
  
  def drop
    if @dropped == false
      @dropped = true
      @x = @target.x
      @y = @target.y
    end
  end
  
  def draw
    @icon.draw(@x, @y, 4)
  end

     
end 

