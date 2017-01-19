class Reader < ApplicationRecord
  # Direct associations

  has_many   :reader_readings,
             :dependent => :destroy

  has_many   :reader_words,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :first_name, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
