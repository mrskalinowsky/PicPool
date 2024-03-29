class PoolsController < ApplicationController
  # GET /pools
  # GET /pools.json
  def index
    @pools = Pool.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pools }
    end
  end

  # GET /pools/1
  # GET /pools/1.json
  def show
    @pool = Pool.find(params[:id])
    @user = User.find(@pool.user_id)
    @photos  = @pool.photos

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pool }
    end
  end

  # GET /pools/new
  # GET /pools/new.json
  def new
    @user = User.find(params[:user_id])
    @pool = @user.pools.build
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pool }
    end
  end

  # GET /pools/1/edit
  def edit
    @pool = Pool.find(params[:id])
    @user = User.find(@pool.user_id)
  end

  # POST /pools
  # POST /pools.json
  def create
    @user = User.find(params[:user_id])
    @pool = @user.pools.build(params[:pool])
      
    
    respond_to do |format|
      if @pool.save
        format.html { redirect_to user_pools_path(@user), notice: 'Pool was successfully created.' }
        format.json { render json: @pool, status: :created, location: [@user, @pool] }
      else
        format.html { render action: "new" }
        format.json { render json: @pool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pools/1
  # PUT /pools/1.json
  def update
    @pool = Pool.find(params[:id])

    respond_to do |format|
      if @pool.update_attributes(params[:pool])
        format.html { redirect_to @pool, notice: 'Pool was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pools/1
  # DELETE /pools/1.json
  def destroy
    
    @pool = Pool.find(params[:id])
    @user = User.find(@pool.user_id)
    @pool.destroy
    

    respond_to do |format|
      format.html { redirect_to user_pools_path(@user) }
      format.json { head :no_content }
    end
  end
end
