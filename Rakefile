require 'rake'
require 'fileutils'

def git_clone(repo, target)
  path = translate_path(target)
  puts path
  FileUtils.rm_rf(path) if File.exists?(path)
  `git clone ""#{repo}"" "#{target}"`
end

def self.translate_path(path)
  if path[0].chr === '~'
    path[0] = ENV['HOME']
  end
  path
end

desc "Install"
task :install do
  Rake::Task[:install_plugins].execute
  Rake::Task[:install_symlinks].execute
  Rake::Task[:install_configs].execute
  Rake::Task[:install_vundle].execute
end

desc "Install all plugins"
task :install_plugins do
  system("script/install")
end

desc "Install zsh"
task :install_zsh do
  system("script/zshell")
end


desc "Hook our dotfiles into system-standard positions."
task :install_symlinks do
  linkables = Dir.glob('*/**{.symlink}', File::FNM_DOTMATCH)

  skip_all = false
  overwrite_all = false
  backup_all = false

  linkables.each do |linkable|
    overwrite = false
    backup = false

    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        when 'S' then skip_all = true
        when 's' then next
        end
      end
      FileUtils.rm_rf(target) if overwrite || overwrite_all
      `mv "$HOME/.#{file}" "$HOME/.#{file}.backup"` if backup || backup_all
    end
    `ln -s "$PWD/#{linkable}" "#{target}"`
  end
end

desc "Hook our configed files for certain apps into position."
task :install_configs do
  linkables = Dir.glob("config_files/**/*")

  skip_all = false
  overwrite_all = false
  backup_all = false

  linkables.each do |linkable|
    overwrite = false
    backup = false

    #get the file to be symlinkeds name
    name = linkable.split('/').last.split('.')[1]
    extension = linkable.split('/').last.split('.').last
    file = "#{name}.#{extension}"

    #get the target directory
    target_directory = "#{ENV["HOME"]}/Library/Application\ Support/"
    linkable.split('/').last.split('.').first.split('_').each do |folder|
      target_directory << "#{folder} "
    end


    target = "#{target_directory.strip}/#{file}"

    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        when 'S' then skip_all = true
        when 's' then next
        end
      end
      FileUtils.rm_rf(target) if overwrite || overwrite_all
      `mv "#{target}" "#{target}.backup"` if backup || backup_all
    end
    `ln -s "$PWD/#{linkable}" "#{target}"`
  end
end

desc "Install vundle for vim plugins"
task :install_vundle do
  target = "#{ENV["HOME"]}/.vim/vundle.git"
  git_clone('http://github.com/gmarik/vundle.git', target)

  puts "Running BundleClean to clean up any possible lyniced up stuff from a previous install."
  system("vim +BundleClean +qall")
  puts "Running BundleInstall to install plugins...this will take a couple minutes."
  system("vim +BundleInstall +qall")
  puts "vim plugins installed."
end

desc "Uninstall and remove symlinks"
task :uninstall do
  Rake::Task[:uninstall_plugins].execute
  Rake::Task[:uninstall_symlinks].execute
  Rake::Task[:uninstall_dotfiles].execute
  Rake::Task[:uninstall_zshell].execute
end

desc "Uninstall brew, apps, and plugins"
task :uninstall_plugins do
  system("script/uninstall")
end

desc "Remove symlinks and restore backups if exist"
task :uninstall_symlinks do
  Dir.glob('**/*.symlink').each do |linkable|

    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    # Remove all symlinks created during installation
    if File.symlink?(target)
      FileUtils.rm(target)
    end

    # Replace any backups made during installation
    if File.exists?("#{ENV["HOME"]}/.#{file}.backup")
      `mv "$HOME/.#{file}.backup" "$HOME/.#{file}"`
    end
  end
end

desc "Remove .dotfiles"
task :uninstall_dotfiles do
  system("rm -rf ~/.dotfiles")
end

task default: :install
