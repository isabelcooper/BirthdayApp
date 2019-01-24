class DateFormatter

  def initialize
    @days
  end

  def days_to_next_birthday(date)
    days_left(date)
    minus_numbers
    multiple_years
    @days
  end

  def days_since_past_birthday(date)
    (Date.today- date).to_i
  end

  private

  def days_left(date)
    @days = (date - Date.today).to_i
  end

  def minus_numbers
    while @days < 0
      @days += 365
    end
  end

  def multiple_years
    @days -= 365 while @days > 365
  end

end
