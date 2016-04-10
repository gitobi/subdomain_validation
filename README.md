# SubdomainValidation

Subdomain validator for Rails

## Getting Started

Add subdomain_validation gem to your Gemfile.

`gem 'subdomain_validation'`

Run bundler.

`bundle install`

## How to use

First, Add `SubdomainValidation` module to a model.

```rb
class User < ActiveRecord::Base
  include SubdomainValidation
end
```

Next, add `validates` method on a column in the model.

```rb
class User < ActiveRecord::Base
  include SubdomainValidation

  validates :username, subdomain: true
end
```

## Validator Specifications

- Be not nil.
  - Allow by using allow_nil option
- Be not blank.
  - Allow by using allow_blank option
- Be not reserved name.
  - Customize by using reserved_name option
- Be more than 3 characters.
- Be less than or equal to 63 characters.
- Be in alphanumeric and hyphen.
- Do not start hyphen.
- Do not end hyphen.

### Reference

[RFC 1035 - Domain names - implementation and specification](https://tools.ietf.org/html/rfc1035)

### Default Settings

- reserved_name
  - The following name are prohibited to register by default. You can customize thease name.
    - www
    - http
    - https
    - ftp
    - sftp
    - ssl
    - ns
    - mx
    - pop
    - smtp
    - admin
    - mail
    - users


### Options

- reserved_name
  - Values: String Array or False
  - String Array
    - You can reserve the words which can not be taken.
    - If use this option, then default reserved_name will be disabled.
    - `validates :username, subdomain: { reserved_name: %w(www blog admin) }`
  - False
    - You can disable reserved_name feature.
    - If use this option, then default reserved_name will be disabled.
    - `validates :username, subdomain: { reserved_name: false }`
- Common options
  - allow_nil
    - You can allow nil value by using allow_nil option.
    - `validates :username, subdomain: true, allow_nil: true`
  - allow_blank
    - You can allow blank value by using allow_blank option.
    - `validates :username, subdomain: true, allow_blank: true`
  - on
    - You can specify when the validation should happen.
    - `validates :username, subdomain: true, on: :create`

### I18n

You can customize or add validation error messages.
Add following keys to your locale file in config/locales.

```yaml
en:
  subdomain_validation:
    errors:
      messages:
        label:           "can only include letters and numbers and \"-\""
        first_character: "can't start with \"-\""
        last_character:  "can't end with \"-\""
```

Or, make a pull request :)

# License

This project rocks and uses MIT-LICENSE.
