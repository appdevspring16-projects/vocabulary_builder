class ReaderWord < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :reader_id, :presence => true

  validates :word_id, :uniqueness => true

  validates :word_id, :presence => true

end
