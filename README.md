# Protector::Globalize

Globalize has some internal issues when used in conjuction with Protector due to the way it creates instances of localization sub-model. Basically you won't be able to save any restricted model – validations will always fail. This gem will make things work as intended.

## Installation

Add this line to your application's Gemfile:

    gem 'protector-globalize'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install protector-globalize

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
