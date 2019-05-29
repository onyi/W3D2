PRAGMA foreign_keys = ON;

DROP TABLE if exists users;
DROP TABLE if exists questions;
DROP TABLE if exists question_follows;
DROP TABLE if exists replies;
DROP TABLE if exists question_likes;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(20) NOT NULL,
  lname VARCHAR(20) NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  title VARCHAR(140) NOT NULL,
  body VARCHAR NOT NULL
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent INTEGER,
  body VARCHAR NOT NULL,
  user_id INTEGER NOT NULL
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL, 
  user_id INTEGER NOT NULL
);


insert into users (id, fname, lname) values (1, 'Helen-elizabeth', 'Tewkesbury');
insert into users (id, fname, lname) values (2, 'Jordan', 'Amorine');
insert into users (id, fname, lname) values (3, 'Carolin', 'Mengo');
insert into users (id, fname, lname) values (4, 'Janet', 'Barth');
insert into users (id, fname, lname) values (5, 'Vasili', 'Jore');
insert into users (id, fname, lname) values (6, 'Stanton', 'Muggleton');
insert into users (id, fname, lname) values (7, 'Sigismond', 'Meredyth');
insert into users (id, fname, lname) values (8, 'Darcie', 'Tixall');
insert into users (id, fname, lname) values (9, 'Paten', 'Lello');
insert into users (id, fname, lname) values (10, 'Roxi', 'Neagle');
insert into users (id, fname, lname) values (11, 'Paige', 'Axelby');
insert into users (id, fname, lname) values (12, 'Nikolas', 'Hoys');
insert into users (id, fname, lname) values (13, 'Kristyn', 'Jennison');
insert into users (id, fname, lname) values (14, 'Creight', 'Fedder');
insert into users (id, fname, lname) values (15, 'Melvin', 'Jedrychowski');
insert into users (id, fname, lname) values (16, 'Sheppard', 'Kime');
insert into users (id, fname, lname) values (17, 'Bryana', 'Diemer');
insert into users (id, fname, lname) values (18, 'Rancell', 'McGrotty');
insert into users (id, fname, lname) values (19, 'Giulietta', 'Haack');
insert into users (id, fname, lname) values (20, 'Athena', 'Bottinelli');

insert into questions (id, title, body, user_id) values (1, 'Manic', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.', 1);
insert into questions (id, title, body, user_id) values (2, 'Nixon by Nixon: In His Own Words', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.', 2);
insert into questions (id, title, body, user_id) values (3, 'Wah-Wah', 'Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 3);
insert into questions (id, title, body, user_id) values (4, 'Paranormal Activity: The Marked Ones', 'Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.', 4);
insert into questions (id, title, body, user_id) values (5, 'How to Meet Girls from a Distance', 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 4);
insert into questions (id, title, body, user_id) values (6, 'Bettie Page Reveals All', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.', 6);
insert into questions (id, title, body, user_id) values (7, 'Last Wave, The', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.', 7);
insert into questions (id, title, body, user_id) values (8, 'Breaking Away', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 8);
insert into questions (id, title, body, user_id) values (9, 'Bachelor Party Vegas', 'Phasellus in felis.', 9);
insert into questions (id, title, body, user_id) values (10, 'Operation Petticoat', 'Nam dui.', 4);
insert into questions (id, title, body, user_id) values (11, 'Highlander: The Search for Vengeance', 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.', 11);
insert into questions (id, title, body, user_id) values (12, 'Schooled: The Price of College Sports ', 'Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.', 12);
insert into questions (id, title, body, user_id) values (13, 'Strangeland', 'Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.', 13);
insert into questions (id, title, body, user_id) values (14, 'City of Sadness, A (Bei qing cheng shi)', 'Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 14);
insert into questions (id, title, body, user_id) values (15, 'Last Shot, The', 'Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.', 15);
insert into questions (id, title, body, user_id) values (16, 'Blow Job', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', 16);
insert into questions (id, title, body, user_id) values (17, 'Battle Royale (Batoru rowaiaru)', 'Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.', 17);
insert into questions (id, title, body, user_id) values (18, 'Dead in Tombstone', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 18);
insert into questions (id, title, body, user_id) values (19, 'Destry Rides Again', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', 19);
insert into questions (id, title, body, user_id) values (20, 'Blackbeard, the Pirate', 'Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.', 20);

insert into question_follows (id, question_id, user_id) values (1, 1, 1);
insert into question_follows (id, question_id, user_id) values (2, 2, 1);
insert into question_follows (id, question_id, user_id) values (3, 2, 2);
insert into question_follows (id, question_id, user_id) values (4, 2, 3);
insert into question_follows (id, question_id, user_id) values (5, 3, 5);

insert into replies (id, question_id, parent, body, user_id) values (1, 1, NULL, 'YOU SUCK GO TO BED', 1);
insert into replies (id, question_id, parent, body, user_id) values (2, 1, 1, 'YOU ROCK GO TO BED', 2);
insert into replies (id, question_id, parent, body, user_id) values (3, 1, 1, 'YOU SMELL GO TO BED', 2);
insert into replies (id, question_id, parent, body, user_id) values (4, 1, 2, 'YOU LOOK GREAT GO TO BED', 3);
insert into replies (id, question_id, parent, body, user_id) values (5, 1, 4, 'YOU AMAZING GO TO BED', 4);

insert into question_likes (id, question_id, user_id) values (1, 4, 1);
insert into question_likes (id, question_id, user_id) values (2, 1, 2);
insert into question_likes (id, question_id, user_id) values (3, 4, 3);
insert into question_likes (id, question_id, user_id) values (4, 4, 3);
insert into question_likes (id, question_id, user_id) values (5, 4, 5);

