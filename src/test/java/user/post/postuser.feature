#language En
Feature: create users

    Background:

    * def TokenId = '7d15030cb55b5df9de9e9bbdcde859c8ffb951f4927d766303d98021d5d2427b'
        * def payload =
        """
    {
    "name":"manuel32333",
    "email":"manuel45334334654@gmail.com",
    "gender":"male",
    "status":"Active",

    }
    """

      @create
      Scenario: create new user
      Given url 'https://gorest.co.in/public/v2/users'
      And request payload
      And header Authorization = 'Bearer ' + TokenId
        When method Post
          Then status 201
          And print response
         And def id = response.id
        And print id


  Scenario: create user already exist
    Given url 'https://gorest.co.in/public/v2/users'
    And request payload
    And header Authorization = 'Bearer ' + TokenId
    When method Post
    Then status 422
    And print response
    And def id = response.id
    And print id
