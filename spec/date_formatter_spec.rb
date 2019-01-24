require 'date_formatter'

describe DateFormatter do

  it 'should return days until birthday' do
    date_provided = Date.today + 10
    expect(DateFormatter.new(date_provided).days_to_next_birthday).to eq 10
  end

  it 'should return days until next birthday (even if given date is over a year away)' do
    date_provided = Date.today + 731
    expect(DateFormatter.new(date_provided).days_to_next_birthday).to eq 1
  end

  it 'should calculate days until next birthday if given a negative number' do
    date_provided = Date.today - 100
    expect(DateFormatter.new(date_provided).days_to_next_birthday).to eq 265
  end

  describe '#days since past birthday' do

    it 'should calculate when birthday is in past' do
      date_provided = Date.today - 100
      expect(DateFormatter.new(date_provided).days_since_past_birthday).to eq 100
    end

    it 'should calculate when birthday is in future' do
      date_provided = Date.today + 364
      expect(DateFormatter.new(date_provided).days_since_past_birthday).to eq 1
    end
  end
end
