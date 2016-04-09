module SubdomainValidation
  class SubdomainValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)

      if value.blank?
        record.errors.add(attribute, :blank)
        return
      end

      record.errors.add(attribute, :taken) if reserved_name.include?(value)
      record.errors.add(attribute, :too_short, count: 3) if value.length < 3
      record.errors.add(attribute, :too_long, count: 63) if 63 < value.length

      record.errors.add(attribute, I18n.t('subdomain_validation.errors.messages.label')) if value =~ /[^A-Za-z0-9\-]/

      record.errors.add(attribute, I18n.t('subdomain_validation.errors.messages.first_character')) if value =~ /^-/
      record.errors.add(attribute, I18n.t('subdomain_validation.errors.messages.last_character')) if value =~ /-$/
    end

    private
    def reserved_name
      case options[:reserved_name]
      when nil
        %w(www http https ftp sftp ssl ns mx pop smtp admin mail users)
      when false
        []
      else
        options[:reserved_name]
      end
    end
  end
end
