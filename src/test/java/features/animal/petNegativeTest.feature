@pet
Feature: Negative & Positive scenarios


  Scenario Outline: Category name positive scenarios ['<categoryName>']
    * def testData = <categoryName>
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
    #Create pet
    Given url 'https://petstore.swagger.io/v2'
    When path 'pet'
    And request animal
    And method post
    Then status 200
    Examples: category name
      | categoryName |
      | null         |
      | 11           |
      | ''           |
      | '11'         |


  Scenario Outline: Category ID negative scenarios ['<categoryID>']
    * def testData = <categoryID>
    * def animal =
  """
    { id: 0,
     category: {
                 id: '#(categoryID)',
                 name: 'anil'},
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
    #Create pet
    Given url 'https://petstore.swagger.io/v2'
    When path 'pet'
    And request animal
    And method post
    Then status 500
    And match response.message == 'something bad happened'
    Examples: category ID
      | categoryID                 |
      | ''                         |
      | '11'                       |
      | 'asd'                      |
      | 11111111111111111111111111 |