#Задание 2#
#Название и продолжительность самого длительного трека#

select name, track_duration from track
where track_duration = (select max(track_duration) from track);

#Название треков, продолжительность которых не менее 3,5 минут#

select name from track
where track_duration > 350;

#Названия сборников, вышедших в период с 2021 по 2023 год включительно#

select name from collection
where "year" >= 2021 and "year" <= 2023;

#Исполнители, чьё имя состоит из одного слова#

select name from musician
where "name" not like '% %' and "name" not like  '%/%';

#Название треков, которые содержат «an» или «ot»#

select name from track 
where "name" like '%an%' or "name" like '%ot%';

#Задание 3#
#Количество исполнителей в каждом жанре#

SELECT g.name, count(ge.musician_id) 
  FROM music_genre g
       JOIN music_genremusician  ge 
       ON g.music_genre_id  = ge.music_genre_id 
 GROUP BY g."name"; 

#Количество треков, вошедших в альбомы 2000–2020 годов#

SELECT a."name" , a."year" , count(t.track_id) 
  FROM album a
       JOIN track t 
       ON a.album_id = t.album_id
 WHERE a."year"  BETWEEN 2000 and 2020
 GROUP BY a."name" , a."year";

#Средняя продолжительность треков по каждому альбому#

SELECT a."name" , AVG(t.track_duration) 
  FROM album a
       JOIN track t 
       ON a.album_id = t.album_id
 GROUP BY a."name";

#Все исполнители, которые не выпустили альбомы c 1970 по 200о год#

SELECT distinct e."name"  
  FROM musician  e
       JOIN albummusician ea 
       ON e.musician_id  = ea.musician_id
       JOIN album a 
       ON a.album_id = ea.album_id
 WHERE a."year" not between 1970 and 2000;

#Названия сборников, в которых присутствует конкретный исполнитель (50 Cent)#

SELECT c."name"  
  FROM collection c
       JOIN trakcollection tc 
       ON c.collection_id = tc.collection_id
       JOIN track t 
       ON t.track_id = tc.track_id
       JOIN album a 
       ON a.album_id = t.album_id
       JOIN albummusician ea 
       ON a.album_id = ea.album_id
       JOIN musician e 
       ON e.musician_id = ea.musician_id
 WHERE e."name"  LIKE '%%50 Cent%%';

#Задание 4#
#Названия альбомов, в которых присутствуют исполнители более чем одного жанра#

SELECT a."name"  
  FROM album a
       JOIN albummusician ea 
       ON a.album_id = ea.album_id
       JOIN musician e 
       ON e.musician_id = ea.musician_id
       JOIN music_genremusician ge 
       ON ge.musician_id = e.musician_id
       JOIN music_genre g 
       ON g.music_genre_id = ge.music_genre_id 
 GROUP BY e."name", a."name"
HAVING count(ge.music_genre_id) > 1;

#Наименования треков, которые не входят в сборники#

SELECT t."name" 
  FROM track t
       LEFT JOIN  trakcollection tc 
       ON t.track_id = tc.track_id
 WHERE tc.track_id IS null;

#Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько#

SELECT e."name", t.track_duration
  FROM musician e
       JOIN albummusician ea 
       ON e.musician_id = ea.musician_id
       JOIN album a 
       ON a.album_id = ea.album_id
       JOIN track t 
       ON t.album_id = a.album_id
 WHERE track_duration = (SELECT MIN(track_duration) 
   FROM track);

#Названия альбомов, содержащих наименьшее количество треков#

SELECT a."name", count(t.track_id) 
  FROM album a
       JOIN track t ON a.album_id = t.album_id
       GROUP BY a."name" 
HAVING count(t.track_id) in (
       SELECT count(t.track_id) 
       FROM album a
       JOIN track t 
       ON a.album_id = t.album_id
       GROUP BY a."name"
       ORDER BY count(t.track_id)
       LIMIT 1);
