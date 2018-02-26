class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :contracts

  def has_contracts?
    Contract.where(owner_id: id).length > 0
  end

  def number_of_contracts
    Contract.where(owner_id: id).length || 0
  end
end
