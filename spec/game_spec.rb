require_relative '../classes/game'

describe Game do
  context 'When testing the Game class' do
    it 'Should be instance of the class' do
      game = Game.new(true, '2022-02-15', '2020-01-26')
      expect(game).to be_instance_of(Game)
    end

    it 'move_to_archive should return true' do
      game = Game.new(true, '2019-02-15', '2010-01-26')
      game.move_to_archive
      expect(game.archived).to eql true
    end

    it 'move_to_archive should return false for published_date less than 10 years' do
      game = Game.new(true, '2019-02-15', '2018-09-08')
      game.move_to_archive
      expect(game.archived).to eql false
    end
  end
end
