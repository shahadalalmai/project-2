class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_many :appointments, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# validates :name, presence: true, lenght: {minimum: 3}
# validates :age, presence: true, length: {minimum: 1, maximum: 3}, numericality: true
# validates :weight, presence: true, length: {minumum: 2, maximum: 3}, numericality: true
# validates :height, presence: true, length: {minumum: 3, maximum: 3}, numericality: true
# validate that it's not negative number { greater_than: 1}
# check how to display error msgs if the validation is false. check .valid? in the documenttaion

end
