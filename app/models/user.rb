class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :boards, dependent: :destroy
  has_many :applausers, dependent: :destroy
  has_many :applauser_boards, through: :applausers, source: :board 

  def own?(object)
    object.user_id == id
  end

  def applauser?(board)
    applauser_boards.include?(board)
  end

  def applauser(board)
    applauser_boards << board
  end

  def noapplauser(board)
    applauser_boards.destroy(board)
  end
  
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, uniqueness: true
  validates :email, presence: true
end
