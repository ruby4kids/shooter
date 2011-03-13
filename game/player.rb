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
    @gun.button_down(id)
  end
  
  def update
    if @game_window.button_down? Gosu::Button::KbLeft
      move_left
    end
    if @game_window.button_down? Gosu::Button::KbRight
      move_right
    end
    @gun.update
  end

  def move_left
    @x -= 10 if @x > 0
  end

  def move_right
    @x += 10 if @x < @game_window.width - @icon.width
  end

  def draw
    @icon.draw(@x, @y, 3)
    @gun.draw
  end

end
