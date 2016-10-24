class UsersHasQuestsActivitiesController < ApplicationController
  before_action :set_users_has_quests_activity, only: [:show, :edit, :update, :destroy]

  # GET /users_has_quests_activities
  def index
    sql = 'SELECT * FROM users_has_quests_activities WHERE users_id= ' + @current_user.id.to_s
    @users_has_quests_activities = UsersHasQuestsActivity.find_by_sql([sql])   
  end

  # GET /users_has_quests_activities/1
  def show
  end

  # GET /users_has_quests_activities/new
  def new
    @users_has_quests_activity = UsersHasQuestsActivity.new
  end

  # GET /users_has_quests_activities/1/edit
  def edit
  end

  # POST /users_has_quests_activities
  def create
    @users_has_quests_activity = UsersHasQuestsActivity.new(users_has_quests_activity_params)

    if @users_has_quests_activity.save
      redirect_to @users_has_quests_activity, notice: 'Users has quests activity was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users_has_quests_activities/1
  def update
    if @users_has_quests_activity.update(users_has_quests_activity_params)
      redirect_to @users_has_quests_activity, notice: 'Users has quests activity was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users_has_quests_activities/1
  def destroy
    @users_has_quests_activity.destroy
    redirect_to users_has_quests_activities_url, notice: 'Users has quests activity was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_has_quests_activity
      @users_has_quests_activity = UsersHasQuestsActivity.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def users_has_quests_activity_params
      params.require(:users_has_quests_activity).permit(:quests_activities_id, :users_id)
    end
end
