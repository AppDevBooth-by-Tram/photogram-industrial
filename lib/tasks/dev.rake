require 'faker'
desc "Fill the database tables with some sample data"
task :sample_data => :environment do
  create_users
  create_photos
  create_likes
  create_comments
  create_follow_requests
end


def create_users
 25.times do 
  user = User.new
  user.username = Faker::Name.name 
  user.private = Faker::Boolean.boolean
  user.email = Faker::Internet.email
  user.password = "password"
  user.save
end
p "Added #{User.count} users"
end


def create_photos
  photos = ["https://tinyurl.comy6hk6oep", "https://tinyurl.com/y5uszprj", "https://picsum.photos/200"]
  10.times do |count|
    photo = Photo.new 
    photo.image = photos.sample
    photo.caption = "This is a caption"
    photo.owner_id = User.sample.id
    photo.save
  end

 p "Added #{Photo.count} photos"
end

def create_likes
 50.times do
  like = Like.new
  like.fan_id = User.sample.id
  like.photo_id = Photo.sample.id
  like.save
 end
 p "Added #{Like.count} likes"
end

def create_comments
 50.times do
  comment = Comment.new
  comment.body = Faker::Quote
  comment.photo_id = Photo.sample.id
  comment.author_id = User.sample.id
  comment.save
 end

 p "Added #{Comment.count} Comments"
end

def create_follow_requests
 20.times do
  follow_request = FollowRequest.new
  follow_request.sender_id = User.sample.id
  follow_request.recipient_id = User.sample.id
  follow_request.status = ["accepted", "pending", "rejected"].sample
 end
 p "Added #{FollowRequest.count} follow requests"

end
