# class Jeeps::CLI

#     def welcome
#         puts "Hey! Come to check out some Jeeps? You can use this CLI to check the mileage on different year models of the 4WD Wrangler Unlimited."
#         menu
#     end

#     def call 
#         puts "Jeep mileage"
#         menu
#     end

#     def user_input
#         user_input = gets.chomp
#     end

#     def menu
#         puts "Input 'mileage' to view this latest model's MPG, or 'done' to exit."
#         if user_input == 'mileage'
#             mileage
#         elsif user_input == 'done'
#             exit
#         else 
#             puts "Try again"
#         end
#         mileage
#     end

#     def mileage=(mileage)
#         @mileage = mileage
#     end

#     def mileage
#         @mileage
#     end

#     def exit
#         puts "Happy Trails! Don't forget the wave!"
#     end

#     def scrape_list
#         Jeeps::Scraper.scrape_mileage
#     end

# end


####### code along with eden events

class Jeeps::CLI
    def call
        puts "Thanks for coming to check out Wrangler mileage! Remember: it's the smiles per gallon, not the miles per gallon!"
        get_years
        list_years
        get_user_year
        # get_mpg_for(year)
        # list_mpg
    end

    def get_years
        @years = Jeeps::Year.all
    end

    def list_years
        puts "On what year are you interested in checking mileage?"
        @years.each.with_index(1) do |year, index|
            puts "#{index}. #{year}"
        end
    end

    def get_user_year
        chosen_year = gets.strip.to_i
        show_mileage_for(chosen_year) if valid_input(chosen_year, @years)
        end
    end

    def valid_input(input, data)
        input.to_i <= data.length && input.to_i > 0
    end

    def show_mileage_for(chosen_year)
        year = @years[chosen_year - 1]
        puts "Here is the mileage for #{year}"
        ## to implement
        # Jeeps::Mileage.all.each.with_index(1) do | mileage |
        #     puts mileage.number
        #end
        # get_mpg_for
    end
    binding.pry
end