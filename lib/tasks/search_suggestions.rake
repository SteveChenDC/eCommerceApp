namespace :search_suggestions do 

  desc 'Generate search suggestions'
  task index: :environment do # Calls index and makes it dependent on the rake task by rails caleld environment
    SearchSuggestion.seed # That gives access to SearchSuggestion class. Then calls seed() method
  end
  
end #wrapped up in search_suggestions for organization