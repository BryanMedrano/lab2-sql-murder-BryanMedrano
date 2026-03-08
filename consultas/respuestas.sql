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

-- 6. A partir de las declaraciones de los testigos, investigué a los miembros
-- del gimnasio "Get Fit Now". El primer testigo mencionó que el sospechoso
-- llevaba una bolsa del gimnasio y que su número de membresía comenzaba con "48Z".
-- También indicó que solo los miembros Gold tienen ese tipo de bolsa.

SELECT * FROM get_fit_now_member
WHERE id LIKE '%48Z%'
AND membership_status = 'gold';

-- 7. Luego de identificar a los dos posibles sospechosos del gimnasio,
-- busqué sus registros en la tabla person para obtener sus números de licencia.
-- Esta información es necesaria para revisar los vehículos asociados a cada uno.

SELECT * FROM person
WHERE id = 28819 OR id = 67318;

-- 8. Para identificar cuál de los dos sospechosos coincidía con la pista
-- de la placa del vehículo ("H42W"), consulté la tabla drivers_license
-- usando los license_id obtenidos previamente.

SELECT * FROM drivers_license
WHERE id = 173289 OR id = 423327;

-- 9. Finalmente, con toda la información recopilada, 
-- llegué a la conclusión de que el sospechoso era Jeremy Bowers, 
-- quien tenía el número de membresía "48Z123" y la placa del vehículo "0H42W2" coincidía con la descripción dada por los testigos.

INSERT INTO solution VALUES (1, 'Jeremy Bowers');
        
        SELECT value FROM solution;