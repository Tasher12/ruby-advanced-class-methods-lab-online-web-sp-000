class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song_name = self.new 
    song_name.save 
    song_name
  end 
  

  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new 
    song.name = song_name
    song.save  
    song 
  end
  
  def self.find_by_name(name)
    self.all.find {|find| find.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end 
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end 
  
  def self.new_from_filename(name)
    names = filename.split(" - ")
      song = self.new 
      song_name = data[0]
      artist_name = data[1].gsub(".mp3")
      song_name = self.new 
      song.name = name
      song.artist_name = artist_name
      song 
   end 
  end
  
  def self.destroy_all
    @@all.clear 
  end
  
end
