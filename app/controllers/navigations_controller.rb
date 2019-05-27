class NavigationsController < ApplicationController
  before_action :authenticate_user!,:set_navigation, only: [:show, :edit, :update, :destroy]
  access  user: {except: [:destroy]}, admin_user: :all

  # GET /navigations
  def index
    @navigations = Navigation.all
  end

  # GET /navigations/1
  def show
  end

  # GET /navigations/new
  def new
    @navigation = Navigation.new
  end

  # GET /navigations/1/edit
  def edit
  end

  # POST /navigations
  def create
    @navigation = Navigation.new(navigation_params)

    if @navigation.save
      redirect_to @navigation, notice: 'Navigation was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /navigations/1
  def update
    if @navigation.update(navigation_params)
      redirect_to @navigation, notice: 'Navigation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /navigations/1
  def destroy
    @navigation.destroy
    redirect_to navigations_url, notice: 'Navigation was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_navigation
      @navigation = Navigation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def navigation_params
      params.require(:navigation).permit(:title, :path, :is_visible, :can_create, :can_edit, :can_delete, :user_id)
    end
end
