FactoryGirl.define do
  sequence :emergency_serial do |n|
    10_000_000 + n
  end

  factory :emergency do
    code { "E-#{generate :emergency_serial}" }
    fire_severity { rand(6) }
    police_severity { rand(6) }
    medical_severity { rand(6) }
    full_response false
  end

  sequence :responder_serial do |n|
    100 + n
  end

  factory :responder do
    type { %w(Fire Police Medical).sample }
    name { "#{type[0]}-#{generate :responder_serial}" }
    capacity { rand(5) + 1 }
    on_duty { rand(3) == 0 ? true : false }
  end
end
