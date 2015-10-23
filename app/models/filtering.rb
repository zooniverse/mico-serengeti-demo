module Filtering
  class SimpleFilter
    def initialize(filter)
      @filter = filter
    end

    def name
      @filter.to_s
    end

    def check(subject)
      send(@filter, subject)
    end

    private

    def entire_dataset(subject)
      true
    end

    def daytime(subject)
      if subject.consensus.time_of_day
        ["10", "11", "12", "13", "14"].include?(subject.consensus.time_of_day[0..1])
      else
        (10..14).include?(subject.image_timestamp.hour)
      end
    end

    def nighttime(subject)
      if subject.consensus.time_of_day
        ["00", "01", "02", "03"].include?(subject.consensus.time_of_day[0..1])
      else
        (0..3).include?(subject.image_timestamp.hour)
      end
    end

    def blank(subject)
      subject.consensus.crowd_says == 'blank'
    end

    def one_animal(subject)
      subject.consensus.total_animals == 1
    end

    def simple(subject)
      subject.consensus.total_animals > 1 and subject.consensus.total_animals <= 5
    end

    def complex(subject)
      subject.consensus.total_animals > 5
    end

    def single_species(subject)
      subject.consensus.total_species == 1
    end

    def multi_species(subject)
      subject.consensus.total_species > 1
    end
  end

  class SpecificSpecies
    def initialize(species)
      @species = species
    end

    def name
      "specific_species_#{@species}"
    end

    def check(subject)
      subject.consensus.species_found_by_crowd.include?(@species)
    end
  end
end
