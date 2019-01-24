class DateFormatter

  def initialize(date)
    @date = date
    @days
  end

  def days_to_next_birthday
    days_left
    minus_numbers
    multiple_years
    @days
  end

  def days_since_past_birthday
    365 - days_to_next_birthday
    #@days < 0 ? (Date.today- @date).to_i : (Date.today+ @date).to_i
  end

  private

  def days_left
    @days = (@date - Date.today).to_i
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
