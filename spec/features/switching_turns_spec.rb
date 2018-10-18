feature 'switching turns' do
  scenario 'turns switched after attack' do
    sign_in_and_play
    click_button('Attack')
    click_button('Next')
    expect(page).to have_content "Its Mittens's turn"
  end
end
