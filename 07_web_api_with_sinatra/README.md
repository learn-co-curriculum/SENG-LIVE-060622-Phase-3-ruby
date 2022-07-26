## 7. Web API with Sinatra 
### SWBAT

- [ ] Review databases vs servers vs APIs
- [ ] Review client-side vs server-side routing
- [ ] Review HTTP verbs
- [ ] Explain what MVC is and why it’s a popular pattern
- [ ] Observe how to create a controller and handle routing w/ controller actions
- [ ] Observe how to create dynamic routes
- [ ] Explain what params are and how to access them
- [ ] Observe using Postman to test server-side routes

--- 

## Understanding Sinatra

From there we can start building out our code. Before we do that, however, let's take a minute to talk about Sinatra, what it does and how we're going to adjust our thinking to work with it. 

You'll have some time over the weekend to do some labs on Sinatra, but since you haven't seen all of that content yet, we'll go through this content briefly so you have a sense of what it is and why it's useful before we start using it to build out our application. 

[Sinatra](http://sinatrarb.com/) is a DSL (Domain Specific Language) for quickly creating web applications in Ruby with minimal effort:

```rb
require 'sinatra'
get '/frank-says' do
  'Put this in your pipe & smoke it!'
end
```

So, Sinatra gives us a collection of methods we can use to create web applications. 

Okay, but what does web application mean? Simply put, a web application is a program that runs on a web server instead of on your local machine. So, in order for users to interact with a web application they have to interact with that web server. 

---

## Interacting with a Web Server

There are two key protocols that we can use to manage the interaction between browsers and servers: HTTP & Websockets. 

> Note that Websockets are usually used for real time communications like chat that require connections to stay open in both directions. 

For our purposes, we'll be focusing on HTTP, which is short for HyperText Transfer Protocol. 

You may recognize the HyperText part of that acronym from the HTML acronym (HyperText Markup Language). This is fitting, as HTTP was the original protocol used for delivering HTML documents from web servers to clients (web browsers). Before we get deeper into the HTTP protocol, let's talk through what this looks like from the perspective of the URL.

---

## Identifying Resources on the Web

The following is borrowed from an [article on MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Identifying_resources_on_the_Web). It's optional reading if you'd like to get a little more details and context about the terminology used to talk about the URL in all of its glorious detail. We're going to focus mainly on the pieces that are relevant for today. 

1. The port
2. The path
3. The query

Once we talk briefly about how each is relevant to what we're doing today, we'll move on to the Breaking down the HTTP protocol section.

The target of an HTTP request is called a "resource", whose nature isn't defined further; it can be a document, a photo, or anything else. Each resource is identified by a Uniform Resource Identifier (URI) used throughout HTTP for identifying resources. 

---

## Exploring the URL

The most common form of URI is the URL (Uniform Resource Locator) commonly referred to as a web address. The following are examples.

```
https://developer.mozilla.org
https://developer.mozilla.org/en-US/docs/Learn/
https://developer.mozilla.org/en-US/search?q=URL
```

The URL contains instructions to the web server that are used to determine what information should be part of the response that it sends back to the client.

A URL is composed of different parts, some mandatory and others are optional. A more complex example might look like this:

```
http://www.example.com:80/path/to/myfile.html?key1=value1&key2=value2#SomewhereInTheDocument
```

We'll be breaking this url down into pieces below based upon MDN's guide to [Identifying resources on the web](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Identifying_resources_on_the_Web).

---

## Protocol

![](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Identifying_resources_on_the_Web/mdn-url-protocol@x2.png)

This is an indicator to the browser that it should use the HTTP protocol to handle this request. Other common protocols or schemes) that might be used here include: 

|protocol|use|
|----|----|
|`mailto:`| Used to open the user's default mail program with a new email draft to the email address that follows `mailto:`|
|`file:`| Used when the browser is used to open a file that exists within the user's local computer. The path to the file will follow `file:`|
|`view-source:`| used when the browser's `View Page Source` menu option is selected. It opens the source code for the web address following `view-source:`|

Other examples can be found [in the MDN article](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Identifying_resources_on_the_Web#syntax_of_uniform_resource_identifiers_uris)

--- 

## Authority

![](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Identifying_resources_on_the_Web/mdn-url-domain@x2.png)

www.example.com is the domain name or authority that governs the namespace. It indicates which Web server is being requested. Alternatively, it is possible to directly use an [IP address](https://developer.mozilla.org/en-US/docs/Glossary/IP_Address), but because it is less convenient, it is not often used on the Web.

---

## Port

![](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Identifying_resources_on_the_Web/mdn-url-port@x2.png)

:80 is the port in this instance. It indicates the technical "gate" used to access the resources on the web server. It is usually omitted if the web server uses the standard ports of the HTTP protocol (80 for HTTP and 443 for HTTPS) to grant access to its resources. Otherwise it is mandatory.

--- 

## Path

![](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Identifying_resources_on_the_Web/mdn-url-path@x2.png)

`/path/to/myfile.html` is the path to the resource on the Web server. In the early days of the Web, a path like this represented a physical file location on the Web server. Nowadays, it is mostly an abstraction handled by Web servers without any physical reality. A bit later on, we'll use the `path` as part of the `routes` that we create.

---

## Query 

![](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Identifying_resources_on_the_Web/mdn-url-parameters@x2.png)

`?key1=value1&key2=value2` are extra parameters provided to the Web server. Those parameters are a list of key/value pairs separated with the & symbol. The Web server can use those parameters to do extra stuff before returning the resource to the user. Each Web server has its own rules regarding parameters, and the only reliable way to know how a specific Web server is handling parameters is by asking the Web server owner. 

In Sinatra, we'll be able to access query parameters using a hash called `params`. The example above would be accessible to us like so:

```rb
params[:key1] #=> "value1"
params[:key2] #=> "value2"
```

---

## Fragment

![](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Identifying_resources_on_the_Web/mdn-url-anchor@x2.png)

`#SomewhereInTheDocument` is an anchor to another part of the resource itself. An anchor represents a sort of "bookmark" inside the resource, giving the browser the directions to show the content located at that "bookmarked" spot. On an HTML document, for example, the browser will scroll to the point where the anchor is defined; on a video or audio document, the browser will try to go to the time the anchor represents. It is worth noting that the part after the #, also known as fragment identifier, is never sent to the server with the request. 

What this means is that clicking on anchor links within the same HTML document will not trigger a page refresh. They will tell the browser to move the viewport to the appropriate place.

--- 

## Breaking Down the HTTP Protocol

In the example URL above, we mainly focused on one HTTP verb: `GET`. When you type a url into the browser and hit enter or click on a link, generally the browser will send a GET request to a particular URL. There are other HTTP verbs that we'll use as well. MDN's article on [HTTP](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview) is a good place to review for further reading.

![](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvqTN_pZMrazSvvj6FIzxMXUa8dlMkdFIXCg&usqp=CAU)

The basic idea is that the client (browser) sends a request to the server and the server sends a response back to the client. 

---

## Different Types of Requests

There are different types of HTTP requests that you should be aware of. These are called request methods. The following are the most relevant to what we'll be working with in Sinatra and later in Rails.

- [GET](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/GET) - for retrieving (not modifying) information
- [POST](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST) - for sending new information
- [PUT](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PUT) - for replacing existing information (full update)
- [PATCH](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PATCH) - for updating existing information (partial update)
- [DELETE](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/DELETE) - for deleting stored information

---

# Request/Response Cycle

The Request/Response cycle is a key concept when we're building web applications, so let's take a minute to review what each of them looks like in more technical detail.

Here's an example of what an HTTP request might look like:

![](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview/http_request.png)

Requests consist of the following elements:

- An HTTP method, usually a verb like GET, POST or a noun like OPTIONS or HEAD that defines the operation the client wants to perform. Typically, a client wants to fetch a resource (using GET) or post the value of an HTML form (using POST), though more operations may be needed in other cases.
- The path of the resource to fetch; the URL of the resource stripped from elements that are obvious from the context, for example without the protocol (http://), the domain (here, developer.mozilla.org), or the TCP port (here, 80).
- Optional headers that convey additional information for the servers. *We'll use these to indicate that we want to format the body of our requests in JSON and to receive responses in JSON format*
- Or a body, for some methods like POST, similar to those in responses, which contain the resource sent. *In our case, the body of a request might be form data extracted from the state in one of our controlled forms*

---

# HTTP Responses

And here's an example HTTP Response

![](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview/http_response.png)

Responses consist of the following elements:

- The version of the HTTP protocol they follow.
- A status code, indicating if the request was successful, or not, and why.
- A status message, a non-authoritative short description of the status code.
- HTTP headers, like those for requests.
- Optionally, a body containing the fetched resource.

---

# Getting Started with Sinatra

When we're first building web applications as an API backend, our focus is on building out endpoints. An endpoint is a route to which requests can be sent in order to retrieve a particular response. When we speak about a `route` we mean a path that a user can take through your application to go from a request to a response. The main ideas we have to manage when building a route/endpoint for our API are these:

> The terms route and endpoint are used interchangeably when talking about possible requests we can send to an API.

- the HTTP verb (get, post, put, patch, or delete)
- the path (`"/"`, `"/dogs"`, `"/walks"`)
- the JSON that we want to send back as a response
  - We might make a query to our database using `Dog.all` and then convert the results to JSON and return that 

An example might look like this:

```rb
get "/dogs" do
    Dog.all.to_json
end
```

---

# Details and Configuration

Other HTTP details we'll have to account for:
- any headers we need to include
  - `"Accept": "application/json"`
  - `"Content-Type": "application/json"`
- Allowing requests across origins 
  - important so that we can ensure that our API will respond if we make a fetch request from another domain.
  - this is necessary because we may be deploying the react app somewhere like [Netlify](https://www.netlify.com/) while our Sinatra API is deployed on [Heroku](https://www.heroku.com/). They would both have different web addresses, so we'd need to make sure that our API on Heroku will accept requests originating from our react app on Netlify.

---

### IMPORTANT NOTE

When you work on your project, it's recommended that your react application be in one repository and your sinatra api be in another repository. While it is possible to store all of the code in a single repository, it affects the process of deploying your code. There are pros and cons to each approach, but at this point, the benefits of deploying the frontend and backend to separate servers/services (heroku for backend and netlify for frontend) outweigh the challenges. Storing the frontend code in one repo and the backend code in another will allow you to deploy both to the services mentioned above via a simple `git push`. One of the downsides is that it makes user authentication a bit trickier. In Phase 4, when we introduce authentication, we're going to deploy our rails application and our react application together from a single repo. So, you'll get some experience with both approaches.

---

### Quick Question to think about before break
If we look again at our dog walker application again:
![Dog Walker Application](https://res.cloudinary.com/dnocv6uwb/image/upload/v1627627105/dog-walker-app-demo-13fps_nwstsn.gif)


## Exploring the Starter Codebase 

- `app/models`: Our Active Record models. Responsible for code that accesses and updates data in our database using classes that inherit from ActiveRecord::Base. We'll have the models we've been working on throughout the phase here.
- `config`: Code in this folder is responsible for our environment setup, like requiring files/gems, and establishing a connection to the database.
- `db/migrate`: Our Active Record migrations. Responsible for creating and altering the structure of the database (making new tables, adding columns to existing tables, etc).
- `db/seeds.rb`: Lets us easily add sample data to the database.
- `Gemfile`: Lists all the gems our application depends on.
- `Rakefile`: Code for common tasks that we can easily run from the command line, like `rake console` and `rake server` to run our local dev server.
- `config.ru`: Essential file that all Sinatra applications require. Contains instructions on how to run the rack web server.
- `app/controllers/application_controller.rb` - inherits from `Sinatra::Base` which allows us to define api endpoints like `get '/dogs'`. Sets up configuration to allow cross origin requests (CORS) so our react app can get data from our Sinatra API.

--- 

## Introducing MVC

Before we can hop in and start writing code, we need to understand one of the main design patterns that Ruby on Rails follows. This is important now because we'll be applying that same design pattern to our Sinatra application. This pattern is called **Model-View-Controller**, or **MVC** for short. It looks something like this:

![](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVnObsmAMBWv4xbev4TmmLezWslQ87Ugtn2g&usqp=CAU)

Connecting the diagram to our HTTP request/response cycle, we can say that the React client in our Browser sends a request to our server and the controller is the part of our sinatra code that decides how to respond. It may interact with one of our Models to get data from the database and then render a response back to the browser utilizing a view. 

> The way we've used React so far, we've been doing all rendering of HTML within the browser. While Sinatra has the ability to render html from the server side, we won't be doing so because we want to do that in React. Instead, we'll be thinking of our *view* code as a way of describing what the JSON representation of our data should look like when we send a response back to our client side react code.

---


## Key Concepts:

- **Model** - class that inherits from ActiveRecord::Base that can make queries to the DB and get a collection of objects back
- **Controller** - class that defines routes and decides how our server will respond to incoming requests
- **View** - the code that determines the structure of the JSON that the controller will respond with. Later, we can move this code to separate files called serializers, but for now, we'll keep this code right inside our controller's routes. If we're thinking of our full stack application holistically, we could say that our view code is our react frontend code.

Models should be familiar at this point, so the new concepts are the Controller and the View. In Sinatra, the controller is where we define the routes our application will respond to. 
> This is slightly different in Rails–there are controllers in Rails as well, but the routes are defined in a separate file. In Sinatra, routes live in the controller.

---

## Our First API endpoint

Let's jump in and try some stuff out. First, let's add this to the application controller.
```rb
get "/hi" do 
  { hello: "world" }
end
```

Next, we'll use `rake server` to start our development server. 

```bash
rake server
```

You should see something like this:

```bash
10:34:57 [rerun] Api launched
10:34:57 [rerun] Rerun (16074) running Api (16092)
2021-08-20 10:34:58 -0700 Thin web server (v1.8.1 codename Infinite Smoothie)
2021-08-20 10:34:58 -0700 Maximum connections set to 1024
2021-08-20 10:34:58 -0700 Listening on localhost:9292, CTRL+C to stop
10:34:59 [rerun] Watching . for **/*.{rb,js,coffee,css,scss,sass,erb,html,haml,ru,yml,slim,md,feature,c,h} with Darwin adapter
```

---

## Testing it Out

Now, let's go over to the browser and visit:

```
http://localhost:9292/hi
```

Uh oh!

```
Internal server error
```

OK, so this isn't super helpful. When you get a message like this in the browser, you want to check out the server logs. 

---
## The Error
```
2021-09-09 18:08:37 -0700 Unexpected error while processing request: Body yielded non-string value [:hello, "world"]
        /Users/dakotamartinez/.rvm/gems/ruby-2.6.6/gems/rack-2.2.3/lib/rack/lint.rb:21:in `assert'
        /Users/dakotamartinez/.rvm/gems/ruby-2.6.6/gems/rack-2.2.3/lib/rack/lint.rb:756:in `block in each'
        /Users/dakotamartinez/.rvm/gems/ruby-2.6.6/gems/rack-2.2.3/lib/rack/body_proxy.rb:41:in `each'
        /Users/dakotamartinez/.rvm/gems/ruby-2.6.6/gems/rack-2.2.3/lib/rack/body_proxy.rb:41:in `method_missing'
        /Users/dakotamartinez/.rvm/gems/ruby-2.6.6/gems/rack-2.2.3/lib/rack/lint.rb:754:in `each'
        /Users/dakotamartinez/.rvm/gems/ruby-2.6.6/gems/rack-2.2.3/lib/rack/body_proxy.rb:41:in `method_missing'
        /Users/dakotamartinez/.rvm/gems/ruby-2.6.6/gems/rack-2.2.3/lib/rack/content_length.rb:26:in `call'
        /Users/dakotamartinez/.rvm/gems/ruby-2.6.6/gems/thin-1.8.1/lib/thin/connection.rb:86:in `block in pre_process'
        /Users/dakotamartinez/.rvm/gems/ruby-2.6.6/gems/thin-1.8.1/lib/thin/connection.rb:84:in `catch'
        /Users/dakotamartinez/.rvm/gems/ruby-2.6.6/gems/thin-1.8.1/lib/thin/connection.rb:84:in `pre_process'
        /Users/dakotamartinez/.rvm/gems/ruby-2.6.6/gems/thin-1.8.1/lib/thin/connection.rb:53:in `process'
        /Users/dakotamartinez/.rvm/gems/ruby-2.6.6/gems/thin-1.8.1/lib/thin/connection.rb:39:in `receive_data'
        /Users/dakotamartinez/.rvm/gems/ruby-2.6.6/gems/eventmachine-1.2.7/lib/eventmachine.rb:195:in `run_machine'
        /Users/dakotamartinez/.rvm/gems/ruby-2.6.6/gems/eventmachine-1.2.7/lib/eventmachine.rb:195:in `run'
        ...
```

---

## Debugging the Error

So the error is `Unexpected error while processing request: Body yielded non-string value [:hello, "world"]`

When we return a value from one of our routes, we need to make sure that the value is a string. We generally want to send JSON strings as responses, so we can use the `to_json` method to do that.


So, let's break this down. Rack is expecting the return value for the route to be a string, but the body is yielding a non string value. We know we want our api to respond with JSON, so let's convert the hash to json:

```rb
get "/hi" do 
  { hello: "world" }.to_json
end
```

And try it again:

---

![json output](https://github.com/DakotaLMartinez/intro_to_sinatra/raw/main/img/json-output.png) 

---

## Prettifying the Output
If it doesn't look so nice for you, I recommend installing the [JSONView](https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc?hl=en) chrome extension. After installing, reload the page in the browser and you should see the same formatting as the image above.

---

# API Endpoint Checklist

So, when it comes to building out an API endpoint (route) these are the 3 things we need to do:

1. define the request method (get/post/patch/put/delete)
2. define the path to the route ('/hi')
3. pass a block that returns a JSON formatted string (which will be our response body)

---

## Devtools and Debugging

- Browser for get requests using [JSONView](https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc?hl=en) chrome extension for pretty JSON output
- Network Tab in Chrome when using react
- Postman for testing non GET requests
- rake server logs
- binding.pry within `rake server` terminal
- puts statements within `rake server` terminal

--- 

# Important Gotchas & Troubleshooting steps

## Problem - Routes paths must start with `/`!
  
If you add this:

```rb
get 'dogs' do 
  'hi there'
end
```

And then visit `http://localhost:9292/dogs`, you'll see this:

![404](https://res.cloudinary.com/dnocv6uwb/image/upload/v1629480277/Screen_Shot_2021-08-20_at_10.24.00_AM_p8nfb0.png)

---
## Fix - Routes paths must start with `/`!

fix the problem by adding the preceding `/`

```rb
get '/dogs' do 
  'hi there'
end
```

Now, you'll see

![hi there](https://res.cloudinary.com/dnocv6uwb/image/upload/v1629481002/Screen_Shot_2021-08-20_at_10.35.45_AM_ufdnsl.png)

---

# Problem - Server won't start because port is in use

If you start your server and see something like this:

```
10:27:06 [rerun] Api launched
10:27:06 [rerun] Rerun (14359) running Api (14521)
2021-08-20 10:27:07 -0700 Thin web server (v1.8.1 codename Infinite Smoothie)
2021-08-20 10:27:07 -0700 Maximum connections set to 1024
2021-08-20 10:27:07 -0700 Listening on localhost:9292, CTRL+C to stop
Traceback (most recent call last):
        15: from /Users/dakotamartinez/.rvm/gems/ruby-2.6.6/bin/ruby_executable_hooks:24:in `<main>'
        14: from /Users/dakotamartinez/.rvm/gems/ruby-2.6.6/bin/ruby_executable_hooks:24:in `eval'
        13: from /Users/dakotamartinez/.rvm/gems/ruby-2.6.6/bin/rackup:23:in `<main>'
        12: from /Users/dakotamartinez/.rvm/gems/ruby-2.6.6/bin/rackup:23:in `load'
        ... stack trace abridged here ...
         2: from /Users/dakotamartinez/.rvm/gems/ruby-2.6.6/gems/thin-1.8.1/lib/thin/backends/tcp_server.rb:16:in `connect'
         1: from /Users/dakotamartinez/.rvm/gems/ruby-2.6.6/gems/eventmachine-1.2.7/lib/eventmachine.rb:531:in `start_server'
/Users/dakotamartinez/.rvm/gems/ruby-2.6.6/gems/eventmachine-1.2.7/lib/eventmachine.rb:531:in `start_tcp_server': no acceptor (port is in use or requires root privileges) (RuntimeError)
```

---

# Fix - Server won't start because port is in use

that means there's already a server running somewhere. You need to find the running process and kill it. To do that, you can run the following command:

```bash
ps -ax | grep rackup
```

And you'll see a list of all processes that include `rackup` in them.

> **Aside**: The `grep` command is a search tool and we're piping the output of `ps -ax` to it, `ps -ax` will print a list of the running processes including their process ids and the path to the executable file itself. This will give us a list of processes that include `config.ru`. We should only see 2. The first will be the server process we need to kill, the second will be the search (which also contains `config.ru` in the command)

---

# Example of Fix

```bash
> ps -ax | grep rackup
21736 ttys008    0:03.02 ruby /Users/dakotamartinez/.rvm/gems/ruby-2.7.4/bin/rerun -b rackup -p 9292    
21780 ttys008    0:01.69 ruby /Users/dakotamartinez/.rvm/gems/ruby-2.7.4/bin/rackup -p 9292    
21918 ttys009    0:00.00 grep rackup
```
The number at the beginning of the line is the process id that we need to kill.

```bash
kill -9 21736
kill -9 21780
```

We can confirm that it worked by running the `ps -ax | grep config.ru` again:
```bash
> ps -ax | grep rackup
22194 ttys009    0:00.00 grep rackup
```

Now, we only see the search process and no other process containing `rackup`. At this point, we can try running the server again using `rake server`

```bash
> rake server
10:34:57 [rerun] Api launched
10:34:57 [rerun] Rerun (16074) running Api (16092)
2021-08-20 10:34:58 -0700 Thin web server (v1.8.1 codename Infinite Smoothie)
2021-08-20 10:34:58 -0700 Maximum connections set to 1024
2021-08-20 10:34:58 -0700 Listening on localhost:9292, CTRL+C to stop
10:34:59 [rerun] Watching . for **/*.{rb,js,coffee,css,scss,sass,erb,html,haml,ru,yml,slim,md,feature,c,h} with Darwin adapter
```
If you see something like the above then you're good to go!

Warm up question:
What is the difference between an API, server and database