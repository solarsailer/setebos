require 'colorize'

# Logger.
class Logger

  # -------------------------------------------------------
  # Pre-formatted log.
  # -------------------------------------------------------

  # Public: Print a success message.
  #
  # message  - message.
  #
  # Returns nothing.
  def self.success(message)
    Logger.log message.colorize(:green).bold
  end

  # Public: Print an error message and **exit**.
  #
  # message  - message.
  #
  # Returns nothing.
  def self.error(message)
    Logger.log message.colorize(:red).bold
    exit 1
  end

  # Public: Print a warning message.
  #
  # message  - message.
  #
  # Returns nothing.
  def self.warning(message)
    Logger.log message.colorize(:orange)
  end

  # Public: Print an info message.
  #
  # message  - message.
  #
  # Returns nothing.
  def self.info(message)
    Logger.log message.colorize(:blue)
  end

  # Public: Print a message.
  #
  # message  - message.
  #
  # Returns nothing.
  def self.message(message)
    Logger.log message
  end

  # -------------------------------------------------------
  # Raw log.
  # -------------------------------------------------------

  def self.log(message)
    puts message
  end
end
