class Biker < ActiveRecord::Base
    has_many :bets
    has_many :betters, through: :bets



end