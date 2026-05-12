CREATE DATABASE IF NOT EXISTS db_ventas_despachos;
USE db_ventas_despachos;

CREATE TABLE IF NOT EXISTS ventas (
    id_venta BIGINT AUTO_INCREMENT PRIMARY KEY,
    direccion_compra VARCHAR(255) NOT NULL,
    valor_compra INT NOT NULL,
    fecha_compra DATE NOT NULL,
    despacho_generado BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS despachos (
    id_despacho BIGINT AUTO_INCREMENT PRIMARY KEY,
    fecha_despacho DATE,
    patente_camion VARCHAR(20),
    intento INT DEFAULT 1,
    id_compra BIGINT NOT NULL,
    direccion_compra VARCHAR(255) NOT NULL,
    valor_compra BIGINT NOT NULL,
    despachado BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE INDEX idx_ventas_despacho_generado ON ventas(despacho_generado);
CREATE INDEX idx_despachos_id_compra ON despachos(id_compra);
CREATE INDEX idx_despachos_despachado ON despachos(despachado);
