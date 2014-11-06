class Mang
  include Mongoid::Document
  include DeviseTokenAuth::Concerns::User
end
