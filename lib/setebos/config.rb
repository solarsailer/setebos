require 'active_support/core_ext/hash/indifferent_access'
require 'erb'
require 'yaml'

require 'setebos/messages'

class Setebos::Config

  # Public: Parse a configuration file.
  #
  # path - the config file path.
  #
  # Examples
  #
  #   Config.parse(./setebos.yml)
  #   # => Hash
  #
  # Returns an HashWithIndifferentAccess
  # Exit with a message if an error is rescued.
  def self.parse(path)
    config = YAML.load(
      ERB.new(
        File.read(path)
      ).result
    )

    HashWithIndifferentAccess.new(config)

  # Exit with a message if error.
  rescue Errno::ENOENT
    Logger.error Setebos::Messages::CONFIG_NONEXISTENT
  rescue
    Logger.error Setebos::Messages::CONFIG_INVALID
  end
end
