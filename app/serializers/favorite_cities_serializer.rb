class FavoriteCitiesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location

   attribute :api_key do |object|
    user = User.find(object.user_id)
    user[:api_key]
   end
end
