namespace :succotash do
  desc "Create 'db/seeds/static.rb' and 'db/seeds/sample.rb'"
  task :install do
    spec = Gem::Specification.find_by_name 'succotash'

    puts "*** Creating seed dirs ***".green
    system("mkdir -p #{Rails.root}/db/seeds/static") unless Dir.exist?("#{Rails.root}/db/seeds/static")
    system("mkdir -p #{Rails.root}/db/seeds/sample") unless Dir.exist?("#{Rails.root}/db/seeds/sample")

    unless File.exist?("#{Rails.root}/db/seeds/static.yml")
      system("cp #{spec.gem_dir}/lib/templates/static.yml #{Rails.root}/db/seeds/")
      puts "*** Settings up static.rb ***".green
    else
      puts "*** static.rb already exists ***".yellow
    end

    unless File.exist?("#{Rails.root}/db/seeds/sample.yml")
      system("cp #{spec.gem_dir}/lib/templates/sample.yml #{Rails.root}/db/seeds/")
      puts "*** Settings up sample.rb ***".green
    else
      puts "*** sample.rb already exists ***".yellow
    end

  end
end
