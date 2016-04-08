class Site < ActiveRecord::Base
  include SubdomainValidation

  validates :name, subdomain: true
  validates :name_with_option, subdomain: { reserved_name: %w(blog) }, allow_nil: true, allow_blank: true
  validates :name_with_reserved_name_false, subdomain: { reserved_name: false }

end
