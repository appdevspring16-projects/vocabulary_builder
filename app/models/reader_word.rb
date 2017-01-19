class ReaderWord < ApplicationRecord
  # Direct associations

  belongs_to :reader_readings

  belongs_to :word

  belongs_to :reader

  # Indirect associations

  # Validations

  validates :reader_id, :presence => true

  validates :word_id, :uniqueness => true

  validates :word_id, :presence => true

end
