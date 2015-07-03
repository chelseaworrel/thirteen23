require File.expand_path('../config/application', __FILE__)
  namespace :db do
   desc "Rebuild database"
   task :rebuild, [] => :environment do
     raise "Not allowed to run on production" if Rails.env.production?
     Rake::Task['db:drop'].execute
     Rake::Task['db:create'].execute
     Rake::Task['db:migrate'].execute
     Rake::Task['db:seed'].execute
   end
  end
Rails.application.load_tasks
