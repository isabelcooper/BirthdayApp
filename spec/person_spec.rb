require 'person'

describe Person do

  let(:subject) { Person.new("Cat", Date.today + 10, date_formatter_class ) }
  let(:date_formatter_class) { double(:date_formatter_class, new: date_formatter) }
  let(:date_formatter) { double(:date_formatter, days_to_next_birthday: 10 , days_since_past_birthday: 355 ) }

  describe '#initialize' do
    it 'should return name' do
      expect(subject.name).to eq "Cat"
    end

    it 'should return birthday' do
      expect(subject.birthday).to eq (Date.today + 10)
    end
  end

  describe '#days_to_next_birthday' do
    it 'should return days to next birthday' do
      expect(subject.days_to_next_birthday).to eq 10
    end

    it 'should return days since last birthday' do
      expect(subject.days_since_past_birthday).to eq 355
    end
  end
end
