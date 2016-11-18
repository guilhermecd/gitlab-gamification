class RankController < ApplicationController
  def show
    if params[:format] == "ponto"
	    sql = 'SELECT *
	    FROM users 
	    ORDER BY score DESC, updated_at ASC;'
   		@usuarios = User.find_by_sql([sql])
      @control = 'ponto'
   	end
   	if params[:format] == "nivel"
	    sql = 'SELECT *
	    FROM users 
	    ORDER BY nivel DESC, updated_at ASC;'
   		@usuarios = User.find_by_sql([sql])
      @control = 'nivel'
   	end
  end
end

#  @current_user.nivel.to_s + ' 