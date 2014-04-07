require 'spec_helper'

describe Setebos::Config do

  before do
    @file_01 = Setebos::Config.parse('samples/config01.yml')
    @file_02 = Setebos::Config.parse('samples/config02.yml')
  end

  describe 'when asked to parse a config file' do
    it 'must retrieve a server' do
      @file_01[:server][:host].must_equal 'setebos'
    end

    it 'must retrieve a list of files and a server' do
      @file_02[:server][:host].must_equal 'setebos'
      @file_02[:files].length.must_be :==, 2

      @file_02[:files][0][:from].must_equal 'samples/test01.txt'
      @file_02[:files][0][:to].must_equal '/tmp'

      @file_02[:files][1][:from].must_equal 'samples/test_with_$_chars_symb_42.md'
      @file_02[:files][1][:to].must_equal '/tmp/02/'
    end
  end

end
