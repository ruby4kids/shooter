class Gun
  attr_reader :player, :game_window, :bullets
  
  def initialize(player)
    @player = player
    @game_window = player.game_window
    @max_bullets = 100
    @bullet_count = 0
    @bullets = []
  end
  
  def shoot
    @bullet_count += 1
    if @bullet_count < @max_bullets
      @bullets << Bullet.new(self)
    end
  end
  
  def update
    @bullets.each {|bullet| bullet.update}
  end
  
  def draw
    @bullets.each {|bullet| bullet.draw}
  end
end
