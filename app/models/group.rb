class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :messages

  validates :name, presence: true

  def members
    members=""
    self.users.each do |user|
      members += "#{user.name}　"
    end
    members
  end

  def last_message
    self.messages.presence ? messages.last.body : 'メッセージはありません'
  end
end
