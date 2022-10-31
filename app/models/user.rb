class User < ApplicationRecord
  has_person_name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :competitions, dependent: :destroy
  has_many :competition_entries, dependent: :destroy
  has_many :news, dependent: :destroy
end
