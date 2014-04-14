require 'formula'
require 'fileutils'

class CqTools < Formula

  version '1.0'
  homepage 'https://github.com/joshes/cq-tools'
  url 'https://github.com/joshes/cq-tools/archive/1.0.tar.gz'
  sha1 'b6b1cc167330e4e89a040ac3bc12ba167daca2b7'

  # Also depends on Java 7! Not sure if we can do much about it here

  depends_on 'ruby'

  # This is really optional based on if the user will use cq-sync or not
  depends_on 'directory-watcher'

  def install

    system 'gem', 'install', 'json'
    system 'gem', 'install', 'nokogiri'
    system 'gem', 'install', 'activesupport'

    bin.install 'cq-checklib'
    bin.install 'cq-clean'
    bin.install 'cq-kill'
    bin.install 'cq-new-project'
    bin.install 'cq-running'
    bin.install 'cq-set-server'
    bin.install 'cq-set-workspace'
    bin.install 'cq-start'
    bin.install 'cq-stop'
    bin.install 'cq-sync'
    bin.install 'cq-tail'
    bin.install 'cq_build.rb'
    bin.install 'cq_common.rb'
    bin.install 'cq_configuration.rb'
    bin.install 'cq_configuration_setter.rb'
    bin.install 'cq_filewatch_handler.rb'

    # config files
    FileUtils.copy '.cq', File.expand_path '~'

  end

  def caveats
    <<-EOS.undent

    cq-tools configuration files were created - note: Java 7 is required for cq-sync.

    You *MUST* configure the system before using these tools!!

    1. Add 'source ~/.cq/env' to ~/.bash_profile
    2. Edit ~/.cq/cfg to your requirements, adding as many servers and/or workspaces as required
    2. Run: cq-set-server and choose the server you want to use for the current session
    3. Run: cq-set-workspace and choose the workspace you want to use for the current session

    These scripts effectively manage the ~/.cq/env file for you based on your configuration settings.

    ### More information
    You can read more on the cq-tools here: https://github.com/joshes/cq-tools

    EOS
  end

end
