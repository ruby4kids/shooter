class Bullet
  attr_reader :x, :y
  
  def initialize(gun)
    @gun = gun
    @game_window = gun.game_window
    @player = gun.player
    @x = -100
    @y = -100
    @icon = Gosu::Image.new(@game_window, "media/bullet.png", false)
    @shot = false
  end
  
  def update
    if @shot == true
      @y = @y - 20
    end
  end
  
  def shoot
    @x = @player.x
    @y = @player.y
    @shot = true
  end
  
  def available?
    @shot == false
  end
  
  def hit_target?(target)
    hit = Gosu::distance(center_x, center_y, target.center_x, target.center_y) < 20
    hit
  end
  
  def center_x
    (@x + @icon.width)/2.0
  end
  
  def center_y
    (@y + @icon.height)/2.0
  end
  
  def draw
    @icon.draw(@x, @y, 4)
  end
  
end
