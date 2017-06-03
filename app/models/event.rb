class Event < ApplicationRecord

  validates_presence_of :sid, :cid

end
