class Notification < ActiveRecord::Base
  belongs_to :user
  # default_scope -> { order(created_at: :asc).reverse_order! }
end
