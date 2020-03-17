class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :artist
  belongs_to :genre


  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if self.artist 
      self.artist.name
    end
  end 

  def notes=(notes)
    notes.each do |note|
      if !note.empty?
      new_note = Note.find_or_create_by(content: note)
      self.notes << new_note 
      end
    end 
  end 
end
