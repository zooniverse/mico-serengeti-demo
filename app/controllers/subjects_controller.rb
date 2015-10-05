class SubjectsController < ApplicationController
  def index
    @subjects = Subject.order(:id).limit(100)
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def mico_submit
    @subject = Subject.find(params[:id])
    @subject.submit_to_mico
    @subject.save!
    redirect_to @subject
  end

  def mico_update
    @subject = Subject.find(params[:id])
    @subject.update_mico_data
    @subject.save!
    redirect_to @subject
  end
end
