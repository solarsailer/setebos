require 'spec_helper'

describe Setebos::Config do

  describe "when asked to parse a config file" do
    it "must load a simple config file" do
      result = Setebos::Config.parse('samples/config01.yml')
      puts result
    end
  end

end
