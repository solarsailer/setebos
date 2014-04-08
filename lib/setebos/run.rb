require 'setebos/messages'
require 'setebos/logger'
require 'setebos/config'
require 'setebos/server'

class Setebos::Run

  # Public: Constructor.
  def initialize(path)
    @config = Setebos::Config.parse(path)

    # Init server.
    @server = create_server(@config[:server])

    # Send files.
    send_files(@config[:files])
  end

  # -------------------------------------------------------
  # Private.
  # -------------------------------------------------------

  private

  def validate_files_section(files_section)
    Logger.error Setebos::Messages::FILES_NIL if not files_section
    Logger.error Setebos::Messages::FILES_NOT_ARRAY if not files_section.kind_of?(Array)
  end

  # Private: Create a server with the :server section of the config file.
  #
  # server_section - Server section of the config file.
  #
  # Returns a Setebos::Server.
  def create_server(server_section)
    Logger.info Setebos::Messages::SERVER_START % server_section.to_s

    # Create.
    server = Setebos::Server.new(
      server_section[:host],
      user:     server_section[:user],
      password: server_section[:password]
    )

    # Test reachability.
    reachable = server.test()
    Logger.error Setebos::Messages::NOT_REACHABLE if not reachable

    Logger.success Setebos::Messages::SERVER_OK

    # Return the server.
    server
  end

  # Private: Send files to the machine.
  #
  # files_section - Array of files [{to: '...', from: '...'}, {...}].
  #
  # Returns nothing.
  def send_files(files_section)
    validate_files_section(files_section)

    Logger.info Setebos::Messages::SEND_FILES_START

    errors = @server.send_files(files_section)
    errors.each do |err|
      Logger.warning Setebos::Messages::FILE_NOT_SEND % err
    end

    Logger.success Setebos::Messages::SEND_FILES_OK
  end
end
