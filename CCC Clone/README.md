# Assignment 2 
(the first assignment was not affliated with this project)

## Requirements

Pass all the tests and satisfy all the Rubocop checks.  You can run the tests with 'rails test'
from the home directory.  

Each failed test deducts 5 points and failed Rubocop check deducts 2 points.


## Overview:

### Create static pages for home, help, and about.  

You'll need to generate a controller and views to provide for home, help and about pages.  

- The home page must include links to reach the help and about pages.  You can
do this with a sidebar, banner, or whatever else you'd like to use.  The testing
code will look for the links in the body of the page.

- The help page must include an email address from whom the user can request help.

- The about page must include some text that describes you as the system author.

To pass the tests, you must name your controller StaticPages.  

References:  
  - [My Lecture Notes](https://utah.instructure.com/files/64591175/download?download_frd=1)
  - Hartl, Chapter 3


### Change the root route to point to the home page.  

References:
  - [My Lecture Notes](https://utah.instructure.com/files/64591175/download?download_frd=1)
  - Hartl, Chapter 5, Section 5.3.2


### Modify the User model:

* Add a method to return the full name of a user by combining first and last names
with a space between them.
* Add validations to ensure the email attribute:
  * is filled in
  * accepts only valid email addresses 
  * is no longer than 255 characters
  * is always saved in lower case
  * is unique

References:
  - [My Lecture Notes](https://utah.instructure.com/files/64593814/download?download_frd=1)
  - Hartl, Chapter 6, Section 6.2
  