class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  
  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all.paginate(:page => params[:page], :per_page => 15)
    #p "looooooook->#{@condition}"
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    @current_url = false
    @condition = action_name
  end

  # GET /tickets/1/edit
  def edit
    @condition = action_name
  end

  # POST /tickets
  # POST /tickets.json
  def create
    
    @ticket = Ticket.new(ticket_params)
    respond_to do |format|
      
      @ticket.generate_current_url(ticket_params[:current_url])
      begin
        @send_customer = Customer.find(ticket_params[:customer_id])
      rescue Exception => e
        flash[:notice] = "Can't find castomer with id = #{@send_customer}"
        p "test condition -----------------------------------------------"
        redirect_to :action => :index, :controller => "tickets"
        return 0
      end
      if @ticket.save
        p @send_customer.name
        #p "====>"+ticket_params[:customer_id]
        CastomerMailer.welcom_email(@ticket, @send_customer).deliver!
        format.html { redirect_to "/tickets/"+@ticket.current_url, notice: 'Ticket was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ticket }
      else
        format.html { render action: 'new' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to action: 'show' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find_by_current_url(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:title, :status, :customer_id, :user_id, :current_url)
    end
end
