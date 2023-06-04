/*========================CONSTRAINT -- KISITLAMALAR=======================================================

1) UNIQUE -->  Bir sütundaki verilerin BENZERSİZ olmasıdır.(2 veya daha fazla null deger kabul eder)

2) NOT NULL --> Bir sütunun NULL İÇERMEMESİNİ sağlar
   (NOT NULL kısıtlaması, data türünden hemen sonra yazılır. CONSTRAINT ismi tanımlanmaz.)   

3) PRIMARY KEY --> UNIQUE(BENZERSİZ) - NOT NULL 
   Bir tabloda en fazla bir adet Primary Key olur. 
   iki sutunun birlesiminden bir Primary Key oluşturulmasına ise Composite Primary Key denir.

4) CHECK --> Bir sütunun değer aralığını sınırlamak için kullanılır.

5) FOREIGN KEY --> Başka bir tablodaki PRİMARY KEY'i referans göstermek için kullanılır.
   Böylelikle, tablolar arasında Parent- Child ilişkisi oluşur.
============================================================================================================*/

/*
SORU1: memurlar isminde bir tablo oluşturunuz. 
id, isim, maas, mezuniyet sutunları olsun.
id sutununun data turu int olsun. PRİMARY KEY kısıtlaması olsun.
isim sutununun data turu varchar(30) olsun. UNIQUE kısıtlaması olsun.
maas sutununun data turu int olsun. maas 5000 buyuk olsun.
mezuniyet sutununun data turu varchar(25) olsun. NOT NULL kısıtlaması olsun.  
*/

create table memurlar(
id int PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int CHECK(maas>5000),
mezuniyet varchar(25) NOT NULL
);

insert into memurlar values(1,'Ali',10000,'Lisans');
insert into memurlar values(2,'Ahmet',15000,'Yuksek Lisans');
insert into memurlar values(3,'Altug',20000,'Lisans');
insert into memurlar values(4,'Elif',18000,'Lisans');

select * from memurlar;

insert into memurlar values(1,'Zulal',20000,'Lise');  -- PRIMARY KEY sebebiyle error verir
insert into memurlar values(5,'Altug',25000,'Yuksek Lisans');  -- UNIQUE sebebiyle error verir
insert into memurlar values(6,'Hayri',4000,'Lisans');  -- CHECK sebebiyle error verir
insert into memurlar values(7,'Burak',30000,null);  -- NOT NULL sebebiyle error verir

/*
SORU2: insanlar isminde bir tablo oluşturunuz. 
isim, soyisim sutunları olsun.
isim sutununun data turu varchar(20) olsun.
soyisim sutununun data turu varchar(30) olsun. 

isim sutununda PRİMARY KEY kısıtlaması olsun. Kısıtlamanın isimi pr_ks olsun.
soyisim sutununda UNIQUE kısıtlaması olsun. Kısıtlamanın ismi uni_ks olsun.
*/

create table insanlar(
isim varchar(20),
soyisim varchar(30),
	
CONSTRAINT pr_ks PRIMARY KEY(isim),
CONSTRAINT uni_ks UNIQUE(soyisim)
);

insert into insanlar values('Harun','Tan');
insert into insanlar values('Azra','Can');

select * from insanlar;

insert into insanlar values('Harun','Kan'); -- PRIMARY KEY sebebiyle error verir
insert into insanlar values(null,'Er');  -- PRIMARY KEY sebebiyle error verir
insert into insanlar values('Kudret','Can');  -- UNIQUE sebebiyle error verir

/*
SORU3: hayvanlar isminde bir tablo oluşturunuz. 
isim, cins sutunları olsun.
isim sutununun data turu varchar(20) olsun.
cins sutununun data turu varchar(25) olsun.

isim ve cins sutunları birlesiminden bir PRIMARY KEY kısıtlaması olsun.(Composite Primary Key). Kısıtlamanın ismini comp_pr yapınız

*/

create table hayvanlar(
isim varchar(20),
cins varchar(25),  --kisitlamayi kendimiz belirledigimiz icin sutunlarin altina yaziyoruz
	
CONSTRAINT comp_pr PRIMARY KEY(isim,cins)  --iki sutunun birlesiminden bir PRIMARY KEY elde ettik
);

insert into hayvanlar values('Findik','Sus Kopegi');
insert into hayvanlar values('Findik','Coban');
insert into hayvanlar values('Duman','Sus Kopegi');

insert into hayvanlar values('Findik','Sus Kopegi'); -- PRIMARY KEY kisitlamasi sebebiyle error verir

/*
NOT : CONSTRAINT leri sutun isimlerinin altinda belirtmenin bize sagladigi kolaylik;

1) CONSTRAINT ismini kendimiz belirleyebiliyoruz.
2) COMPOSITE PRIMARY KEY yapmamiza imkan veriyor.(Iki sutunun birlesiminden bir PRIMARY KEY olusturulmasi)

*/

create table emekciler
(
id char(5) PRIMARY KEY,   ---> UNIQUE + NOT NULL
isim varchar(50) UNIQUE,
maas int NOT NULL   -- NOT NULL icin constraint ismi yazilmiyor
);


insert into emekciler values(10002, 'Mehmet Yılmaz', 12000);
insert into emekciler values(10008, null, 5000);  --UNIQUE iki veya daha fazla null kabul eder
insert into emekciler values(10010, null,5000);  --UNIQUE iki veya daha fazla null kabul eder
insert into emekciler values(10020, null, 5000);
insert into emekciler values(10004, 'Veli Han', 5000);
insert into emekciler values(10005, 'Mustafa Ali', 5000);
insert into emekciler values(10006, 'Canan Yaş', null);   -- NOT NULL kisitlamasindan dolayi error verdi 
insert into emekciler values(10003, 'CAN', 5000);
insert into emekciler values(10007, 'CAN', 5000);  -- UNIQUE kisitlamasindan dolayi error verdi 
insert into emekciler values(10009, 'Cem', '');  -- int data turune sahip veri girilmeli 
insert into emekciler values('', 'osman', 2000);
insert into emekciler values('', 'osman can', 2000);  -- PRIMARY KEY den dolayi error verdi.ikinci defa hiclik giremeyiz
insert into emekciler values('', 'veli can', 6000);  -- PRIMARY KEY 
insert into emekciler values(10002, 'ayse Yılmaz', 12000);   -- PRIMARY KEY
insert into emekciler values(null, 'filiz', 12000); --PRIMARY KEY . null kabul etmez

select * from emekciler;
delete from emekciler where id='10002';
