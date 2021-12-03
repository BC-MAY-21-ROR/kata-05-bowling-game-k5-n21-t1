class Game
    def initialize()
        @first_shot = 0
        @second_shot = 0
        @score = Array.new(10, 0)
    end

    def shot(opportunity)
        if opportunity == 1
            @first_shot = rand(0..10)
        else
            @second_shot = rand(0..(10-@first_shot))
        end
    end

    def fill_frame(frame_number,bonus)
        if bonus == 2
            @score[frame_number-1] += @first_shot+@second_shot
        elsif bonus == 1
            @score[frame_number-1] += @first_shot
        end
        @score[frame_number] += shot(1)
        @score[frame_number] += shot(2)
        if frame_number != 0
            @score[frame_number] += @score[frame_number-1]
        end
    end

    def play
        (0..9).each do |frame|
            if @first_shot == 10
                fill_frame(frame,2)
            elsif @first_shot + @second_shot == 10
                fill_frame(frame,1)
            end
            fill_frame(frame,0)
        end
        @score[9]
    end

    attr_reader :first_shot,:second_shot,:score
end