require 'erb'
require 'yaml'

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
  # Returns an Hash.
  def self.parse(path)
    YAML.load(
      ERB.new(
        File.read(path)
      ).result
    )
  end
end
