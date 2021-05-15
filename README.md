# URL Shortener

Your task is to build the back end of a web service for shortening URLs. This will be an API service that a client would communicate with. The deliverable is the source code, written in Ruby, using whichever libraries, tools, database(s), and development methodologies you choose.

The requirements intentionally leave out many details. This is an opportunity for you to make decisions about the design of the service. What you leave out is just as important as what you include!

Product Requirements:

- Clients should be able to create a shortened URL from a longer URL.
- Clients should be able to specify a custom slug.
- Clients should be able to expire / delete previous URLs.
- Users should be able to open the URL and get redirected.

Project Requirements:

- The project should include an automated test suite.
- The project should include a README file with instructions for running the web service and its tests. You should also use the README to provide context on choices made during development.
- The project should be packaged as a zip file or submitted via a hosted git platform (Github, Gitlab, etc).#

## Requirements

- Docker
- Ruby 3.0.1
- Redis
- Docker-Compose

## Directions

Everything is in docker to make testing pretty seamless so just run `docker-compose up -d`.

## Testing

I honestly didn't have time to add tests to this.

### Desgin Descions

Essentially I used redis as the database because it lends itself to this type of workload. Meaning the key, value store fits the slug that we use that points to a url value. The only reason I didn't attach this to a model is because that would have taken some extra time it was a bit easier to just bake the values into the controller. If I could have done this over again I would have had the model take 3 values slug(optional), url, and exprie date(optional). It would be cleaner because you could bake the validations right into the model.

The whole reason I didn't bake the models and anything else into is because I spent way too much time trying to get the debugger working, and getting the docker-compose up and running. I ran into a problem where my page refused to reload even though the contianer was linked to my loacl enviorment. So I was forced to restart the docker-commpose everytime I made a change. I also spent too much time trying to get the docker image to be nice to alpine do to the small nature of alpine there were a lot of missing packages. In the end I got the requirements up and I'm mostly happy with what I have.
