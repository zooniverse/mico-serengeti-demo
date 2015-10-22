class Detection
  def animal_presence(subject)
    if actually_has_animal?(subject)
      if mico_found_animal?(subject)
        :true_positives
      else
        :false_negatives
      end
    else
      if mico_found_animal?(subject)
        :false_positives
      else
        :true_negatives
      end
    end
  end

  private

  def actually_has_animal?(subject)
    subject.consensus.crowd_says != "blank"
  end

  def mico_found_animal?(subject)
    subject.regions.size > 0
  end
end
