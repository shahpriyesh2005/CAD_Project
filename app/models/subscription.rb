class Subscription < ApplicationRecord

  ORGANIZER_NAME = []
  @organizers = Event.distinct.pluck(:organizer_name)

  @organizers.each do |name|
    ORGANIZER_NAME << name
  end
  puts ORGANIZER_NAME
end
