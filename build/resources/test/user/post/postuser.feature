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
    * def invalidpayload =
           """
    {
    "namee":"manuel32333",
    "emaile":"manuel45334334654@gmail.com",
    "gendeer":"male",
    "statuse":"Active",

    }
    """

      * def payloaduser =
            """
    {
    "name":"#(name)",
    "email":"#(email)",
    "gender":"#(gender)",
    "status":"#(status)",

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
    And def message = response[0].message
    And print message
    #Afirmaciones inteligentes validamos el mensaje en el json de response
    And match message == "has already been taken"


    Scenario: create user invalid Json body
      Given url 'https://gorest.co.in/public/v2/users'
      And request invalidpayload
      And header Authorization = 'Bearer ' + TokenId
      When method Post
      Then status 400
      And print response

   #Scenario Outline:
  Scenario Outline: create multiple user
    Given url 'https://gorest.co.in/public/v2/users'
    And request payloaduser
    And header Authorization = 'Bearer ' + TokenId
    When method Post
    Then status 201
    And print response
    And def id = response.id
    And print id

    Examples:
      |name|email|gender|status|
      |manuel|manuel@outline.com|male|Active|
      |manuel|email@emailde.com|male|Active|