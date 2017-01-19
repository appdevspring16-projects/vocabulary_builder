class Author < ApplicationRecord
  # Direct associations

  has_many   :readings,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :presence => true

end
