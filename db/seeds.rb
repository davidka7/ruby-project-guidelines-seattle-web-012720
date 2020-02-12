require "pry"
# require_relative '../config/environment'

#bt1 =  Better.create("Junior Patato")
#bt2 =  Better.create("Millionare Spinach")
#bt3 =  Better.create("Power Powder")
#bt4 =  Better.create("Elpato Biwi")
#bt5 =  Better.create("Mario X-Moore")
#bt6 =  Better.create("Sazuki Hasikepo")
#bt7 =  Better.create("")
#bt8 =  Better.create("")
#bt9 =  Better.create("")
#bt10 = Better.create("")
#bt11 = Better.create("")
#bt12 = Better.create("")
#bt13 = Better.create("")
#bt14 = Better.create("")
#bt15 = Better.create("")
#bt16 = Better.create("")
#bt17 = Better.create("")
#bt18 = Better.create("")
#bt19 = Better.create("")
#bt20 = Better.create("")
#bt21 = Better.create("")
#bt22 = Better.create("")
#bt23 = Better.create("")
#bt24 = Better.create("")
#bt25 = Better.create("")
#bt26 = Better.create("")
#bt27 = Better.create("")
#bt28 = Better.create("")
#bt29 = Better.create("")
#bt30 = Better.create("")

        #a = 5.times do (location: Faker::Games::ElderScrolls.city) end
          #  binding.pry
        #b = 5.times do (race: Faker::Games::ElderScrolls.name) end
        Biker.delete_all
        Biker.reset_pk_sequence
        Better.delete_all
      Better.reset_pk_sequence
         Bet.delete_all
         Bet.reset_pk_sequence
    #    binding.pry
          25.times do Biker.create(name: Faker::FunnyName.name, age: Random.rand(15..50)) end
          100.times do Better.create(name: Faker::Name.name) end
         Random.rand(4..6).times do Bet.create(race: "Joongle Death", bet: Random.rand(50000),location: "Solitude", better_id: Better.all.sample.id, biker_id: Biker.all.sample.id) end
         Random.rand(4..6).times do Bet.create(race: "Frost Trail", bet: Random.rand(50000),location: "Cyrodul", better_id: Better.all.sample.id, biker_id: Biker.all.sample.id) end
         Random.rand(4..6).times do Bet.create(race:"Bloody Giver", bet: Random.rand(50000),location: "Towers Of Doom", better_id: Better.all.sample.id, biker_id: Biker.all.sample.id) end
         Random.rand(4..6).times do Bet.create(race: "When the Clock hits ZERO", bet: Random.rand(50000),location: "Potato Town", better_id: Better.all.sample.id, biker_id: Biker.all.sample.id) end  
         Random.rand(4..6).times do Bet.create(race: "Dark Sky", bet: Random.rand(50000),location: "Center Village", better_id: Better.all.sample.id, biker_id: Biker.all.sample.id) end
         

      

