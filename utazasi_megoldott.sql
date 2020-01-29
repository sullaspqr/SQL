/*
 * FELADAT: Egy utazási iroda nyilvántartja az általa hirdetett úticélokat,
 * és az oda szervezett turnusokat, valamint az online felületükre regisztrált
 * felhasználókat és azok utazásait. Az adatbázis megtalálható az utazasdata.sql
 * fájlban. Írjuk meg az alábbi lekérdezéseket ezen adatokra!
 */
 
 /*
  * 9.0 Hogyan adnánk *utólag* hozzá a turnus táblához,
  * hogy az utazas_id külsõ kulcsként hivatkozik az utazas
  * tábla id attribútumára?
  */
  ALTER TABLE turnus ADD CONSTRAINT kulsk
  FOREIGN KEY (utazas_id) REFERENCES utazas(id);
 
 /*
  * 9.1 Országonként hány városba utazhatunk el?
  */
  SELECT orszag, COUNT(varos) 
  FROM utazas 
  GROUP BY orszag;
  
 /*
  * 9.2 Jelenítsük meg az elsõ tíz legtávolabbi úticélt.
  */
  SELECT orszag, varos
  FROM utazas
  ORDER BY tavolsag DESC
  LIMIT 0, 10;
 
 /*
  * 9.3 Mely úticélok olcsóbbak 120.000 Ft-nál?
  */
  
  SELECT orszag, varos
  FROM utazas
  WHERE alapar < 120000;
 /*
  * 9.4 Adjuk meg, hogy egy felhasználó az eddigiekben
  * hány utat rendelt meg.
  */
  
  SELECT felhasznalonev, nev, COUNT(turnus_id)
  FROM felhasznalo, utazik
  WHERE felhasznalo.id = utazik.felh_ID
  GROUP BY felhasznalonev, nev;
  
  /*
   * 9.5 Kik azok, akik több útra is elmentek?
   */
   
  SELECT felhasznalonev, nev, COUNT(turnus_id)
  FROM felhasznalo, utazik
  WHERE felhasznalo.id = utazik.felh_ID
  GROUP BY felhasznalonev, nev
  HAVING COUNT(turnus_id)>1;

  /*
   * 9.6 Adjuk meg, hogy melyik 3 felhasználó költötte el
   * eddig a legtöbb pénzt, és mennyit.
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
  
 /* 9.7 Mondjuk meg, melyik úticél(ok) a legnépszerûbb(ek). 
  * Adjuk meg azt is, melyik
  * indulási idõpontban indulnak a legtöbben oda. 
  */
  
  SELECT orszag, varos, indulasi_ido, foglalt 
  FROM turnus, utazas
  WHERE utazas.id = turnus.utazas_ID
  AND foglalt=(SELECT MAX(t.foglalt) FROM turnus AS t);
  
 /*
  * 9.8 Adjunk meg nézettáblát, amin keresztül látjuk,
  * hogy az egyes utazásokra a különbözõ indulási
  * idõpontokban összesen eddig mennyi pénzt költöttek.
  * (Nem biztos, hogy minden útból indítanak turnusokat.)
  */
  
  CREATE OR REPLACE VIEW koltekezes AS
  SELECT orszag, varos, SUM(alapar*foglalt)
  FROM utazas, turnus
  WHERE
  utazas.id = turnus.utazas_id
  GROUP BY orszag, varos;
 
 
 /*
  * 9.9 Listázzuk betûrendben nõvekvõ és ár szerint
  * csökkenõ sorrendben az olyan utakat, amelyekbõl nem 
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
   * 9.10 Melyik utazásokból fog 2014. augusztusában 
   * valahány turnus indulni, és hány turnus fog belõlük
   * indulni ekkor?
   */
   
   SELECT orszag, varos, COUNT(turnus.id)
   FROM utazas, turnus
   WHERE
   utazas.id = turnus.utazas_id
   AND YEAR(indulasi_ido)=2014
   AND MONTH(indulasi_ido)=8
   GROUP BY orszag, varos;
 