create table Recipes
(
    id           int auto_increment
        primary key,
    title        varchar(150)                       not null,
    description  text                               not null,
    time_created datetime default CURRENT_TIMESTAMP not null,
    author_id    int                                not null,
    constraint authorID
        foreign key (author_id) references Users (id)
            on update cascade on delete cascade
);

create index authorID_idx
    on Recipes (author_id);

INSERT INTO team_14.Recipes (id, title, description, time_created, author_id) VALUES (1, 'Fluffy Pancakes', 'These pancakes are just right.', '2019-04-30 03:23:25', 2);
INSERT INTO team_14.Recipes (id, title, description, time_created, author_id) VALUES (15, 'Aunt Cora''s World''s Greatest Cookies', 'WORLD''S BEST CHOCOLATE CHIP PEANUT BUTTER COOKIES!', '2019-04-30 00:05:03', 1);
INSERT INTO team_14.Recipes (id, title, description, time_created, author_id) VALUES (18, 'Grandma''s Poppyseed Chicken', 'Delicious poppyseed chicken just like Grandma Jenkins used to make', '2019-04-30 02:09:37', 17);
INSERT INTO team_14.Recipes (id, title, description, time_created, author_id) VALUES (19, 'Egg in a hole', 'Pretty basic. Eggs and bread', '2019-04-30 01:52:36', 17);
INSERT INTO team_14.Recipes (id, title, description, time_created, author_id) VALUES (20, 'Pasta Carbonara', 'Quick and easy creamy pasta carbonara', '2019-04-30 02:03:13', 17);
INSERT INTO team_14.Recipes (id, title, description, time_created, author_id) VALUES (21, 'Mac and Jeezy', 'Delicious mac and cheese brought to you by Terry Crews
', '2019-04-30 02:10:14', 17);