class User < ApplicationRecord
  has_many :calendar_events, dependent: :destroy
end
