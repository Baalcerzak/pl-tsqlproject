INSERT INTO ZAWODNICY VALUES ('Lionel', 'Messi', 'Napastnik', 'Argentyna', 613, 1, 1, 32);
INSERT INTO ZAWODNICY VALUES ('Cristiano', 'Ronaldo', 'Napastnik', 'Portugalia', 602, 2, 1, 35);
INSERT INTO ZAWODNICY VALUES ('Robert', 'Lewandowski', 'Napastnik', 'Polska', 488, 3, 1, 33);
INSERT INTO ZAWODNICY VALUES ('Sergio', 'Ramos', 'Obronca', 'Hiszpania', 76, 4, 1, 34);
INSERT INTO ZAWODNICY VALUES ('Toni', 'Kroos', 'Pomocnik', 'Niemcy', 72, 5, 1, 32);
INSERT INTO ZAWODNICY VALUES ('Marcelo', 'Vieira', 'Obronca', 'Brazylia', 40, 6, 1, 33);
INSERT INTO zawodnicy VALUES ('Neymar', 'Junior', 'Skrzydłowy', 'Brazylia', 541, 7, 1, 28);
INSERT INTO zawodnicy VALUES ('Kylian', 'Mbappé', 'Napastnik', 'Francja', 263, 8, 1, 21);

INSERT INTO trofea (id_trofeum, typ_trofeum, nazwa) VALUES (1, 'Liga', 'Liga Mistrzów');
INSERT INTO trofea (id_trofeum, typ_trofeum, nazwa) VALUES (2, 'Liga', 'Liga Europy');
INSERT INTO trofea (id_trofeum, typ_trofeum, nazwa) VALUES (3, 'Krajowy', 'Puchar Polski');
INSERT INTO trofea (id_trofeum, typ_trofeum, nazwa) VALUES (4, 'Krajowy', 'Superpuchar Polski');
INSERT INTO trofea (id_trofeum, typ_trofeum, nazwa) VALUES (5, 'Kontynentalny', 'Puchar UEFA');


INSERT INTO Trener VALUES (1, 'Jose', 'Mourinho', 'Portugalia','2001-07-01','2008-12-01', 1);
INSERT INTO Trener VALUES (2, 'Jurgen', 'Klopp', 'Niemcy', '2008-12-01','2018-12-01', 1);

INSERT INTO stadion VALUES (1, 'Stadion Narodowy', 'Warszawa', 58143);
INSERT INTO stadion VALUES (2, 'Stadion Miejski', 'Poznań', 43115);
INSERT INTO stadion VALUES (3, 'Stadion Wrocław', 'Wrocław', 41028);
INSERT INTO stadion VALUES (4, 'Stadion Narodowy', 'Warszawa', 55867);
INSERT INTO stadion VALUES (5, 'Stadion Miejski', 'Gdańsk', 43152);

INSERT INTO sponsorzy (id_sponsora, nazwa, dlugosc_kontraktu, kierownik_id_kierownika, data_podpisania)
VALUES (1, 'Adidas', '3 lata', 1, '2020-05-06');
INSERT INTO sponsorzy (id_sponsora, nazwa, dlugosc_kontraktu, kierownik_id_kierownika, data_podpisania)
VALUES (2, 'Nike', '5 lat', 1, '2020-05-07');
INSERT INTO sponsorzy (id_sponsora, nazwa, dlugosc_kontraktu, kierownik_id_kierownika, data_podpisania)
VALUES (3, 'Puma', '1 rok', 1, '2020-05-08');

INSERT INTO mecze VALUES (1, '2020-06-12', 1, 'Legia', '3:2');
INSERT INTO mecze VALUES (2, '2020-06-15', 1, 'Lech', '2:1');
INSERT INTO mecze VALUES (3, '2020-06-17', 1, 'Śląsk', '1:0');
INSERT INTO mecze VALUES (4, '2020-06-21', 1, 'Cracovia', '2:2');
INSERT INTO mecze VALUES (5, '2020-06-25', 1, 'Górnik', '3:1');

INSERT INTO KIEROWNIK VALUES (1, 'Tomasz', 'Kowalski', 50);

INSERT INTO kibice VALUES (1, 'aktywny', 'sezonowy');
INSERT INTO kibice VALUES (2, 'nieaktywny', 'sezonowy');
INSERT INTO kibice VALUES (3, 'aktywny', 'meczowy');
INSERT INTO kibice VALUES (4, 'nieaktywny', 'meczowy');
INSERT INTO kibice VALUES (5, 'aktywny', 'jednorazowy');
INSERT INTO kibice VALUES (6, 'nieaktywny', 'jednorazowy');