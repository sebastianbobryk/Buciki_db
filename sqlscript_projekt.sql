#Usuwanie poprzednich wersji
drop trigger if exists buciki.zmniejszacz;
drop table if exists buciki.zamowienia;
drop table if exists buciki.buty;
drop table if exists buciki.klienci;
drop database if exists buciki;


#Tworzenie bazy danych
create database Buciki; 
use Buciki;

#Tworzenie tabeli buty - magazynu
create table buty (
id_butow int primary key auto_increment,
producent text,
model text,
rozmiar int,
liczba_par int,
cena float
);

#Przykłady asortymentu
insert into buty(producent, model, rozmiar, liczba_par, cena) values("Mrugala", "Kidsone", 27, 2, 109.9);
insert into buty(producent, model, rozmiar, liczba_par, cena) values("Emel", "Kids2", 23, 4, 159.9);
insert into buty(producent, model, rozmiar, liczba_par, cena) values("Emel", "Kids2", 25, 3, 159.9);
insert into buty(producent, model, rozmiar, liczba_par, cena) values("Emel", "Kids2", 24, 5, 159.9);
insert into buty(producent, model, rozmiar, liczba_par, cena) values("Mrugala", "Kidsone", 30, 5, 109.9);
insert into buty(producent, model, rozmiar, liczba_par, cena) values("Mrugala", "Kidsone", 25, 3, 109.9);
insert into buty(producent, model, rozmiar, liczba_par, cena) values("Ipanema", "Japonki", 29, 8, 59.90);
insert into buty(producent, model, rozmiar, liczba_par, cena) values("Ipanema", "Japonki", 31, 6, 59.90);
insert into buty(producent, model, rozmiar, liczba_par, cena) values("Ipanema", "Japonki", 27, 3, 59.90);
insert into buty(producent, model, rozmiar, liczba_par, cena) values("Gaspar", "Gasp", 26, 2, 189.90);
insert into buty(producent, model, rozmiar, liczba_par, cena) values("Gaspar", "Gasp", 29, 6, 189.90);
insert into buty(producent, model, rozmiar, liczba_par, cena) values("Gaspar", "Gasp", 30, 1, 189.90);

#Tworzenie tabeli klienci
create table klienci (
id_klienta int primary key auto_increment,
imie text,
nazwisko text,
miejscowosc text,
adres text,
e_mail text
);
#Przykłady klientów
insert into klienci(imie, nazwisko, miejscowosc, adres, e_mail) values("Sebastian", "Bobryk", "Lublin","ul.Szczytowa 26/23", "sebaso86@o2.pl");
insert into klienci(imie, nazwisko, miejscowosc, adres, e_mail) values("Kinga", "Kocmierowska", "Warszawa", "ul.Orzycka 8/37", "kingakocmierowska@wp.pl");
insert into klienci(imie, nazwisko, miejscowosc, adres, e_mail) values("Katarzyna", "Mierzwa", "Lublin","ul.Rozana 2/34", "kasia88@onet.pl");
insert into klienci(imie, nazwisko, miejscowosc, adres, e_mail) values("Ewa", "Pietras", "Motycz","ul.Jeziorna", "e.pietras@gmail.com");
insert into klienci(imie, nazwisko, miejscowosc, adres, e_mail) values("Sylwia", "Barnowska", "Szczytno","ul.Jeziorna 23", "sylwia7@o2.pl");
insert into klienci(imie, nazwisko, miejscowosc, adres, e_mail) values("Kamil", "Krason", "Warszawa","ul.Wita Stwosza 89/112", "kkras@wp.pl");

#Tworzenie tabeli z zamówieniami
create table zamowienia (
id_zamowienia int primary key auto_increment,
id_klienta int,
id_butow int,
data_zl_zam date,
status_zam varchar(20) default "oczekujace",
data_realizacji date, 
foreign key(id_klienta) references klienci(id_klienta),
foreign key(id_butow) references buty(id_butow)
);

#Przykłady zamówień
insert into zamowienia(id_klienta, id_butow, data_zl_zam, data_realizacji) values (1, 2, "2017-11-12", "2017-11-14");
insert into zamowienia(id_klienta, id_butow, data_zl_zam, data_realizacji) values (2, 2, "2017-11-14", "2017-11-15");
insert into zamowienia(id_klienta, id_butow, data_zl_zam, data_realizacji) values (3, 1, "2017-11-19", "2017-11-21");
insert into zamowienia(id_klienta, id_butow, data_zl_zam, data_realizacji) values (6, 2, "2017-11-17", "2017-11-19");
insert into zamowienia(id_klienta, id_butow, data_zl_zam, data_realizacji) values (5, 10, "2017-11-16", "2017-11-18");
insert into zamowienia(id_klienta, id_butow, data_zl_zam, data_realizacji) values (1, 10, "2017-11-20", "2017-11-21");
insert into zamowienia(id_klienta, id_butow, data_zl_zam, data_realizacji) values (4, 6, "2017-11-13", "2017-11-15");
insert into zamowienia(id_klienta, id_butow, data_zl_zam, data_realizacji) values (3, 9, "2017-11-20", "2017-11-21");
insert into zamowienia(id_klienta, id_butow, data_zl_zam, data_realizacji) values (6, 7, "2017-11-20", "2017-11-21");
insert into zamowienia(id_klienta, id_butow, data_zl_zam, data_realizacji) values (6, 9, "2017-11-22", "2017-11-23"); 
insert into zamowienia(id_klienta, id_butow, data_zl_zam, data_realizacji) values (2, 12, "2017-11-14", "2017-11-15");

#Tworzenie tabeli z loginami i hasłami
create table logpass (id smallint primary key auto_increment, login varchar(30), pass varchar(30), uprawnienia bit default 0);
#przykłady uzytkowników
insert into logpass(login, pass) values ("sebaso", "1224");
insert into logpass(login, pass) values ("ewp", "5324");
insert into logpass(login, pass) values ("kasia88", "1111");
insert into logpass(login, pass) values ("kinia", "2208");
insert into logpass(login, pass, uprawnienia) values ("admin", "9225", 1); 

#triger
create trigger zmniejszacz after update on zamowienia for each row update buty set liczba_par=liczba_par-1 where buty.id_butow = old.id_butow and old.status_zam = "oczekujace" and new.status_zam = "zrealizowano";
#update zamownienia
update zamowienia set status_zam = "zrealizowano" where id_zamowienia = 1;
update zamowienia set status_zam = "zrealizowano" where id_zamowienia = 2;
update zamowienia set status_zam = "zrealizowano" where id_zamowienia = 3;
update zamowienia set status_zam = "zrealizowano" where id_zamowienia = 6;
update zamowienia set data_realizacji = "2017-11-23" where id_zamowienia = 1;
select * from klienci;
select * from buty;
select * from zamowienia;
select * from logpass;

#zapytanie wyszukujące imie, nazwisko kl wraz z liczba zamowien
select k.imie, k.nazwisko, count(*) as Ile_zam from klienci as k join zamowienia as z on z.id_klienta = k.id_klienta group by k.id_klienta;
#zapytanie wyszukujące imie, nazwisko wraz wypisaniem producenta i modelu zakupionych butow
select k.imie, k.nazwisko, b.producent, b.model from klienci as k join buty as b join zamowienia as z on z.id_klienta = k.id_klienta and b.id_butow = z.id_butow;
#zapytanie wyszukujące imie, nazwisko oraz producenta z wyborem danej miejscowosci
select k.imie, k.nazwisko,k.miejscowosc, b.producent from klienci as k join buty as b join zamowienia as z on z.id_klienta = k.id_klienta and b.id_butow = z.id_butow where miejscowosc="Lublin" or miejscowosc="Warszawa";
#zapytanie imie, nazwisko, jesli cena jest >100
select k.imie, k.nazwisko, k.miejscowosc from klienci as k join buty as b join zamowienia as z on z.id_klienta = k.id_klienta and b.id_butow = z.id_butow where cena > "100";
#zapytanie imie, nazwisko, jesli cena jest >100 i został okreslony producent
select k.imie, k.nazwisko, k.miejscowosc from klienci as k join buty as b join zamowienia as z on z.id_klienta = k.id_klienta and b.id_butow = z.id_butow where cena > "100" and producent = "Mrugala";
#zapytanie wyszukujące producenta i model jesl klient jest z określonej miejscowosci  i cena jest > 50
select b.producent, b.model from buty as b join klienci as k join zamowienia as z on z.id_butow = b.id_butow and z.id_klienta = k.id_klienta where miejscowosc = "Warszawa" and cena > "50";