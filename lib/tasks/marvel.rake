namespace :marvel do
  desc "Marvel comics"
  task :create do
    MarvelService::Marvel.new.response
  end
end
