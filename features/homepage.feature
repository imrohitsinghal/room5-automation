Feature: Home Page

  @web
  Scenario: As a new user, I want to search for Australia
    Given I am on the homepage
    When I click on search bar button
    And I enter "Australia" and submit
    Then I should be able to see search results for Australia
    Then I compare the screen for "search_results"

  @web
  Scenario: As a new user, I want to open hotel magazine for France
    Given I am on the homepage
    When I select "france" from country
    Then I should see "LE CHOIX DE LA RÉDACTION" on the homepage

  @web
  Scenario: As a new user, I want to subscribe for hotel experience
    Given I am on the homepage
    When I enter and submit my email id as "abcd@trivago.com"
    Then I should be able to see "You are now checked-in!"

  @web
  Scenario: As a new user, I want to navigate using Nav Bar
    Given I am on the homepage
    When I click on nav bar icon
    And I select "All Themes" under inspiration
    Then I should see "Destinations & Inspiration" on the themes page

  @web
  Scenario: As a new user, I want to visually verify all screens
    Given I am on the homepage
    Then I compare the screen for "home_page_top"
    When I click to "open" nav bar icon
    Then I compare the screen for "menu_options"
    When I click to "close" nav bar icon
    And I scroll down
    Then I compare the screen for "home_page_bottom"


