# ActiveCampaignRb

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/active_campaign_rb`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_campaign_rb'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install active_campaign_rb

## Usage

```ruby
ActiveCampaignRb.configure do |config|
  config.api_endpoint = active_campaign_api_endpoint
  config.api_key = active_campaign_api_key
end

# List all accounts
ActiveCampaignRb.list_accounts

# List all contacts, Supports filtering , sorting, pagination
ActiveCampaignRb.list_contacts(orders: {email: :asc})

# Retrieve a contact, path params substitution from params hash
# api path: /api/v3/contacts/{id}
ActiveCampaignRb.retrieve_contact({id: 1})

# Create tag
ActiveCampaignRb.create_tag(tag: {tag: 'Tag Name', description: 'Tag description'})
```

Ref [Active Campaign API Docs](https://developers.activecampaign.com/reference) for more params and options.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/EloquentStudio/active_campaign_rb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/EloquentStudio/active_campaign_rb/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ActiveCampaignRb project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/EloquentStudio/active_campaign_rb/blob/master/CODE_OF_CONDUCT.md).
