class Filtering
  def entire_dataset(subject)
    true
  end

  def daytime(subject)
    return false unless subject.consensus.time_of_day
    ["10", "11", "12", "13", "14"].include?(subject.consensus.time_of_day[0..1])
  end

  def nighttime(subject)
    return false unless subject.consensus.time_of_day
    ["10", "11", "12", "13", "14"].include?(subject.consensus.time_of_day[0..1])
  end

  def blank(subject)
    subject.consensus.crowd_says == 'blank'
  end

  def blank_or_one_animal(subject)
    return true if blank(subject)
    subject.consensus.total_animals == 1
  end

  def blank_or_simple(subject)
    return true if blank(subject)
    subject.consensus.total_animals > 1 and subject.consensus.total_animals <= 5
  end

  def blank_or_complex(subject)
    return true if blank(subject)
    subject.consensus.total_animals > 5
  end

  def blank_or_single_species(subject)
    return true if blank(subject)
    subject.consensus.crowd_says != 'blank' and subject.consensus.crowd_says != 'multi'
  end

  def blank_or_multi_species(subject)
    return true if blank(subject)
    subject.consensus.crowd_says == 'multi'
  end
end
