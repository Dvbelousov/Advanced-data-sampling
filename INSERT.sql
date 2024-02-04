#Задание 1#

insert into music_genre ("name")
values ('Jazz'), ('Rap'), ('Pop'), ('Rock');

insert into musician ("name")
values ('Frank Sinatra'), ('Louis Armstrong'),
       ('50 Cent'), ('Eminem'), ('AC/DC'),
       ('Gorky Park'), ('Eagles');
      
insert into music_genremusician (music_genre_id, musician_id)
values (1,1), (1,2), (2,3), (2,4), (3,7), (4,5), (4,6);

insert into album ("name", "year")
values ('That’s Life', 1966), ('Close To You', 1957), 
       ('Hello, Dolly',1964), ('La Vie en rose', 1950), 
       ('The Massacre', 2005), ('Curtis', 2007),
       ('Encore', 2004), ('Recovery ', 2010),
       ('Powerage', 1978), ('Back in Black', 1980),
       ('Moscow Calling', 1993), ('Stare', 1996),
       ('Desperado', 1973), ('Hotel California', 1976);
      

 insert into albummusician (musician_id, album_id)   
 values (1, 1), (1, 2), (2, 3), (2, 4), (3, 5), (3, 6), (4, 7), (4, 8), (5, 9), (5, 10), (6, 11), (6, 12), (7, 13), (7, 14);
 
insert into track ("name", track_duration, album_id)
values ('Sand and Sea', 229, 1), ('Give Her Love', 214, 1),('Close to You', 337, 2), ('Don"t Like Goodbyes', 457, 2),
       ('A Lot of Livin" to Do', 236, 3), ('Hey, Look Me Over', 234, 3), ('You"re The Top', 237, 4), ('Take Tht A Train', 206, 4),
       ('Get in My Car', 405, 5), ('Ski Mask Way', 305, 5), ('Come & Go', 328, 6), ('Fully Loaded Clip', 313, 6),
       ('Yellow Brick Road', 546, 7), ('Rain Man', 514, 7), ('On Fire', 334, 8), ('Not Afraid', 408, 8),
       ('Gimme a Bullet', 300, 9), ('Sin City', 440, 9), ('Hells Bells', 509, 10), ('Shake a Leg', 403, 10),
       ('Politics of Love', 403, 11), ('Two Candles', 501, 11), ('Five Wheel Drive', 426, 12), ('Ego', 551, 12),
       ('Doolin-Dalton', 326, 13), ('Out of Control',304, 13), ('Hotel California', 630, 14), ('Wasted Time', 455, 14);
      
insert into collection ("name", "year")
values ('Collection 1', 2020), ('Collection 2', 2021), 
       ('Collection 3', 2022), ('Collection 4', 2023), ('Collection 5', 2024);
      
insert into trakcollection (collection_id, track_id) 
values (1, 1), (1, 3), (1, 5), (1, 7), 
       (2, 2), (2, 4), (2, 6), (2, 8),
       (3, 9), (3, 11), (3, 13), (3, 15),
       (4, 10), (4, 12), (4, 14), (4, 16),
       (5, 17), (5, 19), (5, 21), (5, 23);