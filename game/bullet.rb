class Bullet
  attr_reader :x, :y
  
  def initialize(gun)
    @gun = gun
    @game_window = gun.game_window
    @player = gun.player
    @x = @player.x
    @y = @player.y
    @icon = Gosu::Image.new(@game_window, "media/bullet.png", false)
  end
  
  def update
    @y = @y - 10
  end
  
  def hit_target?(target)
    Gosu::distance(@x, @y, target.x, target.y) < 20
  end
  
  def draw
    @icon.draw(@x, @y, 4)
  end
  
end
