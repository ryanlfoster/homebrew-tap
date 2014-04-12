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

    bin.install 'brewpath'
    bin.install 'cq-checklib'
    bin.install 'cq-common.rb'
    bin.install 'cq-filewatch-handler.rb'
    bin.install 'cq-kill'
    bin.install 'cq-new-project'
    bin.install 'cq-running'
    bin.install 'cq-set.rb'
    bin.install 'cq-set-branch'
    bin.install 'cq-set-server'
    bin.install 'cq-start'
    bin.install 'cq-stop'
    bin.install 'cq-sync'
    bin.install 'cq-tail'

    # config files
    FileUtils.copy '.cq', File.expand_path '~'

  end

  def caveats
    <<-EOS.undent

    cq-tools configuration files were created.

    You *MUST* configure the system before using these tools. As well, Java 7 is required for cq-sync.

    There are two ways to configure these tools.

    1. Simple - if you only have one project and one CQ instance use this
    2. Switchable - if you have multiple projects or switch between multiple CQ servers use this

    ### Simple

    1. Edit ~/.cq-env to match your system

    **CQ_SERVER_HOME** should point to the root of your server (e.g. ~/Servers/cq5/cq-quickstart)

    **CQ_BRANCH_HOME** should point to your CQ project and is only necessary to be set if you use cq-sync - this will sync all files realtime found under /jcr_root/

    ### Switchable

    1. Edit ~/.cq-cfg to your requirements, adding as many servers and/or branches as required
    2. Run: cq-set-server and choose the server you want to use for the current session
    3. Run: cq-set-branch and choose the branch you want to use for the current session

    These scripts effectively manage the .cq-env file for you based on your configuration settings.


    ### More information
    You can read more on the cq-tools here: https://github.com/joshes/cq-tools

    EOS
  end

end
