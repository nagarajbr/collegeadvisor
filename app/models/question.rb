class Question
  include ActiveModel::Model

  attr_accessor :option_1,:option_2,:option_3,:option_4,:option_5,:option_6,:option_7,:option_8,:option_9,:option_10

  #validates :option_1,:option_2,:option_3,:option_4,:option_5,:option_6,:option_7,:option_8,:option_9,:option_10 , presence: true

end