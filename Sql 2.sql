-- CREACION DE TABLAS
DROP DATABASE IF EXISTS andesbike;
CREATE DATABASE andesbike;
USE andesbike;

CREATE TABLE tiendas (
    id_tienda INT AUTO_INCREMENT,
    nombre VARCHAR(60) NOT NULL,
    comuna VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_tienda)
);

CREATE TABLE bicicletas (
    id_bicicleta INT AUTO_INCREMENT,
    modelo VARCHAR(60) NOT NULL,
    categoria ENUM('Eléctrica', 'Infantil', 'Montaña', 'Ruta', 'Urbana') NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_bicicleta)
);

CREATE TABLE vendedores (
    id_vendedor INT AUTO_INCREMENT,
    nombre VARCHAR(80) NOT NULL,
    id_tienda INT,
    fecha_ingreso DATE,
    PRIMARY KEY (id_vendedor),
    FOREIGN KEY (id_tienda) REFERENCES tiendas(id_tienda)
);

CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT,
    id_vendedor INT NOT NULL,
    id_bicicleta INT NOT NULL,
    fecha DATE NOT NULL,
    unidades INT NOT NULL,
    PRIMARY KEY (id_venta),
    FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor),
    FOREIGN KEY (id_bicicleta) REFERENCES bicicletas(id_bicicleta)
);

-- CARGA DE DATOS

INSERT INTO tiendas (nombre, comuna) VALUES
('Andes Providencia', 'Providencia'),
('Andes Maipú', 'Maipú'),
('Andes Concepción', 'Concepción'),
('Andes La Serena', 'La Serena');

INSERT INTO vendedores (nombre, id_tienda, fecha_ingreso) VALUES
('Camila Ortiz', 1, '2024-06-20'),
('Diego Fuentes', 1, '2024-01-15'),
('Javiera Soto', 2, '2023-07-24'),
('Matías Herrera', 2, '2024-01-15'),
('Paula Riquelme', 3, '2022-11-02'),
('Ignacio Vera', 3, '2024-08-19'),
('Fernanda Lillo', 1, '2025-02-03'),
('Rubén Castro', NULL, '2025-06-10');

INSERT INTO bicicletas (modelo, categoria, precio) VALUES
('Cordillera 29', 'Montaña', 549990.00),
('Ruta Austral', 'Ruta', 899990.00),
('Urbana Pro', 'Urbana', 329990.00),
('Pequeño Andes', 'Infantil', 149990.00),
('Volt City', 'Eléctrica', 1249990.00),
('Trail Master', 'Montaña', 749990.00),
('Urbana Lite', 'Urbana', 229990.00),
('Sprint R7', 'Ruta', 1099990.00);

INSERT INTO ventas (id_vendedor, id_bicicleta, fecha, unidades) VALUES
(1, 1, '2025-03-04', 2), 
(1, 3, '2025-03-18', 1), 
(1, 5, '2025-04-02', 1), 
(2, 2, '2025-03-04', 1), 
(2, 1, '2025-04-11', 3), 
(2, 7, '2025-05-06', 2), 
(3, 4, '2025-03-21', 4),
(3, 3, '2025-04-15', 2), 
(3, 6, '2025-05-20', 1),
(4, 1, '2025-03-27', 1),
(4, 5, '2025-05-09', 2),
(5, 2, '2025-04-08', 1),
(5, 6, '2025-04-23', 2),
(5, 4, '2025-06-02', 5),
(6, 3, '2025-05-13', 3),
(6, 7, '2025-06-17', 1),
(6, 1, '2025-06-24', 2),
(1, 6, '2025-06-30', 1);

-- CONSULTAS



