require_relative 'date_formatter'

class Person

  def self.create(name, birthday, color)
    @person = Person.new(name, birthday, color)
  end

  def self.specific_person
    @person
  end

  attr_reader :name, :birthday, :color
  def initialize(name, birthday, color = "#fff", formatter = DateFormatter )
    @name = name
    @birthday = birthday
    @color = color
    @formatter = formatter.new(@birthday)
  end

  def days_to_next_birthday
    @formatter.days_to_next_birthday
  end

  def days_since_past_birthday
    @formatter.days_since_past_birthday
  end

end
