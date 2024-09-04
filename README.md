# Ruby on Rails Tutorial

<h3>Some useful commands:</h3>

Once your project is created, run:

```git
$ rails g controller home index
```

To run the server locally:

```git
$ rails s
```

To see all of the routes that your app is using:

```git
$ rails routes
```

<h3>Styling</h3>

One of the easiest ways to style your Rails site is to bootstrap it with GetBoostrap

<h3>Adding CRUD to your app</h3>

```git
$ rails g scaffold (name of table) (column1:datatype1) (column2:datatype2) etc..
```

You can find all the different data types (string, integer, text, etc.) [here: Rails Migration Guide](https://guides.rubyonrails.org/v3.2/migrations.html)

You can push the migration into the database using:
```git
$ rails db:migrate
```

<h3>Authentication / Devise Setup</h3>

Add Devise to your Gemfile: Open your Gemfile and add the following line:
Ruby

gem 'devise'

Install the gem: Run the following command to install the Devise gem:
```git
bundle install
```

Set up Devise: Run the Devise installation generator:
```git
rails generate devise:install
```

Configure Devise: Follow the instructions provided by the generator. Typically, you need to add a few lines to your config/environments/development.rb file and set up your root route in config/routes.rb.

Generate the User model: Run the following command to generate a User model with Devise:
```git
rails generate devise User
```

Run the migrations: Apply the generated migrations to your database:
```git
rails db:migrate
```

Set up views: If you want to customize the Devise views, you can generate them with:
```git
rails generate devise:views
```

<h3>Associations</h3>

In Rails, an [association](https://guides.rubyonrails.org/v4.0/association_basics.html#:~:text=In%20Rails%2C%20an%20association%20is%20a%20connection%20between,you%20can%20declaratively%20add%20features%20to%20your%20models.) is a connection between two Active Record models.

You can add user_id's to the friends table by running the following two commands:
```git
rails g migration add_user_id_to_friends user_id:integer:index
rails db:migrate
```

To make it so that only the logged in user can edit things, you should:

1) add the following line to your app/controller/friends_cotnroller.rb:
   
   before_action :authenticate_user!, except: [:index, :show]
   #if its the correct user, allow them to edit, update and destroy
   before_action: :correct_user, only: [:edit, :update, :destroy]

   def new
    #@friend = Friend.new
    @friend = current_user.friends.build
   end

   def create
    #@friend = Friend.new(friend_params)
    @friend = current_user.friends.build(friend_params)...
   
   def correct_user 
    @friend = current_user.friends.find_by(id: params[:id])
    redirect_to friends_path, notice: "Not Authorized To Edit This Friend" if @friend.nil?
   end

2) updates the files in your app/views/friends like index.html.erb to include user_id

   Also add this line to your code in the tbody: <% if friend.user == current_user %>

<h3>Controllers</h3>

Controllers play a crucial role in the MVC (Model-View-Controller) architecture. They:
1) **Handle Requests:** Controllers are responsible for handling incoming HTTP requests. When a request is made to your application, the router determines which controller and action to use. The controller then processes the request and prepares the appropriate response.
2) **Interact with Models:** Controllers often interact with models to retrieve or save data. For example, when a user submits a form, the controller might create a new record in the database using a model.
3) **Render Views:** After processing the request and interacting with models, controllers render views to generate the HTML (or other formats like JSON, XML) that is sent back to the user’s browser. The view templates are responsible for displaying the data to the user.
4) **Manages Sessions and Cookies:** Controllers can manage sessions and cookies to store data between requests. This is useful for things like user authentication, where you need to keep track of a user’s login state1.
5) **Handle Filters and Callbacks:** Controllers can use filters and callbacks to execute code before, after, or around actions. This is useful for tasks like authentication, logging, or modifying request parameters.
6) **Error Handling:** Controllers can handle exceptions that occur during request processing, ensuring that your application can gracefully handle errors and provide meaningful feedback to users.

<h3>Git/GitHub Steps</h3>

Setup Git & save all of our code to a local repository with the following steps:

$ git config --global user.name "Your Name"
$ git config --global user.email "you@youraddress.com"
$ git config --global push.default matching
$ git config --global alias.co checkout
$ git init
$ git add .
$ git commit -am 'initial commit'

Push to GitHub:

$ mkdir ~/.ssh (create ssh directory)
$ cd ~/.ssh (go to key location)
$ ssh-keygen.exe (to generate your key, don't enter a password)
$ cat id_rsa.pub (to see your key)
$ cd (go back to your projects directory)
$ git remote add origin git@github.com/markbuckle/your-repository.git
$ git branch -M main
$ git push -u origin main

[Link to the tutorial video](https://www.youtube.com/watch?v=fmyvWz5TUWg)


  


