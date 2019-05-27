class TransportersController < ApplicationController
  before_action :authenticate_user!, :set_transporter, only: [:show, :edit, :update, :destroy]
  access  user: {except: [:destroy]}, admin_user: :all

  # GET /transporters
  def index
    @transporters = Transporter.all
  end

  # GET /transporters/1
  def show
  end

  # GET /transporters/new
  def new
    @transporter = Transporter.new
  end

  # GET /transporters/1/edit
  def edit
  end

  # POST /transporters
  def create
    @transporter = Transporter.new(transporter_params)

    if @transporter.save
      redirect_to @transporter, notice: 'Transporter was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /transporters/1
  def update
    if @transporter.update(transporter_params)
      redirect_to @transporter, notice: 'Transporter was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /transporters/1
  def destroy
    @transporter.destroy
    redirect_to transporters_url, notice: 'Transporter was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transporter
      @transporter = Transporter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transporter_params
      params.require(:transporter).permit(:transporter_name, :address, :phone)
    end
end
