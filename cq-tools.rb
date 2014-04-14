require 'formula'
require 'fileutils'

class CqTools < Formula

  version '1.1'
  homepage 'https://github.com/joshes/cq-tools'
  url 'https://github.com/joshes/cq-tools/archive/1.1.zip'
  sha1 '01be7c715379f23d442316a2561f1c38843aad39'

  # Also depends on Java 7! Not sure if we can do much about it here

  depends_on 'ruby'

  # This is really optional based on if the user will use cq-sync or not
  depends_on 'directory-watcher'

  def copy_unless_there(check, src, dst)
    if File.exists? check
      puts "Not overwriting existing file at: #{check}"
    else
      FileUtils.copy(src, dst)
    end
  end

  def install

    # TODO need to check if these are already installed ...
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
    home_dir = File.expand_path('~')
    dest_dir = File.join(home_dir, '.cq')
    env_file = File.join(dest_dir, 'env')
    cfg_file = File.join(dest_dir, 'cfg')

    if !File.exists? dest_dir
      FileUtils.makedirs(dest_dir)
    end

    copy_unless_there env_file, '.cq/env', dest_dir
    copy_unless_there cfg_file, '.cq/cfg', dest_dir

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
