class WriterController < ApplicationController
  before_filter :authenticate_user!, except: [ :index, :show ]
  respond_to :json, :html

  def new
    @writer = Writer.new
  end

  def create
    @writer = Writer.create(writer_params)
  end

  def update
    @writer = Writer.find(params[:id])
    @writer.update(writer_params)
  end

  def edit
    @writer = Writer.find(params[:id])
    respond_with(@writer)
  end

  def destroy
  end

  def index
    @writers = Writer.all
    puts "Found #{@writers.size} writers"
    respond_with(@writers)
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
