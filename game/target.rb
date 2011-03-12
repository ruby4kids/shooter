class Target
  
  attr_reader :x, :y, :game_window, :alive
  
  def initialize(game_window, x, y)
    @game_window = game_window
    @player = game_window.player
    @icon = Gosu::Image.new(game_window, "media/duck.png", false)
    @x = x
    @y = y
    @alive = true
  end
  
  def update
    check_if_hit
    if alive?
      if @x > @game_window.width
        @x = 0
      else
        @x = @x + 20
      end
    end
  end
  
  def check_if_hit
    if (@alive and @player.gun.bullets.any? {|bullet| bullet.hit_target?(self)})
      @alive = false
    end
  end
  
  def alive?
    @alive = true
  end
  
  def draw
    if @alive
      @icon.draw(@x, @y, 2)
    end
  end
  
end
