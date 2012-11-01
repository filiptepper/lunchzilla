class Order < ActiveRecord::Base
  belongs_to :user
  has_many   :items, dependent: :destroy

  scope :current, -> {
    where(Arel::Table.new(:orders)[:created_at].gt(Date.today - 1)).
    where(Arel::Table.new(:orders)[:created_at].lt(Date.today + 1)).
    order('id ASC')
  }

  def has_item_for?(user)
    self.item_for(user).present?
  end

  def item_for(user)
    self.items.find_by(:user_id => user.id)
  end
end