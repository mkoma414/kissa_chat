FactoryGirl.define do

  factory :user do
    email                   'm-koma@nifty.com'
    password                'password'
    password_confirmation   'password'
    name                    'koma'

    # after(:create) do |user|
    #   create(:group_user, user: user, group: create(:group))
    # end
  end

end