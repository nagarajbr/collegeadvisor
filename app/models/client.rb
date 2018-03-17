class Client < ApplicationRecord
enum gender: [:Male, :Female]
has_many :address
has_many :education

end
