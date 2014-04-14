require 'formula'

class DirectoryWatcher < Formula

  version '1.1'
  homepage 'https://github.com/joshes/directory-watcher'
  url 'https://github.com/joshes/directory-watcher/releases/download/directory-watcher-1.1/DirectoryWatcher.jar'
  sha1 '0e804fb61ffd22c80ec39e68b8d03167b32d2c22'

  def install
    libexec.install 'DirectoryWatcher.jar'
    bin.write_jar_script libexec/'DirectoryWatcher.jar', 'DirectoryWatcher'
  end

end
