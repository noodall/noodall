if ENV['MONGOHQ_URL']
  config = {Rails.env => {'uri' => ENV['MONGOHQ_URL']}}
else
  config = Rails.configuration.database_configuration
end

MongoMapper.setup(
  config,
  Rails.env,
  { :logger    => Rails.logger }
)
