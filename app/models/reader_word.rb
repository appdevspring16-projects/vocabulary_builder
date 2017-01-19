class ReaderWord < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :word_id, :uniqueness => true

  validates :word_id, :presence => true

end
