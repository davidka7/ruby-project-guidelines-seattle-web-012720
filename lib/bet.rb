class Bet < ActiveRecord::Base
    belongs_to :better
    belongs_to :biker




    def self.create_new_race(racez,locationz) #create
        Random.rand(80).times do Bet.create(race: racez, bet: Random.rand(50000),location: locationz, better_id: Better.all.sample.id, biker_id: Biker.all.sample.id) end
    end

    def self.find_by_name_of_race(racez) #read
        self.where(race: racez).order(created_at: :desc)
    end

    def self.destroy_race(racez) #destroy
        self.destroy_by(race: racez)
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