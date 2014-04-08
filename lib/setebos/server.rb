require 'setebos/logger'
require 'net/scp'

# Public: Server object.
class Setebos::Server

  TEST_MESSAGE = 'A test connection was successfully established with the server.'

  attr_accessor :hostname, :user, :password

  # Public: Create a server object.
  #
  # hostname - the name of the server.
  # user     - (optional) the name of the user (default to root).
  # password - (optional) the password of the user.
  def initialize(hostname, options = {})
    @hostname = hostname
    @user     = options[:user]     || 'root'
    @password = options[:password] || nil
  end

  # Public: Test the connection to the server.
  #
  # Returns `true` if success, `false` otherwise.
  def test
    system("ssh -q #{remote()} 'echo #{TEST_MESSAGE}'")
  end

  # Public: Send a group of files.
  # Print an error log if the file cannot be send.
  #
  # files  - An array of files (a file is an hash of the form {:from, :path}.
  #
  # Examples
  #
  #   send_files([ {from: /l, to: /r}
  #              , {from: /l2, to: /r2}
  #              ])
  #   # => nil
  #
  # Returns nothing.
  def send_files(files)
    files.each do |f|
      if f[:from] and f[:to]
        scp f[:from], f[:to]
      else
        Logger.error "File: cannot send #{f}."
      end
    end
  end

  # Public: Create a remote path.
  #
  # Examples
  #
  #   # Given a server with hostname = 'server' and user = 'user':
  #   remote()
  #   # => 'user@server'
  #
  #   # Given a server with hostname = 'server' and user = 'user'
  #   # and password = 'password':
  #   remote()
  #   # => 'user:password@server'
  #
  # Returns a String containing the user/password/hostname.
  def remote
    "#{@user}#{@password ? ":#{@password}" : ''}@#{@hostname}"
  end

  # -------------------------------------------------------
  # Private.
  # -------------------------------------------------------

  private

  # Private: Send a file via SCP.
  #
  # local_path  - the path of the local file.
  # remote_path - the path of the remote file.
  #
  # Examples
  #
  #   scp('./tmp.txt', '/pxn/files/tmp.txt')
  #   # => nil
  #
  # Returns nothing.
  def scp(local_path, remote_path)
    hash = {}
    hash[:password] = @password if @password

    Net::SCP.start(@hostname, @user, hash) do |scp|
      scp.upload! local_path, remote_path
    end
  end
end
