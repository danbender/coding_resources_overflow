class SourcesController < ApplicationController
  def index
    @sources = Source.all
  end

  def new
    @source = Source.new
  end

  def create
    @source = Source.new
    @source.title = params[:source][:title]
    @source.url = params[:source][:url]
    @source.save
    redirect_to "/"
  end

end