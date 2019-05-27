class ProposalHeadersController < ApplicationController
  skip_before_action :verify_authenticity_token
  protect_from_forgery prepend: true, with: :exception
 
  before_action :authenticate_user!, :set_proposal_header, only: [:show, :edit, :update, :destroy]
  access  user: {except: [:destroy]}, admin_user: :all

  # GET /proposal_headers
  def index
    @proposal_headers = ProposalHeader.all
    respond_to do |format|
      format.html
      format.json { render json: ProposalHeadersDatatable.new(params) }
    end
  end

  # GET /proposal_headers/1
  def show
    #@porposal_details =  @proposal_header.proposal_details 
     
  end

  # GET /proposal_headers/new
  def new
    @proposal_header = ProposalHeader.new
    #@proposal_detail = ProposalDetail.new
    
    @cust_id = params[:data_value]
    
    @customer = Customer.find(id = @cust_id)
   

    respond_to do |format|
      format.html { render :new} 
      #format.js
      
    end
  end

  # GET /proposal_headers/1/edit
  def edit
    @cust_id = @proposal_header.customer_id
    @customer = Customer.find(id = @cust_id)
  end

  # POST /proposal_headers
  def create
    @proposal_header = ProposalHeader.new(proposal_header_params)
   
    

 
  respond_to do |format|
    if @proposal_header.save

      format.html { redirect_to proposals_path_url, notice: 'Teklifiniz Başarıyla Oluşturuldu' }
      #format.js
      #format.json { render json: @proposal_header, status: :created, location: @proposal_header }
    else
      format.html { render action: "new" }
      format.json { render json: @proposal_header.errors, status: :unprocessable_entity }
    end
  end
  end

  # PATCH/PUT /proposal_headers/1
  def update
    if @proposal_header.update(proposal_header_params)
      redirect_to @proposal_header, notice: 'Teklif Düzenlendi.'
    else
      render :edit
    end
  end

  # DELETE /proposal_headers/1
  def destroy
    @proposal_header.destroy
    redirect_to proposal_headers_url, notice: 'Teklif Silindi.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal_header
      @proposal_header = ProposalHeader.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def proposal_header_params
      params.require(:proposal_header).permit(:customer_id, :title, :description,prop_dets_attributes: [:id,:quantity,:unit_price,:total_price,:_destroy])
    end
end
