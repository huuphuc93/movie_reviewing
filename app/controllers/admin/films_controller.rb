class Admin::FilmsController < ApplicationController
  before_action :find_films , except: [:new, :create]
  
  def new
    @film = Film.new
  end

  def create
    @film = Film.new film_params
    if @film.save
      redirect_to [:admin, @film]
      flash[:success] = "Complete create films"
    else
      render "new"
    end
  end
  
  def update
   if @film.update_attributes film_params
    flash[:success] = "Film updated"
    redirect_to [:admin, @film]
   else
    render "edit"
   end
  end
  
  def destroy
    @film.destroy
    flash[:success] = "Film deleted!"
  end

  private
  
  def find_films
    @film = Film.find_by id: params[:id]
    return if @film
    flash[:danger] = "Not film user with id #{params[:id]}"
    redirect_to root_path
  end

  def film_params
    params.require(:film).permit :name, :play_time, :link_trailer, :describe
  end
  
end
