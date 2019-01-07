class FavoriteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :current_weather

  attribute :location do |object|
    object.location.split(",").map do |word|
      if word.length > 2
        word.titleize
      else
        word.upcase
      end
    end.join(", ")
  end

end
