namespace :metrics do
  desc 'Runs reek'
  task reek: :environment do
    system 'bundle exec reek'
  end
end
