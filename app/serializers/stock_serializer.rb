class StockSerializer < ActiveModel::Serializer
  belongs_to :portfolio
  attributes :name, :ticker, :sector, :portfolio_id
end
