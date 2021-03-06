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
            puts "#{index}. #{year.name}"
        end
    end

    def get_user_year
        chosen_year = gets.strip.to_i
        show_mileage_for(chosen_year) if valid_input(chosen_year, @years)
    end

    def valid_input(input, data)
        input.to_i <= data.length && input.to_i > 0
    end

    def show_mileage_for(chosen_year)
        year = @years[chosen_year - 1]
        year.get_mileage
        puts "Here is the combined mileage for #{year.name}"
        year.mileage.each.with_index(1) do |mileage, idx|
            puts "#{idx}. #{mileage.name}"
        end
    end
end