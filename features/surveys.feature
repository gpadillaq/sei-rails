Feature: surveys

Scenario:Add Survey
    Given I am logged in as test user with all privileges
    And I go to home page
    When I visit "Survey" Page
    And I click "Crear Survey"
    And I fill in "Nombre" with "Evaluacion #1"
    And I select "01" from "Fecha inicio Día"
    And I select "Febrero" from "Fecha inicio Mes"
    And I select "2016" from "Fecha inicio Año"
    And I select "03" from "Fecha Mes Día"
    And I select "Febrero" from "Fecha Mes Mes"
    And I select "2016" from "Fecha Mes Año"
    And I press "Guardar"
    Then I should be index page "surveys"
    And I should see "Evaluacion #1"
    And I should see "2016-02-01"
    And I should see "2016-02-03"

Scenario: Edit Survey
    Given have model "Survey":
        |nombre          |inicio       |fin                  |
        |Evaluacion #1   |@{Date.today}|@{Date.today + 1.day}|
    Given I am logged in as test user with all privileges
    And I go to home page
    When I visit "Survey" Page
    Then I should be index page "surveys"
    And I should see "Evaluacion #1"
    And I should see "2016-02-01"
    And I should see "2016-02-03"
    And I hover#(survey_1)
    When I click edit "surveys" for "1"
    And I fill in "Nombre" with "Evaluacion #1"
    And I press "Guardar"
    And I should see "Evaluacion #1"
    And I should see "2016-02-01"
    And I should see "2016-02-03"
