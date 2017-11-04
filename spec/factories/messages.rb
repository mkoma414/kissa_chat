FactoryGirl.define do

  factory :message do
    body      "abc"
    image     Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/animals.png'))
    # user_id (create(:user)).id
    # group_id  (create(:group)).id
    group
    user
  end

end