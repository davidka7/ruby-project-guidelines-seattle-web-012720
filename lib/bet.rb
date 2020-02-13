class Bet < ActiveRecord::Base
    belongs_to :better
    belongs_to :biker

    def self.all_races
        Bet.all.map{|objetcs|objetcs.race}.uniq
    end

    def self.all_location
        Bet.all.map{|objetcs|objetcs.location}.uniq
    end

    def self.create_new_race(racez,locationz) #create
        Random.rand(4..6).times do Bet.create(race: racez, bet: Random.rand(50000),location: locationz, better_id: Better.all.sample.id, biker_id: Biker.all.sample.id) end
    end

    def self.find_by_name_of_race(racez) #read
        self.where(race: racez).order(created_at: :desc)
    end

    def self.destroy_race(racez) #destroy
        self.destroy_by(race: racez)
        puts "Race Over"
    end

    def self.all_of_people_in_race(racez)
        a = Bet.all.where(race: racez).map{|number|number.biker_id}
        
        ##a=[1,6,3,4,6,9]
        #do 
           b =  a.map{|b|Biker.all.find(b)}
            b.map{|b_obj|b_obj.name}
          #z =   Biker.all.select{|object|object.id == }
          #b = Biker.all.select{|inside|inside.id}
           # a.select{|a|a==b}
        #end


       # if i < a.length.times  
       # a.length.times do Biker.all.find_by(id:a[i]).name i+=1 end
        #end
    end

    def self.count_of_people_in_race(racez)
        a = Bet.all.where(race: racez).map{|number|number.biker_id}.uniq
    end

    def self.who_will_win_race_random_biker(racez) #read
       a = Bet.all.where(race: racez).map{|number|number.biker_id}[Random.rand(1..Bet.count_of_people_in_race(racez).length)-1]
       Biker.all.find_by(id: a).name
    end

    def self.who_won_on_what_race(racez) #read
        p "The winner is #{Bet.who_will_win_race_random_biker(racez)}"
    end

    def self.see_who_is_in_a_race(racez)
        Bet.all.where(race: racez)
    end

    def self.all_of_betters_who_bet_on_winner(racez)
        a = Bet.all.where(biker_id: Biker.all.select{|object|object.name == Bet.who_will_win_race_random_biker(racez)}).map{|the_ids|the_ids.better_id}
        ##a=[1,6,3,4,6,9]
        #do 
           b =  a.map{|b|Better.all.find(b)}
            b.map{|b_obj|b_obj.name}
    end

    def self.i_bet_money_on_you(racez, player_bet_on, bets) #read
        #"The winner is #{player_bet_on}"
    #Bet.who_won_on_what_race(racez)
       if z = "#{Bet.who_won_on_what_race(racez)}" == "The winner is #{player_bet_on}"
            puts "Dang, your so good at this, you won three times more than you original #{bets}, congratulations to You and too #{Bet.all_of_betters_who_bet_on_winner(racez)}"
            Bet.destroy_race(racez)
        else
            puts "Okay you are pretty bad at this, if you have no more money, get out!! All Betters,#{Bet.all_of_betters_who_bet_on_winner(racez)} who bet on the winner rider can proceed to the virtual office to collect their money"
            z

           Bet.destroy_race(racez)
        end
    end

   # def self.change_race_name(racez, new_race_name) #update
        
      #  user = self.find_by(race: racez)
     #   user.update_all(race: new_race_name)
   # end
   def self.change_location_of_race(locationz, new_location_name)
    self.where(location: locationz).update(location: new_location_name)
   end

   def self.change_name_of_race(racez, new_race_name)
    self.where(race: racez).update(race: new_race_name)
   end

    #def self.change_location_of_race(locationz, new_location_name) #update
       # self.find_by_location(locationz).update(location: new_location_name)
       # user = self.find_by(location: locationz)
        #user.update_all(location: new_location_name)
   # end

    #def self.find_by_location(locationz)
      #  self.find_by(location: locationz)
        # iterate over all bets and grab by same location
    #end


    
end