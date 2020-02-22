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
      list = YAML.load_file(
        File.join(
          File.dirname(__FILE__), '..', 'lib', 'reserved_subdomains_list.yml'
        )
      )


      sut = ActiveModelTestClass.new

      list.each do |reserved_subdomain|
        sut.subdomain = reserved_subdomain
        expect(sut).to be_invalid
      end

    end

    it 'should not allow subdomains that look like MX records' do
      sut = ActiveModelTestClass.new
      sut.subdomain = 'mx1'

      expect(sut).to be_invalid
    end

    it 'should not allow subdomains that look like databases' do
      sut = ActiveModelTestClass.new
      sut.subdomain = 'db99'

      expect(sut).to be_invalid
    end

    it 'should not allow subdomains that look like data centers' do
      sut = ActiveModelTestClass.new
      sut.subdomain = 'dc4'

      expect(sut).to be_invalid
    end

    it 'should not allow subdomains that look like dns servers' do
      sut = ActiveModelTestClass.new
      sut.subdomain = 'dns100'

      expect(sut).to be_invalid
    end

    it 'should not allow subdomains that look like ftp servers' do
      sut = ActiveModelTestClass.new
      sut.subdomain = 'ftp1'

      expect(sut).to be_invalid
    end

    it 'should not allow subdomains that look like generic hosts' do
      sut = ActiveModelTestClass.new
      sut.subdomain = 'host3'

      expect(sut).to be_invalid
    end

    it 'should not allow subdomains that look like mail servers' do
      sut = ActiveModelTestClass.new
      sut.subdomain = 'mail9'

      expect(sut).to be_invalid
    end

    it 'should not allow subdomains that look like imap servers' do
      sut = ActiveModelTestClass.new
      sut.subdomain = 'imap1'

      expect(sut).to be_invalid
    end

    it 'should not allow subdomains that look like name servers' do
      sut = ActiveModelTestClass.new
      sut.subdomain = 'ns2'

      expect(sut).to be_invalid
    end

    it 'should not allow subdomains that look like generic servers' do
      sut = ActiveModelTestClass.new
      sut.subdomain = 'server2'

      expect(sut).to be_invalid

      sut.subdomain = 'server-2'

      expect(sut).to be_invalid
    end

    it 'should not allow subdomains that look like smtp servers' do
      sut = ActiveModelTestClass.new
      sut.subdomain = 'smtp6'

      expect(sut).to be_invalid
    end

    it 'should not allow subdomains that look like dev servers' do
      sut = ActiveModelTestClass.new
      sut.subdomain = 'dev4'

      expect(sut).to be_invalid
    end

    it 'should not allow subdomains that look like static content servers' do
      sut = ActiveModelTestClass.new
      sut.subdomain = 'static4'

      expect(sut).to be_invalid
    end

    it 'should not allow subdomains that look like versions' do
      sut = ActiveModelTestClass.new
      sut.subdomain = 'v1'

      expect(sut).to be_invalid
    end

    it 'should not allow subdomains that look like semver versions' do
      sut = ActiveModelTestClass.new
      sut.subdomain = 'v1.0.0'

      expect(sut).to be_invalid
    end

    it 'should not allow subdomains that look like vpn servers' do
      sut = ActiveModelTestClass.new
      sut.subdomain = 'vpn2'

      expect(sut).to be_invalid
    end

    it 'should not allow subdomains that look like web servers' do
      sut = ActiveModelTestClass.new
      sut.subdomain = 'web3'

      expect(sut).to be_invalid
    end

    it 'should not allow subdomains that look like www servers' do
      sut = ActiveModelTestClass.new
      sut.subdomain = 'www4'

      expect(sut).to be_invalid
    end


  end
end
