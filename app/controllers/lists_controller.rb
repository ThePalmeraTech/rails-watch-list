class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @movie = Movie.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update(params[:id])

    redirect_to list_path(@list)
  end

  def destroy
    @list.destroy
    redirect_to lists_path(@lists)
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
