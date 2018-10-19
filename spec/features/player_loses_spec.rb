feature "shows 'Lose' message when reach 0HP first" do
  scenario "player_2 reaches 0HP" do
    sign_in_and_play
    18.times { next_page }
    click_button('Attack')
    expect(page).to have_content 'Mittens has lost'
  end
end

def next_page
  click_button('Attack')
  click_button('Next')
end
