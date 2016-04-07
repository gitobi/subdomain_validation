module SubdomainValidation
  class SubdomainValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)

      if value.blank?
        record.errors.add(attribute, :blank)
        return
      end

      record.errors.add(attribute, :too_short, count: 3) if value.length < 3
      record.errors.add(attribute, :too_long, count: 63) if 63 < value.length

      record.errors.add(attribute, 'can only include letters and numbers and -') if value =~ /[^A-Za-z0-9\-]/

      record.errors.add(attribute, 'can not start with -') if value =~ /^-/
      record.errors.add(attribute, 'can not end with -') if value =~ /-$/
    end
  end
end
