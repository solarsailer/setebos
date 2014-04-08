require 'setebos/logger'
require 'setebos/config'
require 'setebos/server'

class Setebos::Run

  # Public: Constructor.
  def initialize(path)
    @config = Setebos::Config.parse(path)

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
    Logger.info "Create a server for #{server_section.to_s}..."

    server = Setebos::Server.new(
      server_section[:host],
      user:     server_section[:user],
      password: server_section[:password]
    )

    reachable = server.test()
    Logger.error 'The server is not reachable. Abort.' if not reachable
  end
end
