class Song
  attr_accessor :name, :artist

   def initialize(name)
    @name = name
  end

   def self.new_by_filename(filename)
    an_artist, song = filename.split(" - ") # find the artist and song in a filename by parsing
    #create new song instance using the string we gathered from the filename
    new_song = self.new(song)
    #the new song will have an artist associated with it
    new_song.artist_name = an_artist
    #return the new_song instance
    new_song
  end

   def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    #the class method artist
    self.artist.add_song(self)
    #the class method
  end
end
