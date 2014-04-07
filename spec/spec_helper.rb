# Minitest spec.
require 'minitest/spec'
require 'minitest/autorun'

# Load setebos.
require 'setebos'

# Load every file in lib/setebos
Dir["./lib/setebos/*.rb"].each { |file| require file }
