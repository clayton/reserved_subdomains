RSpec.describe ReservedSubdomains do
  context 'Allowed Subdomains' do
    it 'should allow non-reserved subdomains' do
      sut = ActiveModelTestClass.new
      sut.subdomain = 'hello-world'

      expect(sut).to be_valid
    end
  end

  context 'Reserved subdomains' do
    it 'should not allow anything on the reserved list' do
      sut = ActiveModelTestClass.new
      sut.subdomain = 'admin'

      expect(sut.valid?).to be false
    end

    it 'should not allow anything on the regexp list' do
      sut = ActiveModelTestClass.new
      sut.subdomain = 'ww2'

      expect(sut.valid?).to be false
    end

  end
end
