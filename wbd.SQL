/*
Created: 2014-11-17
Modified: 2014-11-23
Model: Physical model
Database: Oracle 11g Release 2
*/


-- Create tables section -------------------------------------------------

-- Table salony_samochodowe

CREATE TABLE "salony_samochodowe"(
  "nr_salonu" Integer NOT NULL,
  "nazwa" Varchar2(25 ) NOT NULL,
  "adres_ulica" Varchar2(25 ) NOT NULL,
  "adres_miasto" Varchar2(25 ) NOT NULL,
  "adres_kod_pocztowy" Varchar2(6 ) NOT NULL,
  "wlasciciel_imie" Varchar2(15 ) NOT NULL,
  "wlasciciel_nazwisko" Varchar2(15 ) NOT NULL,
  "data_otwarcia" Date NOT NULL
)
/

-- Add keys for table salony_samochodowe

ALTER TABLE "salony_samochodowe" ADD CONSTRAINT "nr_salonuPK" PRIMARY KEY ("nr_salonu")
/

-- Table samochody

CREATE TABLE "samochody"(
  "nr_samochodu" Integer NOT NULL,
  "cena" Number(10,2) NOT NULL,
  "VIN" Number NOT NULL,
  "rocznik" Integer NOT NULL,
  "nr_salonu" Integer NOT NULL,
  "nr_promocji" Integer,
  "nr_modelu" Integer NOT NULL
)
/

-- Add keys for table samochody

ALTER TABLE "samochody" ADD CONSTRAINT "nr_sam_salonowego" PRIMARY KEY ("nr_samochodu")
/

-- Table pracownicy

CREATE TABLE "pracownicy"(
  "nr_pracownika" Integer NOT NULL,
  "imie" Varchar2(15 ) NOT NULL,
  "nazwisko" Varchar2(15 ) NOT NULL,
  "PESEL" Number NOT NULL,
  "data_urodzenia" Date NOT NULL,
  "adres_ulica" Varchar2(25 ) NOT NULL,
  "adres_miasto" Varchar2(25 ) NOT NULL,
  "adres_kod_pocztowy" Varchar2(6 ) NOT NULL,
  "data_zatrudnienia" Date NOT NULL,
  "nr_telefonu" Varchar2(14 ) NOT NULL,
  "email" Varchar2(30 ) NOT NULL,
  "nr_salonu" Integer NOT NULL,
  "nr_stanowiska" Integer NOT NULL
)
/

-- Add keys for table pracownicy

ALTER TABLE "pracownicy" ADD CONSTRAINT "nr_pracownikaPK" PRIMARY KEY ("nr_pracownika")
/

-- Table klienci

CREATE TABLE "klienci"(
  "nr_klienta" Integer NOT NULL,
  "imie" Varchar2(15 ) NOT NULL,
  "nazwisko" Varchar2(15 ) NOT NULL,
  "PESEL" Number NOT NULL,
  "data_urodzenia" Date NOT NULL,
  "adres_ulica" Varchar2(25 ) NOT NULL,
  "adres_miasto" Varchar2(25 ) NOT NULL,
  "adres_kod_pocztowy" Varchar2(6 ) NOT NULL,
  "plec" Varchar2(1 ),
  "nr_salonu" Integer NOT NULL
)
/

-- Add keys for table klienci

ALTER TABLE "klienci" ADD CONSTRAINT "nr_klientaPK" PRIMARY KEY ("nr_klienta")
/

-- Table uslugi

CREATE TABLE "uslugi"(
  "nr_uslugi" Integer NOT NULL,
  "nr_rejestracyjny" Varchar2(10 ) NOT NULL,
  "rocznik" Varchar2(4 ) NOT NULL,
  "data_przyjecia_pojazdu" Date NOT NULL,
  "data_wydania_pojazdu" Date,
  "opis_uslugi" Varchar2(15 ) NOT NULL,
  "raport_koncowy" Clob,
  "nr_klienta" Integer NOT NULL,
  "nr_faktury" Integer,
  "nr_modelu" Integer NOT NULL
)
/

-- Add keys for table uslugi

ALTER TABLE "uslugi" ADD CONSTRAINT "nr_uslug" PRIMARY KEY ("nr_uslugi")
/

-- Table wyposazenie

CREATE TABLE "wyposazenie"(
  "nr_wyposazenia" Integer NOT NULL,
  "nazwa" Varchar2(30 ) NOT NULL,
  "kategoria" Varchar2(20 ) NOT NULL,
  "opis" Clob
)
/

-- Add keys for table wyposazenie

ALTER TABLE "wyposazenie" ADD CONSTRAINT "nr_wyposazeniaPK" PRIMARY KEY ("nr_wyposazenia")
/

-- Table transakcje

CREATE TABLE "transakcje"(
  "nr_faktury" Integer NOT NULL,
  "kwota" Number(10,2) NOT NULL,
  "data_transakcji" Date NOT NULL,
  "sposob_platonsci" Varchar2(15 ) NOT NULL,
  "nr_klienta" Integer NOT NULL,
  "nr_pracownika" Integer NOT NULL
)
/

-- Add keys for table transakcje

ALTER TABLE "transakcje" ADD CONSTRAINT "nr_fakturyPK" PRIMARY KEY ("nr_faktury")
/

-- Table czas_pracy

CREATE TABLE "czas_pracy"(
  "nr_czasu_pracy" Integer NOT NULL,
  "start_pracy" Date NOT NULL,
  "koniec_pracy" Date NOT NULL,
  "nr_pracownika" Integer NOT NULL
)
/

-- Add keys for table czas_pracy

ALTER TABLE "czas_pracy" ADD CONSTRAINT "nr_czasu_pracy" PRIMARY KEY ("nr_czasu_pracy","nr_pracownika")
/

-- Table wyplaty

CREATE TABLE "wyplaty"(
  "nr_wyplaty" Integer NOT NULL,
  "data_realizacji" Date NOT NULL,
  "kwota" Number(10,2) NOT NULL,
  "nr_pracownika" Integer NOT NULL
)
/

-- Add keys for table wyplaty

ALTER TABLE "wyplaty" ADD CONSTRAINT "nr_wyplaty" PRIMARY KEY ("nr_wyplaty","nr_pracownika")
/

-- Table promocje

CREATE TABLE "promocje"(
  "nr_promocji" Integer NOT NULL,
  "nazwa" Varchar2(25 ),
  "opis" Varchar2(50 ) NOT NULL,
  "znizka" Float(2) NOT NULL,
  "data_rozpoczecia" Date NOT NULL,
  "data_zakonczenia" Date NOT NULL
)
/

-- Add keys for table promocje

ALTER TABLE "promocje" ADD CONSTRAINT "nr_promocjiPK" PRIMARY KEY ("nr_promocji")
/

-- Table raty_harmonogram

CREATE TABLE "raty_harmonogram"(
  "nr_harmonogramu_rat" Integer NOT NULL,
  "data_rozpoczecia" Date NOT NULL,
  "data_ukonczenia" Date NOT NULL,
  "oprocentowanie" Float(2) NOT NULL,
  "nr_faktury" Integer NOT NULL
)
/

-- Add keys for table raty_harmonogram

ALTER TABLE "raty_harmonogram" ADD CONSTRAINT "nr_rat" PRIMARY KEY ("nr_harmonogramu_rat")
/

-- Table czesci

CREATE TABLE "czesci"(
  "nr_czesci" Integer NOT NULL,
  "cena" Number(10,2) NOT NULL,
  "nazwa" Varchar2(20 ) NOT NULL,
  "marka" Varchar2(20 ) NOT NULL,
  "kategoria" Varchar2(20 ) NOT NULL,
  "kod" Varchar2(15 ) NOT NULL,
  "ilosc_na_stanie" Integer
)
/

-- Add keys for table czesci

ALTER TABLE "czesci" ADD CONSTRAINT "nr_czesci" PRIMARY KEY ("nr_czesci")
/

-- Table stanowiska

CREATE TABLE "stanowiska"(
  "nr_stanowiska" Integer NOT NULL,
  "nazwa" Varchar2(20 ) NOT NULL,
  "wynagrodzenie" Number(10,2) NOT NULL
)
/

-- Add keys for table stanowiska

ALTER TABLE "stanowiska" ADD CONSTRAINT "nr_stanowiska" PRIMARY KEY ("nr_stanowiska")
/

-- Table raty_ewidencja

CREATE TABLE "raty_ewidencja"(
  "nr_raty" Integer NOT NULL,
  "data_wplaty" Date NOT NULL,
  "kwota" Number(10,2) NOT NULL,
  "nr_harmonogramu_rat" Integer NOT NULL
)
/

-- Add keys for table raty_ewidencja

ALTER TABLE "raty_ewidencja" ADD CONSTRAINT "nr_raty" PRIMARY KEY ("nr_raty","nr_harmonogramu_rat")
/

-- Table modele samochodow

CREATE TABLE "modele samochodow"(
  "nr_modelu" Integer NOT NULL,
  "marka" Varchar2(15 ) NOT NULL,
  "model" Varchar2(15 ) NOT NULL,
  "masa" Float(2),
  "ilosc_drzwi" Integer,
  "ilosc miejsc" Integer
)
/

-- Add keys for table modele samochodow

ALTER TABLE "modele samochodow" ADD CONSTRAINT "nr_modelu" PRIMARY KEY ("nr_modelu")
/

-- Table samochody_wyposazenie

CREATE TABLE "samochody_wyposazenie"(
  "nr_samochodu" Integer NOT NULL,
  "nr_wyposazenia" Integer NOT NULL
)
/

-- Table transakcje_czesci

CREATE TABLE "transakcje_czesci"(
  "nr_faktury" Integer NOT NULL,
  "nr_czesci" Integer NOT NULL,
  "ilosc" Integer NOT NULL
)
/

-- Table uslugi_czesci

CREATE TABLE "uslugi_czesci"(
  "nr_uslugi" Integer NOT NULL,
  "nr_czesci" Integer NOT NULL,
  "ilosc" Integer NOT NULL
)
/

-- Table transakcje_samochody

CREATE TABLE "transakcje_samochody"(
  "nr_faktury" Integer NOT NULL,
  "nr_samochodu" Integer NOT NULL
)
/

-- Create relationships section ------------------------------------------------- 

ALTER TABLE "pracownicy" ADD CONSTRAINT "zatrudnia" FOREIGN KEY ("nr_salonu") REFERENCES "salony_samochodowe" ("nr_salonu")
/

ALTER TABLE "transakcje" ADD CONSTRAINT "klienci dokonuja" FOREIGN KEY ("nr_klienta") REFERENCES "klienci" ("nr_klienta")
/

ALTER TABLE "klienci" ADD CONSTRAINT "salon_przyjmuje" FOREIGN KEY ("nr_salonu") REFERENCES "salony_samochodowe" ("nr_salonu")
/

ALTER TABLE "czas_pracy" ADD CONSTRAINT "przepracowal" FOREIGN KEY ("nr_pracownika") REFERENCES "pracownicy" ("nr_pracownika")
/

ALTER TABLE "wyplaty" ADD CONSTRAINT "otrzymal_wyplate" FOREIGN KEY ("nr_pracownika") REFERENCES "pracownicy" ("nr_pracownika")
/

ALTER TABLE "transakcje" ADD CONSTRAINT "zawiera_transakcje" FOREIGN KEY ("nr_pracownika") REFERENCES "pracownicy" ("nr_pracownika")
/

ALTER TABLE "raty_harmonogram" ADD CONSTRAINT "platnosc_ratalna" FOREIGN KEY ("nr_faktury") REFERENCES "transakcje" ("nr_faktury")
/

ALTER TABLE "samochody" ADD CONSTRAINT "sprzedaje" FOREIGN KEY ("nr_salonu") REFERENCES "salony_samochodowe" ("nr_salonu")
/

ALTER TABLE "uslugi" ADD CONSTRAINT "zostawia" FOREIGN KEY ("nr_klienta") REFERENCES "klienci" ("nr_klienta")
/

ALTER TABLE "uslugi" ADD CONSTRAINT "obejmuje_usluge" FOREIGN KEY ("nr_faktury") REFERENCES "transakcje" ("nr_faktury")
/

ALTER TABLE "samochody" ADD CONSTRAINT "obejmuje_samochody" FOREIGN KEY ("nr_promocji") REFERENCES "promocje" ("nr_promocji")
/

ALTER TABLE "pracownicy" ADD CONSTRAINT "jest_na_stanowisku" FOREIGN KEY ("nr_stanowiska") REFERENCES "stanowiska" ("nr_stanowiska")
/

ALTER TABLE "raty_ewidencja" ADD CONSTRAINT "sa_splacane" FOREIGN KEY ("nr_harmonogramu_rat") REFERENCES "raty_harmonogram" ("nr_harmonogramu_rat")
/

ALTER TABLE "samochody" ADD CONSTRAINT "model" FOREIGN KEY ("nr_modelu") REFERENCES "modele samochodow" ("nr_modelu")
/

ALTER TABLE "uslugi" ADD CONSTRAINT "odnosi_sie_do" FOREIGN KEY ("nr_modelu") REFERENCES "modele samochodow" ("nr_modelu")
/



