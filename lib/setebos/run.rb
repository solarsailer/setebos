require 'setebos/logger'
require 'setebos/config'
require 'setebos/server'

class Setebos::Run

  # Public: Constructor.
  def initialize(path)
    @config = Setebos::Config.parse(path)
    Logger.error 'Invalid or nonexistent file.' if not @config

    # Server.
    @server = create_server(@config[:server])
  end

  # -------------------------------------------------------
  # Private.
  # -------------------------------------------------------

  private

  # Private: Create a server with the :server section of the config file.
  #
  # server_section - Server section of the config file..
  #
  # Returns a Setebos::Server.
  def create_server(server_section)
    server = Setebos::Server.new(
      server_section[:host],
      user:     server_section[:user],
      password: server_section[:password]
    )
  end
end
