feature 'Hit points' do
  scenario 'player 1 sees player 2 hit points' do
    sign_in_and_play
    expect(page).to have_content 'Mittens HP: 100'
  end
end
