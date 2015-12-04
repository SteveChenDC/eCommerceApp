class SearchSuggestion # Doesn't inherit ActiveRecord::Base, using Redis instead

  def self.seed
    Product.find_each do |product|
      name = Product.name
      1.upto(name.length - 1 ) do |n|
        prefix = name[0, n]
        $redis.zadd 'search-suggestions:#{prefix.downcase}', 1, name.downcase
      end
    end
  end

  def self.terms_for(prefix)
    $redis.zrevrange 'search-suggestions:#{prefix.downcase}', 0, 9
  end

end