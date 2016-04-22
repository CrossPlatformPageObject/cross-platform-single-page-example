Feature: As a user, I should be able to order food with different payment options

  @cash
  Scenario: I should be able to order food by cash on delivery.

    Given As a user I order following items:
      | item_name     | quantity |
      | Dosa          | 1        |
      | Filter Coffee | 1        |
    Then I should see above items in cart
    When I proceed to purchase items
    And I enter following user details
      | name | address  |
      | XYZ  | Kp, Pune |
    And I choose to pay by cash after delivery
    Then I see the complete purchase summary

  @credit
  Scenario: I should be able to order food by cash on delivery.

    Given As a user I order following items:
      | item_name     | quantity |
      | Dosa          | 1        |
      | Filter Coffee | 1        |
    Then I should see above items in cart
    When I proceed to purchase items
    And I enter following user details
      | name | address  |
      | XYZ  | Kp, Pune |
    And I choose to pay by card
    Then I see the complete purchase summary




