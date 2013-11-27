class SourcesController < ApplicationController
  def index
    @sorted_sources = Source.order('upvote_count DESC')
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

  def upvote
    source = Source.find(params[:id].to_i)
    source.upvote_count += 1
    source.save
    @sorted_sources = Source.order('upvote_count DESC')
    render :partial => 'sorted_sources_list', :locals => {:sorted_sources => @sorted_sources}
  end

end