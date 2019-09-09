class InfosController < ApplicationController
  def new
    @info = Info.new
  end

  def destroy
    @info = Info.find(params[:id])
    @info.destroy
      flash[:notice] = "The information is successfully deleted"
      redirect_to infos_path(@info)
  end

  def show
    @info = Info.find(params[:id])
  end

  def index
    @infos = Info.all
  end

  def edit
    @info = Info.find(params[:id])
  end

  def update
    @info = Info.find(params[:id])
    if @info.update(info_params)
      flash[:success] = "The information was successfully updated"
      redirect_to info_path(@info)
    else
      flash[:success] = "Unable to update the information !!!"
      render 'edit'
    end
  end

  def create
    @info = Info.new(info_params)
    @info.user  = User.first
    if @info.save
      flash[:success] = "The information was successfully saved"
      redirect_to info_path(@info)
    else
      render 'new'
    end
  end

  private
  def info_params
    params.require(:info).permit(:site, :username, :password, :signature)
  end
end
