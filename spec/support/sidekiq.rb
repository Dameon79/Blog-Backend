Sidekiq::Testing.fake!

RSpec::Sidekiq.configure do |config|
  config.warn_when_jobs_not_processed_by_sidekiq = false
end

RSpec.configure do |config|
  config.before(:each) do
    Sidekiq::Worker.clear_all
  end
end

 RSpec.configure do |config|
   config.around(:each, :inline) do
       Sidekiq::Testing.inline!
     else
       Sidekiq::Testing.fake!
    end
  end