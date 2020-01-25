# frozen_string_literal: true

require 'rails_helper'

feature 'Index tracking' do
  scenario 'accesses the page correctly' do
    visit root_path

    expect(page).to have_css('h1', text: 'Lista de Tracking')
    expect(page).to have_css('th', text: 'Visitante')
    expect(page).to have_css('th', text: 'Página')
    expect(page).to have_css('th', text: 'Data/Hora')
    expect(page).to have_selector :link,
                                  'Ver lista de contatos',
                                  href: contacts_path
  end

  scenario 'list displayed successfully' do
    create_list(:track, 30)

    visit tracks_path

    expect(page).to have_css('tr', count: 31)
  end

  scenario 'list displayed with pagination' do
    create_list(:track, 80)

    visit tracks_path

    expect(page).to have_css('tr', count: 51)
    expect(page).to have_selector :link, 'Next'
    expect(page).to have_selector :link, 'Last'

    click_on 'Next'

    expect(page).to have_css('tr', count: 31)
    expect(page).to have_link('First')
    expect(page).to have_link('Prev')
  end
end
