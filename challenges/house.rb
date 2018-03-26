class House
  def self.recite
    rhyme = new
    rhyme.build_rhyme.rstrip + "\n"
  end

  def build_rhyme
    rhyme_pieces = pieces.reverse
    rhyme = ''
    rhyme << "This is the house that Jack built.\n\n"
    rhyme_parts = "the house that Jack built."
    rhyme_pieces[1..-1].each do |piece|
      line = piece.join("\n")
      rhyme << "This is #{line} " << "#{rhyme_parts}\n\n"
      rhyme_parts.prepend("#{line} ")
    end
    rhyme
  end

  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end