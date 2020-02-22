RSpec.describe ReservedSubdomains do
  context 'Allowed Subdomains' do
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
