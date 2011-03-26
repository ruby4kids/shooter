class Player
  attr_reader :x, :y, :game_window, :gun
  attr_accessor :bombs
  
  def initialize(game_window)
    @bombs = game_window.bombs
    @alive = true
    @boom = Gosu::Song.new(game_window, "media/explosion.wav")
    @game_window = game_window
    @icon = Gosu::Image.new(game_window, "media/player.png", false)
    @icon_explosion = Gosu::Image.new(game_window, "media/player_explosion.png", false)
    @x = 300    
    @y = 450
    @gun = Gun.new(self)
  end
  
  def reset
    @alive = true
    @gun.reset
  end
  
  def center_x
    (@x + @icon.width)/2.0
  end
  
  def alive?
    @alive == true
  end
  
  def check_if_hit
     if (@alive and @bombs.any? {|bomb| bomb.hit_player?(self)})
       @alive = false 
       @boom.play
     end
   end
  
  def center_y
    (@y + @icon.height)/2.0
  end
  
  def button_down(id)
    @gun.button_down(id)
  end
  
  def update
    check_if_hit
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
    if alive?
      @icon.draw(@x, @y, 3)
    else
      @icon_explosion.draw(@x, @y, 3)
    end
    @gun.draw
  end

end
