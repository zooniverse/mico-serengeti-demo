class SubjectsController < ApplicationController
  respond_to :html, :json

  def index
    @subjects = Subject.where(image_index: 0).includes(:consensus).includes(:comments)

    # Filters
    @subjects = @subjects.where(zooniverse_id: params["subject_id"])                                           if params["subject_id"]
    @subjects = @subjects.where("subjects.mico_status = ?", params["status"])                                  if params["status"]
    @subjects = @subjects.where("subjects.mico_status IS NULL")                                                if params["status_unprocessed"]
    @subjects = @subjects.where("subjects.mico_data -> 'objectsFound' = ?", params["number_of_regions"])       if params["number_of_regions"]
    @subjects = @subjects.where("subjects.mico_data -> 'objectsFound' >= ?", params["number_of_regions_min"])  if params["number_of_regions_min"]
    @subjects = @subjects.where("subjects.mico_data -> 'objectsFound' <= ?", params["number_of_regions_max"])  if params["number_of_regions_max"]
    @subjects = @subjects.joins(:comments).where("jsonb_array_length(comments.mico_data->'entities') = ?", params["entities_found"])               if params["entities_found"]
    @subjects = @subjects.joins(:comments).where("jsonb_array_length(comments.mico_data->'entities') <= ?", params["entities_found_max"])          if params["entities_found_max"]
    @subjects = @subjects.joins(:comments).where("jsonb_array_length(comments.mico_data->'entities') >= ?", params["entities_found_min"])          if params["entities_found_min"]
    @subjects = @subjects.joins(:comments).where("comments.mico_data->'sentiment'!='null' AND (comments.mico_data->>'sentiment')::float > 0.0")    if params["sentiment_positive"]
    @subjects = @subjects.joins(:comments).where("comments.mico_data->'sentiment'!='null' AND (comments.mico_data->>'sentiment')::float < 0.0")    if params["sentiment_negative"]
    @subjects = @subjects.joins(:comments).where("comments.mico_data->'sentiment'!='null' AND (comments.mico_data->>'sentiment')::float = 0.0")    if params["sentiment_neutral"]
    @subjects = @subjects.where(comments_count: params["number_of_comments"])                                  if params["number_of_comments"]
    @subjects = @subjects.where("comments_count >= ?", params["number_of_comments_min"])                       if params["number_of_comments_min"]
    @subjects = @subjects.where("comments_count <= ?", params["number_of_comments_max"])                       if params["number_of_comments_max"]
    @subjects = @subjects.where(zooniverse_dominant_species: params["species"])                                if params["species"]
    @subjects = @subjects.where({ zooniverse_dominant_species: ["wildebeest","warthog","buffalo","elephant","ostrich"]}) if params["species_target"]
    @subjects = @subjects.joins(:consensus).where(consensus: {site_id: params["site_id"]})                     if params["site_id"]
    @subjects = @subjects.joins(:consensus).where(consensus: {roll_id: params["roll_id"]})                     if params["roll_id"]
    @subjects = @subjects.joins(:consensus).where(consensus: {total_animals: params["total_animals"]})         if params["total_animals"]
    @subjects = @subjects.joins(:consensus).where("consensus.total_animals >= ?", params["total_animals_min"]) if params["total_animals_min"]
    @subjects = @subjects.joins(:consensus).where("consensus.total_animals <= ?", params["total_animals_max"]) if params["total_animals_max"]
    @subjects = @subjects.joins(:consensus).where(consensus: {total_species: params["total_species"]})         if params["total_species"]
    @subjects = @subjects.joins(:consensus).where("consensus.total_species >= ?", params["total_species_min"]) if params["total_species_min"]
    @subjects = @subjects.joins(:consensus).where("consensus.total_species <= ?", params["total_species_max"]) if params["total_species_max"]
    @subjects = @subjects.where(light: params["light"])                                                        if params["light"]
    @subjects = @subjects.joins(:comments).where("comments.mico_data IS NULL")                                 if params["has_no_comment_analysis_data"]
    @subjects = @subjects.joins(:comments).where("comments.mico_data IS NOT NULL")                             if params["has_comment_analysis_data"]
    @subjects = @subjects.joins(:comments).where("comments.mico_status = ?", params["comment_status"])         if params["comment_status"]
    @subjects = @subjects.joins(:comments).where("comments.mico_status IS NULL")                       if params["comment_status_unprocessed"]

    @subjects = @subjects.where(vr1_entire_dataset: true)                                                      if params["vr1_entire_dataset"]
    @subjects = @subjects.where(vr1_daytime: true)                                                             if params["vr1_daytime"]
    @subjects = @subjects.where(vr1_nighttime: true)                                                           if params["vr1_nighttime"]
    @subjects = @subjects.where(vr1_blank: true)                                                               if params["vr1_blank"]
    @subjects = @subjects.where(vr1_non_blank: true)                                                           if params["vr1_non_blank"]
    @subjects = @subjects.where(vr1_one_animal: true)                                                          if params["vr1_one_animal"]
    @subjects = @subjects.where(vr1_simple: true)                                                              if params["vr1_simple"]
    @subjects = @subjects.where(vr1_complex: true)                                                             if params["vr1_complex"]
    @subjects = @subjects.where(vr1_single_species: true)                                                      if params["vr1_single_species"]
    @subjects = @subjects.where(vr1_only_buffalo: true)                                                        if params["vr1_only_buffalo"]
    @subjects = @subjects.where(vr1_only_elephant: true)                                                       if params["vr1_only_elephant"]
    @subjects = @subjects.where(vr1_only_ostrich: true)                                                        if params["vr1_only_ostrich"]
    @subjects = @subjects.where(vr1_only_warthog: true)                                                        if params["vr1_only_warthog"]
    @subjects = @subjects.where(vr1_only_wildebeest: true)                                                     if params["vr1_only_wildebeest"]
    @subjects = @subjects.where(vr1_only_other: true)                                                          if params["vr1_only_other"]
    @subjects = @subjects.where(vr1_multi_species: true)                                                       if params["vr1_multi_species"]
    @subjects = @subjects.where(vr1_multi_including_buffalo: true)                                             if params["vr1_multi_including_buffalo"]
    @subjects = @subjects.where(vr1_multi_including_elephant: true)                                            if params["vr1_multi_including_elephant"]
    @subjects = @subjects.where(vr1_multi_including_ostrich: true)                                             if params["vr1_multi_including_ostrich"]
    @subjects = @subjects.where(vr1_multi_including_warthog: true)                                             if params["vr1_multi_including_warthog"]
    @subjects = @subjects.where(vr1_multi_including_wildebeest: true)                                          if params["vr1_multi_including_wildebeest"]
    @subjects = @subjects.where(vr1_multi_including_none_of_the_five: true)                                    if params["vr1_multi_including_none_of_the_five"]

    # Sort
    case params[:sort]
    when "number_of_regions_desc"
      @subjects = @subjects.order("subjects.mico_data -> 'objectsFound' DESC")
    when "number_of_regions_asc"
      @subjects = @subjects.order("subjects.mico_data -> 'objectsFound' ASC")
    when "number_of_comments_desc"
      @subjects = @subjects.order("comments_count DESC")
    when "number_of_comments_asc"
      @subjects = @subjects.order("comments_count ASC")
    when "status_desc"
      @subjects = @subjects.order("subjects.mico_status DESC")
    when "status_asc"
      @subjects = @subjects.order("subjects.mico_status ASC")
    when "subject_id_desc"
      @subjects = @subjects.order("zooniverse_id DESC")
    when "subject_id_asc"
      @subjects = @subjects.order("zooniverse_id ASC")
    else
      @subjects = @subjects.order("subjects.mico_status ASC, subjects.mico_data -> 'objectsFound' DESC, comments_count DESC")
    end

    # Pagination
    if params["per_page"]
      per_page = params["per_page"].to_i
      if per_page.to_s != params["per_page"]
        per_page = nil
      end
    end
    if per_page
      @subjects = @subjects.page(params[:page]).per(per_page)
    else
      @subjects = @subjects.page(params[:page])
    end

    respond_with @subjects
  end

  def show
    @subject = Subject.find(params[:id])
    respond_with @subject
  end

  def mico_submit
    @subject = Subject.find(params[:id])
    AnalyseSubjectJob.enqueue(@subject.id, priority: 1)
    redirect_to @subject, notice: "Update enqueued but probably not yet processed. Refresh the page after a short while for an updated status."
  end
end
