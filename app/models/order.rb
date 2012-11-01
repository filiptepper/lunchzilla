class Order < ActiveRecord::Base
  belongs_to :user

  scope :current, -> {
    where(Arel::Table.new(:orders)[:created_at].gt(Date.today - 1)).
    where(Arel::Table.new(:orders)[:created_at].lt(Date.today + 1))
  }
end