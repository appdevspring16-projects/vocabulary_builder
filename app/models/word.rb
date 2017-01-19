class Word < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :word, :uniqueness => true

  validates :word, :presence => true

end
