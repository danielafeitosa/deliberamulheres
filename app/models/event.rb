class Event < ActiveRecord::Base
  attr_accessible :category, :description, :title
end
