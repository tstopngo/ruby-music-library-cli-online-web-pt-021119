require 'pry'

class MusicImporter
  
  attr_accessor :path

  def initialize(filepath)
    @path = filepath
  end
  
  def files
    Dir[@path + "/*.mp3"].collect do |filepath|
     filepath.split("/")[4] 
    end
  end

  def import
    files.each do |song|
      Song.create_from_filename(song)
    end
  end

end