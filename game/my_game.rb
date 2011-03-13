class My_game < Gosu::Window
  
  attr_reader :player, :targets
  
  def initialize(window_width, window_height)
    super(window_width,window_height,0)
    @background_image = background_image "media/pario_background.png"
    @player = Player.new(self)
    @targets = 5.times.map {|i| Target.new(self, i * 150, i * 20)}
    @font = Gosu::Font.new(self, 'System', 24)
  end
  
  def button_down(id)
    @player.button_down(id)
  end
  
  def targets_left
    @targets.select {|target| target.alive?}.size
  end
  
  def update
    @player.update
    @targets.each {|target| target.update}
  end

  def draw
    @player.draw
    @targets.each {|target| target.draw}
    @background_image.draw 0,0,0
    @font.draw("Targets: #{targets_left}", 50,550,4)
  end
end
