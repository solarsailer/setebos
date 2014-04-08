require 'erb'
require 'yaml'
require 'active_support/core_ext/hash/indifferent_access'

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
    Logger.error 'Nonexistent file.'
  rescue
    Logger.error 'Invalid file.'
  end
end
