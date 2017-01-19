class Reading < ApplicationRecord
  # Direct associations

  has_many   :reader_readings,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :author_id, :presence => true

  validates :title, :presence => true

end
