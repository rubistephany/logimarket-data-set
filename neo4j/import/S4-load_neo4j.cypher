// 1. Crear Clientes, Pedidos y sus relaciones
LOAD CSV WITH HEADERS FROM 'file:///neo4j_relaciones.csv' AS row
MERGE (c:Cliente {id: row.cliente_id})
MERGE (p:Pedido {id: row.pedido_id})
MERGE (c)-[:REALIZA]->(p);

// 2. Crear Productos y conectarlos a los Pedidos
LOAD CSV WITH HEADERS FROM 'file:///neo4j_relaciones.csv' AS row
MERGE (pr:Producto {id: row.producto_id})
MERGE (p:Pedido {id: row.pedido_id})
MERGE (p)-[:INCLUYE]->(pr);

// 3. Crear Almacenes y conectarlos a los Pedidos
LOAD CSV WITH HEADERS FROM 'file:///neo4j_relaciones.csv' AS row
MERGE (a:Almacen {id: row.almacen_id})
MERGE (p:Pedido {id: row.pedido_id})
MERGE (p)-[:SALE_DE]->(a);

// 4. Crear Transportistas y conectarlos a los Pedidos
LOAD CSV WITH HEADERS FROM 'file:///neo4j_relaciones.csv' AS row
MERGE (t:Transportista {id: row.transportista_id})
MERGE (p:Pedido {id: row.pedido_id})
MERGE (t)-[:TRANSPORTA]->(p);