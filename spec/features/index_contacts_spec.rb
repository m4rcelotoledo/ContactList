# frozen_string_literal: true

require 'rails_helper'

feature 'Index contacts' do
  scenario 'accesses the page correctly' do
    visit root_path
    click_on 'Ver lista de contatos'

    expect(current_path).to eq contacts_path
    expect(page).to have_css('h1', text: 'Lista de Contatos')
    expect(page).to have_css('th', text: 'Email')
    expect(page).to have_css('th', text: 'Nome')
    expect(page).to have_css('th', text: 'GUID')
    expect(page).to have_selector :link,
                                  'Ver lista de tracking', href: root_path
  end

  scenario 'list displayed successfully' do
    create_list(:contact, 70)

    visit contacts_path

    expect(page).to have_css('tr', count: 51)
    expect(page).to have_selector :link,
                                  'Ver lista de tracking', href: root_path
    expect(page).to have_selector :link, 'Next'
    expect(page).to have_selector :link, 'Last'

    click_on 'Next'

    expect(page).to have_css('tr', count: 21)
    expect(page).to have_selector :link,
                                  'Ver lista de tracking', href: root_path
    expect(page).to have_link('First')
    expect(page).to have_link('Prev')
  end
end
