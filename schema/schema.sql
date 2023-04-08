CREATE DATABASE catalog;

CREATE TABLE genres (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE authors (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);

CREATE TABLE sources (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE items (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    genre_id INT REFERENCES genres(id),
    author_id INT REFERENCES authors(id),
    label_id INT REFERENCES labels(id),
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL
);

CREATE TABLE music_albums (
    id INT GENERATED ALWAYS AS IDENTITY,
    on_spotify BOOLEAN NOT NULL,
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

CREATE TABLE books (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    publish_date DATE,
    publisher VARCHAR(100) NOT NULL,
    cover_state VARCHAR(100) NOT NULL,
    label_id INT REFERENCES labels(id)
);

CREATE TABLE authors (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    item_id INT REFERENCES items(id),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);

CREATE TABLE games (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    genre_id INTEGER REFERENCES genres(id),
    label_id INTEGER REFERENCES labels(id),
    author_id INTEGER REFERENCES authors(id),
    source_id INTEGER REFERENCES sources(id),
    archived BOOLEAN,
    multiplayer VARCHAR(5),
    last_played_at DATE,
    FOREIGN KEY (genre_id) REFERENCES genres (id),
    FOREIGN KEY (author_id) REFERENCES authors (id),
    FOREIGN KEY (label_id) REFERENCES labels (id)
);
