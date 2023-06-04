-- $$  blok yapilarini basina $$ isareti koyarsak sonuna da koymamiz gerekir. tirnak isaretinden kurtuluyoruz
                       -- fazladan tirnak isaretinden kurtuluyoruz
					   -- $ kullanirsak tirnak isaretlerinden kurtuluruz
/*
test
*/

-- ******** DEGISKEN TANIMLAMA *************

do $$ -- anonymous block. -> Dolar: Ozel karakterler oncesinde tirnak icin
declare
    counter integer := 1;  -- counter adinda bir degisken olusturuldu.Default değeri 1 olarak atandı.
	first_name varchar(50) := 'Bahadir';
	last_name varchar(50) := 'Gunuvar';
	payment numeric(4,2) := 20.50;  --> numeric(presicion,scale)
	--parantez icindeki 4 sayinin 4 karakter olmasi gerektigini 2 ise virgulden sonraki karakter sayisini verir
begin
   -- raise notice 'Isim: %  Soyisim: %', first_name, last_name;  --raise ortaya cikar demek (Javadaki print gibi) ve outputun aciklamasini verir
	                                                            -- % yer tutucu, reference
    -- Mehmet Fatih 20.5 USD odeme aldi.
	raise notice 'Counter: % Isim: % Soyisim: % Odeme: %', counter, first_name, last_name, payment;
	
end $$;	
	
	
/*
	Task 1 : değişkenler oluşturarak ekrana " Ahmet ve Mehmet beyler 120 tl ye bilet aldılar. "
	cümlesini ekrana yazdırınız.
*/	

-- bir deger dondureceksek do yazmamamiz gerekiyor

do $$
declare
	first_person varchar(50) := 'Ahmet';
	second_person varchar(50) := 'Mehmet';
	payment numeric(3) := 120;
begin
	raise notice '% ve % beyler % TL ye bilet aldılar.',
	first_person,
	second_person,
	payment;
end $$;
	
	
-- **************** BEKLETME KOMUTU *****************

do $$
declare
    created_at time := now();  -- time -> data type, now() -> olusturuldugu zaman
begin
    raise notice '%', created_at;
	perform pg_sleep(5); --> 5 sn bekle1!
	raise notice '%', created_at;
end $$;	
	
	
-- ************** TABLODAN DATA TIPINI KOPYALAMA **************************

do $$
declare 
    f_title film.title%type; -- text
	
	filmsuresi film.length%type;
	
begin
   -- 1 ID'li filmin ismini getirelim
   select title 
   from film 
   into f_title  -- Uncharted
   where id=1;
	
	raise notice '%', f_title;
	
	select length 
	from film
	into filmsuresi
	where id=1;
	
	raise notice '%', filmsuresi;
	
end $$;	
	
	
	
	
	
	
	
	
	