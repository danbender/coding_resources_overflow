class SourcesController < ApplicationController
  def index
    @sorted_sources = Source.order('upvote_count DESC')
  end

  def new
    @source = Source.new
  end

  def create
    @source = Source.new(source_params)
    params = {:source => {url: '', title: ''}}
    if @source.save
      redirect_to root_path
    else
      flash[:error] = 'You fucked up, son!'
    end
    # @source.title = params[:source][:title]
    # @source.url = params[:source][:url]
    # @source.save
    # redirect_to root_path
  end

  def upvote
    source = Source.find(params[:id])
    source.upvote_count += 1
    source.save
    @sorted_sources = Source.order('upvote_count DESC')
    render :partial => 'sorted_sources_list', :locals => {:sorted_sources => @sorted_sources}
  end

  def destroy
    source_to_delete = Source.find(params[:id])
    source_to_delete.destroy
    render :json => {source_id: source_to_delete.id}
  end

  def edit
    @source_to_edit = Source.find(params[:id])
    render :partial => 'edit', :locals => {:source_to_edit => @source_to_edit}
  end

  def update
    @source_to_edit = Source.find(params[:id])
    @source_to_edit.title = params[:source][:title]
    @source_to_edit.url = params[:source][:url]
    @source_to_edit.save
    redirect_to root_path
  end

protected
  def source_params
    params.require(:source).permit(:url, :title)
  end
end