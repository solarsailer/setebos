require 'setebos/logger'

class Setebos::Run

  # Public: Constructor.
  def initialize(path)
    @config = Setebos::Config.parse(path)
    Logger.error 'Invalid or nonexistent file.' if not @config
  end
end
