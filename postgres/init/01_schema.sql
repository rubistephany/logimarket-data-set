CREATE TABLE clientes (
    id_cliente VARCHAR(50) PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    ciudad VARCHAR(100)
);

CREATE TABLE productos (
    id_producto VARCHAR(50) PRIMARY KEY,
    nombre VARCHAR(100),
    categoria VARCHAR(100),
    precio_unitario NUMERIC(10,2)
);

CREATE TABLE almacenes (
    id_almacen VARCHAR(50) PRIMARY KEY,
    nombre_almacen VARCHAR(100),
    ciudad VARCHAR(100),
    capacidad_m3 INT
);

CREATE TABLE transportistas (
    id_transportista VARCHAR(50) PRIMARY KEY,
    nombre_empresa VARCHAR(100),
    tipo_servicio VARCHAR(100)
);

CREATE TABLE pedidos (
    id_pedido VARCHAR(50) PRIMARY KEY,
    id_cliente VARCHAR(50) REFERENCES clientes(id_cliente),
    id_producto VARCHAR(50) REFERENCES productos(id_producto),
    id_almacen VARCHAR(50) REFERENCES almacenes(id_almacen),
    id_transportista VARCHAR(50) REFERENCES transportistas(id_transportista),
    fecha_pedido DATE,
    cantidad INT,
    total_linea NUMERIC(10,2)
);

CREATE TABLE entregas (
    id_entrega VARCHAR(50) PRIMARY KEY,
    id_pedido VARCHAR(50) REFERENCES pedidos(id_pedido),
    fecha_entrega_teorica DATE,
    fecha_entrega_real DATE,
    estado_entrega VARCHAR(50),
    nivel_gravedad VARCHAR(50)
);

CREATE TABLE stock (
    id_almacen VARCHAR(50) REFERENCES almacenes(id_almacen),
    id_producto VARCHAR(50) REFERENCES productos(id_producto),
    stock_teorico INT,
    stock_real INT,
    PRIMARY KEY (id_almacen, id_producto)
);

CREATE TABLE incidencias (
    id_incidencia VARCHAR(50) PRIMARY KEY,
    id_pedido VARCHAR(50) REFERENCES pedidos(id_pedido),
    tipo_incidencia VARCHAR(100),
    gravedad VARCHAR(50),
    fecha_incidencia DATE,
    descripcion TEXT
);