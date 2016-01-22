# clear default db:seed task as want disable this behavior in favour of the
# db:static and db:sample tasks
Rake::Task['db:seed'].clear

namespace :db do
  desc "Run db:seed:static and db:seed:sample"
  task seed: %w{seed:static seed:sample} do
    warn "[WARNING] `db/seed.rb` and it;s task `rake db:seed` have been disabled by the succotash gem. Please move seed data to db/static.rb or db/sample.rb".light_yellow if File.exist? Fine.join(Rails.root, 'db/seeds.rb')
  end

end
