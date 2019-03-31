class Artist
  
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
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
   artist = Artist.new(name)
   artist.save
   artist
  end
  
  def add_song(song)
    songs.include?(song) ? song: @songs << song
    song.artist == nil ? song.artist = self: song.artist 
  end
  
  def genres
    @songs.collect {|song| song.genre}.uniq
  end
  

  
end