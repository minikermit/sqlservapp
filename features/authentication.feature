Feature:  Authentication

  Scenario:  Log in user

    Given I have a user with email address "minikermit@hotmail.com"
    When I go to the sign in page
    And I fill in "user_email" with "minikermit@hotmail.com"
    And I fill in "user_password" with "12345678"
    Then I should see "Welcome minikermit@hotmail.com"