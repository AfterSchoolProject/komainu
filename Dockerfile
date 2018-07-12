FROM ruby:2.5

WORKDIR /webapp

COPY Gemfile* /webapp/
RUN bundle install --with production

COPY . /webapp/

EXPOSE 3000

ENTRYPOINT ["rails", "s", "-b", "0.0.0.0"]
