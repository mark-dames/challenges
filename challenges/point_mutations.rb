class DNA
  def initialize(strand)
    @strand = strand
  end
  
  def hamming_distance(strand2)
    distance = 0
    min, max = [@strand, strand2].sort_by { |strand| strand.size }
    min.each_char.with_index do |char, idx|
      distance += 1 unless char == max[idx]
    end
    distance
  end
end

