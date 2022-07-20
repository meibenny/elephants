# syntax=docker/dockerfile:1
FROM klakegg/hugo:0.101.0-ubuntu

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y vim

WORKDIR /code
COPY . /code/elephants
RUN hugo new site example
WORKDIR /code/example/themes
RUN ln -s ../../elephants .
WORKDIR /code/example
RUN echo "theme = \"elephants\"" >> config.toml
WORKDIR /code/example/content/posts
RUN echo "---\ntitle: \"example post\"\ndate: 2022-07-15T00:00:00-05:00\ndraft: false\n---\n\nExample" > my-first-post.md
RUN echo "---\ntitle: \"example tag\"\ndate: 2022-07-20T00:00:00-05:00\ntags: [\"example_tag\"]\ndraft: false\n---\n\nExample" > my-second-post.md
WORKDIR /code
