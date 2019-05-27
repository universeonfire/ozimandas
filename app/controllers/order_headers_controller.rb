class OrderHeadersController < ApplicationController
  skip_before_action :verify_authenticity_token
  protect_from_forgery prepend: true, with: :exception
  before_action :authenticate_user!, :set_order_header, only: [:show, :edit, :update, :destroy]
  access  user: {except: [:destroy]}, admin_user: :all


  # GET /order_headers
  def index
    @order_headers = OrderHeader.all
    respond_to do |format|
      format.html
      format.json { render json: OrderHeadersDatatable.new(params) }
    end
  end

  # GET /order_headers/1
  def show
  end

  # GET /order_headers/new
  def new
    @order_header = OrderHeader.new
    @cust_id = params[:data_value]
    
    @customer = Customer.find(id = @cust_id)
   

    respond_to do |format|
       
      format.js
      
    end
  end

  # GET /order_headers/1/edit
  def edit
    @cust_id = @proposal_header.customer_id
    @customer = Customer.find(id = @cust_id)
  end

  # POST /order_headers
  def create
    @order_header = OrderHeader.new(order_header_params)

    respond_to do |format|
    if @order_header.save

      format.html { redirect_to @order_header, notice: 'order_header was successfully created.' }
      format.js
      format.json { render json: @order_header, status: :created, location: @order_header }
    else
      format.html { render action: "new" }
      format.json { render json: @order_header.errors, status: :unprocessable_entity }
    end
  end
  end

  # PATCH/PUT /order_headers/1
  def update
    if @order_header.update(order_header_params)
      redirect_to @order_header, notice: 'Order header was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /order_headers/1
  def destroy
    @order_header.destroy
    redirect_to order_headers_url, notice: 'Order header was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_header
      @order_header = OrderHeader.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_header_params
      params.require(:order_header).permit(:order_date, :deadline, :invoice_number, :shipment_date,order_dets_attributes: [:id,:quantity,:unit_price,:total_price,:_destroy])
    end
end
