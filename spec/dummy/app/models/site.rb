class Site < ActiveRecord::Base
  include SubdomainValidation

  validates :name, subdomain: true

end
