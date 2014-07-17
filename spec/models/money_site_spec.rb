require 'spec_helper'

describe MoneySite do
  
  before do
  	@money_site = MoneySite.new(root_domain: "www.test.com", pbn_id: 2, description: "this is a test money site entry")
  end

  subject { @money_site }

  it { should respond_to(:root_domain) }
  it { should respond_to(:pbn_id) }
  it { should respond_to(:description) }

  it { should be_valid }

  describe "when root_domain is not present" do
  	before { @money_site.root_domain = " " }
  	it { should_not be_valid }
  end

  describe "when pbn_id is not present" do
  	before { @money_site.pbn_id = " " }
  	it { should_not be_valid }
  end

  describe "when description is not present" do
  	before { @money_site.description = " " }
  	it { should_not be_valid }
  end

  describe "when root_domain is present" do
  	before { @money_site.root_domain = "www.test.com" }
  	it { should be_valid }
  end

  describe "when root_domain is too long" do
    before { @money_site.root_domain = "a" * 101 }
    it { should_not be_valid }
  end

  describe "when root_domain format is invalid" do
    it "should be invalid" do
      urls = %w[sldk3-*com, dslfkjsldfs lol.****&&&.co]
      urls.each do |invalid_url|
        @money_site.root_domain = invalid_url
        expect(@money_site).not_to be_valid
      end
    end
  end

  describe "when root_domain format is valid" do
    it "should be valid" do
      urls = %w[ www.railstutorial.com iamatest.co.uk test-me.com.au www.test-test-test.com ]
      urls.each do |valid_url|
        @money_site.root_domain = valid_url
        expect(@money_site).to be_valid
      end
    end
  end

  describe "when root_domain is already taken" do
    before do
      money_site_with_same_url = @money_site.dup
      money_site_with_same_url.root_domain = @money_site.root_domain.upcase
      money_site_with_same_url.save
    end

    it { should_not be_valid }
  end



end
