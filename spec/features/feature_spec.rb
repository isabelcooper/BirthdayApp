feature 'check page loads' do
  scenario 'page should launch with welcome' do
    visit '/'
    expect(page).to have_content("Hello")
  end

  scenario 'form accepts name' do
    load_and_fill_form(Date.today)
    expect(page).to have_content('Cat')
  end
end

feature 'if date is today, show happy birthday and name' do

  scenario 'date entered is today' do
    load_and_fill_form(Date.today)
    expect(page).to have_content('Happy Birthday Cat')
  end

end
