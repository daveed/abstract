class DiscussionsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]

  def index
    @discussions = Discussion.all
  end

  def new
    @discussion = Discussion.new
  end

  def show
    @discussion = Discussion.find(params[:id])
  end

  def create
    build_discussion
    if @discussion.valid? && DiscussionService.create(discussion: @discussion, author: current_user)
      flash[:success] = "Discussion Created!"
      redirect_to @discussion
    else
      flash[:error] = 'Discussion not created'
      render action: :new
    end
  end

  private
  def build_discussion
    @discussion = Discussion.new(discussion_params)
    @discussion.author = current_user
  end

  def discussion_params
    params.require(:discussion).permit(:title, :description)
  end
end
