class FillDatasetColumns < ActiveRecord::Migration
  def up
    Subject.reset_column_information

    subjects = Subject.where(mico_status: 'finished')
    subjects.update_all(vr1_entire_dataset: true)
    subjects.where(id: Filtering::SimpleFilter::DAYTIME_IDS).update_all(vr1_daytime: true)
    subjects.where(id: Filtering::SimpleFilter::NIGHTTIME_IDS).update_all(vr1_nighttime: true)

    subjects.joins(:consensus).where(consensus: {crowd_says: 'blank'}).update_all(vr1_blank: true)
    subjects.joins(:consensus).where.not(consensus: {crowd_says: 'blank'}).update_all(vr1_non_blank: true)

    subjects.joins(:consensus).where("consensus.total_animals = 1").update_all(vr1_one_animal: true)
    subjects.joins(:consensus).where("consensus.total_animals > 1 AND consensus.total_animals <= 5").update_all(vr1_simple: true)
    subjects.joins(:consensus).where("consensus.total_animals > 5").update_all(vr1_complex: true)

    subjects.joins(:consensus).where(consensus: {total_species: 1}).update_all(vr1_single_species: true)
    subjects.joins(:consensus).where(consensus: {crowd_says: 'buffalo'}).update_all(vr1_only_buffalo: true)
    subjects.joins(:consensus).where(consensus: {crowd_says: 'elephant'}).update_all(vr1_only_elephant: true)
    subjects.joins(:consensus).where(consensus: {crowd_says: 'ostrich'}).update_all(vr1_only_ostrich: true)
    subjects.joins(:consensus).where(consensus: {crowd_says: 'warthog'}).update_all(vr1_only_warthog: true)
    subjects.joins(:consensus).where(consensus: {crowd_says: 'wildebeest'}).update_all(vr1_only_wildebeest: true)
    subjects.joins(:consensus).where(vr1_single_species: true, vr1_only_buffalo: nil,
                                                               vr1_only_elephant: nil,
                                                               vr1_only_ostrich: nil,
                                                               vr1_only_warthog: nil,
                                                               vr1_only_wildebeest: nil).update_all(vr1_only_other: true)

    subjects.joins(:consensus).where(consensus: {crowd_says: 'multi'}).update_all(vr1_multi_species: true)
    subjects.joins(:consensus).where(consensus: {crowd_says: 'multi'}).where("consensus.crowd_says_if_multi LIKE '%buffalo%'").update_all(vr1_multi_including_buffalo: true)
    subjects.joins(:consensus).where(consensus: {crowd_says: 'multi'}).where("consensus.crowd_says_if_multi LIKE '%elephant%'").update_all(vr1_multi_including_elephant: true)
    subjects.joins(:consensus).where(consensus: {crowd_says: 'multi'}).where("consensus.crowd_says_if_multi LIKE '%ostrich%'").update_all(vr1_multi_including_ostrich: true)
    subjects.joins(:consensus).where(consensus: {crowd_says: 'multi'}).where("consensus.crowd_says_if_multi LIKE '%warthog%'").update_all(vr1_multi_including_warthog: true)
    subjects.joins(:consensus).where(consensus: {crowd_says: 'multi'}).where("consensus.crowd_says_if_multi LIKE '%wildebeest%'").update_all(vr1_multi_including_wildebeest: true)
    subjects.joins(:consensus).where(consensus: {crowd_says: 'multi'}).where(vr1_multi_including_buffalo: nil,
                                                                             vr1_multi_including_elephant: nil,
                                                                             vr1_multi_including_ostrich: nil,
                                                                             vr1_multi_including_warthog: nil,
                                                                             vr1_multi_including_wildebeest: nil).update_all(vr1_multi_including_none_of_the_five: true)
  end

  def down
  end
end
