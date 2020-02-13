
class CommandLineInterface

    

    def greet

        url= "http://artii.herokuapp.com/make?text=Hello+World"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        puts response.body
        puts 'Welcome to the Universal Races, the best web to bet on your favorite Riders!'.colorize(:light_blue) 
        CommandLineInterface.run
    end
  
  


  def self.run
     puts "Hey, nice to see you here, do you want to see all the races running at the moment? - enter - 'Y' or 'N'".colorize(:light_blue) 
     answer = gets.chomp
     if answer == "Y"
        puts "Here are all the Races!!!!!"
        puts Bet.all_races
        CommandLineInterface.riders
     elsif answer == "N"
       CommandLineInterface.leave_or_stay

    else
        puts "goodbye"
    end

end


def self.leave_or_stay
    puts "Would you want to continue on your betting journey or leave, say 'yess' if you want too, say 'nah' if you want to leave".colorize(:light_blue) 
    answer = gets.chomp
    if answer =="yess" 
        CommandLineInterface.all_options
    else
       puts "goodbye"
    end

end

def self.riders

    puts " Want to see every rider in a specific race, hmm, sure, enter the race name, otherwise enter in 'create' if you want to sponsor a race of your own!!!.".colorize(:light_blue) 
    answer = gets.chomp

    if Bet.all_races.select{|races|races == answer} == [answer]
        puts "Here are all the Bikers within this race!!!!".colorize(:light_blue) 
        puts "#{Bet.all_of_people_in_race(answer)}".colorize(:light_green) 
        CommandLineInterface.all_options
    elsif answer == "create"
        CommandLineInterface.racez
    else
    puts "try again"
    CommandLineInterface.run
    end
    end


    def self.all_options 
        url= "http://artii.herokuapp.com/make?text=Option+Menu"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        puts response.body

        puts "Hello, at the front office, you have many options, please enter for which you want to see or do.
                The options are: 
                1. If you are Better, you have the option to create a race, please enter 'race'.

                2. If you are feeling excited and want to sponsor a race, and change its location, enter 'location' here.

                3. If you want to change the name of a race, well if everyone around you is fine with that, then please do, by entering 'name'.

                4. If you want to view what races were bet on, you can, but since, we had some security issues lately, our system is down for personal data info, enter 'id' to see status on it.
                
                5. You also have the option of betting on a race, you will either win or lose money, 
                wether your a vip member or not, please enter in the name of the race you want to bet on, 
                just remember since the races have already happened, you get your results immediately,
                and the race dissapears from the account that you bid on.
                
                6. Secret Account, the password is not 'Secret_Code'".colorize(:light_red) 

                

                puts "Here are the races you can bet on" 
                puts "Here are the Present races"
                puts Bet.all_races
                puts "Here are the locations of all races"
                puts Bet.all_location
                
                answer = gets.chomp
                if answer == "race"

                        CommandLineInterface.racez
                elsif answer == "Secret_Code"
                    puts "
                    Bad Reviews Deleted:
                    
                    1. This game is based on luck not skill, It's sort of rigged!>!?@L@
                    
                         ̿'̿''̿̿ ̿ ̿ ̿ ̿ ̿
                        ﾉ*:･ﾟ✧ ✧ﾟ･: *ヽ(◕ヮ◕ヽ)
                        [̲̅$̲̅(̲̅5̲̅)̲̅$̲̅]
                        ┬┴┬┴┤ ͜ʖ ͡°) ├┬┴┬┴
                        ( ͡°╭͜ʖ╮͡° )
                        (͡ ͡° ͜ つ ͡͡°)
                        (• Ε •)
                        (ง'̀-'́)ง
                        (ಥ﹏ಥ)
                        ﴾͡๏̯͡๏﴿ O



                        2. They Robbed after they gave me the money, I was walking down the little street called deads man road when i got off the hippo transit on exit 40,
                        I smashed with a rock by two man wearing Universal Shirts, one of them Cashiers at the office, i could swear he looked like him, he was just twice bigger!!
                        "

                    
                            CommandLineInterface.all_options
                       

                elsif answer == "location"
                    CommandLineInterface.locationz

                elsif answer == "name"
                    CommandLineInterface.namez

                elsif answer == "id"
                    CommandLineInterface.idz
                elsif Bet.all_races.select{|race|race == answer} == [answer]
                puts Bet.all_of_people_in_race(answer)
                    if  Bet.all_races.select{|race|race == answer} == [answer]
                        puts "enter in first a players name"
                        baby = gets.chomp


                        if  Bet.all_of_people_in_race(answer).select{|player|player == baby } == [baby]
                            puts "enter bidding amount"
                            suppert = gets.chomp
                            Bet.i_bet_money_on_you(answer, baby, suppert)
                            CommandLineInterface.all_options
                        else
                            puts "got an error in grammer try again"
                            CommandLineInterface.all_options
                        end
                    
                    else
                            puts "got an error in grammer try again"
                            CommandLineInterface.all_options



                    end

                else
                    CommandLineInterface.goodbye
                end

            end

            def self.racez
                puts "Enter leave if you want to go back to main menu, otherwise enter in anything else you want to name your your new race!!"
                answer = gets.chomp
                if answer == "leave"
                    CommandLineInterface.all_options
                end
                puts "After the name please enter a location"
                diffVariable = gets.chomp
                    Bet.create_new_race(answer, diffVariable)
                    CommandLineInterface.all_options
                
            end

            def self.locationz
                "Remeber entering a wrong original location, will give you no value to your new location"
                puts "Here are all the locations of every race"
                puts Bet.all_location
                puts "Enter leave if you want to go back to main menu, otherwise enter in first the orignial location"
                answer = gets.chomp
                if answer == "leave"
                    CommandLineInterface.all_options
                end
                puts "Now enter in the new location"
                diffVariable = gets.chomp
                if Bet.all_location.select{|location|location == answer} ==[answer]
                    Bet.change_location_of_race(answer, diffVariable)
                    CommandLineInterface.all_options
                else
                    puts "back to main menu"
                    CommandLineInterface.all_options
                end
            end

            def self.namez
                puts "Remeber entering a wrong original race name, will give you no value to your new race name"
                puts "Enter leave if you want to go back to main menu, otherwise enter in the original race name first."
                answer = gets.chomp
                if answer == "leave"
                    CommandLineInterface.all_options
                end
                puts "And after enter in the new name"
                diffVariable = gets.chomp
                if Bet.all_races.select{|races|races == answer} == [answer]
                    Bet.change_name_of_race(answer, diffVariable)
                    CommandLineInterface.all_options
                else 
                    puts "back to main menu"
                    CommandLineInterface.all_options
                end
            end

            def self.idz
                puts "'DownnnnnN!!!!!!!!!'Enter leave if you want to go back to main menu" # enter a race to see just ids, but the name of the race, location and bid amount will be shown!>!>!!!"
                answer = gets.chomp
                if answer == "leave"
                    CommandLineInterface.all_options
                elsif Bet.all_races.select{|races|races == answer} == answer
                    Bet.find_by_name_of_race(racez)
                    #CommandLineInterface.all_options
                else 
                    CommandLineInterface.all_options
                end
            end



            def self.goodbye
                puts "if you still want to continue on your journey enter yess, otherise enter anything else
                "
                answer = gets.chomp
            if answer == "yess"
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