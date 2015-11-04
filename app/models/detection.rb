module Detection
  class Base; end

  class Emptiness < Base
    def name
      "emptiness"
    end

    def check(subject)
      if actually_blank?(subject)
        if mico_says_blank?(subject)
          :true_positives
        else
          :false_negatives
        end
      else
        if mico_says_blank?(subject)
          :false_positives
        else
          :true_negatives
        end
      end
    end

    private

    def actually_blank?(subject)
      subject.consensus.crowd_says == "blank"
    end

    def mico_says_blank?(subject)
      subject.regions.size == 0
    end
  end

  class AnimalCount < Base
    def initialize(amount)
      @amount = amount
    end

    def name
      "animal_count_#{@amount}"
    end

    def check(subject)
      if subject.consensus.total_animals == @amount
        if subject.regions.size == @amount
          :true_positives
        else
          :false_negatives
        end
      else
        if subject.regions.size == @amount
          :false_positives
        else
          :true_negatives
        end
      end
    end
  end

  class AnimalType < Base
    def initialize(species)
      @species = species
    end

    def name
      "animal_type_#{@species}"
    end

    def check(subject)
      if actually_has_animal?(subject)
        if subject.regions.map(&:animal).include?(@species)
          :true_positives
        else
          :false_negatives
        end
      else
        if subject.regions.map(&:animal).include?(@species)
          :false_positives
        else
          :true_negatives
        end
      end
    end

    def actually_has_animal?(subject)
      subject.consensus.species_found_by_crowd.include?(@species)
    end
  end
end
