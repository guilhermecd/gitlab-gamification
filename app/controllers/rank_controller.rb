class RankController < ApplicationController
  def show
    if params[:format] == "ponto"
	    sql = 'SELECT *
	    FROM users 
	    ORDER BY score DESC;'
   		@usuarios = User.find_by_sql([sql])
   	end
   	if params[:format] == "nivel"
	    sql = 'SELECT *
	    FROM users 
	    ORDER BY nivel DESC;'
   		@usuarios = User.find_by_sql([sql])
   	end
  end

end

#  @current_user.nivel.to_s + ' 