require 'setebos/version'
require 'setebos/run'

# Setebos main class.
class Setebos::Setebos

  # Public: Execute the `run` command.
  #
  # path  - file path.
  #
  # Returns nothing.
  def self.run(path)
    Setebos::Run.new(path)
  end
end
