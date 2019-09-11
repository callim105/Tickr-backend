class StockSerializer < ActiveModel::Serializer
  belongs_to :portfolio
  attributes :id, :name, :ticker, :sector, :portfolio_id
end
