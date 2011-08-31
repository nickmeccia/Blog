Feature: user views all posts
	
	As a user
	I want to look at every post
	when I visit the website
	
	Scenario: view a list of posts on the home page
		Given a post exists with title: "First Post"
		And a post exists with title: "Second Post"
		When I go to the home page
		Then I should see "First Post"
		And I should see "Second Post"
		
	Scenario: create a valid post
		Given I am on the home page
		And I follow "New Post"
		When I fill in "Title" with "New Post"
		And I fill in "Body" with "Some Content"
		And I press "Create"
		Then "1" post should exist
