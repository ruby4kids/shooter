class Gun
  attr_reader :player, :game_window, :bullets
  
  def initialize(player)
    @player = player
    @game_window = player.game_window
    @bullets = 10.times.map {Bullet.new(self)}
    @font = Gosu::Font.new(@game_window, 'System', 24)
  end
  
  def button_down(id)
    if id == Gosu::Button::KbSpace
      shoot
    end
  end
  
  def update
    @bullets.each {|bullet| bullet.update}
  end
  
  def shoot
    next_bullet.shoot if next_bullet
  end 
  
  def next_bullet
    @bullets.find {|bullet| bullet.available?}
  end
  
  def bullets_left
    @bullets.select {|bullet| bullet.available?}.size
  end
  
  def draw
    @font.draw("Bullets: #{bullets_left}", 550,500,4)
    @bullets.each {|bullet| bullet.draw}
  end
end
