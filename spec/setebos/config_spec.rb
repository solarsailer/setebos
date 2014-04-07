require 'spec_helper'

describe Setebos::Config do

  before do
    @file_01 = Setebos::Config.parse('samples/config01.yml')
    @file_02 = Setebos::Config.parse('samples/config02.yml')
  end

  describe "when asked to parse a config file" do
    it "must retrieve a server" do
      @file_01[:server][:host].must_equal "setebos"
    end

    it "must retrieve a list of files and a server" do
      @file_02[:server][:host].must_equal "setebos"
    end
  end

end
