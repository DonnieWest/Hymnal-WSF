class WriterController < ApplicationController
  respond_to :json, :html

  def new
    @writer = Writer.new
  end

  def create
    @comment = Writer.create(writer_params)
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
    id = params[:id]

    unless id.nil?
      @writer = Writer.find(id)
      respond_with(@writer)
    end

  end

  private
  def writer_params
    params.require(:writer).permit(:name, :details)
  end
end
