class CustomersController < ApplicationController
  before_action :authenticate_user!, :set_customer, only: [:show, :edit, :update, :destroy]
  access  user: {except: [:destroy]}, company_admin: :all

  # GET /customers
  def index
    @customers = Customer.all 
    respond_to do |format|
      format.html
      format.json { render json: CustomersDatatable.new(params) }
    end
  end

  # GET /customers/1
  def show
     

    respond_to do |format|
     
       format.json { render @customer}

     end
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to @customer, notice: 'Customer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /customers/1
  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: 'Customer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /customers/1
  def destroy
    @customer.destroy
    redirect_to customers_url, notice: 'Customer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def customer_params
      params.require(:customer).permit(:firm_name, :adress, :phone)
    end
end
