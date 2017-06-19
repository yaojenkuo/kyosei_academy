class CoursesController < ApplicationController
    before_action :find_course, only: [:edit, :update, :destroy, :show]
    
    def index
        @courses = Course.all
    end

    def show
    end

    def new
        @course = Course.new
    end

    def create
        @course = Course.new(course_params)
        if @course.save
            redirect_to courses_path, notice: "新增課程成功！"
        else
            render :new
        end
    end

    def edit
    end
    
    def update
        if @course.update_attributes(course_params)
            redirect_to course_path, notice: "課程更新成功！"
        else
            render :edit
        end
    end

    def create
        @course = Course.new(course_params)

        if @course.save
            redirect_to courses_path, notice: "成功新增課程！"
        else
            render :new
        end
    end

    def destroy
        @course.destroy if @course
        redirect_to courses_path, notice: "課程資料已刪除！"
    end

    private
    def course_params
        params.require(:course).permit(:name_en, :name_ch, :description, :hours)
    end

    def find_course
      @course = Course.find_by(id: params[:id])
    end
    
end
