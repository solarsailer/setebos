# Minitest spec.
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

# Minitest color.
require 'minitest/ansi'
MiniTest::ANSI.use!

# Load setebos.
require 'setebos'

# Load every file in lib/setebos
Dir["./lib/setebos/*.rb"].each { |file| require file }

