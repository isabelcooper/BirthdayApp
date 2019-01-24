require 'date_formatter'

describe DateFormatter do
  it 'should return days until birthday' do
    date_provided = Date.today + 10
    expect(subject.days_to_next_birthday(date_provided)).to eq 10
  end

  it 'should return days until next birthday (even if given date is over a year away)' do
    date_provided = Date.today + 731
    expect(subject.days_to_next_birthday(date_provided)).to eq 1
  end

  it 'should calculate days until next birthday if given a negative number' do
    date_provided = Date.today - 100
    expect(subject.days_to_next_birthday(date_provided)).to eq 265
  end

  it 'should calculate days since last birthday' do
    date_provided = Date.today - 100
    expect(subject.days_since_past_birthday(date_provided)).to eq 100
  end
end
