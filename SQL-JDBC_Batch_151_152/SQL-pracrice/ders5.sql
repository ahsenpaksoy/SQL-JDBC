/*
anneler, babalar ve cocuklar adında 3 tane tablo olusturun
anneler tablosunda id(primary key), isim(unique) ve meslek sutunları olsun
babalar tablosunda id(primary key), isim ve meslek sutunları olsun
cocuklar tablosunda isim, anne_id,  baba_id,yas sutunları olsun
her cocugun anneler tablosundan bir annesi ve
babalar tablosundan bir babası olsun
cocuklar tablosunda anne_id ve baba_id sutunlarını 
referans alan foreign key kısıtlaması olsun
*/

create table anneler(
	id int primary key,
	isim varchar(50) unique,
	meslek varchar(50)
);

create table babalar(
	id int primary key,
	isim varchar(50),
	meslek varchar(50)
);

create table cocuklar(
	isim varchar(50),
	anne_id int,
	baba_id int,
	yas int,
	constraint anne_fk foreign key(anne_id) references anneler(id),
	constraint baba_fk foreign key(baba_id) references babalar(id)
);




















