require_relative './config/environment'
#require_relative 'app/controllers/agents_controller'
#require_relative 'app/controllers/listings_controller'

require './config/environment'

#if ActiveRecord::Migrator.needs_migration?
  #raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
#end

use Rack::MethodOverride
use SessionsController
use ListingsController
run ApplicationController