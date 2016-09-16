class RankController < ApplicationController
  def show
    print "aokskaoskaosokaoksokaokskoa\n\n\n\n\n\n"
    puts  params
    print "Algo? \n"
    sql = 'SELECT *
    FROM users
    ORDER BY score DESC
    LIMIT 10;'
    @usuarios = User.find_by_sql([sql])
  end

end
