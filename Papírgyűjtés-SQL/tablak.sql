CREATE TABLE tanulok (
  tazon int,
  nev varchar(17) NOT NULL,
  osztaly varchar(2) NOT NULL,
  CONSTRAINT pk_tanulok PRIMARY KEY (tazon)
);

CREATE TABLE leadasok (
  sorsz int,
  tanulo int  NOT NULL,
  idopont date  NOT NULL,
  mennyiseg int  NOT NULL,
  CONSTRAINT pk_leadasok PRIMARY KEY (sorsz),
  CONSTRAINT fk_leadastanulo FOREIGN KEY (tanulo) REFERENCES tanulok(tazon)
);
