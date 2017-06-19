class TeachersController < ApplicationController
    
    before_action :find_teacher, only: [:edit, :update, :destroy, :show]

    def index
        @teachers = Teacher.all
    end

    def show
    end
    
    def new
        @teacher = Teacher.new
    end

    def create
        @teacher = Teacher.new(teacher_params)
        if @teacher.save
            redirect_to teachers_path
        else
            render :new
        end
    end

    def edit
    end
    
    def update
        if @teacher.update_attributes(teacher_params)
            redirect_to teacher_path, notice: "講師更新成功！"
        else
            render :edit
        end
    end

    def destroy
        @teacher.destroy if @teacher
        redirect_to teachers_path, notice: "講師資料已刪除！"
    end

    private
    def teacher_params
        params.require(:teacher).permit(:name, :description)
    end

    def find_teacher
      @teacher = Teacher.find_by(id: params[:id])
    end

end
