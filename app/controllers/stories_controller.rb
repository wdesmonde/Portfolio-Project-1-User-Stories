class StoriesController < ApplicationController
  before_filter :require_login
  
  # GET /stories
  # GET /stories.json
  def index	
    if params[:tag]
      @stories = Story.tagged_with(params[:tag])
    else
      @stories = Story.all
    end
    # in_progress = Story.where(:status => 'In Progress')
    # @stories = Story.where(:status => 'Not Started')
    # @stories = Story.where(:status => 'Test')
    # @stories = Story.where(:status => 'Backlog')
    # @stories = Story.where(:status => 'Done')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stories }
    end
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @story = Story.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @story }
    end
  end

  # GET /stories/new
  # GET /stories/new.json
  def new
    @story = Story.new
    @story.user_id = current_user.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @story }
    end
  end

  # GET /stories/1/edit
  def edit
    @story = Story.find(params[:id])
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(params[:story])

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render json: @story, status: :created, location: @story }
      else
        format.html { render action: "new" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PUT /stories/1
  # PUT /stories/1.json
  def update
    @story = Story.find(params[:id])

    respond_to do |format|
      if @story.update_attributes(params[:story])
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit_multiple
    if params[:story_ids]
      @stories = Story.find(params[:story_ids])
      @users = User.all
    else
      redirect_to :stories
    end
  end
  
  def update_multiple
    @stories = Story.find(params[:story_ids])
    @tags_to_add = params[:tags_to_add]
    @tags_to_remove = params[:tags_to_remove]
    @stories.reject! do |story|
      story.update_attributes(params[:story].reject { |k,v| v.blank? })
    end
    if @stories.empty?
      redirect_to :stories
    else
      render "edit_multiple"
    end
  end

  

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    respond_to do |format|
      format.html { redirect_to stories_url }
      format.json { head :ok }
    end
  end
end
