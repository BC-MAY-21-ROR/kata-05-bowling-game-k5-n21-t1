# frozen_string_literal: true

# Class of the game who is able to fill frames, do a ball roll and play
class Game
  def initialize
    @first_shot = 0
    @second_shot = 0
    @third_shot = 0
    @score = Array.new(10, 0)
  end

  def obtain_first_shot
    @first_shot = rand(0..10)
  end

  def obtain_second_shot
    @second_shot = rand(0..(10 - @first_shot))
  end

  def obtain_third_shot
    @third_shot = rand(0..10)
  end


  def validate_last_frame
    if @first_shot == 10 && @second_shot == 10 && @third_shot == 10
      30
    elsif @first_shot + @second_shot == 10
      10 + obtain_third_shot
    else
      @first_shot + @second_shot
    end
  end

  def bonus(frame_number, bonus)
    case bonus
    when 1
      @score[frame_number - 1] += @first_shot
    when 2
      @score[frame_number - 1] += @first_shot + @second_shot
    when 3
      @score[frame_number - 1] += validate_last_frame
    end
  end

  def fill_frame(frame_number, bonus)
    @score[frame_number] += obtain_first_shot
    @score[frame_number] += obtain_second_shot
    bonus(frame_number, bonus)
    @score[frame_number] += @score[frame_number - 1] if frame_number != 0
  end

  def print_score(frame_number)
    print "\n\tFrame #{frame_number + 1}"
    print "\n\t\tPrimer tiro #{@first_shot}\n"
    print "\n\t\tSegundo tiro: #{@second_shot}\n"
    print "\n\t\tPuntuacion #{@score[frame_number]}\n"
  end

  def play
    (0..8).each do |frame|
      if @first_shot == 10
        fill_frame(frame, 2)
      elsif @first_shot + @second_shot == 10
        fill_frame(frame, 1)
      else
        fill_frame(frame, 0)
      end
      print_score(frame)
    end
    fill_frame(9, 3)
    print_score(9)
  end
  attr_reader :first_shot, :second_shot, :score
end
