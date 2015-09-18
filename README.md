# LP2
**Lesson Sections Duration** 

Determine necessary blocks of time for each section and attach to sections

 
**LEARNING GOALS**

At the end of the lesson the student should be able to give themselves a passing rating on the following:

* I can explain what a validation is
* I can provide two examples for when a validation should be used
* I can write two validations for existing projects
* I can look at someone else’s project and identify where a validation should be used
 

**Introduction**

Q: What does the word validation mean?  
A: Example: variation of → to make valid; substantiate; confirm
 
Q: Can anyone use it validation or validate or even valid in a sentence?  
A: Example sentence: They had to wait for the security office to validate their passports before proceeding.
 
Q: In general terms, what do you think we’re trying to do when we validate something in Rails?  
A: Example: check to see if something is valid etc. etc.

**Instructor:** Simply put, a validation checks to see whether something contains the proper information. If it does not it will let us know that the item is not valid.
 
**Example:** When you go to a website and sign up as a new user the form will ask you to fill in your username. If the form has no validation you would be allowed to sign up while leaving your username blank or you might be able to sign up with the same username a million times. Validation prevents this from happening. 
 
**Why is this important?**  
We want to make sure that our databases store only valid or real data. For example, we would want unique email addresses for each user in our database. We don’t want to store the same data over and over again if a user is improperly signing up over and over again. You can think of validations as the rules our data must follow. It’s good to write validations before the data reaches the database so we can keep the database as clean as possible

Validation rules should be enforced globally throughout the application so they logically go in the model. We want to enforce the rules all the time, not just some of the time. Any time the model goes to save information to the database the validations can be checked. if the rules are not being followed the model will refuse to save the data and give the user a chance to fix



**Student Activity**  
Purpose - Have students think about all the times they have experienced being “validated” by a web application without even realizing it. Should also gain understanding of many ways validation are used

Materials: Chart paper/markers - different color marker for each group

Set student up in groups
Each group starts off with a sheet of chart paper
Without using the username example above, write down three times you’ve interacted with validations (maybe without even realizing it)
Pass the chart paper on to the next group - they must write three more with their colored marker - their three must be different
Continue passing on until each group has added their portions

Whole class - teacher led session to sort validations into categories. What are we validating? Pull information out of students.   
Examples: 
* password can’t be blank - fits into validating the presence of
* password must be at least 8 characters - fits into length
etc.

 
**Validations**


There are a number of built in validations and you can also build custom helpers. Today, we’re going to focus on four of the basics to get your feet wet. 

* validates_presence_of
* validates_length_of
* validates_uniqueness_of
* validates_numericality_of



**Presence**
Lets start with the basic presence validation. As the name indicates it checks to see whether or not something is present and returns a true or false. 

Example:

```ruby
class Article < ActiveRecord::Base
  validates :title, presence: true
end
```

In the Article object we are checking to see whether a single item → title is present.
The structure of the presence validations is as follows:

```ruby 
validates :title
``` 
This calls the validate method on the symbol title
```ruby
presence: true 
```
This sets the symbol presence to true


This can also be done by using the following method. What do you notice that is different?

```ruby
class Article < ActiveRecord::Base
  validates_presence_of :title
end
```

We are giving it the task in the title of the method. Were telling it to validate the presence of “something” then giving it the specific item to validate This is a shortcut method that saves us from having to set the value of presence to true each time. This is also very useful when applying the validation to multiple items as in the following example.

In the Post object we are checking to see whether multiple items are present, in this case title, body and description. 
```ruby
class Post < ActiveRecord::Base
  validates_presence_of :title, :body, :description
end
```

The structure is as follows:
```ruby
validates_presence_of 
```
then a symbol which is the attribute we want to validate. 

Optionally, we can add a second argument which is a hash of options for configuring behavior

The attribute must not be blank. Therefore it can't be nil, false, an empty string, and empty array or empty hash.



**Length**
This validation is going to take a hash of options containing the parameters we are looking for. Some of the options we can choose are
```ruby
:is, :minimum, :maximum, :within, :in
```

```ruby
class User < ActiveRecord::Base
  validates :name, length: { minimum: 2}
  validates :pin, length: {is: 4} 
end
```

What are each of these doing?



**Numericality**

Numericality checks to see that a field is being entered with a number format

```ruby
class User < ActiveRecord::Base
  validates :pin, numericality: true
end
```


**Uniqueness**

This validation checks to make sure that the data being entered is unique!

Example:
```ruby
class Post < ActiveRecord::Base
  validates :title, uniqueness: true
end
```
Q: Can someone explain what this is checking?

```ruby
class Post < ActiveRecord::Base
  validates :title, uniqueness: true
end
```

Additionally we can add additional specifications
```ruby
class Post < ActiveRecord::Base
  validates :title, uniqueness: {case_sensitive: false}
end
```

Q: Can someone explain what we are checking here?


**Scenario Activity 1**

In groups or independently depending on group make-up
Materials: Scenario cards(_need to be made in advance_), pen/pencil to note answers

Tell students:   
Don’t worry about the syntax specifically or writing “code.” Focus on writing statements that demonstrates your understanding of the type of validation needed for the scenario.

_Sample scenario1_
You have a simple blog application where you write about your 13 cats. Your mom and grandmother are your best, (and only) readers and you want to make sure that you keep them in the loop! Heaven forbid you submit a post with the title, “Mittens Escaped!” but you accidentally post it without the body! Grandma will call at least 13 times wanting to hear all about it! Make sure this doesn’t happen by making sure that you have a **title and body** before posting.  

Acceptable answers example:
		* validates title: true
		* validates body: true
		*	validates_presence_of :title, :body
		*	validate that title is true/exists
		*	validate that body is true/exists

_Sample scenario2_
Your web application request that users sign up using their email address as their username. How will you keep a user from entering an email address more than once?

Etc.
Etc.


**Scenario Activity2** - Can be interchanged with activity 1

Instructor Led
Students complete work individually
Group review - students share answers at the board

_I’m A..._
-rocket scientist
-accountant
-law school dropout
-grandmother
-banker
-cat lady
-lawyer
-programmer
-teacher
-doctor
-etc.

_Filling out a..._
-dating profile
-legal form
-bank transfer form
-job application
-school application
-parent permission form
-withdrawal request
-new email signup
-police report
-rental car reservation
 -etc.
 
_That asks for a ..._
a signup sheet containing 
-username
-password
-password confimation
-phone number
-mailing address
-pin number
-numerical user id
-blog post title
-author name
-etc.
 
**Example Intro:** 
We’re going to complete an activity that will help you practice writing validations. I’m going to select three cards: a user, a form they are filling out and the requirements of that form. Your job is to decide what validation is needed and write code/statements to create that validation. Again, don’t worry so much about the exact code as you do about understanding what should be validated and what type of validation you need.

_Example draw:_

I’m a **cat lady** filling out a **dating profile** that asks for a **phone number**.

Students write a validation to check for numericality and/or presence and/or length of phone number.

_Example review:_

Have student A come up and share their answer: 
-any number of possible answers, correct codewise or acceptable statements
-guage student cohort make-up and comfort level with explaining their answers, writing on board etc.



**Code Along**
Purpose: Have student immediately implement basic rails validations. Give them something small to continue as homework

```ruby
rails new Lesson
```
cd into Lesson 
```ruby
rails g scaffold blog title:string body:text
```

```ruby
rails c
```
to start your server

In browser - go to localhost:3000 and make sure you’re up and running

Navigate to localhost:3000/blogs and see what's there

You should have the ability to create a new blog post, lets do it

Click new blog

Click create blog without entering anything into the title or body field

Boom - blog was successfully created… and that’s a problem

We now have a blank title and body - lets fix this

Q: What do we want to happen?  

A: Student answer - We want the creator to have to enter a title AND body before they can create a blog post.

Let’s go into the model for our blog and add validation
```ruby
validates_presence_of :title, :body
```
Now let’s go back to our blog post and try to create blog again.
Perfect, we get two errors. Title can’t be blank and body can’t be blank. It’s that simple to add a validation for presence!

Ok let’s break this. I’m going to put in a title of M and a body of M. That works and that’s no good! We can have all sorts of scammy, weird looking blog posts going out in this case so lets fix this by adding Q: __________? Right, length! Thats not a completely perfect fix but it minimizes the chances that the author is just posting random stuff.

Let’s go back into the model and add validation:
```ruby
validates_length_of :title, minimum: 4
validates_length_of :body, minimum: 140
```

_(*Note the options hash can be written several different ways - decide whether to teach students one way for clarity's sake or to explore all the options)_

Now we get error messages if the title contains less than 4 characters or the body contains less than 140 characters. Again, this isn't perfect. A user can still submit a bunch of gobbledy-gook but we’ve lessened the likelihood somewhat.


Moving on, let’s create a super simple user to go along with our blog posts
```ruby
-rails g scaffold User name:string email:string pin:integer
```
Remember that string is the default and you don’t have to include this on the name and email fields
```ruby
-rake db:migrate
```
lets go ahead and check out what we have at localhost:3000/users

If we click on New User and then create user what will happen? You got it! We are able to create a blank user just like before with our blog posts. Not good! Let's work on this together and a little later on you guys will take it away on your own.

First lets set the name to have to contain a value
```ruby
validates_presence_of :name
```

Then let’s go ahead and set a minimum and maximum using `:within`

To do this we need to give a range of acceptable values that our name length must fall within.

We start off normally using our `validates_length_of` method, then we use `within:` and the specified range to end up with this
```ruby
validates_length_of name :name, within: 4..20
```

Now if we try to enter a blank name we are prompted that the name cannot be blank AND the name is too short. Well I have a friend named Amy and a friend named JT…. hmmm… they would not be able to enter their names in this field. So let’s adapt that range to start with a lower limit of 1

Does that really make sense?
Well it could …. but it would also make sense just to use a maximum in this case. By setting the presence_of validation we have assured that the name cannot be blank, thereby ensuring that the user will enter at least 1 character. So let’s swap out the :within for maximum.

```ruby
validates_length_of :name, maximum: 20
```

On to email

Let’s set the validation. In email we could definitely use the :within validator. An legitimate email is almost always going to be greater than, let’s say 6 characters. Unless you’re looking at m@m.co, (which is super weird and shady sounding) so we can feel comfortable using within here.

```ruby
validates_presence_of :email
validates_length_of :email, within: 6..25
```
Now we’re moving along and you've gotten some practice so I want you to try a few things on your own.

In this application:
1)Set the length of the pin number to exactly 4 digits.
