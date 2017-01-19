class Reading < ApplicationRecord
  # Direct associations

  belongs_to :author

  has_many   :reading_words,
             :dependent => :destroy

  has_many   :reader_readings,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :author_id, :presence => true

  validates :title, :presence => true

end
