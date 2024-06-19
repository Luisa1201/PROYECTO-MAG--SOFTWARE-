CREATE TABLE tareas (
    id serial PRIMARY KEY,
    nombre_tarea VARCHAR(255) NOT NULL,
    fecha_tarea DATE NOT NULL
);
select * from tareas;

CREATE TABLE usuarios (
    id SERIAL,
    nombre VARCHAR(50),
    correo VARCHAR(50),
    usuario VARCHAR(20),
    contrasena VARCHAR(20),
  
    CONSTRAINT PK_id PRIMARY KEY (id) ,
    CONSTRAINT CK_nombre  CHECK (char_length(nombre) >= 3), 
    CONSTRAINT NN_nombre CHECK (nombre IS NOT NULL),
    CONSTRAINT UC_correo  UNIQUE (correo), 
    CONSTRAINT CK_correo CHECK (char_length(correo) >= 5), 
    CONSTRAINT NN_correo CHECK (correo IS NOT NULL),
    CONSTRAINT UC_usuario UNIQUE (usuario),  
    CONSTRAINT CK_usuario CHECK (char_length(usuario) >= 3),  
    CONSTRAINT CK_contrasena CHECK (char_length(contrasena) >= 3),
    CONSTRAINT NN_contrasena CHECK (contrasena IS NOT NULL)
);

select * from usuarios;

CREATE TABLE clientes (
    id SERIAL ,
    nombre VARCHAR(50),
    apellidos VARCHAR(50),
    cedula VARCHAR(20),
    nit VARCHAR(15),
    email VARCHAR(100),
    telefono VARCHAR(15) ,
    direccion VARCHAR(100),
    estado VARCHAR (10),

   CONSTRAINT PK_cli_id PRIMARY KEY (id) ,
   CONSTRAINT NN_nombre CHECK (nombre IS NOT NULL),
   CONSTRAINT NN_apellidos CHECK (apellidos IS NOT NULL),
   CONSTRAINT UC_cedula  UNIQUE (cedula), 
   CONSTRAINT NN_cedula   CHECK (cedula IS NOT NULL),
   CONSTRAINT UC_nit  UNIQUE (nit), 
   CONSTRAINT NN_nit CHECK (nit IS NOT NULL),
   CONSTRAINT NN_email CHECK (email IS NOT NULL),
   CONSTRAINT NN_telefono CHECK (telefono IS NOT NULL),
   CONSTRAINT NN_direccion CHECK (direccion IS NOT NULL),
   CONSTRAINT NN_estado CHECK (estado IS NOT NULL),
   CONSTRAINT CK_estado CHECK  (estado IN ('activo', 'inactivo'))
);

select * from clientes;

drop table usuarios;

drop table clientes;


INSERT INTO usuarios (nombre, correo, usuario, contrasena) VALUES 
('yeinny', 'yeinny@gmail.com', 'admin', '1234');


INSERT INTO clientes (nombre, apellidos, cedula, nit, email, telefono, direccion, estado) VALUES 
('Maria', 'Lopez', '123456789', '987654321', 'MARIA.LOPEZ@EXAMPLE.COM', '555-1234', 'Calle Falsa 123', 'activo'),
('Jose', 'Martinez', '234567890', '876543210', 'JOSE.MARTINEZ@EXAMPLE.COM', '555-5678', 'Avenida Siempre Viva 742', 'inactivo'),
('Luis', 'Garcia', '345678901', '765432109', 'LUIS.GARCIA@EXAMPLE.COM', '555-9012', 'Boulevard de los Sueños 89', 'activo');

UPDATE usuarios SET contrasena = '123456789' WHERE usuario = 'admin';

UPDATE clientes SET estado = 'inactivo' WHERE nombre = 'Maria' AND apellidos = 'Lopez';

DELETE FROM usuarios WHERE id = 1;


DELETE FROM clientes WHERE nombre = 'Luis' AND apellidos = 'Garcia';

SELECT * FROM clientes WHERE estado = 'inactivo';


CREATE OR REPLACE FUNCTION cliente_trigger()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        RAISE NOTICE 'Se ha insertado un nuevo cliente. Detalles: %', NEW;
    ELSIF TG_OP = 'UPDATE' THEN
        RAISE NOTICE 'Se ha actualizado un cliente. Detalles del nuevo registro: %, Detalles del antiguo registro: %', NEW, OLD;
    ELSIF TG_OP = 'DELETE' THEN
        RAISE NOTICE 'Se ha eliminado un cliente. Detalles: %', OLD;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER cliente_trigger
AFTER INSERT OR UPDATE OR DELETE
ON clientes
FOR EACH ROW
EXECUTE FUNCTION cliente_trigger();



CREATE TABLE profesionales (
    id SERIAL ,
    nombre VARCHAR(50),
    apellidos VARCHAR(50),
    especializacion VARCHAR(50),
    email VARCHAR(100),
    telefono VARCHAR(15) ,
    direccion VARCHAR(100),
    estado VARCHAR (10),

   CONSTRAINT PK_profe_id PRIMARY KEY (id) ,
   CONSTRAINT NN_nombre CHECK (nombre IS NOT NULL),
   CONSTRAINT NN_apellidos CHECK (apellidos IS NOT NULL), 
   CONSTRAINT NN_especializacion  CHECK (especializacion IS NOT NULL),
   CONSTRAINT UC_email  UNIQUE (email),
   CONSTRAINT NN_email CHECK (email IS NOT NULL),
   CONSTRAINT NN_telefono CHECK (telefono IS NOT NULL),
   CONSTRAINT NN_direccion CHECK (direccion IS NOT NULL),
   CONSTRAINT NN_estado CHECK (estado IS NOT NULL),
   CONSTRAINT CK_estado CHECK  (estado IN ('activo', 'inactivo'))
);

drop table profesionales;
select * from profesionales;




CREATE TABLE servicios (
    id SERIAL ,
    nombre VARCHAR(100),
    descripcion VARCHAR(200),
	
   CONSTRAINT PK_servi_id PRIMARY KEY (id) ,
   CONSTRAINT NN_nombre CHECK (nombre IS NOT NULL),
   CONSTRAINT NN_descripcion CHECK (descripcion IS NOT NULL));
   
select * from servicios;

