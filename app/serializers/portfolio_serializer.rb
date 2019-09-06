class PortfolioSerializer < ActiveModel::Serializer
  belongs_to :user
  attributes :id, :name, :description
end
