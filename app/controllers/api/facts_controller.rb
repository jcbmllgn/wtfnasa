class Api::FactsController < Api::AbstractController
  before_action :set_fact, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  # GET /facts
  # GET /facts.json
  def index

    if params[:all] == true
      render :json => Fact.all
    else
      render :json => Fact.where( approved: true )
    end
  end

  # GET /facts/1
  # GET /facts/1.json
  def show
  end

  # GET /facts/new
  def new
    @fact = Fact.new
  end

  # GET /facts/1/edit
  def edit
  end

  # POST /facts
  # POST /facts.json
  def create
    @fact = Fact.new(fact_params)

    respond_to do |format|
      if @fact.save
        format.html { redirect_to @fact, notice: 'Fact was successfully created.' }
        format.json { render :show, status: :created, location: @fact }
      else
        format.html { render :new }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facts/1
  # PATCH/PUT /facts/1.json
  def update
    respond_to do |format|
      if @fact.update(fact_params)
        format.html { redirect_to @fact, notice: 'Fact was successfully updated.' }
        format.json { render :show, status: :ok, location: @fact }
      else
        format.html { render :edit }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end

  def upvote
    @fact.upvote = @fact.upvote + 1
    if @fact.save!
      render status: 201, json: {}
    else
      render status: 500, json: {}
    end
  end

  def downvote

    @fact = Fact.find(params[:id])

    @fact.downvote = @fact.downvote + 1
    if @fact.save!
      render status: 201, json: {}
    else
      render status: 500, json: {}
    end
  end

  # # DELETE /facts/1
  # # DELETE /facts/1.json
  # def destroy
  #   @fact.destroy
  #   respond_to do |format|
  #     format.html { redirect_to facts_url, notice: 'Fact was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fact
      @fact = Fact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fact_params
      params.require(:fact).permit(:title, :description, :url, :upvote, :downvote, :id)
    end
end
