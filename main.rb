require "pp"

pp ENV["INPUT_SECRETS"][1,20]

Dir[?*].each do |bucket|
  next unless File.directory? bucket
  puts "BUCKET '#{bucket}'"
  File.write "/temp.json", Base64.decode64(Hash[*ENV["INPUT_SECRETS"].split].fetch bucket)
  `gcloud auth activate-service-account --key-file=/temp.json`
  `rm /temp.json`
  `gsutil -m rsync -r -d #{bucket} gs://#{bucket}`
end

