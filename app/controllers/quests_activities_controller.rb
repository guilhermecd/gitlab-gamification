class QuestsActivitiesController < ApplicationController
  before_action :set_quests_activity, only: [:show, :edit, :update, :destroy]

  # GET /quests_activities
  def index
    @quests_activities = QuestsActivity.all
  end

  # GET /quests_activities/1
  def show

  end

  # GET /quests_activities/new
  def new
    @quests_activity = QuestsActivity.new
  end

  # GET /quests_activities/1/edit
  def edit
  end

  # POST /quests_activities
  def create
    @quests_activity = QuestsActivity.new(quests_activity_params)

    if @quests_activity.save
      redirect_to @quests_activity, notice: 'Quests activity was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /quests_activities/1
  def update
    if @quests_activity.update(quests_activity_params)
      redirect_to @quests_activity, notice: 'Quests activity was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /quests_activities/1
  def destroy
    @quests_activity.destroy
    redirect_to quests_activities_url, notice: 'Quests activity was successfully destroyed.'
  end

  #DESCRIPT /quests_activities/description
  def description
    sql = 'SELECT * 
           FROM quests_activities 
           WHERE quests_id = ' + '1'
    print "skoakoskoakosaokskoaoksokakosakosokaoksaok-- "

    @quests_activities = QuestsActivity.find_by_sql([sql])
    #@quests_activities = QuestsActivity.find(params[:quests_id])
    # @quests_activities = QuestsActivity.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quests_activity
      @quests_activity = QuestsActivity.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def quests_activity_params
      params.require(:quests_activity).permit(:descricao_tarefa, :quests_id, :qtd_pontos, :parent_activity, :target_type, :action, :label)
    end
end
