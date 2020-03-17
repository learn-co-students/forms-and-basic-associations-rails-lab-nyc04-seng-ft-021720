class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
 end

  def notes=(notes)
    notes.each do |note|
      unless note.empty?
      new_note = Note.find_or_create_by(content: note)
      self.notes << new_note 
      end
    end 
  end 
end
 
