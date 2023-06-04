CREATE TABLE calisanlar
(
id int PRIMARY KEY, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
sirket VARCHAR(20)
);


INSERT INTO calisanlar VALUES(123456789, 'Ali Yildiz', 'Istanbul', 5500, 'Tefal');
INSERT INTO calisanlar VALUES(234567890, 'Ayse Sahin', 'Istanbul', 4500, 'Karaca');
INSERT INTO calisanlar VALUES(345678901, 'Hayriye Tekin', 'Ankara', 3500, 'Samsung'); 
INSERT INTO calisanlar VALUES(456789012, 'Feyza Sanli', 'Izmir', 6000, 'Arcelik');
INSERT INTO calisanlar VALUES(567890123, 'Deniz Yildirim', 'Ankara', 7000, 'Beko');
INSERT INTO calisanlar VALUES(456715012, 'Melek Metin', 'Ankara', 4500, 'Profilo');

select * from calisanlar;

-- SORU1: calisanlar tablosundaki sirket sutununun adini firma olarak degistiriniz.
alter table calisanlar rename column sirket to firma; 


-- SORU2: calisanlar tablosunun adini isciler olarak degistiriniz.
alter table calisanlar rename to isciler;


-- SORU3: isciler tablosundaki sehir sutununun veri tipini VARCHAR(30) olarak değiştiriniz.
alter table isciler alter column sehir type varchar(30);
select * from isciler;


-- SORU4: isciler tablosuna maas 3000 den kucuk olan degerler veri olarak girilemesin.
--kısıtlama ekleyelim ve kısıtlamaya check_maas ismini verelim
alter table isciler add constraint check_maas check(maas>=3000);

INSERT INTO isciler VALUES(456718062, 'Veliye Sahin', 'Ankara', 3500, 'Dyson');


--SORU5: isciler tablosundaki check_maas kısıtlamasını 2000den az maas girilemeyecek seklinde guncelleyelim
alter table isciler drop constraint check_maas,
add constraint check_maas check(maas>=2000);

--kisitlamada bir guncelleme yapmak istiyorsak once eski kisitlamayi drop 
--yapip daha sonra ayni isimli kisitlamayi guncel haliyle tekrar eklememiz gerekir.

INSERT INTO isciler VALUES(456718060, 'Vahide Yilmaz', 'Antalya', 2500, 'Siemens');
select * from isciler;


--SORU6: isciler tablosunun isim sutununa unique constrainti ekleyin,
alter table isciler add unique(isim);

INSERT INTO isciler VALUES(450715092, 'Aysen Sahin', 'Ankara', 6500, 'Bosch');

--constraints eklemek icin iki yol var:
-- 1) alter table + tabloadi + add constraint + cons.adi(ozel kendi verdigimiz) cons turu(sutun/kisitlama tanimi)
-- 2) alter table + tabloadi + add + cons turu(sutun/kisitlama tanimi)


--SORU7: isciler tablosundaki unique kısıtlamasını kaldırın
alter table isciler drop constraint isicler_isim_key;
--kisitlamanin ismini tablodan baktik


--SORU8: isciler tablosundaki tum verileri silin.(not: ddl komutlarini kullanin)
truncate table isciler;
--truncate komutu where ile kullanilmaz, delete komutu where ile kullanilir
--delete from isciler;  boyle de yazabiliriz

select * from isciler;


--SORU9: isciler tablosunu silin
drop table isciler;














