CREATE TABLE labels(
  id INT GENERATED ALWAYS AS IDENTITY,
  title CHAR(50),
  color CHAR(50),
  PRIMARY KEY(id)
)

CREATE TABLE authors(
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name CHAR(50),
  last_name CHAR(50),
  PRIMARY KEY(id)
)

CREATE TABLE books(
  id INT GENERATED ALWAYS AS IDENTITY,
  publisher CHAR(50),
  cover_state CHAR(10),
  published_date DATE,
  archived BOOLEAN,
  genre_id INT,
  author_id INT,
  label_id  INT,
  FOREIGN KEY(genre_id) REFERENCES genres(id),
  FOREIGN KEY(author_id) REFERENCES authors(id),
  FOREIGN KEY(label_id) REFERENCES labels(id),
  PRIMARY KEY(author_id)
)

CREATE TABLE games(
  id INT GENERATED ALWAYS AS IDENTITY,
  multiplayer BOOLEAN,
  last_played_date DATE,
  published_date DATE,
  archived BOOLEAN,
  genre_id INT,
  author_id INT,
  label_id  INT,
  FOREIGN KEY(genre_id) REFERENCES genres(id),
  FOREIGN KEY(author_id) REFERENCES authors(id),
  FOREIGN KEY(label_id) REFERENCES labels(id),
  PRIMARY KEY(id)
)