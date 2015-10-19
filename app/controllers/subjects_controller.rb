class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
    @subjects = @subjects.where(zooniverse_dominant_species: params["species"]) if params["species"]
    @subjects = @subjects.order("mico_status ASC, mico_data -> 'objectsFound' DESC, comments_count DESC")
    @subjects = @subjects.limit(200)
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def mico_submit
    @subject = Subject.find(params[:id])
    AnalyseSubjectJob.enqueue(@subject.id)
    redirect_to @subject
  end

  def mico_update
    @subject = Subject.find(params[:id])
    @subject.update_from_mico
    @subject.save!
    redirect_to @subject
  end
end
