class SchedulingsController < ApplicationController
  def index
    @schedulings = Scheduling.all
  end
  
  def new
    @scheduling = Scheduling.new
  end
 
  def create
    @scheduling = Scheduling.new(params.require(:scheduling).permit(
      :title, 
      :start_date, 
      :end_date, 
      :all_day, 
      :memo))
     if @scheduling.save
       flash[:success] = "スケジュールを新規追加しました"
       redirect_to :schedulings
     else
       flash.now[:failure] = "スケジュールを新規追加できませんでした"
       render "new"
     end
  end
 
  def show
    @scheduling = Scheduling.find(params[:id])
  end
 
  def edit
    @scheduling = Scheduling.find(params[:id])
  end
 
  def update
    @scheduling = Scheduling.find(params[:id])
    if @scheduling.update(params.require(:scheduling).permit(:title, :start_date, :end_date, :all_day, :memo))
       flash[:success] = "ユーザーID「#{@scheduling.id}」の情報を更新しました"
       redirect_to :schedulings
    else
       flash.now[:failure] = "ユーザーID「#{@scheduling.id}」の情報を更新できませんでした"
       render "edit"
    end
  end
 
  def destroy
    @scheduling = Scheduling.find(params[:id])
     @scheduling.destroy
     flash[:success] = "スケジュールを削除しました"
     redirect_to :schedulings
  end
end

