FactoryGirl.define do
  factory :source do
    title 'hi, i am a title'
    url 'www.google.com'
  end

  factory :comment do
    source
    body 'I love this resource you have posted, sir'
  end
end