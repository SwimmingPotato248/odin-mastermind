class Mastermind
    CODES = ["white", "black", "red", "blue", "green", "yellow"]
    attr_accessor :code
    def initialize(turns = 12)
        @turns = turns
        @code = []
        4.times { @code.push(CODES[rand(6)]) }
        @correct = false
        @current_turn = 0
    end

    def guess(guess)
        @guess = guess
    end

    def check_guess
        key = Array.new(4, "none")
        matched = Array.new(4, false)
        4.times do |i|
            if @guess[i] == code[i]
                key[i] = "black"
                matched[i] = true
            end
        end

        4.times do |i|
            if code.include?(@guess[i]) && key[i] != "black"
                key[i] = "white"
                matched[i] = true
            end
        end
        puts "Keys - #{key}"
        if key == ["black", "black", "black", "black"]
            @correct = true
        end
    end

    def play_game
        while !@correct && @current_turn < @turns
            @current_turn += 1
            puts "Turn #{@current_turn}"
            puts "Enter your guesses"
            puts "Possible color: #{CODES}"
            guess = gets.chomp.split
            puts "#{guess}"
            guess(guess)
            check_guess()
        end
        if @correct
            puts "Your guess is correct!! You guess it after #{@current_turn} turns"
        else
            puts "You didn't guess it in time!"
            puts "The code is #{@code}"
        end
    end
end

game = Mastermind.new
game.play_game