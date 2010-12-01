Factory.define :user do |user|
  user.email                 { |u| Faker::Internet.email(u.name) }
  user.name                  { Faker::Name.name }
  user.password              { "password" }
  user.password_confirmation { "password" }
end

Factory.define :website_editor, :parent => :user do |user|
  user.groups [ "editor" ]
end

Factory.define :website_administrator, :parent => :user do |user|
  user.groups [ "admin" ]
end

