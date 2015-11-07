require 'reek/rake/task'

namespace :metrics do
  Reek::Rake::Task.new do |t|
    t.fail_on_error = true
  end
end
