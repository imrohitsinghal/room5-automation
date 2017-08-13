def move_nakal_files_to_result_dir (platform)
  Dir["#{Nakal.directory}/#{Nakal.device_name}/**/*_diff.png"].each do |file|
    `mv #{file} #{$PROJECT_ROOT}/results`
    `mv #{file.gsub('_diff','_current')} #{$PROJECT_ROOT}/results`
    `cp #{file.gsub('_diff','')} #{$PROJECT_ROOT}/results`
  end
end