FROM arm32v7/ruby:latest

WORKDIR /webapp

COPY Gemfile* /webapp/
RUN bundle install

COPY . /webapp/

EXPOSE 3000

CMD ["rails", "s", "-b", "0.0.0.0"]
