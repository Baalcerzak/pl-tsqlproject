--trigger1 tsql
Napisz wyzwalacz który nie pozwoli zmienić pojemności stadionu


CREATE TRIGGER TT3
    ON stadion
    FOR UPDATE
    AS
BEGIN
    IF UPDATE(pojemnosc)
        BEGIN
            ROLLBACK
            RAISERROR('Nie mozna zmienic pojemnosci stadionu',1,2)
        end
end

UPDATE Stadion
SET Pojemnosc = 5000
WHERE id_stadionu = 1;

--trigger2 tsql
Napisz wyzwalacz który nie pozwoli usunąć zawodnika który ma mniej niz 30 lat.


CREATE TRIGGER TT2
    ON zawodnicy
    FOR DELETE
    AS
BEGIN
    IF EXISTS(SELECT wiek from deleted where wiek<30)
    BEGIN
        RAISERROR('Nie mozesz usunac zawodnika ponizej 30 roku zycia',1,2)
        ROLLBACK
    end
end;

DELETE from zawodnicy where wiek < 30;

--procedure1 tsql
Napisz procedure służącą do wstawiania kierowników. Procedura będzie posiadać parametry id, imie, nazwisko, wiek. Należy sprawdzic czy dany kierownik istnieje jeżeli tak to nie wstawiamy nowego rekordu.

CREATE PROCEDURE TPP1
    @idk INT,
    @imiek VARCHAR(20),
    @nazk VARCHAR(20),
    @wiekk INT
AS BEGIN
    IF NOT EXISTS (SELECT 'X' FROM kierownik WHERE imie = @imiek or nazwisko = @nazk or wiek=@wiekk)
        INSERT INTO kierownik (id_kierownika, imie, nazwisko, wiek)
        VALUES (@idk, @imiek,@nazk,@wiekk)
    ELSE
        PRINT 'Taki kierownik juz istnieje'
end

exec TPP1 @idk = 2, @imiek = 'Tomasz', @nazk = 'Kowalski', @wiekk = 50;

--procedure2 tsql
Napisz procedure umożliwiającą modyfikowanie liczby goli zawodników tak aby zawodnicy posiadjące minimalna(parametr procedury) ilość bramek mieli zwiększone je podwójnie

CREATE PROCEDURE TPP2
    @min INT
AS BEGIN
    DECLARE K CURSOR FOR SELECT id_zawodnika, nazwisko, liczba_goli from zawodnicy
    DECLARE @id int, @naz varchar(20), @gole int
    OPEN K
    FETCH NEXT FROM K INTO @id, @naz, @gole
    WHILE @@FETCH_STATUS = 0
    BEGIN
        IF @gole < @min BEGIN
            SET @gole = @gole *2
            UPDATE zawodnicy SET liczba_goli = @gole WHERE id_zawodnika=@id
            PRINT 'Zwiekszono ilosc bramek: '+@naz;
        end
        FETCH NEXT FROM K INTO @id, @naz, @gole
    end
    CLOSE K
    DEALLOCATE K
end

exec TPP2 @min = 100;

--trigger1 plsql
Napisz wyzwalacz który nie pozwoli:
-usuwać zawodników młodszych niż 30 lat
-zmieniać liczby bramek na liczbę mniejszą niż 0

CREATE OR REPLACE TRIGGER tp1
    BEFORE DELETE OR UPDATE ON ZAWODNICY
    FOR EACH ROW
BEGIN
    IF DELETING AND :OLD.WIEK<30 THEN
        RAISE_APPLICATION_ERROR(-20500, 'Nie mozna usunac zawodnika ktory ma mniej niz 30 lat');
    ELSIF UPDATING AND :NEW.LICZBA_GOLI<0 THEN
        RAISE_APPLICATION_ERROR(-20500, 'Nie mozna zmienic liczby goli na liczbe mniejsza niz 0');
    end if;
end;

DELETE ZAWODNICY WHERE WIEK < 30;
UPDATE ZAWODNICY SET LICZBA_GOLI = -1 WHERE ID_ZAWODNIKA = 1;


--trigger2 plsql
Napisz wyzwalacz który nie pozwoli:
-wstawić kierownika, który już istnieje

CREATE OR REPLACE TRIGGER tp2
    BEFORE INSERT ON KIEROWNIK
    FOR EACH ROW
DECLARE
    x INT;
BEGIN
    IF INSERTING THEN
        SELECT COUNT(*) INTO x FROM KIEROWNIK WHERE NAZWISKO = :NEW.NAZWISKO;
        IF x > 0 THEN
            RAISE_APPLICATION_ERROR(-20500, 'Istnieje już taki kierownik');
        end if;
    end if;
end;

Insert into KIEROWNIK values (2,'Tomasz', 'Kowalski', '50');

--procedure1 plsql
Napisz procedure która będzie przyjmowała nazwisko i liczbe bramek. Procedura powinna aktualizować liczbe bramek danego zawodnika.

CREATE OR REPLACE PROCEDURE pp1 (pnazwisko VARCHAR2, pliczba INT) AS
    istnieje int;
BEGIN
    SELECT COUNT(1) INTO istnieje
    FROM ZAWODNICY
    WHERE NAZWISKO = pnazwisko;
    IF istnieje > 0 THEN
        UPDATE ZAWODNICY SET LICZBA_GOLI=pliczba WHERE NAZWISKO = pnazwisko;
    end if;
end;

begin
    pp1(pnazwisko => 'Messi', pliczba => 1000);
end;

--procedure2 plsql
Napisz procedure służącą do dodawania kierowników do tabeli kierownik. Procedura będzie przyjmowałą jako parametry nr kierownika, imię, nazwisko i wiek. Należy sprawdzić czy kierownik o takim imieniu i nazwisku istnieje i jeżeli istnieje to nie wstawiamy nowego trenera.


CREATE OR REPLACE PROCEDURE pp2 (nr INTEGER, kimie VARCHAR2, knazwisko VARCHAR2, kwiek INTEGER) AS
    ile INTEGER;
BEGIN
    SELECT COUNT(*) INTO ile FROM KIEROWNIK WHERE imie = kimie OR NAZWISKO = knazwisko OR WIEK = kwiek;
    IF ile >= 1 THEN
        RAISE_APPLICATION_ERROR(-20500, 'Kierownik już istnieje');
    ELSE
        INSERT INTO KIEROWNIK(id_kierownika, imie, nazwisko, wiek)
        VALUES(nr, kimie, knazwisko, kwiek);
    end if;
end;

begin
    pp2(nr => 2, kimie => 'Tomasz', knazwisko => 'Kowalski', kwiek => 50);
end;
