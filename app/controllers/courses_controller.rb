class CoursesController < ApplicationController
# Controller are the plural of the Model name e.g. Courses not Course
  # Refactoring finding our course via params id
  before_action :set_course, only: [:edit, :update, :show, :destroy]

  # Index action goes to views/courses/index.html.erb
  def index
    # Create instance variables @coures which is available in my index view
    # Course refers to model
    # .all is a method on Rails models to get all records
    @courses = Course.all
  end

  # New action goes to views/courses/new.html.erb
  def new
    # Creating a new empty Course object
    @course = Course.new
  end

  # Create action creates a new course record associated with a School
  def create
    # Find first school record
    school = School.find(1)
    # Create course without association
    # @course = Course.new(course_params)

    # Create course based on school -> courses association
    @course = school.courses.build(course_params)

    if @course.save
      # Show successful flash message and redirect to courses list
      flash[:notice] = "Course was successfully added."
      redirect_to courses_path
    else
      # Render the new template
      render :new
    end
  end

  # Edit action goes to views/courses/edit.html.erb
  def edit
    # Find course with params id
    # This find is refactored into before_action
    # @course = Course.find(params[:id])
  end

  def update
    # Find course with params id
    # This find is refactored into before_action
    # @course = Course.find(params[:id])

    # Update course
    if @course.update(course_params)
      # Show flash that course is updated
      flash[:notice] = "Course successfully updated!"
      # Redirect to Courses index
      redirect_to courses_path
    else
      # Render edit page if updating returns false
      render :edit
    end
  end

  # Show action goes to views/courses/show.html.erb
  def show
    # This find is refactored into before_action
    # @course = Course.find(params[:id])
  end

  def destroy
    # Destroy course and redirect to courses path
    @course.destroy
    flash[:notice] = "Course removed."
    redirect_to courses_path
  end

  def search
    
  end

  private

  def course_params
    params.require(:course).permit(:subject, :course_number, :description)
  end

  # Set course method through params via before_action
  def set_course
    @course = Course.find(params[:id])
  end

end
