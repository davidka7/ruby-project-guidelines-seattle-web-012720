class Better < ActiveRecord::Base
    has_many :bets
    has_many :bikers, through: :bets


end