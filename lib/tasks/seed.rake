# clear default db:seed task as want disable this behavior in favour of the
# db:static and db:sample tasks
Rake::Task['db:seed'].clear

namespace :db do
  desc "Run db:seed:static and db:seed:sample"
  task seed: %w{seed:static seed:sample} do
    warn "[WARNING] `db/seed.rb` and it;s task `rake db:seed` have been disabled by the succotash gem. Please move seed data to db/static.rb or db/sample.rb".light_yellow if File.exist? Fine.join(Rails.root, 'db/seeds.rb')
  end

  namespace :seed do

    def load_seed_namespace ns
      # create top-level task (eg db:seed:static or db:seed:sample)
      desc "Load #{ns} seed file"
      task ns => :environment do
        seed_list = YAML::load_file("#{Rails.root}/db/seeds/#{ns}.yml")["#{ns}_seed_files".to_sym] || []
        seed_list.each do |file|
          load_seed "#{Rails.root}/db/seeds/#{ns}/#{file}"
        end
      end

      namespace ns do
        FileList["#{Rails.root}/db/seeds/#{ns}/*.rb"].each do |seed_file|
          task_name = File.basename(seed_file, '.rb')

          desc "Load #{task_name} #{ns} seed file"
          task task_name => :environment do
            load_seed seed_file
          end
        end
      end

    end

    def load_seed seed_file
      return if Rails.env == 'production'
      if File.exist?(seed_file)
        ActiveRecord::Base.transaction do
          begin
            puts "*** Seeding #{seed_file} ***".green
            load seed_file
          rescue => exception
            warn exception.message.red
          end
        end
      else
        puts "#{seed_file} does not exist. Run `rake seed_runner:install` to create this or follow the README for manual install".red
        puts "#{File.basename(seed_file, '.rb')} skipped"
      end
    end

    load_seed_namespace 'static'
    load_seed_namespace 'sample'
  end
end
