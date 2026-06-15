LOAD CSV WITH HEADERS FROM 'file:///neo4j_relaciones.csv' AS row
MERGE (o:Entidad {id: row.origen_id, tipo: row.origen_tipo})
MERGE (d:Entidad {id: row.destino_id, tipo: row.destino_tipo})
WITH o, d, row
CALL apoc.create.relationship(o, row.tipo_relacion, {peso: toInteger(row.peso)}, d) YIELD rel
RETURN count(*);