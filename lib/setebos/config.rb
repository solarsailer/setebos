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
  # Returns an HashWithIndifferentAccess.
  def self.parse(path)
    config = YAML.load(
      ERB.new(
        File.read(path)
      ).result
    )

    HashWithIndifferentAccess.new(config)
  end
end
