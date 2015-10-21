class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
    @subjects = @subjects.where(zooniverse_subject_id: params["subject_id"]) if params["subject_id"]
    @subjects = @subjects.where(zooniverse_dominant_species: params["species"]) if params["species"]
    @subjects = @subjects.order("mico_status ASC, mico_data -> 'objectsFound' DESC, comments_count DESC")
    @subjects = @subjects.page(params[:page])
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def mico_submit
    @subject = Subject.find(params[:id])
    AnalyseSubjectJob.enqueue(@subject.id, priority: 1)
    redirect_to @subject, notice: "Update enqueued but probably not yet processed. Refresh the page for status updates."
  end
end
