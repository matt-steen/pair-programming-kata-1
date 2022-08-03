class SumOfIntervals
  # remove overlaps from the sequence. incomplete (must be run more than once to cover all overlaps)
  def self.reduce(sequence)
    processed_sequence = []
    sequence.each do |pair|
      skip = false
      processed_sequence.each_with_index do |processed_pair, idx|
        # If this pair is already totally covered
        if processed_pair[0] < pair[0] && processed_pair[1] > pair[1]
          skip = true
        elsif processed_pair[0] < pair[0] && processed_pair[1] <= pair[1] && pair[0] < processed_pair[1]
          processed_sequence[idx] = [processed_pair[0], pair[1]]
          skip = true
        elsif processed_pair[1] > pair[1] && processed_pair[0] >= pair[0] && pair[1] > processed_pair[0]
          processed_sequence[idx] = [pair[0], processed_pair[1]]
          skip = true
        elsif processed_pair[0] > pair[0] && processed_pair[1] < pair[1]
          processed_sequence[idx] = [pair[0], pair[1]]
          skip = true
        end
      end

      unless skip
        processed_sequence << pair
      end
    end

    processed_sequence
  end

  def self.sum(sequence)
    processed_sequence = reduce(sequence)
    processed_sequence = reduce(processed_sequence)

    sum = 0
    processed_sequence.each do |pair|
      sum += (pair[1] - pair[0])
    end
    sum
  end
end
