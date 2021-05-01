doit() {
  test -f Cargo.toml && cargo install
  test -f Gemfile && bundle install
  test -f go.mod && go mod verify
  test -f Pipfile && pipenv install
  test -f project.json && npm install
  test -f project.json && yarn install
  test -f WORKSPACE && bazel fetch //...

  test -f project.json && npm run
  test -f project.json && yarn run
  test -f Gruntfile && grunt --help
  test -f gulpfile.js && gulp --tasks
  test -f Rakefile && rake --tasks

  # test -f Gemfile && bundle install
  # test -f Gemfile && bundle install
}
