require 'spec_helper'

describe Setebos::Server do

  before do
    @server = Setebos::Server.new('test')
  end

  describe 'when asked to create a server' do
    it 'must have an hostname and default values for user/password' do
      server = Setebos::Server.new('test')
      server.hostname.must_equal 'test'
      server.user.must_equal     'root'
      server.password.must_equal nil
    end

    it 'must have an hostname and a user with a nil password' do
      server = Setebos::Server.new('test', user: 'test_user')
      server.hostname.must_equal 'test'
      server.user.must_equal     'test_user'
      server.password.must_equal nil
    end

    it 'must have an hostname, a user and a password' do
      server = Setebos::Server.new('test', user: 'test_user', password: 'pass42')
      server.hostname.must_equal 'test'
      server.user.must_equal     'test_user'
      server.password.must_equal 'pass42'
    end
  end

  describe 'when asked to get a password hash' do
    it 'must return an empty hash' do
      server = Setebos::Server.new('test')
      server.password_hash.must_equal Hash.new
    end

    it 'must return an hash with the password' do
      server = Setebos::Server.new('test', password: 'test42')
      hash = {:password => 'test42'}
      server.password_hash.must_equal hash
    end
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
