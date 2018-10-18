feature 'reducing hp' do
  scenario 'after an attack hp reduce by 10' do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content 'Mittens HP: 90'
  end
end
