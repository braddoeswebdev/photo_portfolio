class PhotosController < ApplicationController
  # GET /photos
  # GET /photos.json
  def index
    redirect_to root_path
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])
    redirect_to @photo.collection
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    redirect_to root_path
  end

  # GET /photos/1/edit
  def edit
    redirect_to root_path
  end

  # POST /photos
  # POST /photos.json
  def create
    unless session[:codes].include?(SUPER_SECRET_CODE) || session[:codes].include?(@collection.code)
    redirect_to root_path 
    else
    @photo = Photo.new(params[:photo])

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])
    redirect_to @photo
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    unless session[:codes].include?(SUPER_SECRET_CODE) || session[:codes].include?(@collection.code)
    redirect_to root_path 
    else
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
    end
  end
end
