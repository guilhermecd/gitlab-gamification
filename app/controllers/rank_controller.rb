class RankController < ApplicationController
  def show
  	sql = 'SELECT *
    FROM users
    ORDER BY score DESC
    LIMIT 10;'

    @usuarios = User.find_by_sql([sql])
  end
end
