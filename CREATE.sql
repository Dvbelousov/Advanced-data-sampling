create table if not exists music_genre (
	music_genre_id SERIAL primary key,
	name VARCHAR(120)not null
);
create table if not exists musician (
	musician_id SERIAL primary key,
	name VARCHAR(120)not null
);
create table if not exists album (
	album_id SERIAL primary key,
	name VARCHAR(120)not null,
	year integer check (year between 1900 and extract(year from now()))
);
create table if not exists track (
	track_id SERIAL primary key,
	name VARCHAR(120)not null,
	track_duration integer,
	album_id integer not null references album(album_id)
);
create table if not exists collection (
	collection_id SERIAL primary key,
	name VARCHAR(120)not null,
	year integer check (year between 1900 and extract(year from now()))
);
create table if not exists AlbumMusician (
	album_id integer not null references album(album_id),
	musician_id integer not null references musician(musician_id)
);
create table if not exists Music_genreMusician (
	music_genre_id integer not null references music_genre(music_genre_id),
	musician_id integer not null references musician(musician_id)
);
create table if not exists TrakCollection (
	track_id integer not null references track(track_id),
	collection_id integer not null references collection(collection_id)
);