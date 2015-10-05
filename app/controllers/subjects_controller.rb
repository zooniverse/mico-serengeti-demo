class SubjectsController < ApplicationController
  def index
    @subjects = Subject.order(:id).limit(100)
  end

  def show
    @subject = Subject.find(params[:id])
  end
end
