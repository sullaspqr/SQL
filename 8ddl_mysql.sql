create table if not exists osztaly (
	osztalykod int(4),
        osztalynev varchar(32),
        vezAdoszam int(4),
        primary key (osztalykod)
);

create table if not exists dolgozo (
	adoszam int(4),
        nev varchar(32),
        lakcim varchar(32),
        fizetes int(6),
        osztalykod int(4),
        primary key (adoszam),
        foreign key (osztalykod) references osztaly(osztalykod)
);

alter table osztaly add constraint
foreign key (vezAdoszam) references dolgozo(adoszam);

insert into osztaly (osztalykod, osztalynev) values (16, 'hullg.');

insert into dolgozo values (1111, 'Kovács Mária', 'Szeged, Egy u. 2.', 120000, 16);

update osztaly set vezAdoszam = 1111 where osztalykod=16;

update dolgozo set fizetes = fizetes*1.2 where osztalykod between 10 and 20;


