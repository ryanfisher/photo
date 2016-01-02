require 'reek/rake/task'

namespace :metrics do
  begin
    Reek::Rake::Task.new do |t|
      t.fail_on_error = true
    end
  rescue LoadError
    task :reek do
      $stderr.puts 'Reek is not available. In order to run reek, you must: gem install reek'
    end
  end
end
