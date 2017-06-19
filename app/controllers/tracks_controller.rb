class TracksController < ApplicationController
    before_action :find_track, only: [:edit, :update, :destroy, :show]
    
    def index
        @tracks = Track.all
    end

    def show
    end

    def new
        @track = Track.new
    end

    def create
        @track = Track.new(track_params)
        if @track.save
            redirect_to tracks_path, notice: "新增系列課程成功！"
        else
            render :new
        end
    end

    def edit
    end
    
    def update
        if @track.update_attributes(track_params)
            redirect_to track_path, notice: "系列課程更新成功！"
        else
            render :edit
        end
    end

    def create
        @track = Track.new(track_params)

        if @track.save
            redirect_to tracks_path, notice: "成功新增系列課程！"
        else
            render :new
        end
    end

    def destroy
        @track.destroy if @track
        redirect_to tracks_path, notice: "系列課程資料已刪除！"
    end

    private
    def track_params
        params.require(:track).permit(:name_en, :name_ch, :description)
    end

    def find_track
      @track = Track.find_by(id: params[:id])
    end
end
