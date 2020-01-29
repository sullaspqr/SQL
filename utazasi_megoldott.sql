/*
 * FELADAT: Egy utaz�si iroda nyilv�ntartja az �ltala hirdetett �tic�lokat,
 * �s az oda szervezett turnusokat, valamint az online fel�let�kre regisztr�lt
 * felhaszn�l�kat �s azok utaz�sait. Az adatb�zis megtal�lhat� az utazasdata.sql
 * f�jlban. �rjuk meg az al�bbi lek�rdez�seket ezen adatokra!
 */
 
 /*
  * 9.0 Hogyan adn�nk *ut�lag* hozz� a turnus t�bl�hoz,
  * hogy az utazas_id k�ls� kulcsk�nt hivatkozik az utazas
  * t�bla id attrib�tum�ra?
  */
  ALTER TABLE turnus ADD CONSTRAINT kulsk
  FOREIGN KEY (utazas_id) REFERENCES utazas(id);
 
 /*
  * 9.1 Orsz�gonk�nt h�ny v�rosba utazhatunk el?
  */
  SELECT orszag, COUNT(varos) 
  FROM utazas 
  GROUP BY orszag;
  
 /*
  * 9.2 Jelen�ts�k meg az els� t�z legt�volabbi �tic�lt.
  */
  SELECT orszag, varos
  FROM utazas
  ORDER BY tavolsag DESC
  LIMIT 0, 10;
 
 /*
  * 9.3 Mely �tic�lok olcs�bbak 120.000 Ft-n�l?
  */
  
  SELECT orszag, varos
  FROM utazas
  WHERE alapar < 120000;
 /*
  * 9.4 Adjuk meg, hogy egy felhaszn�l� az eddigiekben
  * h�ny utat rendelt meg.
  */
  
  SELECT felhasznalonev, nev, COUNT(turnus_id)
  FROM felhasznalo, utazik
  WHERE felhasznalo.id = utazik.felh_ID
  GROUP BY felhasznalonev, nev;
  
  /*
   * 9.5 Kik azok, akik t�bb �tra is elmentek?
   */
   
  SELECT felhasznalonev, nev, COUNT(turnus_id)
  FROM felhasznalo, utazik
  WHERE felhasznalo.id = utazik.felh_ID
  GROUP BY felhasznalonev, nev
  HAVING COUNT(turnus_id)>1;

  /*
   * 9.6 Adjuk meg, hogy melyik 3 felhaszn�l� k�lt�tte el
   * eddig a legt�bb p�nzt, �s mennyit.
   */
   
   SELECT felhasznalonev, SUM(alapar)
   FROM felhasznalo, turnus, utazik, utazas
   WHERE
   felhasznalo.id = utazik.felh_ID
   AND turnus.id = utazik.turnus_id
   AND turnus.utazas_id = utazas.id
   GROUP BY felhasznalonev
   ORDER BY SUM(alapar) DESC
   LIMIT 0, 3;
  
 /* 9.7 Mondjuk meg, melyik �tic�l(ok) a legn�pszer�bb(ek). 
  * Adjuk meg azt is, melyik
  * indul�si id�pontban indulnak a legt�bben oda. 
  */
  
  SELECT orszag, varos, indulasi_ido, foglalt 
  FROM turnus, utazas
  WHERE utazas.id = turnus.utazas_ID
  AND foglalt=(SELECT MAX(t.foglalt) FROM turnus AS t);
  
 /*
  * 9.8 Adjunk meg n�zett�bl�t, amin kereszt�l l�tjuk,
  * hogy az egyes utaz�sokra a k�l�nb�z� indul�si
  * id�pontokban �sszesen eddig mennyi p�nzt k�lt�ttek.
  * (Nem biztos, hogy minden �tb�l ind�tanak turnusokat.)
  */
  
  CREATE OR REPLACE VIEW koltekezes AS
  SELECT orszag, varos, SUM(alapar*foglalt)
  FROM utazas, turnus
  WHERE
  utazas.id = turnus.utazas_id
  GROUP BY orszag, varos;
 
 
 /*
  * 9.9 List�zzuk bet�rendben n�vekv� �s �r szerint
  * cs�kken� sorrendben az olyan utakat, amelyekb�l nem 
  * indulnak turnusok. 
  */
  
  SELECT orszag, varos
  FROM utazas
  WHERE id NOT IN (
	SELECT DISTINCT utazas_id
	FROM turnus
  )
  ORDER BY orszag ASC, varos ASC, alapar DESC;
  
  /*
   * 9.10 Melyik utaz�sokb�l fog 2014. augusztus�ban 
   * valah�ny turnus indulni, �s h�ny turnus fog bel�l�k
   * indulni ekkor?
   */
   
   SELECT orszag, varos, COUNT(turnus.id)
   FROM utazas, turnus
   WHERE
   utazas.id = turnus.utazas_id
   AND YEAR(indulasi_ido)=2014
   AND MONTH(indulasi_ido)=8
   GROUP BY orszag, varos;
 