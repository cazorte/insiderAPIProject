@pet
Feature: Using “pet” endpoints from https://petstore.swagger.io/ write CRUD operations API
  tests with positive and negative scenarios.

  Background:
    * def testData = 'anil'
    * def animal =
  """
    { id: 0,
     category: {
                 id: 1,
                 name: '#(testData)'},
     name: 'queen',
     photoUrls: [ 'striiin' ],
     tags: [ {
                 id: 2,
                 name: 'zxc'
             }
           ],
     status: 'available'
    }
  """

  Scenario: CRUD
    #Create pet
    Given url 'https://petstore.swagger.io/v2'
    When path 'pet'
    And request animal
    And method post
    Then status 200
    And print response
    And match animal.category.name == response.category.name

    * def petID = response.id

    #Update pet
    Given url baseURL
    When path 'pet'
    And request { id: '#(petID)', name:  "updatedName" , status: 'available' }
    And method put
    Then status 200
    And print response
    And match response.name == 'updatedName'

    #Read pet
    Given url baseURL
    When path 'pet',petID
    And method get
    Then status 200
    And print response
    And match response.id == petID
    And match response.name == 'updatedName'
    And match response.status == 'available'

    #Delete pet

    Given url baseURL
    When path 'pet',petID
    And method delete
    Then status 200
    * string strPetID = petID
    And match response.message == strPetID
    And match response.code == 200

  #Scenario: Negative test