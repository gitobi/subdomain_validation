FactoryGirl.define do
  factory :site do
    name                          'web'
    name_with_option              'web'
    name_with_reserved_name_false 'web'
  end
end
