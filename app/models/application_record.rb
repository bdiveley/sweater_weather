class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def format_location(location)
    location.split(",").map do |word|
      if word.length > 2
        word.titleize
      else
        word.upcase
      end
    end.join(", ")
  end

end
