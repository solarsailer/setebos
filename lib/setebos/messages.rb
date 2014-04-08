# Messages.
class Setebos::Messages

  # Setebos::Config.
  CONFIG_NONEXISTENT = 'Nonexistent file.'
  CONFIG_INVALID     = 'Invalid file.'

  # Setebos::Run.
  FILES_NIL        = 'There is no `files` section in the config.'
  FILES_NOT_ARRAY  = 'The `files` section is not a list.'

  SERVER_START     = 'Use server %s...'
  SERVER_OK        = 'Server done.'

  NOT_REACHABLE    = 'The server is not reachable.'


  SEND_FILES_START = 'Send files...'
  SEND_FILES_OK    = 'Sending files done.'
  FILE_NOT_SEND    = 'Warning: cannot send the %s file.'
end
