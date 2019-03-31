class Genre
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :songs
  @@all = []
  
  def initialize(name, genre = nil)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    while all.length != 0
      all.pop()
    end
  end
  
  def self.create(name)
   genre = Genre.new(name)
   genre.save
   genre
  end
  
  def add_song(song)
    songs.include?(song) ? song: @songs << song
    song.artist == nil ? song.artist = self: song.artist 
  end
  
  def artists
    songs.collect{|song| song.artist}.uniq
  end
  
  
end