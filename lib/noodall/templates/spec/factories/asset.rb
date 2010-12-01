Factory.define :asset do |asset|
  asset.tags { Faker::Lorem.words(4) }
  asset.title { "Image asset" }
  asset.description { "The asset description" }
  asset.file {File.new(File.expand_path("../../files/beef.png",  __FILE__))}
end
