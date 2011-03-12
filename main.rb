$:.unshift(File.expand_path("../game", __FILE__))
$:.unshift(File.expand_path("../lib", __FILE__))

require 'rubygems'
require 'gosu'
require 'yaml'

Dir['{game,lib}/*.rb'].each { |f| require File.basename(f[0..-4]) }

config = YAML::load(File.open("config/config.yml"))

#Add lib includes here
include Util

game = My_game.new(config[:screen_height], config[:screen_width])
game.show
