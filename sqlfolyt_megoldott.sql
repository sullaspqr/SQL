/* Tablak letrehozasa */
CREATE TABLE IF NOT EXISTS foldresz
(
	nev VARCHAR(20) PRIMARY KEY,
	terulet INT
);

CREATE TABLE IF NOT EXISTS orszag
(
	hivoszam INT PRIMARY KEY,
	orszag_neve VARCHAR(30) NOT NULL,
	terulete INT,
	hivatalos_nyelv VARCHAR(20),
	gdp INT,
	eghajlat VARCHAR(15),
	foldresz_nev VARCHAR(20),
	FOREIGN KEY (foldresz_nev) REFERENCES foldresz(nev) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS etnikum
(
	kod INT PRIMARY KEY,
	megnevezes VARCHAR(30),
	nyelv VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS lakossag
(
	orszag_hivoszam INT,
	etnikum_kod INT,
	hany_fo INT,
	PRIMARY KEY(orszag_hivoszam, etnikum_kod),
	FOREIGN KEY (orszag_hivoszam) REFERENCES orszag(hivoszam) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (etnikum_kod) REFERENCES etnikum(kod) ON UPDATE CASCADE ON DELETE CASCADE			 
);

/* 8.1 */
SELECT hany_fo
FROM orszag, lakossag, etnikum
WHERE 
orszag.hivoszam = lakossag.orszag_hivoszam 
AND lakossag.etnikum_kod = etnikum.kod 
AND etnikum.megnevezes LIKE '%lengyel%'
AND orszag.orszag_neve = 'Franciaország';

/* 8.2 */
SELECT AVG(orszag.gdp)
FROM orszag
WHERE foldresznev LIKE 'Európa';

/* 8.3 */
SELECT orszag.orszag_neve, SUM(lakossag.hany_fo)
FROM orszag, lakossag
WHERE
orszag.hivoszam = lakossag.orszag_hivoszam
GROUP BY orszag.orszag_neve
HAVING SUM(lakossag.hany_fo) > 12000000;

/* 8.4 */
SELECT SUM(lakossag.hany_fo)
FROM orszag, lakossag
WHERE
orszag.hivoszam = lakossag.orszag_hivoszam
AND orszag.orszag_neve = 'Svájc';

/* 8.5 */
SELECT orszag_neve, etnikum.megnevezes, lakossag.hany_fo
FROM orszag, lakossag, etnikum
WHERE orszag.hivoszam = lakossag.orszag_hivoszam
AND lakossag.etnikum_kod = etnikum.kod
AND etnikum.kod = ( 
	SELECT e2.kod
	FROM orszag AS o2, lakossag AS l2, etnikum AS e2
	WHERE o2.hivoszam = l2.orszag_hivoszam
	AND e2.kod = l2.etnikum_kod
	AND o2.hivoszam = orszag.hivoszam
	ORDER BY l2.hany_fo DESC 
	LIMIT 1
); 