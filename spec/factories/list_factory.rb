#NOTE: Factory Girl Expects that each class inherits from ActiveRecord
FactoryGirl.define do
  factory :list, class: List do

    name "A name"

  end
end