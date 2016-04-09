# SubdomainValidation

Subdomain validator for Rails

## Getting Started

Add subdomain_validation gem to your Gemfile.

`gem 'subdomain_validation'`

Run bundler.

`bundle install`

## How to use

Add `SubdomainValidation` module to a model.

```rb
class User < ActiveRecord::Base
  include SubdomainValidation
end
```

Add `validates` method on a column in the model.

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
  - String Array
  - You can reserve the words which can not be taken.
  - If use this option, then default reserved_name will be disabled.
  - `validates :username, subdomain: { reserved_name: %w(www blog admin) }`

# License

This project rocks and uses MIT-LICENSE.
