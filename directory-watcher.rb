require 'formula'

class DirectoryWatcher < Formula

  version '1.0'
  homepage 'https://github.com/joshes/directory-watcher'
  url 'https://github.com/joshes/directory-watcher/releases/download/directory-watcher-1.0/DirectoryWatcher.jar'
  sha1 'b4350783b1bdb7f2778ce849784685cad91e0d31'

  def install
    libexec.install 'DirectoryWatcher.jar'
    bin.write_jar_script libexec/'DirectoryWatcher.jar', 'DirectoryWatcher'
  end

end
