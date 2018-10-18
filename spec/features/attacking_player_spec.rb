feature 'Attacking player' do
  scenario 'get a confrimation message of attack' do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content 'Dave attacks Mittens'
  end
end
