class ReadingWord < ApplicationRecord
  # Direct associations

  belongs_to :reading

  belongs_to :word

  # Indirect associations

  # Validations

end
