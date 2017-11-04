require 'rails_helper'
describe Message do
  describe '#create' do

    let(:user){ build(:user) }
    let(:group){ build(:group) }
    # let(:message){ build(:message) }

    it "can save with message" do
      message = build(:message, image: "")
      expect(message).to be_valid
    end

    it "can save with image" do
      message = build(:message, body: "")
      expect(message).to be_valid
    end

    it "can save with message and image" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "can not save without message and image" do
      message = build(:message, body: "", image: "")
      message.valid?
      expect(message.errors[:body_or_image]).to include("を入力してください。")
    end

    it "can not save without group_id" do
      message = build(:message, group_id: "")
      message.valid?
      expect(message.errors[:group][0]).to include("ja.activerecord.errors.models.message.attributes.group.required")
    end

    it "cann not save without user_id" do
      message = build(:message, user_id: "")
      message.valid?
      expect(message.errors[:user][0]).to include("ja.activerecord.errors.models.message.attributes.user.required")
    end

  end
end