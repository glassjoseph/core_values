# URLockBox

# README

## Summary
Core Values helps you build and keep value-driven goals based on psychological research of willpower, habit forming, and social support.
It changes the 'checklist' mentality into goals that reflect your values, and then supports you with habit-development, social support, and guided reflection. Users are guided through goal-setting with links and resources to performance research, goal tracking and review.

Try it out live [here](https://core-values.herokuapp.com)!

![schema](https://raw.githubusercontent.com/glassjoseph/core_values/master/app/assets/images/overview.png)


## Setup

### To Clone:

`git clone git@github.com:glassjoseph/core_values.git`

### To Set Up Database:
`cd core_values`

`bundle install`

`rake db:create`

`rake db:migrate`

`rake db:seed`


### To run the test suite:
`rspec`


## Live Site
Want to log in and see the live site with seeded data? Use the following info:

Login Username: "n"
Login Password: "password"


### Dailies
"Dailies" are the daily goals you set to perform each day. These shouldn't be checklists as much priorities. Score yourself based on how much effort you put into achieving that ideal each day, and track your successes and challenges in your journals. 

![dailies](https://raw.githubusercontent.com/glassjoseph/core_values/master/app/assets/images/dailies.png)

### Resources
Resources are links, images, and quotes that you find inspiring. Add tags to connect your resources and your dailies, so that when you need help and inspiration to meet your goals, you know where to find it!

![cute bunny picture](https://raw.githubusercontent.com/glassjoseph/core_values/master/app/assets/images/bunny_photo.png)
