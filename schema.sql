CREATE DATABASE catalogs

CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    published_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    genre_id INT,
    author_id INT,
    label_id INT,
    FOREIGN KEY (genre_id) REFERENCES genres(id),
    FOREIGN KEY (author_id) REFERENCES authors(id),
    FOREIGN KEY (label_id) REFERENCES labels(id) 
);

CREATE TABLE Books(
  id INT GENERATED ALWAYS AS IDENTITY,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  published_date DATE,
  archived BOOLEAN,
  publisher VARCHAR(50),
  cover_state VARCHAR(20),

  -- primary key of the table 
  PRIMARY KEY(id),

  -- fks of the table 
  FOREIGN KEY(genre_id) REFERENCES Genre(id),
  FOREIGN KEY(suthor_id) REFERENCES Author(id),
  FOREIGN KEY(source_id) REFERENCES Source(id),
  FOREIGN KEY(label_id) REFERENCES Labels(id)
);

CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(300),
    last_name VARCHAR(300)
);

CREATE TABLE Labels (
  id INT GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(30),
  color VARCHAR(30),
  item_id INT,

  -- primary key of the table
  PRIMARY KEY(id)

  -- FOREIGN KEY OF THE TABLE 

  FOREIGN KEY(item_id) REFERENCES Items(id)
);

CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE music_albums (
    id SERIAL PRIMARY KEY,
    on_spotify BOOLEAN NOT NULL,
    label_id INT,
    genre_id INT,
    author_id INT,
    published_date DATE,
    FOREIGN KEY (label_id) REFERENCES labels(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id),
    FOREIGN KEY (author_id) REFERENCES authors(id) 
);

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    multiplayer VARCHAR(100) NOT NULL,
    last_played_at DATE NOT NULL,
    label_id INT,
    genre_id INT,
    author_id INT,
    published_date DATE,
    FOREIGN KEY (label_id) REFERENCES labels(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id),
    FOREIGN KEY (author_id) REFERENCES authors(id) 
);
