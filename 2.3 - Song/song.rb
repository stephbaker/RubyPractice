class Note
  attr_accessor :tone_hz
  attr_accessor :duration_ms
  attr_accessor :next

  def initialize(tone_hz, duration_ms)
    @tone_hz = tone_hz
    @duration_ms = duration_ms
    @next = nil
  end

  def play
    puts "Playing a #{tone_hz} hz note for #{duration_ms} milliseconds"
  end
end

class Song
  attr_accessor :first_note

  def initialize(first_note)
    @first_note = first_note
  end

  def play
    current_note = first_note

    while current_note
      current_note.play
      current_note = current_note.next
    end
  end

  def duration_ms
    song_duration_ms = 0
    current_note = first_note
  
    while current_note 
      song_duration_ms += current_note.duration_ms
      current_note = current_note.next
    end
  
    song_duration_ms
  end

  def last_note
    current_note = first_note
    last_note = first_note

    while current_note
      last_note = current_note if !current_note.next
      current_note = current_note.next
    end
    last_note
  end

  def add_note(first_note)
    last_note.next = first_note
  end

end


## Make some notes
g3 = Note.new(196.0, 400)
e4 = Note.new(329.6, 400)
c4 = Note.new(261.6, 400)

# Make a short song with the notes
first_note = g3
first_note.next = e4

#make a song
first_song = Song.new(first_note)

# Play the song
first_song.play

# Print the length of the song
puts "This song is #{first_song.duration_ms} milliseconds long."

# Find the last note
last_note = first_song.last_note
puts "The last note is #{last_note.tone_hz} hz."

#Add another note
first_song.add_note(c4)

# Re-play the song
first_song.play

# Re-print the length of the song
puts "This song is #{first_song.duration_ms} milliseconds long."
