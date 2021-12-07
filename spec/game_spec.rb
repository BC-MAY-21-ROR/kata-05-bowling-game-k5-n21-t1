# frozen_string_literal: true

require 'rspec'
require_relative '../classes/game'

RSpec.describe Game do
  it 'number of knock down pines in one shot' do
    game = Game.new
    expect(game.obtain_first_shot).to be_between(0, 10)
  end

  it 'number of knock down pines in second shot' do
    game = Game.new
    first_shot = game.obtain_first_shot
    expect(game.obtain_second_shot).to be_between(0, 10 - first_shot)
  end

  it 'returns the actual score of the frame 1' do
    game = Game.new
    new_frame = game.fill_frame(1, 0)
    expect(new_frame).to eq(game.first_shot + game.second_shot)
  end

  it 'returns the total score of the game' do
    game = Game.new
    expect(game.score[9]).to be_between(0, 300)
  end
  it 'returns the sum of the before score plus the first shot and the actual score' do
    game = Game.new
    game.fill_frame(0, 0)
    game.fill_frame(1, 1)
    expect(game.score[1]).to eq(game.score[0] + game.first_shot + game.second_shot)
  end
end
