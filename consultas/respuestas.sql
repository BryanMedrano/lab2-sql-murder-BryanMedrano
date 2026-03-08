-- 1. Consulté el reporte del crimen ocurrido el 15 de enero de 2018 en SQL City
-- para obtener las primeras pistas sobre el asesinato.

SELECT * FROM crime_scene_report  
WHERE date = 20180115 
AND city = 'SQL City' 
AND type = 'murder';

-- 2. Busqué al primer testigo mencionado en el reporte del crimen.
-- La pista indicaba que vive en la última casa de "Northwestern Dr".
-- Para encontrarlo, ordené los números de direcciones de esa calle de mayor a menor
-- y seleccioné la primera (que viene siendo la última casa de Northwestern Dr).

SELECT * FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
LIMIT 1;

-- 3. Revisé la entrevista del primer testigo identificado anteriormente.
-- El testigo declaró haber escuchado un disparo y ver a un hombre salir corriendo
-- con una bolsa del gimnasio "Get Fit Now Gym".
-- También mencionó que el número de membresía comenzaba con "48Z"
-- y que el sospechoso era miembro Gold.
-- Además, el hombre escapó en un carro cuya placa contenía "H42W".

SELECT * FROM interview
WHERE person_id = 14887;

-- 4. Busqué al segundo testigo mencionado en el reporte del crimen.
-- La descripción indicaba que su nombre era Annabel y que vivía en Franklin Ave.
-- Para encontrarla, filtré la tabla person por el nombre y la calle.

SELECT * FROM person
WHERE address_street_name = 'Franklin Ave'
AND name LIKE '%Annabel%';

-- 5. Revisé la entrevista del segundo testigo (Annabel Miller)
-- para verificar si había proporcionado información relevante sobre el crimen.

SELECT * FROM interview
WHERE person_id = 16371;