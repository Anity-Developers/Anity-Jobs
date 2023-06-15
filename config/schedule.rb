every 1.day, at: '12:00 am' do
  sidekiq_options queue: 'default'
  rake "jobs:delete_old"
end
