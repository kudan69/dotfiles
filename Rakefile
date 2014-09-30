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
end

desc "Install all plugins"
task :install_plugins do
  exec("script/install")
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
  Rake::Task[:vundle].execute
end

task :uninstall do
  exec("script/uninstall")

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

desc "Install vundle for vim plugins"
task :vundle do
  target = "#{ENV["HOME"]}/.vim/vundle.git"
  git_clone('http://github.com/gmarik/vundle.git', target)

  puts "Running BundleClean to clean up any possible lyniced up stuff from a previous install."
  `vim +BundleClean +qall`
  puts "Running BundleInstall to install plugins...this will take a couple minutes."
  `vim +BundleInstall +qall`
  puts "vim plugins installed."
end

task default: :install
