CREATE DATABASE catalog

CREATE TABLE items (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    genre_id INT REFERENCES genres(id),
    author_id INT REFERENCES authors(id),
    label_id INT REFERENCES labels(id),
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL
)

CREATE TABLE music_albums (
    id INT GENERATED ALWAYS AS IDENTITY,
    on_spotify BOOLEAN,
    publish_date DATE,
    archived BOOLEAN,
    PRIMARY KEY (id),
    genre_id INT REFERENCES genres(id),
    author_id INT REFERENCES authors(id),
    source_id INT REFERENCES sources(id),
    label_id INT REFERENCES labels(id)
);

CREATE TABLE labels (
    id  INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(100),
    color VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE book (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publish_date DATE,
  publisher VARCHAR(100),
  cover_state VARCHAR(100),
  label_id INT REFERENCES labels(id)
);
