class SearchSuggestion < ActiveRecord::Base
  attr_accessible :popularity, :term
  def self.terms_for(prefix)
  	Rails.cache.fetch(["search-terms", prefix]) do
  	suggestions = where("term like ?", "#{prefix}_%")
  	suggestions.order("popularity desc").pluck(:term)
  	User.where("email like ?", "#{prefix}_%")
  end
  end

  def self.index_users
  	User.find_each do |user|
  	  index_term(user.email)
  	  index_term(user.firstname)
  end 
  end

  def self.index_term(term)
  	where(term: term.downcase).first_or_initialize.tap do |suggestion|
  		suggestion.increment! :popularity
  	end
  end 
end
