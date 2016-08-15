class QuestsController < ApplicationController
  before_action :set_quest, only: [:show, :edit, :update, :destroy]

  # GET /quests
  def index
    @quests = Quest.all
  end

  # GET /quests/1
  def show
  end

  # GET /quests/new
  def new
    @quest = Quest.new
  end

  # GET /quests/1/edit
  def edit
  end

  # POST /quests
  def create
    @quest = Quest.new(quest_params)

    if @quest.save
      redirect_to @quest, notice: 'Quest was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /quests/1
  def update
    if @quest.update(quest_params)
      redirect_to @quest, notice: 'Quest was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /quests/1
  def destroy
    @quest.destroy
    redirect_to quests_url, notice: 'Quest was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quest
      @quest = Quest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def quest_params
      params.require(:quest).permit(:nome_quest, :nivels_id, :valor_pontos)
    end
end
