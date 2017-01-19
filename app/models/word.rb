class Word < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :language, :presence => true

  validates :word, :uniqueness => true

  validates :word, :presence => true

end
