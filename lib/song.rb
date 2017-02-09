require 'pry'
class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end


  def self.new_by_filename(file_name)
    file_name = file_name[0...file_name.length-4]
    artist_name = file_name.split(" - ")[0]
    song_name = file_name.split(" - ")[1]
    artist = Artist.find_or_create_by_name(artist_name)
    song = self.new(song_name)
    song.artist = artist
    artist.add_song(song)
    song
  end

end
