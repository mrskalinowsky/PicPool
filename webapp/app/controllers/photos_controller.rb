class PhotosController < ApplicationController
  # GET /photos
  # GET /photos.json
  def index

    @pool = Pool.find(params[:pool_id])

    @photos = @pool.photos

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @pool = Pool.find(params[:pool_id])
    @photo = @pool.photos.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @pool = Pool.find(params[:pool_id])

    @photo = @pool.photos.find(params[:id])
    # @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    p_attr = params[:photo]
    p_attr[:image] = params[:photo][:image].first if params[:photo][:image].class == Array

    if params[:pool_id]
      @pool = Pool.find(params[:pool_id])
      @photo = @pool.photos.build(p_attr)
    else
      @photo = Photo.new(p_attr)
    end

    if @photo.save
      respond_to do |format|
        format.html {
          render :json => [@photo.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@photo.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update

    @pool = Pool.find(params[:pool_id])

    @photo = @pool.photos.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to pool_path(@pool), notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @pool = Pool.find(params[:pool_id])
    @photo = @pool.photos.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to pool_photos_url }
      format.js
    end
  end

  def make_default
    @photo = Photo.find(params[:id])
    @pool = Pool.find(params[:pool_id])

    @pool.cover = @photo.id
    @pool.save

    respond_to do |format|
      format.js
    end
  end
end
