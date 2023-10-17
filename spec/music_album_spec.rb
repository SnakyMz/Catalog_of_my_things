require_relative '../classes/music_album'

describe MusicAlbum do
  context 'When testing the MusicAlbum class' do
    it 'Should be instance of the class' do
      album = MusicAlbum.new('2020-01-26', on_spotify: true)
      expect(album).to be_instance_of(MusicAlbum)
    end

    it 'move_to_archive should return true' do
      album = MusicAlbum.new('2010-01-26', on_spotify: true)
      album.move_to_archive
      expect(album.archived).to eql true
    end

    it 'move_to_archive should return true' do
      album = MusicAlbum.new('2010-01-26', on_spotify: false)
      album.move_to_archive
      expect(album.archived).to eql false
    end

    it 'move_to_archive should return false for published_date less than 10 years' do
      album = MusicAlbum.new('2018-09-08', on_spotify: false)
      album.move_to_archive
      expect(album.archived).to eql false
    end
  end
end
