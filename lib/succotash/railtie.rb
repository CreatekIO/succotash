module Succotash
  class Railtie < Rails::Railtie
    railtie_name :succotash

    rake_tasks do
      load "tasks/seed.rake"
      load "tasks/succotash.rake"
    end
  end
end

