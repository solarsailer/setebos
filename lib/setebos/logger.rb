require 'colorize'

# Logger.
class Logger
  def self.success(message)
    Logger.log message.colorize(:green).bold
  end

  def self.error(message)
    Logger.log message.colorize(:red).bold
  end

  def self.info(message)
    Logger.log message.colorize(:blue)
  end

  def self.message(message)
    Logger.log message
  end

  def self.log(message)
    puts message
  end
end
