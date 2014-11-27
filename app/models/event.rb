# coding: utf-8
class Event < ActiveRecord::Base
  attr_accessible :category, :description, :title

  CATEGORIES = ['Coligação', 'Manifestação Popular', 'Mídia', 'Pizza', 'Reunião Extraordinária','Reunião Solene']

end
