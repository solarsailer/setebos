require 'colorize'

# Logger.
class Logger

  # -------------------------------------------------------
  # Pre-formatted log.
  # -------------------------------------------------------

  # Public: Print a success message and exit.
  #
  # message  - message.
  #
  # Returns nothing.
  def self.success(message)
    Logger.log message.colorize(:green).bold
  end

  # Public: Print an error message and exit.
  #
  # message  - message.
  # exit_now - should exit the program? Default to true.
  #
  # Returns nothing.
  def self.error(message, exit_now: true)
    Logger.log message.colorize(:red).bold
    exit 1 if exit_now
  end

  # Public: Print an info message and exit.
  #
  # message  - message.
  #
  # Returns nothing.
  def self.info(message)
    Logger.log message.colorize(:blue)
  end

  # Public: Print a message and exit.
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
