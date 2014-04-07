require 'setebos/logger'
require 'net/scp'

# Public: Server object.
class Server
  attr_accessor :host, :user, :password

  # Public: Create a server object.
  #
  # name     - the name of the server.
  # user     - (optional) the name of the user (default to root).
  # password - (optional) the password of the user.
  def initialize(host, user: 'root', password: nil)
    @host     = host
    @user     = user
    @password = password
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

    Net::SCP.start(@host, @user, hash) do |scp|
      scp.upload! local_path, remote_path
    end
  end
end
