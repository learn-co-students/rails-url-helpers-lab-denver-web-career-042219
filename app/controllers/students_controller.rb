class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :activate]

  def index
    @students = Student.all
  end

  def show
    # byebug
  end

  def activate
    if @student.active == false
      Student.update(@student.id, :active => true)
    else
      Student.update(@student.id, :active => false)
    end

    redirect_to action: "show", id: @student.id
    # byebug

  end


  private

    def set_student
      @student = Student.find(params[:id])
    end
end
