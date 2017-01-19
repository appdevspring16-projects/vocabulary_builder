class Word < ApplicationRecord
  # Direct associations

  has_many   :reading_words,
             :dependent => :destroy

  has_many   :reader_words,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :language, :presence => true

  validates :word, :uniqueness => true

  validates :word, :presence => true

end
