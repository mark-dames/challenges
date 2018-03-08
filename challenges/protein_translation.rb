class InvalidCodonError < StandardError; end

class Translation
  TO_PROTEIN = {
    %w(AUG) => 'Methionine',
    %w(UUU UUC) => 'Phenylalanine',
    %w(UUA UUG) => 'Leucine',
    %w(UCU UCC UCA UCG) => 'Serine',
    %w(UAU UAC) => 'Tyrosine',
    %w(UGU UGC) => 'Cysteine',
    %w(UGG) => 'Tryptophan',
    %w(UAA UAG UGA) => 'STOP'
  }
  
  def self.of_codon(codon)
    result = TO_PROTEIN.keys.find { |codon_sequence| codon_sequence.include?(codon) }
    TO_PROTEIN[result]
  end
  
  def self.of_rna(strand)
    raise InvalidCodonError unless strand.match(/([AUGC]{3})+/)
    codons = strand.scan(/[AUGC]{3}/)
    proteins = []
    codons.each do |codon|
      protein = of_codon(codon)
      protein == 'STOP' ? break : proteins << protein
    end
    proteins
  end
end