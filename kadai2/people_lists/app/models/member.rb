class Member < ApplicationRecord
  validates :name,
            presence: { message: "Name can't be blank" },
            length: {
              minimum: 1,
              maximum: 20,
              too_short: "Name is too short (minimum is 1 character)",
              too_long: "Name is too long (maximum is 20 characters)"
            }

  validates :height,
            numericality: {
              greater_than_or_equal_to: 1,
              message: "Height must be 1 or more"
            }

  validates :weight,
            numericality: {
              greater_than_or_equal_to: 1,
              message: "Weight must be 1 or more"
            }
end
