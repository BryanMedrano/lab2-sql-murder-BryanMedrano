# lab2-SQL Murder Mystery-BryanMedrano

## Detective: Bryan Medrano

## Resumen del Caso

El 15 de enero de 2018, SQL City despertó con una escena del crimen que conmocionó a toda la ciudad: un asesinato meticulosamente ejecutado cuya única evidencia inicial era un video de una cámara de seguridad que captó a dos testigos clave.

La investigación se llevó a cabo analizando diferentes tablas de la base de datos mediante consultas SQL hasta poder identificar al sospechoso.

---

## Bitácora de Investigación

### **1. Revisión del reporte del crimen**

La investigación la comencé consultando la tabla `crime_scene_report`
para encontrar el asesinato ocurrido el **15 de enero de 2018 en SQL City**.

```sql
SELECT * FROM crime_scene_report
WHERE date = 20180115 AND city = 'SQL City' AND type = 'murder';
```

**Evidencia**

![alt text](evidencia/paso1_reporte_crimen.png)

> **Conclusión**\
> El reporte del crimen reveló información importante. 
> Las cámaras de seguridad mostraron que existieron dos testigos del crimen:\
El *primer testigo* vivía en ***la última casa de Northwestern Dr.***\
El *segundo testigo* se llamaba ***Annabel y vive en Franklin Ave.*** 
> 
> Estas pistas permitieron continuar la investigación buscando a estas dos personas en la base de datos.

### Siguiendo con la investigación

Ahora debemos encontrar al **primer testigo**.

La pista dice que vive en la ultima casa de Northwestern Dr.
___

### **2. Identificación del primer testigo**

El reporte indicaba que el primer testigo vivía en ***la última casa de Northwestern Dr***. Para encontrar a esta persona, se buscó en la tabla `person` filtrando por esa calle y ordenando el número de direcciones de mayor a menor para obtener la casa con el número más alto.

```sql
SELECT * FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
LIMIT 1;
```

**Evidencia**

![alt text](evidencia/paso2_primer_testigo.png)

> **Conclusión:**\
>La consulta permitió identificar al primer testigo:\
>Nombre: Morty Schapiro\
>Dirección: 4919 Northwestern Dr
>
Con esta información, seguimos con la investigación, ahora tocaba revisar si esta persona ha dado alguna declaración sobre el caso.
___

### **3. Entrevista del primer testigo**

Después de identificar al primer testigo, se consultó en la tabla `interview`
para revisar su declaración sobre lo ocurrido.

```sql
SELECT * FROM interview
WHERE person_id = 14887;
```
**Evidencia**

![alt text](evidencia/paso3_entrevista_testigo1.png)

> **Conclusión:**\
El testigo declaró haber escuchado un disparo y luego vio a un hombre salir corriendo de la escena del crimen.\
La declaración reveló varias pistas importantes:
>- El sospechoso llevaba una bolsa del gimnasio "Get Fit Now Gym".
>- El número de membresía del gimnasio comenzaba con "48Z".
>- Solo los miembros Gold tienen ese tipo de bolsa.
>- El sospechoso escapó en un automóvil cuya placa contenía "H42W".

A partir de la declaración del primer testigo, se obtuvieron varias pistas que sugieren que el sospechoso podría ser miembro del gimnasio **Get Fit Now**. 

Sin embargo, antes de comenzar a buscar posibles sospechosos dentro de las membresías del gimnasio, resulta conveniente analizar la declaración del **segundo testigo mencionado en el reporte del crimen**. Según el reporte, esta persona se llamaba ***Annabel*** y vivía en ***Franklin Ave***. 

Por lo tanto, el siguiente paso de nuestra investigación consistió en localizar a Annabel en la base de datos de personas para revisar si proporcionó alguna declaración relevante sobre el caso.
___
### **4. Identificación del segundo testigo**

El reporte indicaba que esta persona se llamaba **Annabel** y vivía en **Franklin Ave**, por lo que el siguiente paso fue buscar en la base de datos de personas a alguien con ese nombre que residiera en esa calle. 

Para localizarla dentro de la base de datos se ejecutó la siguiente consulta:

```sql
SELECT *
FROM person
WHERE address_street_name = 'Franklin Ave'
AND name LIKE '%Annabel%';
```
**Evidencia**

![alt text](evidencia/paso4_segundo_testigo.png)

> **Conclusión:**\
La consulta permitió identificar a la segunda testigo:\
**Nombre:** Annabel Miller  
**Dirección:** 103 Franklin Ave  

Una vez identificada, procedí a revisar si había dado alguna entrevista que pudiera aportar nuevas pistas para la investigación.
___

### **5. Entrevista del segundo testigo**

Luego de identificar a ***Annabel Miller*** como el segundo testigo del caso, decidí revisar su entrevista para obtener más información sobre el asesinato.

```sql
SELECT * FROM interview
WHERE person_id = 16371;
```

**Evidencia**

![alt text](evidencia/paso5_entrevista_annabel.png)

> **Conclusión:**\
La consulta permitió identificar a la segunda testigo:\
**Nombre:** Annabel Miller  
**Dirección:** 103 Franklin Ave  
En su declaración, Annabel afirmó haber presenciado el asesinato y mencionó que reconoció al asesino del gimnasio al que asiste. También indicó que lo había visto entrenando allí la semana anterior, específicamente el 9 de enero.

Esta información reforzó la pista obtenida en la declaración del primer testigo, quien mencionó que el sospechoso llevaba una bolsa del gimnasio Get Fit Now Gym.

Con ambas declaraciones apuntando al mismo lugar, decidí enfocar la investigación en los miembros del gimnasio Get Fit Now para intentar identificar al sospechoso.
___
