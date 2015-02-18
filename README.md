# README

A very simple application using Grape in Rails.

This example defines API inside `Pondasi::APITest` that created by subclassing `Grape::API`. Please see `app/api/pondasi/api.rb` for more information.

## Installing

```
$ git clone https://github.com/firewalker06/pondasi.git
$ cd pondasi
$ bundle install
```

## Running

```
$ rails s
```

## Example

```
$ curl -X POST -H "Content-Type: application/json" http://localhost:3000/api/posts -d '{ "title": "This is new post", "description": "That describe something" }'
{"id":1,"title":"This is new post","description":"That describe something","created_at":"2015-02-18T13:02:56.798Z","updated_at":"2015-02-18T13:02:56.798Z"}

$ curl -X GET -H "Content-Type: application/json" http://localhost:3000/api/posts
[{"id":1,"title":"This is new post","description":"That describe something","created_at":"2015-02-18T13:02:56.798Z","updated_at":"2015-02-18T13:02:56.798Z"}]

$ curl -X PATCH -H "Content-Type: application/json" http://localhost:3000/api/posts/1 -d '{ "title": "Updating title" }'
true

$ curl -X GET -H "Content-Type: application/json" http://localhost:3000/api/posts/1
{"id":1,"title":"Updating title","description":null,"created_at":"2015-02-18T13:02:56.798Z","updated_at":"2015-02-18T13:04:24.571Z"}

$ curl -X DELETE -H "Content-Type: application/json" http://localhost:3000/api/posts/1
{"id":1,"title":"Updating title","description":null,"created_at":"2015-02-18T13:02:56.798Z","updated_at":"2015-02-18T13:04:24.571Z"}

$ curl -X GET -H "Content-Type: application/json" http://localhost:3000/api/posts
[]
```

## Contributing

Want to contribute? Great!

1. Fork it.
2. Create a branch (`git checkout -b improve_readibility`)
3. Commit your changes (`git commit -am "Change my contact lense"`)
4. Push to the branch (`git push origin improve_readibility`)
5. Open a [Pull Request](https://github.com/firewalker06/pondasi/pulls)
6. Enjoy a refreshing Diet Coke and wait
