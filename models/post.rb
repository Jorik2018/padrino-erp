class Post
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :name, String
  property :body, Text
end
