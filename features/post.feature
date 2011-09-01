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
		