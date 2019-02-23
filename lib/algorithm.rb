Dir[File.join(__dir__, '**/*.rb')].each do |f|
  require f
end
