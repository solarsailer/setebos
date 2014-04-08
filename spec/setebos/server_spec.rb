require 'spec_helper'

describe Setebos::Server do

  before do
    @server = Setebos::Server.new('test')
  end

  describe 'when asked to test a connection' do
    it 'must create a host for user@host' do
      # Server.
      server = Setebos::Server.new('hostname', user: 'user')

      # Test.
      server.remote().must_equal 'user@hostname'
    end

    it 'must create a host for user:password@host' do
      # Server
      server = Setebos::Server.new('hostname', user: 'user', password: 'password')

      # Test.
      server.remote().must_equal 'user:password@hostname'
    end
  end
end
