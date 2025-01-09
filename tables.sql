-- Table: gablota
CREATE TABLE gablota (
    zawodnicy_id_zawodnika integer  NOT NULL,
    trofea_id_trofeum integer  NOT NULL,
    data date  NOT NULL,
    CONSTRAINT gablota_pk PRIMARY KEY (zawodnicy_id_zawodnika,trofea_id_trofeum)
) ;

-- Table: kibice
CREATE TABLE kibice (
    id_kibica integer  NOT NULL,
    status_karnetu varchar2(10)  NOT NULL,
    rodzaj_katnetu varchar2(15)  NOT NULL,
    CONSTRAINT kibice_pk PRIMARY KEY (id_kibica)
) ;

-- Table: kibicowanie
CREATE TABLE kibicowanie (
    mecze_id_meczu integer  NOT NULL,
    kibice_id_kibica integer  NOT NULL,
    CONSTRAINT kibicowanie_pk PRIMARY KEY (mecze_id_meczu,kibice_id_kibica)
) ;

-- Table: kierownik++
CREATE TABLE kierownik (
    id_kierownika integer  NOT NULL,
    imie varchar2(20)  NOT NULL,
    nazwisko varchar2(20)  NOT NULL,
    wiek integer  NOT NULL,
    CONSTRAINT kierownik_pk PRIMARY KEY (id_kierownika)
) ;

-- Table: mecze++
CREATE TABLE mecze (
    id_meczu integer  NOT NULL,
    data date  NOT NULL,
    stadion_id_stadionu integer  NOT NULL,
    przeciwnik varchar2(12)  NOT NULL,
    wynik varchar2(10)  NOT NULL,
    CONSTRAINT mecze_pk PRIMARY KEY (id_meczu)
) ;

-- Table: sponsorzy++
CREATE TABLE sponsorzy (
    id_sponsora integer  NOT NULL,
    nazwa varchar2(20)  NOT NULL,
    dlugosc_kontraktu varchar2(20)  NOT NULL,
    kierownik_id_kierownika integer  NOT NULL,
    data_podpisania date  NOT NULL,
    CONSTRAINT sponsorzy_pk PRIMARY KEY (id_sponsora)
) ;

-- Table: stadion++
CREATE TABLE stadion (
    id_stadionu integer  NOT NULL,
    nazwa varchar2(20)  NOT NULL,
    polozenie varchar2(15)  NOT NULL,
    pojemnosc integer  NOT NULL,
    CONSTRAINT stadion_pk PRIMARY KEY (id_stadionu)
) ;

-- Table: trener++
CREATE TABLE trener (
    id_trenera integer  NOT NULL,
    imie varchar2(20)  NOT NULL,
    nazwisko varchar2(20)  NOT NULL,
    narodowosc varchar2(20)  NOT NULL,
    od date  NOT NULL,
    do date  NULL,
    kierownik_id_kierownika integer  NOT NULL,
    CONSTRAINT trener_pk PRIMARY KEY (id_trenera)
) ;

-- Table: trofea++
CREATE TABLE trofea (
    id_trofeum integer  NOT NULL,
    typ_trofeum varchar2(20)  NOT NULL,
    nazwa varchar2(20)  NOT NULL,
    CONSTRAINT trofea_pk PRIMARY KEY (id_trofeum)
) ;

-- Table: tytuly
CREATE TABLE tytuly (
    data date  NOT NULL,
    trener_id_trenera integer  NOT NULL,
    trofea_id_trofeum integer  NOT NULL,
    CONSTRAINT tytuly_pk PRIMARY KEY (trener_id_trenera,trofea_id_trofeum)
) ;

-- Table: udzial
CREATE TABLE udzial (
    mecze_id_meczu integer  NOT NULL,
    zawodnicy_id_zawodnika integer  NOT NULL,
    CONSTRAINT udzial_pk PRIMARY KEY (mecze_id_meczu,zawodnicy_id_zawodnika)
) ;

-- Table: zawodnicy++
CREATE TABLE zawodnicy (
    imie varchar2(20)  NOT NULL,
    nazwisko varchar2(20)  NOT NULL,
    pozycja varchar2(20)  NOT NULL,
    narodowosc varchar2(20)  NOT NULL,
    liczba_goli integer  NOT NULL,
    id_zawodnika integer  NOT NULL,
    kierownik_id_kierownika integer  NOT NULL,
    wiek integer  NOT NULL,
    CONSTRAINT zawodnicy_pk PRIMARY KEY (id_zawodnika)
) ;

-- foreign keys
-- Reference: gablota_trofea (table: gablota)
ALTER TABLE gablota ADD CONSTRAINT gablota_trofea
    FOREIGN KEY (trofea_id_trofeum)
    REFERENCES trofea (id_trofeum);

-- Reference: gablota_zawodnicy (table: gablota)
ALTER TABLE gablota ADD CONSTRAINT gablota_zawodnicy
    FOREIGN KEY (zawodnicy_id_zawodnika)
    REFERENCES zawodnicy (id_zawodnika);

-- Reference: kibicowanie_kibice (table: kibicowanie)
ALTER TABLE kibicowanie ADD CONSTRAINT kibicowanie_kibice
    FOREIGN KEY (kibice_id_kibica)
    REFERENCES kibice (id_kibica);

-- Reference: kibicowanie_mecze (table: kibicowanie)
ALTER TABLE kibicowanie ADD CONSTRAINT kibicowanie_mecze
    FOREIGN KEY (mecze_id_meczu)
    REFERENCES mecze (id_meczu);

-- Reference: mecze_stadion (table: mecze)
ALTER TABLE mecze ADD CONSTRAINT mecze_stadion
    FOREIGN KEY (stadion_id_stadionu)
    REFERENCES stadion (id_stadionu);

-- Reference: sponsorzy_kierownik (table: sponsorzy)
ALTER TABLE sponsorzy ADD CONSTRAINT sponsorzy_kierownik
    FOREIGN KEY (kierownik_id_kierownika)
    REFERENCES kierownik (id_kierownika);

-- Reference: trener_kierownik (table: trener)
ALTER TABLE trener ADD CONSTRAINT trener_kierownik
    FOREIGN KEY (kierownik_id_kierownika)
    REFERENCES kierownik (id_kierownika);

-- Reference: tytuly_trener (table: tytuly)
ALTER TABLE tytuly ADD CONSTRAINT tytuly_trener
    FOREIGN KEY (trener_id_trenera)
    REFERENCES trener (id_trenera);

-- Reference: tytuly_trofea (table: tytuly)
ALTER TABLE tytuly ADD CONSTRAINT tytuly_trofea
    FOREIGN KEY (trofea_id_trofeum)
    REFERENCES trofea (id_trofeum);

-- Reference: udzial_mecze (table: udzial)
ALTER TABLE udzial ADD CONSTRAINT udzial_mecze
    FOREIGN KEY (mecze_id_meczu)
    REFERENCES mecze (id_meczu);

-- Reference: udzial_zawodnicy (table: udzial)
ALTER TABLE udzial ADD CONSTRAINT udzial_zawodnicy
    FOREIGN KEY (zawodnicy_id_zawodnika)
    REFERENCES zawodnicy (id_zawodnika);

-- Reference: zawodnicy_kierownik (table: zawodnicy)
ALTER TABLE zawodnicy ADD CONSTRAINT zawodnicy_kierownik
    FOREIGN KEY (kierownik_id_kierownika)
    REFERENCES kierownik (id_kierownika);