# frozen_string_literal: true

class City < ApplicationRecord
  has_many :origin_tolls, class_name: "Toll", foreign_key: "origin_id"
  has_many :destination_tolls, class_name: "Toll", foreign_key: "destination_id"

  validates :name, presence: true, uniqueness: true
end
