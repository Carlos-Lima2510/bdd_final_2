-- Tabla: Miguel Rivas --
DROP TABLE IF EXISTS servicio_adicional;
CREATE TABLE servicio_adicional (
    servicio_adicional_id INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    tarifa DECIMAL(10, 2),
    reserva_id INT,
    PRIMARY KEY (servicio_adicional_id)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO servicio_adicional (nombre, descripcion, tarifa, reserva_id) VALUES
('Desayuno', 'Buffet desayuno incluido', 15.00, 1),
('Spa', NULL, 50.00, 2),
('Transporte', 'Traslado al aeropuerto', NULL, 3),
('Cena Romántica', NULL, 75.00, NULL),
('Tour Guiado', 'Excursión a sitios turísticos', 30.00, NULL);

--  Tabla: Alejandro Juarez --

DROP TABLE IF EXISTS habitacion;
CREATE TABLE IF NOT EXISTS `habitacion` (
    `habitacion_id` INT AUTO_INCREMENT PRIMARY KEY,
    `codigo` CHAR(5) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL UNIQUE,
    `tipo` ENUM('individual', 'doble', 'suite') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
    `tarifa_por_noche` DECIMAL(10, 2) DEFAULT NULL,
    `estado` ENUM('disponible', 'ocupada', 'en mantenimiento') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
    `capacidad_maxima` INT NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO `habitacion` (`codigo`, `tipo`, `tarifa_por_noche`, `estado`, `capacidad_maxima`) VALUES
('A001', 'individual', 50.00, 'disponible', 1),
('B002', 'doble', NULL, 'ocupada', 2),
('C003', 'suite', 150.00, 'en mantenimiento', 4),
('D004', 'doble', NULL, 'disponible', 2),
('E005', 'individual', 45.00, 'ocupada', 1);



-- Tabla: Kelvia Neves –

DROP TABLE IF EXISTS huesped;
CREATE TABLE IF NOT EXISTS  huesped (
    huesped_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_unico VARCHAR(50) UNIQUE,
    nombre_completo VARCHAR(100),
    numero_identificacion VARCHAR(50) UNIQUE,
    telefono VARCHAR(20),
    correo_electronico VARCHAR(100)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO huesped (codigo_unico, nombre_completo, numero_identificacion, telefono, correo_electronico) 
VALUES
    ('HUE001', 'Carlos Perez', 'DNI12345678', '+34123456789', 'carlos.perez@example.com'),
    ('HUE002', 'Ana Lopez', 'DNI87654321', '+34123456780', 'ana.lopez@example.com'),
    ('HUE003', 'John Smith', 'PAS987654321', '+44123456789', 'john.smith@example.com'),
    ('HUE004', 'Maria Gonzalez', 'DNI11223344', '+34123456781', 'maria.gonzalez@example.com'),
    ('HUE005', 'Sophie Martin', 'PAS1123581321', '+33123456789', 'sophie.martin@example.com'),
    ('HUE006', 'Liam Brown', 'PAS6677889900', '+44123456790', 'liam.brown@example.com'),
    ('HUE007', 'Isabella Garcia', 'DNI55667788', '+34123456782', 'isabella.garcia@example.com'),
    ('HUE008', 'Emma Martinez', 'DNI33445566', '+34123456783', 'emma.martinez@example.com'),
    ('HUE009', 'James Wilson', 'PAS4455667788', '+44123456791', 'james.wilson@example.com'),
    ('HUE010', 'Oliver Davis', 'PAS9988776655', '+44123456792', 'oliver.davis@example.com');

-- Tabla: Manuel Muñoz --

DROP TABLE IF EXISTS pago;
CREATE TABLE IF NOT EXISTS pago (
pago_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
codigo_unico char(5) NOT NULL,
reserva_id INT UNSIGNED NOT NULL,
monto decimal(8,2),
fecha_de_pago TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
metodo_de_pago ENUM("tarjeta", "efectivo", "transferencia"),
PRIMARY KEY (pago_id),
UNIQUE(codigo_unico))
ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO pago (codigo_unico, reserva_id, monto, metodo_de_pago) 
VALUES
('A1234', 1, 150.500, 'tarjeta'),
('B5678', 2, 200.750, 'efectivo'),
('C9101', 3, NULL, 'transferencia'),
('D1121', 4, 180.000, NULL),
('E3141', 5, 250.300, 'tarjeta'),
('F5161', 6, 100.000, 'efectivo'),
('G7181', 7, 175.250, NULL),
('H9202', 8, NULL, 'transferencia'),
('I1233', 9, 300.000, 'tarjeta'),
('J4567', 10, NULL, NULL);





--  Tabla: Carlos Alvarado --
DROP TABLE IF EXISTS reserva;
CREATE TABLE IF NOT EXISTS reserva (
   reserva_id int PRIMARY KEY AUTO_INCREMENT,
   codigo_unico CHAR(5) UNIQUE NOT NULL,
   fecha_entrada date NOT NULL,
   fecha_salida date NOT NULL,
   estado ENUM("Confirmada", "Pendiente", "Cancelada"),
   costo decimal(10,2)
) ENGINE=MyISAM CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO reserva (codigo_unico, fecha_entrada, fecha_salida, estado, costo)
VALUES ('AB102', '2024-12-25', '2025-12-31', "Confirmada", 1105.50),
      ('AB103', '2025-01-01', '2025-02-01', "Confirmada", 105.50),
      ('AB104', '2025-01-01', '2025-02-01', "Confirmada", 155.50),
      ('AB105', '2025-01-05', '2025-02-05', "Pendiente", 125.00),
      ('AB106', '2025-03-05', '2025-03-10', "Cancelada", 100.00);

   DROP TABLE IF EXISTS reserva_huesped;
   CREATE TABLE IF NOT EXISTS reserva_huesped (
   reserva_huesped_id int PRIMARY KEY AUTO_INCREMENT,
   reserva_id int NOT NULL,
   huesped_id int NOT NULL
) ENGINE=MyISAM CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO reserva_huesped (reserva_id, huesped_id)
VALUES (1, 1),
      (2, 2),
      (3, 3),
      (4, 4),
      (5, 5);

   DROP TABLE IF EXISTS reserva_habitacion;
   CREATE TABLE IF NOT EXISTS reserva_habitacion (
   reserva_habitacion_id int PRIMARY KEY AUTO_INCREMENT,
   reserva_id int NOT NULL,
   habitacion_id int NOT NULL
   ) ENGINE=MyISAM CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO reserva_habitacion (reserva_id, habitacion_id)
VALUES (1, 1),
      (2, 2),
      (3, 3),
      (4, 4),
      (5, 5);



DELIMITER //

DROP PROCEDURE IF EXISTS `consultas_alejandro_juarez` //

CREATE DEFINER=`root`@`%` PROCEDURE `consultas_alejandro_juarez`()
BEGIN

-- Consultas --

-- Unión --
SELECT * FROM habitacion WHERE codigo LIKE 'A%' UNION SELECT * FROM habitacion WHERE codigo LIKE 'D%';

-- Intersección --
SELECT * FROM habitacion WHERE codigo LIKE 'A%' INTERSECT SELECT * FROM habitacion WHERE capacidad_maxima = 1;

-- Diferencia --
SELECT * FROM habitacion WHERE codigo LIKE 'A%' EXCEPT SELECT * FROM habitacion WHERE estado = 'ocupada';

-- Agregación --
SELECT tipo, AVG(tarifa_por_noche) AS tarifa_promedio, COUNT(*) AS cantidad_habitaciones, MAX(tarifa_por_noche) AS tarifa_maxima FROM habitacion GROUP BY tipo;

-- Reunion natural --
SELECT * FROM reserva_habitacion NATURAL JOIN habitacion;

-- Reunion natural por la izquierda --
SELECT * FROM reserva_habitacion LEFT JOIN habitacion ON reserva_habitacion.habitacion_id = habitacion.habitacion_id;

-- Reunion natural por la derecha --
SELECT * FROM habitacion RIGHT JOIN reserva_habitacion ON habitacion.habitacion_id = reserva_habitacion.habitacion_id;

-- Producto cartesiano --
SELECT * FROM reserva_habitacion CROSS JOIN habitacion;

END //

DELIMITER ;


DELIMITER //

DROP PROCEDURE IF EXISTS `consultas_miguel_rivas` //

CREATE DEFINER=`root`@`%` PROCEDURE `consultas_miguel_rivas`()
BEGIN

-- Consultas --
-- Interseccion --
SELECT * FROM servicio_adicional WHERE tarifa < 45
INTERSECT
SELECT * FROM servicio_adicional WHERE descripcion IS NOT NULL;

-- Union --
SELECT * FROM servicio_adicional WHERE tarifa < 45
UNION
SELECT * FROM servicio_adicional WHERE descripcion IS NOT NULL;

-- Diferencia --
SELECT * FROM servicio_adicional WHERE tarifa < 70
EXCEPT
SELECT * FROM servicio_adicional WHERE descripcion IS NOT NULL;

-- Agregacion --
SELECT COUNT(*) AS total_servicios, AVG(tarifa) AS tarifa_promedio
FROM servicio_adicional
WHERE nombre LIKE '%i%';

-- Reunion Natural --
SELECT *
FROM reserva
NATURAL JOIN reserva_servicio_adicional
NATURAL JOIN servicio_adicional;

-- Reunion Natural por derecha --
SELECT *
FROM reserva_servicio_adicional
RIGHT JOIN reserva ON reserva_servicio_adicional.reserva_id = reserva.reserva_id
RIGHT JOIN servicio_adicional ON reserva_servicio_adicional.servicio_adicional_id = servicio_adicional.servicio_adicional_id;

-- Reunion Natural por izquierda --
SELECT *
FROM reserva_servicio_adicional
LEFT JOIN reserva ON reserva_servicio_adicional.reserva_id = reserva.reserva_id
LEFT JOIN servicio_adicional ON reserva_servicio_adicional.servicio_adicional_id = servicio_adicional.servicio_adicional_id;

-- Producto cartesiano --
SELECT *
FROM reserva
CROSS JOIN servicio_adicional;


END //

DELIMITER ;


DELIMITER //

DROP PROCEDURE IF EXISTS `consultas_kelvia_neves` //

CREATE DEFINER=`root`@`%` PROCEDURE `consultas_kelvia_neves`()
BEGIN

-- Consultas --

-- Unión Kelvia --

SELECT * FROM huesped
WHERE numero_identificacion LIKE 'DNI%'
UNION
SELECT * FROM huesped
WHERE numero_identificacion LIKE 'PAS%';

-- Intersección Kelvia --

SELECT * FROM huesped
WHERE numero_identificacion LIKE 'DNI%'
INTERSECT
SELECT * FROM huesped
WHERE telefono LIKE '+34%';

-- Diferencia Kelvia --

SELECT * FROM huesped
WHERE numero_identificacion NOT LIKE 'DNI%'
EXCEPT
SELECT * FROM huesped
WHERE numero_identificacion LIKE 'DNI%';

-- Agregación Kelvia --

SELECT 
    LEFT(telefono, 3) AS pais, 
    COUNT(*) AS total_huespedes
FROM huesped
GROUP BY pais
ORDER BY total_huespedes DESC;

-- Reunion natural -- 

SELECT h.huesped_id, h.codigo_unico, h.nombre_completo, h.numero_identificacion, h.telefono, h.correo_electronico, r.reserva_huesped_id, r.reserva_id
FROM huesped h
NATURAL JOIN reserva_huesped r;

-- Reunion natural por la izquierda --

SELECT h.huesped_id, h.codigo_unico, h.nombre_completo, h.numero_identificacion, h.telefono, h.correo_electronico, r.reserva_huesped_id, r.reserva_id
FROM huesped h
LEFT JOIN reserva_huesped r
ON h.huesped_id = r.huesped_id;


-- Reunion natural por la derecha --

SELECT h.huesped_id, h.codigo_unico, h.nombre_completo, h.numero_identificacion, h.telefono, h.correo_electronico, r.reserva_huesped_id, r.reserva_id
FROM huesped h
RIGHT JOIN reserva_huesped r
ON h.huesped_id = r.huesped_id;

-- Producto cartesiano --

SELECT h.huesped_id, h.codigo_unico, h.nombre_completo, h.numero_identificacion, h.telefono, h.correo_electronico, r.reserva_huesped_id, r.reserva_id
FROM huesped h
CROSS JOIN reserva_huesped r;

END //

DELIMITER ;

DELIMITER //

DROP PROCEDURE IF EXISTS `consultas_manuel_munoz` //

CREATE DEFINER=`root`@`%` PROCEDURE `consultas_manuel_munoz`()
BEGIN

-- Consultas --

-- Intersect --
 SELECT * FROM pago AS p1 WHERE p1.monto > 200.00
INTERSECT
SELECT * FROM pago AS p2 WHERE p2.metodo_de_pago = "efectivo";

-- Union --
SELECT * FROM pago AS p1 WHERE p1.monto > 200.00
UNION
SELECT * FROM pago AS p2 WHERE p2.metodo_de_pago = "efectivo";

-- Diferencia --
SELECT * FROM pago AS p1 WHERE p1.monto > 200.00
EXCEPT
SELECT * FROM pago AS p2 WHERE p2.metodo_de_pago = "efectivo";

-- Agregacion --
SELECT MAX(monto) FROM pago;

-- Natural Join --
SELECT * FROM pago NATURAL JOIN habitacion;

-- Right Join --
SELECT * FROM pago AS p
RIGHT JOIN
reserva AS r ON p.reserva_id = r.reserva_id;

-- Left Join --
SELECT * FROM pago AS p
LEFT JOIN
reserva AS r ON p.reserva_id = r.reserva_id;

--  P.Cartesiano -- 
SELECT * FROM pago CROSS JOIN reserva;

END //

DELIMITER ;


DELIMITER //

DROP PROCEDURE IF EXISTS `consultas_carlos_alvarado` //

CREATE DEFINER=`root`@`%` PROCEDURE `consultas_carlos_alvarado`()
BEGIN

-- Consultas Carlos Alvarado --


-- Intersección --

SELECT * FROM reserva WHERE codigo_unico LIKE 'AB%' INTERSECT SELECT * FROM reserva WHERE costo > 100.00;


-- Diferencia --

SELECT * FROM reserva WHERE codigo_unico LIKE 'A%' EXCEPT SELECT * FROM reserva WHERE costo > 125.00;

-- Unión --

SELECT * FROM reserva WHERE codigo_unico LIKE '%10%' UNION SELECT * FROM reserva WHERE estado = 'Confirmada';

-- Agregación --

SELECT AVG(costo) FROM reserva WHERE estado = 'Pendiente';


-- Reunión Natural --

SELECT * FROM reserva NATURAL JOIN reserva_habitacion;


-- Reunión Natural Por la izquierda --

SELECT r.codigo_unico, h.tarifa_por_noche FROM reserva AS r LEFT JOIN reserva_habitacion AS rh ON rh.reserva_id = r.reserva_id LEFT JOIN habitacion AS h ON h.habitacion_id = rh.habitacion_id;


-- Reunión Natural Por la derecha --

SELECT r.codigo_unico, h.nombre_completo FROM reserva AS r RIGHT JOIN reserva_huesped AS rh ON rh.reserva_id = r.reserva_id RIGHT JOIN huesped AS h ON h.huesped_id = rh.huesped_id;


-- Producto Cartesiano --

SELECT r.codigo_unico, h.nombre_completo FROM reserva r CROSS JOIN reserva_huesped rh CROSS JOIN huesped h;


END //

DELIMITER ;





-- Triggers Miguel Rivas –

-- Trigger Individual --
DELIMITER $$

DROP TRIGGER IF EXISTS aumentar_tarifa_servicio$$

CREATE TRIGGER aumentar_tarifa_servicio
BEFORE INSERT ON servicio_adicional
FOR EACH ROW
BEGIN
    SET NEW.tarifa = NEW.tarifa * 1.10;
END$$

DELIMITER ;

-- Trigger Grupal --
DELIMITER $$

DROP TRIGGER IF EXISTS aumentar_tarifa_servicio_reserva$$

CREATE TRIGGER aumentar_tarifa_servicio_reserva
AFTER INSERT ON reserva
FOR EACH ROW
BEGIN
    UPDATE servicio_adicional
    SET tarifa = tarifa * 1.10;
END$$

DELIMITER ;



-- Triggers Alejandro Juarez --

-- Trigger Individual --

DELIMITER $$
DROP TRIGGER IF EXISTS valida_habitaciones_numero_personas;
CREATE TRIGGER IF NOT EXISTS valida_habitaciones_numero_personas
BEFORE INSERT ON habitacion
FOR EACH ROW
BEGIN
    -- Validar que tarifa_por_noche no sea NULL si el estado es 'ocupada' o 'en mantenimiento'
    IF (NEW.estado IN ('ocupada', 'en mantenimiento') AND NEW.tarifa_por_noche IS NULL) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La tarifa_por_noche no puede ser NULL cuando el estado es "ocupada" o "en mantenimiento".';
    END IF;

    -- Validar que la capacidad_maxima sea mayor a 0
    IF (NEW.capacidad_maxima <= 0) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La capacidad_maxima debe ser mayor que 0.';
    END IF;
END$$

DELIMITER ;

-- Trigger Grupal --

DELIMITER $$
DROP TRIGGER IF EXISTS after_insert_reserva_habitacion;
CREATE TRIGGER IF NOT EXISTS after_insert_reserva_habitacion
AFTER INSERT ON reserva_habitacion
FOR EACH ROW
BEGIN
    UPDATE habitacion
    SET estado = 'ocupada'
    WHERE habitacion_id = NEW.habitacion_id;
END$$
DELIMITER ;

DELIMITER $$
DROP TRIGGER IF EXISTS after_delete_reserva_habitacion;
CREATE TRIGGER IF NOT EXISTS after_delete_reserva_habitacion
AFTER DELETE ON reserva_habitacion
FOR EACH ROW
BEGIN
    UPDATE habitacion
    SET estado = 'disponible'
    WHERE habitacion_id = OLD.habitacion_id;
END$$
DELIMITER ;






-- Triggers Manuel Muñoz --

-- Trigger Individual –

DELIMITER $$
DROP TRIGGER IF EXISTS aumentar_monto;
CREATE TRIGGER IF NOT EXISTS aumentar_monto
BEFORE INSERT ON pago
FOR EACH ROW
BEGIN
    IF NEW.monto IS NOT NULL THEN
        SET NEW.monto = NEW.monto * 1.01;
    END IF;

    IF NEW.metodo_de_pago IS NULL THEN
        SET NEW.metodo_de_pago = 'efectivo';
    END IF;
END$$

DELIMITER ;


-- Trigger Grupal --
DELIMITER $$
DROP TRIGGER IF EXISTS actualizar_pago_monto;
CREATE TRIGGER IF NOT EXISTS actualizar_pago_monto
AFTER UPDATE ON reserva
FOR EACH ROW
BEGIN
       IF OLD.costo <> NEW.costo THEN
        UPDATE pago
        SET monto = NEW.costo
        WHERE reserva_id = NEW.reserva_id;
    END IF;
END$$

DELIMITER ;




-- Triggers Kelvia Neves --

-- Trigger Individual –

DELIMITER //

DROP TRIGGER IF EXISTS before_huesped_insert;
CREATE TRIGGER IF NOT EXISTS before_huesped_insert
BEFORE INSERT ON huesped
FOR EACH ROW
BEGIN
    DECLARE duplicado INT;
    
    SELECT COUNT(*) INTO duplicado
    FROM huesped
    WHERE nombre_completo = NEW.nombre_completo
      AND numero_identificacion = NEW.numero_identificacion;
    
    IF duplicado > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El huésped ya existe con el mismo nombre y número de identificación.';
    END IF;
END;
//

DELIMITER ;

-- Trigger Grupal –

DELIMITER //

DROP TRIGGER IF EXISTS validar_huesped_reserva;
CREATE TRIGGER IF NOT EXISTS  validar_huesped_reserva
BEFORE INSERT ON reserva_huesped
FOR EACH ROW
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM huesped
        WHERE huesped.huesped_id = NEW.huesped_id
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El huesped_id no existe en la tabla huesped.';
    END IF;
END;

//

DELIMITER ;

-- Triggers Carlos Alvarado --


-- Trigger Individual --

DELIMITER $$
DROP TRIGGER IF EXISTS valida_fechas_reserva;
CREATE TRIGGER IF NOT EXISTS valida_fechas_reserva
BEFORE INSERT ON reserva
FOR EACH ROW
BEGIN
    -- Verificar que la fecha de entrada no sea posterior a la fecha de salida
    IF NEW.fecha_entrada > NEW.fecha_salida THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La fecha de entrada no puede ser posterior a la fecha de salida.';
    END IF;
END$$

DELIMITER ;

-- Trigger Grupal --
 
DELIMITER $$
DROP TRIGGER IF EXISTS elimina_huespedes_reserva;

CREATE TRIGGER IF NOT EXISTS elimina_huespedes_reserva
AFTER DELETE ON reserva
FOR EACH ROW
BEGIN
   -- Eliminar registros relacionados en la tabla reserva_huesped
   DELETE FROM reserva_huesped
   WHERE reserva_id = OLD.reserva_id;
END$$

DELIMITER ;
