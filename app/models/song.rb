class Song < ActiveRecord::Base
  belongs_to :genre
  belongs_to :artist
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_id=(genre)
    self.genre = Genre.find_by(name: genre)
    self.genre.id 
  end

  def genre_id
    self.genre ? self.genre_id : nil
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
