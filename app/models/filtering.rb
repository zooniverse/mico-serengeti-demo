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
      [5157023, 5142124, 5156651, 5156671, 5140819, 5176367, 5151895, 5168130, 5149648, 5165024, 5144959, 5143376, 5201352, 5156675, 5143940, 5144149, 5176593, 5154669, 5171143, 5170562, 5168555, 5168595, 5167719, 5166380, 5146814, 5165186, 5164997, 5176424, 5141027, 5186703, 5141033, 5197734, 5141243, 5141991, 5161290, 5143935, 5144844, 5162788, 5147138, 5143992, 5161283, 5143527, 5143605, 5147009, 5156943, 5170632, 5145472, 5166367, 5170683, 5142047, 5162115, 5200729, 5192899, 5170731, 5140795, 5140804, 5140807, 5140810, 5140811, 5140812, 5140813, 5140815, 5140816, 5140817, 5140820, 5140821, 5140823, 5140824, 5140826, 5140827, 5140831, 5140832, 5140837, 5140838, 5140839, 5140842, 5140843, 5140846, 5140848, 5140850, 5140851, 5140852, 5140853, 5140854, 5140855, 5140856, 5140857, 5140858, 5140859, 5140860, 5140861, 5140862, 5140887, 5140891, 5140913, 5140927, 5140941, 5140944, 5140948, 5140951, 5140965, 5140970, 5141008, 5141019, 5141023, 5141034, 5141035, 5141036, 5141042, 5141051, 5141053, 5141054, 5141061, 5141064, 5141067, 5141076, 5141079, 5141080, 5141087, 5141089, 5141099, 5141102, 5141108, 5141110, 5141112, 5141113, 5141115, 5141116, 5141131, 5141132, 5141136, 5141137, 5141144, 5141153, 5141155, 5141157, 5141158, 5141161, 5141165, 5141172, 5141175, 5141182, 5141185, 5141190, 5141195, 5141196, 5141197, 5141199, 5141207, 5141210, 5141211, 5141213, 5141215, 5141216, 5141220, 5141222, 5141224, 5141226, 5141228, 5141237, 5141239, 5141950, 5141952, 5141953, 5141957, 5141963, 5141966, 5141969, 5141970, 5141972, 5141973, 5141974, 5141975, 5141976, 5141980, 5141988, 5141989, 5141992, 5141994, 5141997, 5142001, 5142004, 5142005, 5142008, 5142012, 5142017, 5142021, 5142023, 5142026, 5142028, 5142030, 5142042, 5142046].include?(subject.id)
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
