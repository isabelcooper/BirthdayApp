feature 'check page loads' do
  scenario 'page should launch with welcome' do
    visit '/'
    expect(page).to have_content("Hello")
  end

  scenario 'form passes name to next page' do
    load_and_fill_form(Date.today)
    expect(page).to have_content('Cat')
  end
end

feature 'wish happy birthday' do
  #
  # let(:date_formatter) { double(:date_formatter, days_left: 10)}
  # let(:date_formatter_class) { double(:date_formatter_class, new: date_formatter) }
  # let(:subject) { BirthdayGreeter.new(date_formatter_class) }
  #
  # scenario 'date formatter is run' do
  #   expect(date_formatter).to receive(:days_left)
  #   load_and_fill_form(Date.today)
  # end

  scenario 'date entered is today' do
    load_and_fill_form(Date.today)
    expect(page).to have_content('Happy Birthday Cat')
  end
end

feature 'show birthday countdown' do
  scenario 'date entered is not today' do
    load_and_fill_form(Date.today + 10)
    expect(page).to have_content('10 days until your birthday')
  end

  scenario 'date entered if tomorrow' do
    load_and_fill_form(Date.today + 1)
    expect(page).to have_content('1 day until')
  end

  scenario 'date entered if over 365 days' do
    load_and_fill_form(Date.today + 731)
    expect(page).to have_content(' 1 day until')
  end

  scenario 'date entered is in the past' do
    load_and_fill_form(Date.today - 10)
    expect(page).to have_content('10 days ago')
  end


end
