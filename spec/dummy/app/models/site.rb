class Site < ActiveRecord::Base
  include SubdomainValidation

  validates :name, subdomain: true
  validates :name_with_option, subdomain: true, allow_nil: true, allow_blank: true

end
