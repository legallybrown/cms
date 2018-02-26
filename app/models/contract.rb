class Contract < ActiveRecord::Base
  belongs_to :user

  def owner
    User.find(owner_id) if owner_id
  end
end