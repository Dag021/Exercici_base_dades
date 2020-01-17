--1.Quantitat de registres de la taula de vols:
SELECT count(*) from Flights;
--2.Retard promig de sortida i arribada segons l’aeroport origen.
SELECT Origin, AVG(ArrDelay) as prom_arribades, AVG(DepDelay) as prom_sortides from Flights GROUP BY Origin ORDER BY Origin ASC;
--3.Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen. A més, volen que els resultat es mostrin de la següent forma (fixa’t en l’ordre de les files):
SELECT Origin, colYear, colMonth, ArrDelay as prom_arribades from Flights ORDER BY Origin, colYear ASC;
--4.Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen (mateixa consulta que abans i amb el mateix ordre). Però a més, ara volen que en comptes del codi de l’aeroport es mostri el nom de la ciutat.
SELECT City, colYear, colMonth, ArrDelay as prom_arribades from Flights INNER JOIN USAirports ON Origin = IATA ORDER BY City, colYear ASC;
--5.Les companyies amb més vols cancelats, per mesos i any. A més, han d’estar ordenades de forma que les companyies amb més cancel·lacions apareguin les primeres.
SELECT CarrierCode as UniqueCarrier, colYear, colMonth, SUM(Cancelled) as total_cancelled from Flights INNER JOIN Carriers ON UniqueCarrier = CarrierCode WHERE Cancelled>0 GROUP BY UniqueCarrier, colYear ORDER BY total_cancelled DESC;
--6.L’identificador dels 10 avions que més distància han recorregut fent vols.
SELECT TailNum, SUM(Distance) as totalDistance from Flights WHERE TailNum IS NOT NULL GROUP BY TailNum ORDER BY totalDistance DESC LIMIT 1,11;
--7.Companyies amb el seu retard promig només d’aquelles les quals els seus vols arriben al seu destí amb un retràs promig major de 10 minuts.
SELECT CarrierCode as UniqueCarrier, AVG(ArrDelay) as avgDelay from Flights INNER JOIN Carriers ON UniqueCarrier = CarrierCode GROUP BY UniqueCarrier HAVING AVG(ArrDelay) >10 ORDER BY avgDelay DESC;
