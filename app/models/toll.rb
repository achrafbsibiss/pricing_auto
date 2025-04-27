class Toll < ApplicationRecord
  belongs_to :origin, class_name: "City"
  belongs_to :destination, class_name: "City"

  # before_action :pricing_truck

  private

  def pricing_truck
    if car_price.nil? || truck_price.nil? || bus_price.nil?
      errors.add(:base, "All prices must be present")
      return
    end

    if !(car_price < truck_price && truck_price < bus_price)
      errors.add(:base, "Prices must be ordered: car_price < truck_price < bus_price")
    end
  end
end
