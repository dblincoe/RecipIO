create table Users
(
    id            int auto_increment
        primary key,
    user_name     varchar(50)                        not null,
    email         varchar(50)                        null,
    password_hash char(64)                           not null,
    time_creates  datetime default CURRENT_TIMESTAMP not null,
    constraint Users_email_uindex
        unique (email)
);

INSERT INTO team_14.Users (id, user_name, email, password_hash, time_creates) VALUES (1, 'Kennan LeJeune', 'kcl60@case.edu', 'password', '2019-04-17 03:10:16');
INSERT INTO team_14.Users (id, user_name, email, password_hash, time_creates) VALUES (2, 'David Blincoe', 'drb133@case.edu', 'password', '2019-04-17 03:10:52');
INSERT INTO team_14.Users (id, user_name, email, password_hash, time_creates) VALUES (17, 'Sammy Boy', 'soj3@case.edu', 'databasesSUX', '2019-04-30 01:28:56');