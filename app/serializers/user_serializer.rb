class UserSerializer < ActiveModel::Serializer
  has_many :portfolios, class_name: "Portfolio"
  has_many :stocks, class_name: "Stock"
  attributes :username, :name, :email, :image_url, :member_since, :portfolios, :stocks
end
