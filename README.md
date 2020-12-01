# DiputacioGironaApp developments

## Deploying the app

The app is deployed with [Capistrano](http://capistranorb.com/) using [Figaro](https://github.com/laserlemon/figaro) for `ENV` configuration. In order to deploy it, these are the required steps:

1. Make sure you have Ruby installed with the correct version. Version is specified in the `.ruby-version` file in this repo. In order to test the Ruby version, use `ruby -v`. Using a version manager is recommended, please check RVM or RBenv for Ruby-specific managers, or asdf for a more general version manager.
1. Ensure you have all dependencies installed. Run `bundle install`. If it gives you an error saying Bundler is missing, install it first with `gem install bundler` and then run `bundle install`.
1. Ensure you have the required files to deploy the app. They are not included in this repo because they include sensitive data, so you'll need to ask around. Needed files are:

   1. `Capfile`
   1. `config/deploy.rb`
   1. `config/deploy/production.rb`
1. Make sure the ruby version  is the same that we have in the `config/deploy/production.rb`.
1. Deploy the app with `bundle exec cap production deploy`

After the deployment is finished it can take a few minutes to all services to restart.
In case you still get a 503 you can check if puma is running, in case it's not, you can restart it:

`bundle exec cap production puma:restart`


## Setting up the application

You will need to do some steps before having the app working properly once you've deployed it:

1. Open a Rails console in the server: `bundle exec rails console`
2. Create a System Admin user:

```ruby
user = Decidim::System::Admin.new(email: <email>, password: <password>, password_confirmation: <password>)
user.save!
```

3. Visit `<your app url>/system` and login with your system admin credentials
4. Create a new organization. Check the locales you want to use for that organization, and select a default locale.
5. Set the correct default host for the organization, otherwise the app will not work properly. Note that you need to include any subdomain you might be using.
6. Fill the rest of the form and submit it.

You're good to go!
