# Assignment 5

## Overview

In this assignment, you will refactor your Assignment 4 code to
1)  refactor the User model to include a delivery-related attributes
2)  include the Amazon Web Services Ruby SDK
3)  configure your environment with your AWS credentials
4)  push your Youtube alerts to Amazon's Simple Notification Service


## Requirements

Pass all the tests.  (No rubocop again.)  You can run the tests with 'rails test'
from the home directory.

Each failed test deducts 5 points.  There are 48 test blocks consisting of
72 assertions.  **I make no distinction between failures, errors, and skips.**
Your score will equal: 100 - ((count(failures) + count(errors) + count(skips)) * 5).

To help get you started, I've marked several areas in the project with # TODO
tags that point out functionality you need to add to pass the tests.  

This assignment is due Wednesday, April 26th at midnight.  There is NO late policy for this assignment...anything turned in after that time will not recieve any credit.

## Overview:

### Refactoring the User Model

Our users should have the ability to select the method alerts are sent to them.
We'll give them three options:  email, sms, or http (posting to a url).  We'll
also need to know their phone number or http address so we know where to send
the alert.  We may also want to give them the option of a different email address
than what we have on file for them.  So, we'll need a string field for that.  
Finally, we'll want to know which users have confirmed that AWS can send them
notifications.  (Amazon asks politely before it allows a subscription to an
SNS topic to start sending messages to people.)

You need to create a migration that will add the following fields:

  delivery_preference       - an integer
  delivery_details          - a string
  delivery_method_confirmed - a boolean (with a default of false)

Within the User model, you need to define delivery_preference as an enumerated
type that can take :sms, :email, and :http.  

The models/user_test.rb file will test this portion of the assignment.


### Include the Amazon SDK Gem

Add the v2 of the Amazon Ruby SDK to your Gemfile and run bundle.

References:
  - [Amazon Ruby SDK](http://docs.aws.amazon.com/sdkforruby/api/index.html)
  - [Lecture Notes for Assignment 5]

The models/alert_test.rb file will test this portion of the assignment.


### Configure your Environment with your AWS credentials

To use the Amazon SDK, you'll need to create an Amazon AWS account and put your
credentials into your system.  The traditional way to do this is via environment
variables (just like we did for the Yt gem) but you can also use special file:
~/.aws/credentials.  

References:
  - [Amazon Ruby SDK - see Configuration section](http://docs.aws.amazon.com/sdkforruby/api/index.html)
  - [Lecture Notes for Assignment 5]

  The models/alert_test.rb file will test this portion of the assignment.



### Push YoutubeAlerts to SNS

I'm giving you the majority of the Alert class file which is responsible for
sending alerts to SNS.  To make things more manageable, we're not actually going
to send alerts to the user associated with a YoutubeSearch object.  Rather, the
system will dispatch alerts to a special SNS topic that will deliver the alert
to a database that the testing system can access.  That's how the tests will
verify that your code is sending an alert through the AWS SNS system.

Your task is to fill in the deliver! function to communicate with SNS.  You need
to:
  * Instantiate an SNS client.
  * Call publish on that client to push the alert to it.
    ** Set the SNS topic to AWS_SNS_TOPIC, as defined in the class.
    ** Set the SNS message to the contents of the Alert object's message attribute.
    ** Set the SNS subject to "New Youtube Video!"

    - [Amazon Ruby SDK - instantiating a client](http://docs.aws.amazon.com/sdkforruby/api/Aws/SNS.html)
    - [Amazon Ruby SDK - publish method](http://docs.aws.amazon.com/sdkforruby/api/Aws/SNS/Client.html#publish-instance_method)
    - [Lecture Notes for Assignment 5]

The models/alert_test.rb file will test this portion of the assignment.
