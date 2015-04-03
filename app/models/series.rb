class Series < ActiveRecord::Base
  has_many :episodes, dependent: :destroy
  accepts_nested_attributes_for :episodes, allow_destroy: true
end
