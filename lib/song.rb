require 'pry'
class Song
  
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    artist != nil ? self.artist = artist: false
    genre != nil ? self.genre = genre: false
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
    
  def self.destroy_all
    while all.length != 0
      all.pop()
    end
  end
  
  def self.create(name)
   song = Song.new(name)
   song.save
   song
  end
  
  def artist=(artist)
    @artist=artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre=genre
    genre.add_song(self)
  end
  
  def self.new_from_filename(name)
    song_name = name.split(" - ")[1]
    song_artist = name.split(" - ")[0]
    song_genre = name.split(" - ")[2].chomp(".mp3")
    artist = Artist.find_or_create_by_name(song_artist)
    genre = Genre.find_or_create_by_name(song_genre)
    song = self.new(song_name, artist, genre)
  end
  
  def self.create_from_filename(name)
    song = new_from_filename(name)
    song.save
  end
  
end