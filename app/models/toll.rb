class Toll < ApplicationRecord
  belongs_to :origin
  belongs_to :destination
end
