class Player
  attr_reader :x, :y, :game_window, :gun

  def initialize(game_window)
    @game_window = game_window
    @icon = Gosu::Image.new(game_window, "media/player.png", false)
    @x = 80
    @y = 450
    @gun = Gun.new(self)
  end

  def button_down(id)
    if id == Gosu::Button::KbSpace
      @gun.shoot
    end
  end

  def update
    if @game_window.button_down? Gosu::Button::KbLeft
      turn_left
    end

    if @game_window.button_down? Gosu::Button::KbRight
      turn_right
    end

    @gun.update
  end

  def turn_left
    if @x < 0
      @x = 0
    else
      @x = @x - 20
    end
  end

  def turn_right
    if @x > @game_window.width
      @x = @game_window.width - @icon.width
    else
      @x = @x + 20
    end
  end

  def draw
    @icon.draw(@x, @y, 3)
    @gun.draw
  end

end
