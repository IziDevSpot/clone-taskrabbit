# Creating an App

Rails 4.2.3

---


### Getting Started

Delete any previous schemas, create a new database, seed the database with data
```language-powerbash
rake db:wipe
```
Start the server
```language-powerbash
rake server:start
```

---

## Reviewing Tasks

I prefer to create tasks first that will help me automate stuff such as wiping my development database, auto restarting my local web server and removing comments from my Gemfile. 

Remove the ugly comments from ```Gemfile```
```
rails gemfile:clean
```

Drop the db schema, create a new one, migrate any content and populate any existing data.
```
rails db:wipe
```

Run Rails while monitoring the files withing /app and config.  Restart if changes are made.
```
rails server:start
```

Check which pid your server is running on
```
rails server:pid
```

Force kill the server
```
rails server:kill [:pid]
```

Remove the server
```
rails server:remove_server
```

Review all the commands it took to create this app
```
rails app:initialize
```

---

## Installing libraries

**Step 1**

Review ```Gemfile``` to see the various libraries used.



**Step 2**

Install the libraries
```
bundle install
```



**Step 3**

You'll need to visit the [Bootstrap Documentation](http://www.rubydoc.info/gems/bootstrap-sass/3.3.6) and add modify ```app/assets/stylesheets/application.scss``` and ```app/assets/javascripts/application.js```.


**Step 4 - Simple Form**

Visit [simple form documentation](http://www.rubydoc.info/github/plataformatec/simple_form/master/frames) to install.
```
rails g simple_form:install --bootstrap
```


---


## Rails Command Line

There are many innovations within the Rails framework but my favorite is the Rails Command Line.  ```generate``` (```g```) is a powerful tool which allows you to create ```task```, ```scaffold```, ```model```, ```controller```, ```migration```, ```erb:scaffold```, ```db```, and [much more](http://www.chrisjmendez.com/2016/07/01/rails-cheatsheet/).



---


## The App


**Models**

Create a task so that customers can request tasks and vendors can sell their tasks. Models are the Object of the application. **Models** are **singular** and **Capital**. The columns follow after the Name and require a datatype such as ```string```, ```text```, ```datetime```.

```language-powerbash
rails g model Task title:string description:text company:string url:string
```
```language-powerbash
rake db:migrate
```

**Controllers**

Controllers access the Objects (from the database).  **Controllers** are **plural**.  If you add an action (aka method) after the controller, you will also get *routes*, *views*, *tests*, *stylesheets*, and *helpers* for free.  This is great because you don't have to add them in manually.

```language-powerbash
rails g controller tasks index show new create edit update destroy
```




# Resources

- [List of Associations](https://gist.github.com/rstacruz/1569572) - Includes ```belongs_to```, ```has_one```, ```has_many```, ```has_many :through```, ```has_one :through```, ```has_and_belongs_to_many``` 

