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
  # Returns an HashWithIndifferentAccess or nil.
  def self.parse(path)
    config = YAML.load(
      ERB.new(
        File.read(path)
      ).result
    )

    HashWithIndifferentAccess.new(config)
  rescue
    nil
  end
end
