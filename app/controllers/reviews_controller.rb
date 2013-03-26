class ReviewsController < ApplicationController
  before_filter :load_product


  # GET /product/:id/reviews
 
  def index
    @reviews = Review.all
  
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = Review.find(params[:id])

  
  end

  # GET /reviews/new
  # GET /reviews/new.json
  def new
    @review = Review.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/1/edit
  def edit
    @review = Review.find(params[:id])
  end

  # POST /product/:id/reviews
  def create
    # @review = Review.new(
    #   :comment => params[:review][:comment], 
    #   :product_id => @product.id, 
    #   :user_id => current_user.id
    #   )
    @review = @product.reviews.build(
      :comment => params[:review][:comment],
      :user_id => current_user.id
      )

      if @review.save
        redirect_to @product, notice: 'Review was successfully created.'
      else
        render "/products/show"
      end
  end

  # PUT /reviews/1
  # PUT /reviews/1.json
  def update
    @review = Review.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url }
      format.json { head :no_content }
    end
  end

  def load_product
    @product = Product.find(params[:product_id])
  end
end
