require 'pry'

$PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '../'))
Results_Dir = File.expand_path(File.join(File.dirname(__FILE__), '../results/'))

namespace :execute do
  desc 'Execute auotmated tests on Browser'
  task :web, :feature_tag do |t, args|
    begin
      cleanup
      command = "bundle exec cucumber -r web --format pretty --format html --out #{Results_Dir}/web_report.html"
      command += " --tags #{args[:feature_tag]}" unless args.nil?
      sh command
    ensure
      # cleanup
    end
  end
end


def cleanup
  `rm -rf #{$PROJECT_ROOT}/web_images/*.png`
  `rm -rf #{$PROJECT_ROOT}/results/*`
end








