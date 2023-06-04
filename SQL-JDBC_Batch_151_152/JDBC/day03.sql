CREATE OR REPLACE FUNCTION selamlama(x TEXT) RETURNS TEXT
AS
$$  -- Baslangic ve bitisi belirtmek icin
BEGIN

RETURN 'Merhaba '|| x ||', nasilsin?';
--RETURN 'Merhaba '|| x ||', nasilsin?' || ' Saat kac?';

END;
$$
LANGUAGE plpgsql;   --Procedual language postgre sql


SELECT selamlama('Ayse');


--2. Örnek: İki sayıyı toplayan bir function yazınız ve Callable Statement ile çağırınız.
CREATE OR REPLACE FUNCTION toplama(x INT, y INT) RETURNS NUMERIC 
AS
$$
BEGIN

RETURN x + y;

END;
$$
LANGUAGE plpgsql;

SELECT toplama(1,2);













