def load_and_fill_form(date)
  visit '/'
  fill_in 'name', with: 'Cat'
  fill_in 'date', with: date
  click_button 'Enter'
end
