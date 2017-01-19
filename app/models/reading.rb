class Reading < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :author_id, :presence => true

  validates :title, :presence => true

end
