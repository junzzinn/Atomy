class User < ApplicationRecord
  has_many :products
  has_many :calendar_events
end
