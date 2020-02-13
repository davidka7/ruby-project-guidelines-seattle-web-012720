
class CommandLineInterface

    

    def greet
        puts 'Welcome to the Universal Races, the best web to bet on your favorite Riders!'
        CommandLineInterface.run
    end
  
  


  def self.run
     puts "Hey, nice to see you here, do you want to see all the races running at the moment? - enter - Y or N"
     answer = gets.chomp
     if answer == "Y"
        puts Bet.all_races
        CommandLineInterface.riders
     elsif answer == "N"
       CommandLineInterface.leave_or_stay

    else
        puts "goodbye"
    end

end


def self.leave_or_stay
    puts 'Would you want to continue on your betting journey or leave, say yess if you want too, say nah if you want to leave'
    answer = gets.chomp
    if answer =="yess" 
        CommandLineInterface.all_options
    else
       puts "goodbye"
    end

end

def self.riders

    puts " Want to see every rider in a specific race, hmm, sure, enter the race name, otherwise enter in create if you want to sponsor a race of your own!!!."
    answer = gets.chomp
    if Bet.all_races.select{|races|races == answer}
        puts Bet.all_of_people_in_race(answer)
        CommandLineInterface.all_options
    elsif answer == create
    puts "try again"

    else
    puts "try again"
    CommandLineInterface.run
    end
    end


    def self.all_options
        puts "Hello, at the front office, you have many options, please enter for which you want to see or do.
                The options are: if you are a VIP Bidder, you have the option to create a race, please enter race.
                If you are feeling excited and want to sponsor a race, and change its location, enter location here.
                If you want to change the name of a race, well if everyone around you is fine with that, then please do, by entering name.
                If you want to view what races were bet on, you can, but since, we had some security issues lately, we can only provide id NUMBERS, enter id.
                You also have the option of betting on a race, you will either win or lose money, 
                wether your a vip member or not, please enter in the name of the race you want to bet on, 
                just remember since the races have already happened, you get your results immediately,
                and the race dissapears from the account that you bid on.
                Here are the races currently going on"puts Bet.all_races
                
                answer = gets.chomp
                if answer == race
                        CommandLineInterface.racez

                elsif answer == location
                    CommandLineInterface.locationz

                elsif answer == name
                    CommandLineInterface.namez

                elsif asnwer == id
                    CommandLineInterface.idz
                elsif Bet.all_races.select{|race|race == answer}
                

                else
                    CommandLineInterface.goodbye
                end

            end

            def self.racez
                puts "Enter leave if you want to go back to main menu, otherwise enter in anything else to name your new race!>!>!!!"
                answer = gets.chomp
                if answer == leave
                    CommandLineInterface.all_options
                else 
                    Bet.create_new_race(racez,locationz)

                end
            end

            def self.locationz

            end

            def self.namez

            end

            def self.idz

            end



            def self.goodbye
                puts "if you still want to continue on your journey enter yess, otherise enter anything else
                "
                answer = gets.chomp
            if answer == yess
                CommandLineInterface.all_options
            else
                puts "goodbye"
            end

            end
    #kob = puts "2.:"

    #xxxxxxbob = puts "3. Thinking of Betting on a race, click here" 
    #xxxxxxBet.find_by(race: race_name)

    #dub = puts "4. Want to bet on a race, amazing, please enter the name of the race, rider your betting on as well as the amount your betting, thank you..race:,rider:,amount:"

    #mob = puts "5. Thinking of creating a race of your own... hmm press here"

   # sob = puts "6. Want to see how much people bet on a race, sure, but security comes first so we can only show you numbers not data"

    
   
   # wob = puts "7. You feeling excited, want to sponsor a race and change its location, sure!!"

    #rub = puts "8. You want to change the name of a race, well if everyone around you is fine with that, then please do"

    



   

end