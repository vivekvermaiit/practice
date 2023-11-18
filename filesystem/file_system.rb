load 'filesystem/entry.rb'
load 'filesystem/directory.rb'
load 'filesystem/files.rb'

class FileSystem
  attr_accessor :root, :current_directory

  def initialize
    @root=Directory.new("root",Time.now,Time.now)
    @current_directory = @root
  end

  def make_file(name)
    file = Files.new(name,Time.now,Time.now)
    file.parent=@current_directory
    @current_directory.contents << file
  end

  def make_directory(name)
    dir = Directory.new(name,Time.now,Time.now)
    dir.parent=@current_directory
    @current_directory.contents << dir
  end

  def pwd
    str=@current_directory.name
    it=@current_directory
    while it.parent!=nil
      it=it.parent
      str=it.name + "/" +str
    end
    str
  end
end