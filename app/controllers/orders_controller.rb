require 'nokogiri'

class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = JSON.parse(Order.find(params[:id]).content)
    @msg = '<b>The following will be deleted if you continue: </b><table class="x-grid3-body"><tr class="x-grid3-header"><th class="x-grid3-hd-inner" style="width:60px;">Site</Th><th class="x-grid3-hd-inner">Site Name</th></tr><tr><td colspan="2"><div style="overflow:auto; height: 300;"><table><tr class="x-grid3-locked"><td class="x-grid3-hd-inner" style="width:30px;"><b>1936</b></td><td class="x-grid3-hd-inner"><b>Entity Name</b></td></tr><tr><td></td><td><table><tr class="x-grid3-header"><td class="x-grid3-hd-inner">ID</td><td class="x-grid3-hd-inner">First Name</td><td class="x-grid3-hd-inner">Last Name</td><td class="x-grid3-hd-inner">DOB</td></tr><tr class="x-grid3-locked"><td class="x-grid3-hd-inner">15145</td><td class="x-grid3-hd-inner">John</td><td class="x-grid3-hd-inner">Smith</td><td class="x-grid3-hd-inner">01\u002F06\u002F1931</td><td class="x-grid3-hd-inner" align="right"></td></tr></table>'
    @html = '
			<html>
				<body>
					<b>This is
					some text.</b>
					<p>This is some more text.</p>
					<pre>
					This is
					preformatted
					text.
					</pre>
				</body>
		  </html'
		@doc = Nokogiri::HTML(@html)		  
    #raise @order.inspect
    #@order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
