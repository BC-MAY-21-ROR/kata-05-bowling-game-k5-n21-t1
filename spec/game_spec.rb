require 'rspec'
require_relative '../classes/game'

RSpec.describe Game do
    it 'number of knock down pines in one shot' do
        game = Game.new
        expect(game.shot(1)).to be_between(0,10)
    end

    it 'number of knock down pines in second shot' do
        game = Game.new
        first_shot = game.shot(1)
        expect(game.shot(2)).to be_between(0,10-first_shot)
    end

    it 'returns the actual score of the frame 1' do
        game = Game.new
        new_frame = game.fill_frame(1,0)
        puts "First shot #{game.first_shot}"
        puts "Second shot #{game.second_shot}"
        expect(new_frame).to eq(game.first_shot + game.second_shot)
    end

    it 'returns the total score of the game' do
        game = Game.new
        play = game.play
        puts game.score
        puts play
        expect(play).to be_between(0,500)
    end
    it 'returns the sum of the before score plus the first shot and the actual score' do
        game = Game.new
        zero_frame = game.fill_frame(0,0)
        puts "zero_frame : #{game.score[0]}"
        first_frame = game.fill_frame(1,1)
        puts "First shot, first frame #{game.first_shot}"
        puts "second shot, first frame #{game.second_shot}"
        puts "first_frame : #{first_frame}"
        second_frame = game.fill_frame(2,0)
        puts second_frame
        puts "First shot, second frame #{game.first_shot}"
        puts "second shot, second frame #{game.second_shot}"
        puts "first_frame : #{first_frame}"
        #expect(game.score[2]).to eq(first_frame + second_frame)
    end
end