class PortfolioSerializer < ActiveModel::Serializer
  belongs_to :user
  attributes :name, :description
end
