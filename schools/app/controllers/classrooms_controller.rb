class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]

  # GET /classrooms
  # GET /classrooms.json
  def index
    @classrooms = Classroom.all
  end

  # GET /classrooms/1
  # GET /classrooms/1.json
  def show
    @studentlist = Studentlist.new
    # Where : filtering : user_id, classroom_id
    @studentlists = Studentlist.where(classroom_id: @classroom.id)
    #studentlists는 임의로 적은 이름. s 가 붙는 이유는 의미상 복수가 적절하므로. 
  end

  # GET /classrooms/new
  def new
    @classroom = Classroom.new
  end

  # GET /classrooms/1/edit
  def edit
  end

  # POST /classrooms
  # POST /classrooms.json
  def create
    if current_user.role == "teacher"
      @classroom = Classroom.new(classroom_params)

      respond_to do |format|
        if @classroom.save
          format.html { redirect_to @classroom, notice: 'Classroom was successfully created.' }
          format.json { render :show, status: :created, location: @classroom }
        else
          format.html { render :new }
          format.json { render json: @classroom.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:error] = "Your are not allowed to create a new class."
      redirect_to '/classrooms'
    end
  end

  # PATCH/PUT /classrooms/1
  # PATCH/PUT /classrooms/1.json
  def update
    respond_to do |format|
      if @classroom.update(classroom_params)
        format.html { redirect_to @classroom, notice: 'Classroom was successfully updated.' }
        format.json { render :show, status: :ok, location: @classroom }
      else
        format.html { render :edit }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classrooms/1
  # DELETE /classrooms/1.json
  def destroy
    @classroom.destroy
    respond_to do |format|
      format.html { redirect_to classrooms_url, notice: 'Classroom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classroom_params
      params.require(:classroom).permit(:user_id, :name)
    end
end
