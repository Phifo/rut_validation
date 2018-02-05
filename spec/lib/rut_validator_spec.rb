require "spec_helper"

describe User do
  before(:each) do
    @user = User.new
  end

  context 'when the rut has seven digits' do
    it 'returns a valid record for a correct rut with dots' do
      @user.rut = '1.234.567-4'
      @user.should be_valid
    end

    it 'retuns a valid record for a correct rut without dots' do
      @user.rut = '6354455-8'
      @user.should be_valid
    end

    it 'returns an invalid record for an incorrect rut with dots' do
      @user.rut = '7.654.764-8'
      @user.should_not be_valid
    end

    it 'retuns an invalid record for an incorrect rut without dots' do
      @user.rut = '7654764-8'
      @user.should_not be_valid
    end
  end

  context 'when the rut has eight digits' do
    it 'returns a valid record for a correct rut with dots' do
      @user.rut = '10.137.341-k'
      @user.should be_valid
    end

    it 'returns a valid record for a correct rut without dots' do
      @user.rut = '16329351-K'
      @user.should be_valid
    end

    it 'returns an invalid record for an incorrect rut with dots' do
      @user.rut = '67.124.556-8'
      @user.should_not be_valid
    end

    it 'retuns an invalid record for an incorrect rut without dots' do
      @user.rut = '67124556-8'
      @user.should_not be_valid
    end
  end

  context 'when the rut has nine digits' do
    it 'returns a valid record for a correct rut with dots' do
      @user.rut = '100.327.775-1'
      @user.should be_valid
    end

    it 'returns a valid record for a correct rut without dots' do
      @user.rut = '100327775-1'
      @user.should be_valid
    end

    it 'returns an invalid record for an incorrect rut with dots' do
      @user.rut = '100.327.775-2'
      @user.should_not be_valid
    end

    it 'retuns an invalid record for an incorrect rut without dots' do
      @user.rut = '100327775-2'
      @user.should_not be_valid
    end
  end

  context 'when the rut has an invalid formatting' do
    it 'returns an invalid record for a badly formatted rut' do
      @user.rut = '16329351.-K'
      @user.should_not be_valid
    end

    it 'returns an invalid record for a nil rut' do
      @user.rut = nil
      @user.should_not be_valid
    end

    it 'returns an invalid record for a rut without verification digit' do
      @user.rut = 63544558
      @user.should_not be_valid
    end
  end
end