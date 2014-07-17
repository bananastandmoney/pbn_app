class MoneySite < ActiveRecord::Base
  before_save { self.root_domain = root_domain.downcase }

  VALID_ROOTDOMAIN_REGEX = /[\w\-\.]+\.[\w\-\.]+/
  validates :root_domain, 	presence: true, format: { with: VALID_ROOTDOMAIN_REGEX },
  							length: { maximum: 100 }, uniqueness: { case_sensitive: false }
  validates :pbn_id, presence: true
  validates :description, presence: true
end
