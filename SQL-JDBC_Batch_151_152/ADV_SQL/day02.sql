-- GUN: 2

-- ************** ROW TYPE *******************

-- id'si 1 olan actorun tum bilgilerini alalim
do $$
declare
	selected_actor actor%rowtype;  -- Rowtype: Seçili row'un tüm bilgilerini depolayabilmek için kullanılır.
begin
	select *
	from actor
	into selected_actor
	where id=1;
	
	raise notice '% %', selected_actor.first_name, selected_actor.last_name;
end $$;	


-- ******************** RECORD TYPE ********************

--Film tablosundan id'si 2 olan datanin yalnizca id,title ve type bilgisini al
do $$
declare
	rec record;
begin
	select id,title,type
	from film
	into rec
	where id=2;
	
	raise notice 'ID: % Film Ismi: % Tur: %', rec.id, rec.title, rec.type;
end $$;	


-- *************** IC ICE BLOK YAPILARI ******************

do $$
<<tepeblok>>
declare -- Tepedeki blok, outer block olarak geçiyor.
	counter integer := 0;
begin
	counter := counter+1; -- counter: 1
	raise notice 'Tepe Blok, Counter Değeri: %', counter;
	declare -- Inner Block başlangıcı
		counter integer :=0;
	begin
		counter := counter+10; -- counter: 10
		raise notice 'İç, Counter Değeri: %', counter;
		
		raise notice 'Dış Bloktaki Counter Değeri: %', tepeblok.counter;
	
	end; -- Inner Block sonu
	
	raise notice 'Tepe Blok, Counter Değeri: %', counter;
	
	
end $$; -- Outer Block sonu.


-- ************ CONSTANT DEGERLER *****************

-- KDV degerini sabit deger yap
do $$
declare
	-- selling_price := net_price * 0.1;
	kdv constant numeric := 0.1; -- constant deger, sabit deger. Begin icerisinde tekrar degistirilemez.
	--net_price numeric := 20.5;
begin	
	raise notice 'KDV: %', kdv;
	
	--kdv := 10;
	
end $$;	


-- CONSTANT 'larin degismediginin kanit ornegi

do $$
declare
	olusturulma constant integer := 17;
begin
	raise notice 'Olusturulma zamanı: %', olusturulma;
	
	--olusturulma := 18;
	
	raise notice 'Yeni Olusturulma zamanı: %', olusturulma;
	
end $$;


--  //////////////// CONTROL YAPILARI  ////////////////
-- ************ If Statement ************

--syntax

/*
   IF condition THEN -- eger ... ise/o halde -> islemleri yap.
      Islemler
   END IF;	  
*/

-- Task: 1 id'li filmi bulmaya calis, bulunursa "Bulundu" yazisini print et.
-- id'yi bir variable ile alin.
-- Bulunursa: found
-- Bulunmzsa: not found

-- If - found 
do $$
declare
	selected_film film%rowtype; -- Film objesi kullanilacak
	input_film_id film.id%type := 1; -- Kullanicinin girdigi id numarasi
begin
	select * from film
	into selected_film
	where id=input_film_id;
	
	-- Buldugumuz filmin title'ini getir
	--raise notice '%', selected_film.title;
	
	if found then
		raise notice 'Bulundu: %', selected_film.title;	
	end if;	
	
end $$;	

-- If - not found
do $$
declare
	selected_film film%rowtype; -- Film objesi kullanılacak
	input_film_id film.id%type := 10; -- Kullanıcının girdiği id numarası
begin
	
	SELECT * FROM film
	INTO selected_film
	WHERE id=input_film_id;
 	
	-- Bulduğumuz filmin title'ını getir
	--raise notice '%', selected_film.title;
	
	if not found then
		raise notice 'Bulunamadı! ----> %', input_film_id;
	end if;
end $$;



-- **************** IF ELSE *********************

/*
   IF condition THEN 
       islemler;
   ELSE 
       alternatif islemler;
   END IF;	   
*/

-- Task: 1 id'li film bulunabilirse, title bilgisini yazdir, yoksa BULUNAMADI yazdir.

do $$
declare
	selected_film film%rowtype; -- Film objesi kullanılacak
	input_film_id film.id%type := 10; -- Kullanıcının girdiği id numarası
begin
	
	SELECT * FROM film
	INTO selected_film
	WHERE id=input_film_id;
 	
	-- Bulduğumuz filmin title'ını getir
	--raise notice '%', selected_film.title;
	
	if found then
		raise notice 'Bulundu: %', selected_film.title;
	else
		raise notice 'Bulunamadı: %', input_film_id;
	end if;
end $$;


-- **************** IF - ELSE IF - ELSE ***************

-- syntax:
/*
	IF condition THEN
		işlemler;
	ELSEIF condition_2 THEN
		işlemler;
	ELSEIF condition_3 THEN
		işlemler;
	ELSE
		işlemler;
	END IF;
*/
/*
	Task: 1 ID'li film bulunursa:
	Süresi 50 dakikanın altında ise "Kısa",
	50 ile 120 arasında ise "Ortalama",
	120 dakikadan fazla ise "Uzun"
	print edelim.
*/

do $$
declare
	oFilm film%rowtype;
	lenDescription varchar(50);
	film_id film.id%type := 1;
begin
	SELECT * FROM film
	INTO oFilm
	WHERE id=film_id;
	
	if not found then
		raise notice 'Film bulunamadı!';
	else
		if oFilm.length>0 and oFilm.length<50 then
			lenDescription := 'Kısa';
		elseif oFilm.length>50 and oFilm.length<120 then
			lenDescription := 'Ortalama';
		elseif oFilm.length>120 then
			lenDescription := 'Uzun';
		else
			lenDescription := 'Tanımlanamıyor.';
		end if;
		
		raise notice '% filminin uzunlugu: %', oFilm.title, lenDescription;
		
	end if;
	
end $$;

























 yazisini

