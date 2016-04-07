module SubdomainValidation
  class SubdomainValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)

      record.errors[attribute] << 'is too short' if value.length < 3
      record.errors[attribute] << 'is too long' if  63 < value.length

      record.errors[attribute] << 'can only include letters and numbers and -' if value =~ /[^A-Za-z0-9\-]/

      record.errors[attribute] << 'can not start with -' if value =~ /^-/
      record.errors[attribute] << 'can not end with -' if value =~ /-$/
    end
  end
end
