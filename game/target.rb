class Target
  
  attr_reader :x, :y, :game_window, :alive, :icon
  
  def initialize(game_window, x, y)
    @game_window = game_window
    @player = game_window.player
    @icon = Gosu::Image.new(game_window, "media/target.png", false)
    @icon_explosion = Gosu::Image.new(game_window, "media/explosion.png", false)
    @x = x
    @y = y
    @alive = true
    @boom = Gosu::Song.new(game_window, "media/explosion.wav")
  end
  
  def update
    check_if_hit
    if alive? and @x > @game_window.width
      @x = 0
    else
      @x = @x + 10
    end
  end
  
  def check_if_hit
    if (@alive and @player.gun.bullets.any? {|bullet| bullet.hit_target?(self)})
      @alive = false
      @boom.play
    end
  end
  
  def alive?
    @alive == true
  end
  
  def draw
    if @alive
      @icon.draw(@x, @y, 2)
    else
      @icon_explosion.draw(@x, @y, 2)
    end
  end
  
  def center_x
    (@x + @icon.width)/2.0
  end
  
  def center_y
    (@y + @icon.height)/2.0
  end
  
end
