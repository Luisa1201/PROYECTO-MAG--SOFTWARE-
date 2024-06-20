--
-- PostgreSQL database cluster dump
--

-- Started on 2024-06-19 18:07:36

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:dkPBalPCsUPl5MKgahcrZw==$u9rkYLyXhqtbzEipctrVvzaSc9EzGzcgoL33uof+gk4=:1qzyhYSUxiLb1ek6DIAdOfwcQ7fRRVzu2c7N5jaBAS4=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-06-19 18:07:36

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2024-06-19 18:07:37

--
-- PostgreSQL database dump complete
--

--
-- Database "TestBackup" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-06-19 18:07:37

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4793 (class 1262 OID 24639)
-- Name: TestBackup; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "TestBackup" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';


ALTER DATABASE "TestBackup" OWNER TO postgres;

\connect "TestBackup"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 24640)
-- Name: tienda; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tienda;


ALTER SCHEMA tienda OWNER TO postgres;

--
-- TOC entry 4794 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA tienda; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA tienda IS 'Esquema para gestinar la infromación de una cadena de tiendas de ropa.';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 24641)
-- Name: usuario_app; Type: TABLE; Schema: tienda; Owner: postgres
--

CREATE TABLE tienda.usuario_app (
    cod_usuario integer NOT NULL,
    nombre_usuario character varying(30),
    contrasena character varying(20),
    fecha_creacion timestamp without time zone,
    activo boolean DEFAULT true,
    email character varying(30),
    CONSTRAINT ck_activo CHECK ((activo = ANY (ARRAY[true, false]))),
    CONSTRAINT nn_contrasena CHECK ((contrasena IS NOT NULL))
);


ALTER TABLE tienda.usuario_app OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24647)
-- Name: usuario_cod_usuario_seq; Type: SEQUENCE; Schema: tienda; Owner: postgres
--

CREATE SEQUENCE tienda.usuario_cod_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tienda.usuario_cod_usuario_seq OWNER TO postgres;

--
-- TOC entry 4795 (class 0 OID 0)
-- Dependencies: 217
-- Name: usuario_cod_usuario_seq; Type: SEQUENCE OWNED BY; Schema: tienda; Owner: postgres
--

ALTER SEQUENCE tienda.usuario_cod_usuario_seq OWNED BY tienda.usuario_app.cod_usuario;


--
-- TOC entry 4635 (class 2604 OID 24648)
-- Name: usuario_app cod_usuario; Type: DEFAULT; Schema: tienda; Owner: postgres
--

ALTER TABLE ONLY tienda.usuario_app ALTER COLUMN cod_usuario SET DEFAULT nextval('tienda.usuario_cod_usuario_seq'::regclass);


--
-- TOC entry 4786 (class 0 OID 24641)
-- Dependencies: 216
-- Data for Name: usuario_app; Type: TABLE DATA; Schema: tienda; Owner: postgres
--

COPY tienda.usuario_app (cod_usuario, nombre_usuario, contrasena, fecha_creacion, activo, email) FROM stdin;
1	LACOSTA	ACOSTA	2024-03-02 12:28:00	t	LACOSTA@GMAIL.COM
2	JUAN	CARRASCAL	2024-04-02 14:25:09	f	JCARRACAL@GMAIL.COM
3	SOFIA	TORRADO	2024-05-02 14:27:09	f	STORRADO@GMAIL.COM
4	CARLA	MARTINEZ	2024-04-02 14:25:09	t	CMARTINEZ@GMAIL.COM
5	ANGIE	RINCON	2024-04-02 14:25:09	f	ARINCON@GMAIL.COM
6	CAMILA	RIVERA	2024-03-27 15:39:01	t	CRIVERA@GMAIL.COM
\.


--
-- TOC entry 4796 (class 0 OID 0)
-- Dependencies: 217
-- Name: usuario_cod_usuario_seq; Type: SEQUENCE SET; Schema: tienda; Owner: postgres
--

SELECT pg_catalog.setval('tienda.usuario_cod_usuario_seq', 6, true);


--
-- TOC entry 4640 (class 2606 OID 24650)
-- Name: usuario_app pk_cod_usuario; Type: CONSTRAINT; Schema: tienda; Owner: postgres
--

ALTER TABLE ONLY tienda.usuario_app
    ADD CONSTRAINT pk_cod_usuario PRIMARY KEY (cod_usuario);


--
-- TOC entry 4642 (class 2606 OID 24652)
-- Name: usuario_app uc_nombre_usuario; Type: CONSTRAINT; Schema: tienda; Owner: postgres
--

ALTER TABLE ONLY tienda.usuario_app
    ADD CONSTRAINT uc_nombre_usuario UNIQUE (nombre_usuario);


-- Completed on 2024-06-19 18:07:37

--
-- PostgreSQL database dump complete
--

--
-- Database "bdcolegio" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-06-19 18:07:37

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4859 (class 1262 OID 122910)
-- Name: bdcolegio; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE bdcolegio WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';


ALTER DATABASE bdcolegio OWNER TO postgres;

\connect bdcolegio

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 122911)
-- Name: escuela_190000; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA escuela_190000;


ALTER SCHEMA escuela_190000 OWNER TO postgres;

--
-- TOC entry 4860 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA escuela_190000; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA escuela_190000 IS 'gestión de información académica de una escuela de primaria';


--
-- TOC entry 234 (class 1255 OID 122912)
-- Name: audi_prof_func(); Type: FUNCTION; Schema: escuela_190000; Owner: postgres
--

CREATE FUNCTION escuela_190000.audi_prof_func() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare
   BEGIN
IF (TG_OP = 'UPDATE') THEN
      INSERT INTO escuela_190000.audi_profesor 
      (consecutivo, cod_profesor, documento,  nombre1, nombre2, apellido1, apellido2,activo, sexo, sueldo, fecha_ingreso, celular, cod_area, fecha_registro, usuario, acción) 
        VALUES (default, OLD.cod_profesor, OLD.documento,  OLD.nombre1, OLD.nombre2, OLD.apellido1, OLD.apellido2, OLD.activo, OLD.sexo, OLD.sueldo, OLD.fecha_ingreso, OLD.celular, OLD.cod_area, current_timestamp(0),current_user,'U');
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
      INSERT INTO escuela_190000.audi_profesor 
      (consecutivo, cod_profesor, documento,  nombre1, nombre2, apellido1, apellido2,activo, sexo, sueldo, fecha_ingreso, celular, cod_area, fecha_registro, usuario, acción) 
        VALUES (default, OLD.cod_profesor, OLD.documento,  OLD.nombre1, OLD.nombre2, OLD.apellido1, OLD.apellido2, OLD.activo, OLD.sexo, OLD.sueldo, OLD.fecha_ingreso, OLD.celular, OLD.cod_area, current_timestamp(0),current_user,'D');
        RETURN OLD;
    ELSE
        RAISE WARNING '[audi_prof_func] - Other action occurred: %, at %',TG_OP,now();
        RETURN NULL;
    END IF;

EXCEPTION
    WHEN data_exception THEN
        RAISE WARNING '[audi_prof_func] - UDF ERROR [DATA EXCEPTION] - SQLSTATE: %, SQLERRM: %',SQLSTATE,SQLERRM;
        RETURN NULL;
    WHEN unique_violation THEN
        RAISE WARNING '[audi_prof_func] - UDF ERROR [UNIQUE] - SQLSTATE: %, SQLERRM: %',SQLSTATE,SQLERRM;
        RETURN NULL;
    WHEN OTHERS THEN
        RAISE WARNING '[audi_prof_func] - UDF ERROR [OTHER] - SQLSTATE: %, SQLERRM: %',SQLSTATE,SQLERRM;
        RETURN NULL;

    END;
$$;


ALTER FUNCTION escuela_190000.audi_prof_func() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 122913)
-- Name: area; Type: TABLE; Schema: escuela_190000; Owner: postgres
--

CREATE TABLE escuela_190000.area (
    cod_area character varying(2) NOT NULL,
    nombre_area character varying(80),
    CONSTRAINT nn_area_cod_area CHECK ((cod_area IS NOT NULL)),
    CONSTRAINT nn_nombre_area CHECK ((nombre_area IS NOT NULL))
);


ALTER TABLE escuela_190000.area OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 122918)
-- Name: asignatura; Type: TABLE; Schema: escuela_190000; Owner: postgres
--

CREATE TABLE escuela_190000.asignatura (
    curso character varying(2) NOT NULL,
    sigla character varying(3) NOT NULL,
    nombre_asig character varying(30),
    intensidad_horaria integer,
    cod_area character varying(2),
    CONSTRAINT nn_asig_cod_area CHECK ((cod_area IS NOT NULL)),
    CONSTRAINT nn_asig_curso CHECK ((curso IS NOT NULL)),
    CONSTRAINT nn_asig_sigla CHECK ((sigla IS NOT NULL)),
    CONSTRAINT nn_intensidad_horaria CHECK ((intensidad_horaria IS NOT NULL)),
    CONSTRAINT nn_nombre_asig CHECK ((nombre_asig IS NOT NULL))
);


ALTER TABLE escuela_190000.asignatura OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 122926)
-- Name: audi_profesor; Type: TABLE; Schema: escuela_190000; Owner: postgres
--

CREATE TABLE escuela_190000.audi_profesor (
    consecutivo integer NOT NULL,
    cod_profesor character varying(3),
    documento character varying(15),
    nombre1 character varying(20),
    nombre2 character varying(20),
    apellido1 character varying(20),
    apellido2 character varying(20),
    activo character(1),
    sexo character(1),
    sueldo integer,
    fecha_ingreso date,
    celular character varying(20),
    cod_area character varying(2),
    fecha_registro timestamp without time zone,
    usuario character varying(20),
    "acción" character(1)
);


ALTER TABLE escuela_190000.audi_profesor OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 122929)
-- Name: audi_profesor_consecutivo_seq; Type: SEQUENCE; Schema: escuela_190000; Owner: postgres
--

CREATE SEQUENCE escuela_190000.audi_profesor_consecutivo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE escuela_190000.audi_profesor_consecutivo_seq OWNER TO postgres;

--
-- TOC entry 4861 (class 0 OID 0)
-- Dependencies: 219
-- Name: audi_profesor_consecutivo_seq; Type: SEQUENCE OWNED BY; Schema: escuela_190000; Owner: postgres
--

ALTER SEQUENCE escuela_190000.audi_profesor_consecutivo_seq OWNED BY escuela_190000.audi_profesor.consecutivo;


--
-- TOC entry 220 (class 1259 OID 122930)
-- Name: curso; Type: TABLE; Schema: escuela_190000; Owner: postgres
--

CREATE TABLE escuela_190000.curso (
    curso character varying(2) NOT NULL,
    nombre_curso character varying(10),
    CONSTRAINT nn_curso_curso CHECK ((curso IS NOT NULL)),
    CONSTRAINT nn_nombre_curso CHECK ((nombre_curso IS NOT NULL))
);


ALTER TABLE escuela_190000.curso OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 122935)
-- Name: grupo; Type: TABLE; Schema: escuela_190000; Owner: postgres
--

CREATE TABLE escuela_190000.grupo (
    curso character varying(2) NOT NULL,
    sigla character varying(3) NOT NULL,
    grupo character varying(1) NOT NULL,
    cod_profesor character varying(3),
    matriculados integer DEFAULT 0,
    anyo character varying(4) NOT NULL,
    CONSTRAINT nn_anyo CHECK ((anyo IS NOT NULL)),
    CONSTRAINT nn_grupo CHECK ((grupo IS NOT NULL)),
    CONSTRAINT nn_grupo_cod_profesor CHECK ((cod_profesor IS NOT NULL)),
    CONSTRAINT nn_grupo_curso CHECK ((curso IS NOT NULL)),
    CONSTRAINT nn_grupo_sigla CHECK ((sigla IS NOT NULL)),
    CONSTRAINT nn_matriculados CHECK ((matriculados IS NOT NULL))
);


ALTER TABLE escuela_190000.grupo OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 122945)
-- Name: profesor; Type: TABLE; Schema: escuela_190000; Owner: postgres
--

CREATE TABLE escuela_190000.profesor (
    cod_profesor character varying(3) NOT NULL,
    documento character varying(15),
    nombre1 character varying(20),
    nombre2 character varying(20),
    apellido1 character varying(20),
    apellido2 character varying(20),
    activo character(1),
    sexo character(1),
    sueldo integer,
    fecha_ingreso date,
    celular character varying(20),
    cod_area character varying(2),
    CONSTRAINT ck_activo CHECK ((activo = ANY (ARRAY['S'::bpchar, 'N'::bpchar]))),
    CONSTRAINT ck_sexo CHECK ((sexo = ANY (ARRAY['M'::bpchar, 'F'::bpchar]))),
    CONSTRAINT ck_sueldo CHECK ((sueldo > 0)),
    CONSTRAINT nn_activo CHECK ((activo IS NOT NULL)),
    CONSTRAINT nn_apellido1 CHECK ((apellido1 IS NOT NULL)),
    CONSTRAINT nn_celular CHECK ((celular IS NOT NULL)),
    CONSTRAINT nn_documento CHECK ((documento IS NOT NULL)),
    CONSTRAINT nn_fecha_ingreso CHECK ((fecha_ingreso IS NOT NULL)),
    CONSTRAINT nn_nombre1 CHECK ((nombre1 IS NOT NULL)),
    CONSTRAINT nn_prof_cod_area CHECK ((cod_area IS NOT NULL)),
    CONSTRAINT nn_prof_cod_profesor CHECK ((cod_profesor IS NOT NULL)),
    CONSTRAINT nn_sexo CHECK ((sexo IS NOT NULL)),
    CONSTRAINT nn_sueldo CHECK ((sueldo IS NOT NULL))
);


ALTER TABLE escuela_190000.profesor OWNER TO postgres;

--
-- TOC entry 4656 (class 2604 OID 122961)
-- Name: audi_profesor consecutivo; Type: DEFAULT; Schema: escuela_190000; Owner: postgres
--

ALTER TABLE ONLY escuela_190000.audi_profesor ALTER COLUMN consecutivo SET DEFAULT nextval('escuela_190000.audi_profesor_consecutivo_seq'::regclass);


--
-- TOC entry 4847 (class 0 OID 122913)
-- Dependencies: 216
-- Data for Name: area; Type: TABLE DATA; Schema: escuela_190000; Owner: postgres
--

COPY escuela_190000.area (cod_area, nombre_area) FROM stdin;
A1	CIENCIAS NATURALES Y EDUCACIÓN AMBIENTAL
A2	MATEMÁTICAS
A3	CIENCIAS SOCIALES, HISTORIA, GEOGRAFÍA, CONSTITUCIÓN POLÍTICA Y DEMOCRACIA
A4	HUMANIDADES, LENGUA CASTELLANA E IDIOMA EXTRANJERO
A5	EDUCACIÓN RELIGIOSA
A6	EDUCACIÓN ÉTICA Y EN VALORES HUMANOS
A7	EDUCACIÓN FÍSICA, RECREACIÓN Y DEPORTES
A8	EDUCACIÓN ARTÍSTICA Y CULTURAL
A9	TECNOLOGÍA E INFORMÁTICA
\.


--
-- TOC entry 4848 (class 0 OID 122918)
-- Dependencies: 217
-- Data for Name: asignatura; Type: TABLE DATA; Schema: escuela_190000; Owner: postgres
--

COPY escuela_190000.asignatura (curso, sigla, nombre_asig, intensidad_horaria, cod_area) FROM stdin;
04	BIO	BIOLOGIA	4	A1
04	ARI	ARITMETICA	8	A2
04	LEN	LENGUA CASTELLANA	8	A4
04	ING	INGLES	4	A4
04	EDU	EDUCACION FISICA	4	A7
04	MUS	MUSICA	2	A8
04	INF	INFORMATICA	2	A9
04	GEO	GEOGRAFIA	1	A3
04	REL	RELIGION	1	A5
\.


--
-- TOC entry 4849 (class 0 OID 122926)
-- Dependencies: 218
-- Data for Name: audi_profesor; Type: TABLE DATA; Schema: escuela_190000; Owner: postgres
--

COPY escuela_190000.audi_profesor (consecutivo, cod_profesor, documento, nombre1, nombre2, apellido1, apellido2, activo, sexo, sueldo, fecha_ingreso, celular, cod_area, fecha_registro, usuario, "acción") FROM stdin;
1	011	1007912659	KAROL	GISELA	ALVAREZ	LEON	N	F	4800000	1982-01-04	3207619828	A5	2021-04-03 18:10:24	postgres	D
2	012	1091676766	JUANA	\N	ALVAREZ	OROPOMA	N	F	5900000	1978-08-07	3183156890	A3	2021-04-03 18:10:24	postgres	D
3	001	1005073998	MARIA	JOSE	GONZALES	MORALES	S	F	3500000	1998-01-04	3209290211	A1	2021-04-03 18:18:42	postgres	U
4	002	1097668797	EDUARDO	JOSE	MARTINEZ	GONZALES	S	M	3500000	1998-01-04	3015256887	A2	2021-04-03 18:18:42	postgres	U
5	003	1091679282	LUIS	RINCON	GOMEZ	ACEVEDO	S	M	3320000	1999-02-06	3156684551	A3	2021-04-03 18:18:42	postgres	U
6	001	1005073998	MARIA	JOSE	GONZALES	MORALES	S	F	3500000	1998-01-04	3209290211	A1	2021-04-03 18:20:50	postgres	U
7	002	1097668797	EDUARDO	JOSE	MARTINEZ	GONZALES	S	M	3500000	1998-01-04	3015256887	A2	2021-04-03 18:20:50	postgres	U
8	003	1091679282	LUIS	RINCON	GOMEZ	ACEVEDO	S	M	3320000	1999-02-06	3156684551	A3	2021-04-03 18:20:50	postgres	U
9	003	1091679282	LUIS	RINCON	GOMEZ	ACEVEDO	S	M	3652000	1999-02-06	3156684551	A3	2021-06-16 18:34:24	postgres	U
10	001	1005073998	MARIA	JOSE	GONZALES	MORALES	S	F	3850000	1998-01-04	3209290211	A1	2021-06-18 08:44:34	postgres	U
\.


--
-- TOC entry 4851 (class 0 OID 122930)
-- Dependencies: 220
-- Data for Name: curso; Type: TABLE DATA; Schema: escuela_190000; Owner: postgres
--

COPY escuela_190000.curso (curso, nombre_curso) FROM stdin;
01	PRIMERO
02	SEGUNDO
03	TERCERO
04	CUARTO
05	QUINTO
\.


--
-- TOC entry 4852 (class 0 OID 122935)
-- Dependencies: 221
-- Data for Name: grupo; Type: TABLE DATA; Schema: escuela_190000; Owner: postgres
--

COPY escuela_190000.grupo (curso, sigla, grupo, cod_profesor, matriculados, anyo) FROM stdin;
04	REL	B	005	0	2021
04	BIO	A	001	25	2021
04	ARI	A	002	22	2021
04	GEO	A	003	26	2021
04	LEN	A	004	30	2021
04	REL	A	005	27	2021
04	ARI	B	002	22	2021
\.


--
-- TOC entry 4853 (class 0 OID 122945)
-- Dependencies: 222
-- Data for Name: profesor; Type: TABLE DATA; Schema: escuela_190000; Owner: postgres
--

COPY escuela_190000.profesor (cod_profesor, documento, nombre1, nombre2, apellido1, apellido2, activo, sexo, sueldo, fecha_ingreso, celular, cod_area) FROM stdin;
004	1099874030	CRISTIAN	CAMILO	JAIME	CARRILLO	S	M	3000000	2000-08-07	3214366408	A4
005	1193501314	JULIAN	ANDRES	GALLARDO	VERGEL	S	M	2800000	2005-03-08	3116266286	A5
006	1193501315	GABRIELA	\N	FERNANDEZ	LOPEZ	S	F	2300000	2010-01-09	3166631130	A6
007	1091682463	JUAN	CAMILO	LOPEZ	SANCHEZ	S	M	2300000	2010-01-09	3108256681	A7
008	37333878	JOSE	DAVID	SANTIAGO	GALLARDO	S	M	2300000	2010-01-09	3148554454	A8
009	1091681186	ANDRES	CAMILO	ALEMAN	LOPEZ	S	M	2150000	2015-01-20	3220303719	A9
010	1004863136	JORGE	\N	MOSQUERA	MARQUEZ	S	M	2000000	2018-01-28	3126607014	A1
002	1097668797	EDUARDO	JOSE	MARTINEZ	GONZALES	S	M	3850000	1998-01-04	3015256887	A2
003	1091679282	LUIS	RINCON	GOMEZ	ACEVEDO	N	M	3652000	1999-02-06	3156684551	A3
001	1005073998	MARIA	JOSE	GONZALES	MORALES	N	F	3850000	1998-01-04	3209290211	A1
\.


--
-- TOC entry 4862 (class 0 OID 0)
-- Dependencies: 219
-- Name: audi_profesor_consecutivo_seq; Type: SEQUENCE SET; Schema: escuela_190000; Owner: postgres
--

SELECT pg_catalog.setval('escuela_190000.audi_profesor_consecutivo_seq', 10, true);


--
-- TOC entry 4687 (class 2606 OID 122963)
-- Name: area pk_area; Type: CONSTRAINT; Schema: escuela_190000; Owner: postgres
--

ALTER TABLE ONLY escuela_190000.area
    ADD CONSTRAINT pk_area PRIMARY KEY (cod_area);


--
-- TOC entry 4689 (class 2606 OID 122965)
-- Name: asignatura pk_asignatura; Type: CONSTRAINT; Schema: escuela_190000; Owner: postgres
--

ALTER TABLE ONLY escuela_190000.asignatura
    ADD CONSTRAINT pk_asignatura PRIMARY KEY (curso, sigla);


--
-- TOC entry 4691 (class 2606 OID 122967)
-- Name: audi_profesor pk_audi_profesor; Type: CONSTRAINT; Schema: escuela_190000; Owner: postgres
--

ALTER TABLE ONLY escuela_190000.audi_profesor
    ADD CONSTRAINT pk_audi_profesor PRIMARY KEY (consecutivo);


--
-- TOC entry 4693 (class 2606 OID 122969)
-- Name: curso pk_curso; Type: CONSTRAINT; Schema: escuela_190000; Owner: postgres
--

ALTER TABLE ONLY escuela_190000.curso
    ADD CONSTRAINT pk_curso PRIMARY KEY (curso);


--
-- TOC entry 4695 (class 2606 OID 122971)
-- Name: grupo pk_grupo; Type: CONSTRAINT; Schema: escuela_190000; Owner: postgres
--

ALTER TABLE ONLY escuela_190000.grupo
    ADD CONSTRAINT pk_grupo PRIMARY KEY (anyo, grupo, sigla, curso);


--
-- TOC entry 4697 (class 2606 OID 122973)
-- Name: profesor pk_profesor; Type: CONSTRAINT; Schema: escuela_190000; Owner: postgres
--

ALTER TABLE ONLY escuela_190000.profesor
    ADD CONSTRAINT pk_profesor PRIMARY KEY (cod_profesor);


--
-- TOC entry 4703 (class 2620 OID 122974)
-- Name: profesor trg_grabar_audi_prof; Type: TRIGGER; Schema: escuela_190000; Owner: postgres
--

CREATE TRIGGER trg_grabar_audi_prof BEFORE DELETE OR UPDATE ON escuela_190000.profesor FOR EACH ROW EXECUTE FUNCTION escuela_190000.audi_prof_func();


--
-- TOC entry 4698 (class 2606 OID 122975)
-- Name: asignatura fk_area_asignatura; Type: FK CONSTRAINT; Schema: escuela_190000; Owner: postgres
--

ALTER TABLE ONLY escuela_190000.asignatura
    ADD CONSTRAINT fk_area_asignatura FOREIGN KEY (cod_area) REFERENCES escuela_190000.area(cod_area);


--
-- TOC entry 4702 (class 2606 OID 122980)
-- Name: profesor fk_area_profesor; Type: FK CONSTRAINT; Schema: escuela_190000; Owner: postgres
--

ALTER TABLE ONLY escuela_190000.profesor
    ADD CONSTRAINT fk_area_profesor FOREIGN KEY (cod_area) REFERENCES escuela_190000.area(cod_area);


--
-- TOC entry 4700 (class 2606 OID 122985)
-- Name: grupo fk_asignatura_grupo; Type: FK CONSTRAINT; Schema: escuela_190000; Owner: postgres
--

ALTER TABLE ONLY escuela_190000.grupo
    ADD CONSTRAINT fk_asignatura_grupo FOREIGN KEY (curso, sigla) REFERENCES escuela_190000.asignatura(curso, sigla);


--
-- TOC entry 4699 (class 2606 OID 122990)
-- Name: asignatura fk_curso_asignatura; Type: FK CONSTRAINT; Schema: escuela_190000; Owner: postgres
--

ALTER TABLE ONLY escuela_190000.asignatura
    ADD CONSTRAINT fk_curso_asignatura FOREIGN KEY (curso) REFERENCES escuela_190000.curso(curso);


--
-- TOC entry 4701 (class 2606 OID 122995)
-- Name: grupo fk_profesor_grupo; Type: FK CONSTRAINT; Schema: escuela_190000; Owner: postgres
--

ALTER TABLE ONLY escuela_190000.grupo
    ADD CONSTRAINT fk_profesor_grupo FOREIGN KEY (cod_profesor) REFERENCES escuela_190000.profesor(cod_profesor);


-- Completed on 2024-06-19 18:07:38

--
-- PostgreSQL database dump complete
--

--
-- Database "bdempresa" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-06-19 18:07:38

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4786 (class 1262 OID 90189)
-- Name: bdempresa; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE bdempresa WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';


ALTER DATABASE bdempresa OWNER TO postgres;

\connect bdempresa

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 90190)
-- Name: login; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA login;


ALTER SCHEMA login OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 90203)
-- Name: usuario; Type: TABLE; Schema: login; Owner: postgres
--

CREATE TABLE login.usuario (
    usuario character varying(30),
    correo character varying(20),
    identificacion character varying(20),
    direccion character varying(40),
    contrasena character varying(20),
    CONSTRAINT nn_contrasena CHECK ((contrasena IS NOT NULL))
);


ALTER TABLE login.usuario OWNER TO postgres;

--
-- TOC entry 4780 (class 0 OID 90203)
-- Dependencies: 216
-- Data for Name: usuario; Type: TABLE DATA; Schema: login; Owner: postgres
--

COPY login.usuario (usuario, correo, identificacion, direccion, contrasena) FROM stdin;
Jose	Jose@gmail.com	10067282	CL 168 A 37 CA 36	Jose12345
Andrea	andrea@gmail.com	10067282	CL 168 A 37 CA 40	Andrea
Camilo	camilo@gmail.com	3456789	Carrera 12 	camilo12
Camilo Mora	camilom@gmail.com	234567890	Carrera 14	Camilo12
\.


--
-- TOC entry 4636 (class 2606 OID 90208)
-- Name: usuario uc_usuario; Type: CONSTRAINT; Schema: login; Owner: postgres
--

ALTER TABLE ONLY login.usuario
    ADD CONSTRAINT uc_usuario UNIQUE (usuario);


-- Completed on 2024-06-19 18:07:38

--
-- PostgreSQL database dump complete
--

--
-- Database "dbmag" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-06-19 18:07:38

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4865 (class 1262 OID 32816)
-- Name: dbmag; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE dbmag WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';


ALTER DATABASE dbmag OWNER TO postgres;

\connect dbmag

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 225 (class 1255 OID 98415)
-- Name: cliente_trigger(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.cliente_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION public.cliente_trigger() OWNER TO postgres;

--
-- TOC entry 237 (class 1255 OID 81976)
-- Name: insertar_usuario_condicional(character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.insertar_usuario_condicional(nombre_param character varying, correo_param character varying, usuario_param character varying, contrasena_param character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
    id_usuario INTEGER;
BEGIN
    -- Verificar restricciones de longitud para nombre y correo
    IF (char_length(nombre_param) >= 3 AND
        char_length(correo_param) >= 5 AND
        char_length(usuario_param) >= 3 AND
        char_length(contrasena_param) >= 3) THEN
        -- Iniciar transacción
        BEGIN
            -- Insertar el registro
            INSERT INTO usuarios (nombre, correo, usuario, contrasena) VALUES (nombre_param, correo_param, usuario_param, contrasena_param) RETURNING id INTO id_usuario;
            -- Confirmar la transacción
            COMMIT;
            -- Devolver verdadero indicando éxito
            RETURN TRUE;
        EXCEPTION WHEN others THEN
            -- Revertir la transacción si ocurre un error
            ROLLBACK;
            -- Devolver falso indicando fallo
            RETURN FALSE;
        END;
    ELSE
        -- Devolver falso si las restricciones no se cumplen
        RETURN FALSE;
    END IF;
END;
$$;


ALTER FUNCTION public.insertar_usuario_condicional(nombre_param character varying, correo_param character varying, usuario_param character varying, contrasena_param character varying) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 123047)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nombre character varying(50),
    apellidos character varying(50),
    cedula character varying(20),
    nit character varying(15),
    email character varying(100),
    telefono character varying(15),
    direccion character varying(100),
    estado character varying(10),
    CONSTRAINT ck_estado CHECK (((estado)::text = ANY ((ARRAY['activo'::character varying, 'inactivo'::character varying])::text[]))),
    CONSTRAINT nn_apellidos CHECK ((apellidos IS NOT NULL)),
    CONSTRAINT nn_cedula CHECK ((cedula IS NOT NULL)),
    CONSTRAINT nn_direccion CHECK ((direccion IS NOT NULL)),
    CONSTRAINT nn_email CHECK ((email IS NOT NULL)),
    CONSTRAINT nn_estado CHECK ((estado IS NOT NULL)),
    CONSTRAINT nn_nit CHECK ((nit IS NOT NULL)),
    CONSTRAINT nn_nombre CHECK ((nombre IS NOT NULL)),
    CONSTRAINT nn_telefono CHECK ((telefono IS NOT NULL))
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 123046)
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_id_seq OWNER TO postgres;

--
-- TOC entry 4866 (class 0 OID 0)
-- Dependencies: 219
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- TOC entry 222 (class 1259 OID 123068)
-- Name: profesionales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profesionales (
    id integer NOT NULL,
    nombre character varying(50),
    apellidos character varying(50),
    especializacion character varying(50),
    email character varying(100),
    telefono character varying(15),
    direccion character varying(100),
    estado character varying(10),
    CONSTRAINT ck_estado CHECK (((estado)::text = ANY ((ARRAY['activo'::character varying, 'inactivo'::character varying])::text[]))),
    CONSTRAINT nn_apellidos CHECK ((apellidos IS NOT NULL)),
    CONSTRAINT nn_direccion CHECK ((direccion IS NOT NULL)),
    CONSTRAINT nn_email CHECK ((email IS NOT NULL)),
    CONSTRAINT nn_especializacion CHECK ((especializacion IS NOT NULL)),
    CONSTRAINT nn_estado CHECK ((estado IS NOT NULL)),
    CONSTRAINT nn_nombre CHECK ((nombre IS NOT NULL)),
    CONSTRAINT nn_telefono CHECK ((telefono IS NOT NULL))
);


ALTER TABLE public.profesionales OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 123067)
-- Name: profesionales_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profesionales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.profesionales_id_seq OWNER TO postgres;

--
-- TOC entry 4867 (class 0 OID 0)
-- Dependencies: 221
-- Name: profesionales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profesionales_id_seq OWNED BY public.profesionales.id;


--
-- TOC entry 224 (class 1259 OID 131073)
-- Name: servicios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servicios (
    id integer NOT NULL,
    nombre character varying(100),
    descripcion character varying(200),
    CONSTRAINT nn_descripcion CHECK ((descripcion IS NOT NULL)),
    CONSTRAINT nn_nombre CHECK ((nombre IS NOT NULL))
);


ALTER TABLE public.servicios OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 131072)
-- Name: servicios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servicios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.servicios_id_seq OWNER TO postgres;

--
-- TOC entry 4868 (class 0 OID 0)
-- Dependencies: 223
-- Name: servicios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.servicios_id_seq OWNED BY public.servicios.id;


--
-- TOC entry 216 (class 1259 OID 123021)
-- Name: tareas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tareas (
    id integer NOT NULL,
    nombre_tarea character varying(255) NOT NULL,
    fecha_tarea date NOT NULL
);


ALTER TABLE public.tareas OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 123020)
-- Name: tareas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tareas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tareas_id_seq OWNER TO postgres;

--
-- TOC entry 4869 (class 0 OID 0)
-- Dependencies: 215
-- Name: tareas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tareas_id_seq OWNED BY public.tareas.id;


--
-- TOC entry 218 (class 1259 OID 123029)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre character varying(50),
    correo character varying(50),
    usuario character varying(20),
    contrasena character varying(20),
    CONSTRAINT ck_contrasena CHECK ((char_length((contrasena)::text) >= 3)),
    CONSTRAINT ck_correo CHECK ((char_length((correo)::text) >= 5)),
    CONSTRAINT ck_nombre CHECK ((char_length((nombre)::text) >= 3)),
    CONSTRAINT ck_usuario CHECK ((char_length((usuario)::text) >= 3)),
    CONSTRAINT nn_contrasena CHECK ((contrasena IS NOT NULL)),
    CONSTRAINT nn_correo CHECK ((correo IS NOT NULL)),
    CONSTRAINT nn_nombre CHECK ((nombre IS NOT NULL))
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 123028)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 4870 (class 0 OID 0)
-- Dependencies: 217
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 4658 (class 2604 OID 123050)
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- TOC entry 4659 (class 2604 OID 123071)
-- Name: profesionales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesionales ALTER COLUMN id SET DEFAULT nextval('public.profesionales_id_seq'::regclass);


--
-- TOC entry 4660 (class 2604 OID 131076)
-- Name: servicios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicios ALTER COLUMN id SET DEFAULT nextval('public.servicios_id_seq'::regclass);


--
-- TOC entry 4656 (class 2604 OID 123024)
-- Name: tareas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tareas ALTER COLUMN id SET DEFAULT nextval('public.tareas_id_seq'::regclass);


--
-- TOC entry 4657 (class 2604 OID 123032)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 4855 (class 0 OID 123047)
-- Dependencies: 220
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id, nombre, apellidos, cedula, nit, email, telefono, direccion, estado) FROM stdin;
1	Laura	Martinez	1005678925	17882824	lauran@gmail.com	3278453124	Carrera 19	activo
\.


--
-- TOC entry 4857 (class 0 OID 123068)
-- Dependencies: 222
-- Data for Name: profesionales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profesionales (id, nombre, apellidos, especializacion, email, telefono, direccion, estado) FROM stdin;
1	Laura	Martinez	Contadora	laura@gmail.com	23456756	Carrera 15	activo
2	Julian	Hernandéz	Contadoror	julianh@gmail.com	3091735257	Carrera 14	activo
\.


--
-- TOC entry 4859 (class 0 OID 131073)
-- Dependencies: 224
-- Data for Name: servicios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servicios (id, nombre, descripcion) FROM stdin;
1	Contables	Facturación electrónica
2	Tributario	Impuesto
\.


--
-- TOC entry 4851 (class 0 OID 123021)
-- Dependencies: 216
-- Data for Name: tareas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tareas (id, nombre_tarea, fecha_tarea) FROM stdin;
\.


--
-- TOC entry 4853 (class 0 OID 123029)
-- Dependencies: 218
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, nombre, correo, usuario, contrasena) FROM stdin;
1	Mag Asesorías Consultorías SAS	mag@gmail.com	MAG	Mag1234
\.


--
-- TOC entry 4871 (class 0 OID 0)
-- Dependencies: 219
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 1, true);


--
-- TOC entry 4872 (class 0 OID 0)
-- Dependencies: 221
-- Name: profesionales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profesionales_id_seq', 2, true);


--
-- TOC entry 4873 (class 0 OID 0)
-- Dependencies: 223
-- Name: servicios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servicios_id_seq', 2, true);


--
-- TOC entry 4874 (class 0 OID 0)
-- Dependencies: 215
-- Name: tareas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tareas_id_seq', 1, false);


--
-- TOC entry 4875 (class 0 OID 0)
-- Dependencies: 217
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 1, true);


--
-- TOC entry 4696 (class 2606 OID 123061)
-- Name: clientes pk_cli_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT pk_cli_id PRIMARY KEY (id);


--
-- TOC entry 4690 (class 2606 OID 123041)
-- Name: usuarios pk_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT pk_id PRIMARY KEY (id);


--
-- TOC entry 4702 (class 2606 OID 123081)
-- Name: profesionales pk_profe_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesionales
    ADD CONSTRAINT pk_profe_id PRIMARY KEY (id);


--
-- TOC entry 4706 (class 2606 OID 131080)
-- Name: servicios pk_servi_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicios
    ADD CONSTRAINT pk_servi_id PRIMARY KEY (id);


--
-- TOC entry 4688 (class 2606 OID 123026)
-- Name: tareas tareas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tareas
    ADD CONSTRAINT tareas_pkey PRIMARY KEY (id);


--
-- TOC entry 4698 (class 2606 OID 123063)
-- Name: clientes uc_cedula; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT uc_cedula UNIQUE (cedula);


--
-- TOC entry 4692 (class 2606 OID 123043)
-- Name: usuarios uc_correo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT uc_correo UNIQUE (correo);


--
-- TOC entry 4704 (class 2606 OID 123083)
-- Name: profesionales uc_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesionales
    ADD CONSTRAINT uc_email UNIQUE (email);


--
-- TOC entry 4700 (class 2606 OID 123065)
-- Name: clientes uc_nit; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT uc_nit UNIQUE (nit);


--
-- TOC entry 4694 (class 2606 OID 123045)
-- Name: usuarios uc_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT uc_usuario UNIQUE (usuario);


-- Completed on 2024-06-19 18:07:38

--
-- PostgreSQL database dump complete
--

--
-- Database "dbmagAsesorias" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-06-19 18:07:39

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4790 (class 1262 OID 32783)
-- Name: dbmagAsesorias; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "dbmagAsesorias" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';


ALTER DATABASE "dbmagAsesorias" OWNER TO postgres;

\connect "dbmagAsesorias"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 32807)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    cod_usuario integer NOT NULL,
    usuario character varying(30),
    contrasena character varying(30),
    CONSTRAINT nn_contrasena CHECK ((contrasena IS NOT NULL))
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 32806)
-- Name: usuarios_cod_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_cod_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_cod_usuario_seq OWNER TO postgres;

--
-- TOC entry 4791 (class 0 OID 0)
-- Dependencies: 215
-- Name: usuarios_cod_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_cod_usuario_seq OWNED BY public.usuarios.cod_usuario;


--
-- TOC entry 4634 (class 2604 OID 32810)
-- Name: usuarios cod_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN cod_usuario SET DEFAULT nextval('public.usuarios_cod_usuario_seq'::regclass);


--
-- TOC entry 4784 (class 0 OID 32807)
-- Dependencies: 216
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (cod_usuario, usuario, contrasena) FROM stdin;
1	magasesorias@gmail.com	1234
2	adminis@gmail.com	9876
\.


--
-- TOC entry 4792 (class 0 OID 0)
-- Dependencies: 215
-- Name: usuarios_cod_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_cod_usuario_seq', 2, true);


--
-- TOC entry 4637 (class 2606 OID 32813)
-- Name: usuarios pk_cod_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT pk_cod_usuario PRIMARY KEY (cod_usuario);


--
-- TOC entry 4639 (class 2606 OID 32815)
-- Name: usuarios uc_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT uc_usuario UNIQUE (usuario);


-- Completed on 2024-06-19 18:07:39

--
-- PostgreSQL database dump complete
--

--
-- Database "dbphp" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-06-19 18:07:39

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4790 (class 1262 OID 32907)
-- Name: dbphp; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE dbphp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';


ALTER DATABASE dbphp OWNER TO postgres;

\connect dbphp

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 32912)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    cod_usuario integer NOT NULL,
    usuario character varying(45),
    contrasena character varying(45),
    CONSTRAINT nn_contrasena CHECK ((contrasena IS NOT NULL))
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 32911)
-- Name: usuarios_cod_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_cod_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_cod_usuario_seq OWNER TO postgres;

--
-- TOC entry 4791 (class 0 OID 0)
-- Dependencies: 215
-- Name: usuarios_cod_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_cod_usuario_seq OWNED BY public.usuarios.cod_usuario;


--
-- TOC entry 4634 (class 2604 OID 32915)
-- Name: usuarios cod_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN cod_usuario SET DEFAULT nextval('public.usuarios_cod_usuario_seq'::regclass);


--
-- TOC entry 4784 (class 0 OID 32912)
-- Dependencies: 216
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (cod_usuario, usuario, contrasena) FROM stdin;
1	lozano	191754
\.


--
-- TOC entry 4792 (class 0 OID 0)
-- Dependencies: 215
-- Name: usuarios_cod_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_cod_usuario_seq', 33, true);


--
-- TOC entry 4637 (class 2606 OID 32918)
-- Name: usuarios pk_cod_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT pk_cod_usuario PRIMARY KEY (cod_usuario);


--
-- TOC entry 4639 (class 2606 OID 32920)
-- Name: usuarios uc_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT uc_usuario UNIQUE (usuario);


-- Completed on 2024-06-19 18:07:39

--
-- PostgreSQL database dump complete
--

--
-- Database "dbpostgre" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-06-19 18:07:39

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4855 (class 1262 OID 57349)
-- Name: dbpostgre; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE dbpostgre WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';


ALTER DATABASE dbpostgre OWNER TO postgres;

\connect dbpostgre

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 57350)
-- Name: tienda; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tienda;


ALTER SCHEMA tienda OWNER TO postgres;

--
-- TOC entry 225 (class 1255 OID 57439)
-- Name: subtotal(); Type: FUNCTION; Schema: tienda; Owner: postgres
--

CREATE FUNCTION tienda.subtotal() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare
	p numeric;d numeric;su numeric;vd numeric;
	BEGIN
		-- Chequer cantidad null
		IF NEW.cantidad IS NULL THEN
			RAISE EXCEPTION '% Cantidad no puede ser nulo', NEW.cod_articulo;
		END IF;
		select valor into p from tienda.articulo
		where cod_articulo=NEW.cod_articulo;
		
		d:= NEW.descuento/100;
		su:= NEW.cantidad*p;
		vd:= round((su*d),2);
		NEW.precio_venta := p;
		NEW.subtotal := (su-vd);
		NEW.vlr_descuento := vd;
		RETURN NEW;
		END;
$$;


ALTER FUNCTION tienda.subtotal() OWNER TO postgres;

--
-- TOC entry 226 (class 1255 OID 57441)
-- Name: total(); Type: FUNCTION; Schema: tienda; Owner: postgres
--

CREATE FUNCTION tienda.total() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare
	sb numeric;
	de numeric;
	BEGIN 
	select sum(subtotal), sum(vlr_descuento) into sb, de
	from tienda.detalle
	where consecutivo=NEW.consecutivo;
	
	update tienda.factura set total=sb, descuento=de
	where consecutivo=NEW.consecutivo;
	RETURN NEW;
	END;
$$;


ALTER FUNCTION tienda.total() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 57389)
-- Name: articulo; Type: TABLE; Schema: tienda; Owner: postgres
--

CREATE TABLE tienda.articulo (
    cod_articulo character varying(4) NOT NULL,
    descripcion character varying(100),
    valor integer,
    talla character varying(3),
    color character varying(20),
    nit character varying(20),
    CONSTRAINT ck_talla CHECK (((talla)::text = ANY ((ARRAY['S'::character varying, 'M'::character varying, 'L'::character varying, 'XL'::character varying, 'XXL'::character varying])::text[]))),
    CONSTRAINT ck_valor CHECK ((valor > 0)),
    CONSTRAINT nn_descripcion CHECK ((descripcion IS NOT NULL))
);


ALTER TABLE tienda.articulo OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 57366)
-- Name: barrio; Type: TABLE; Schema: tienda; Owner: postgres
--

CREATE TABLE tienda.barrio (
    cod_comuna character varying(2) NOT NULL,
    cod_barrio character varying(2) NOT NULL,
    nombre character varying(40),
    CONSTRAINT nn_nombre CHECK ((nombre IS NOT NULL))
);


ALTER TABLE tienda.barrio OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 57377)
-- Name: cliente; Type: TABLE; Schema: tienda; Owner: postgres
--

CREATE TABLE tienda.cliente (
    documento character varying(15) NOT NULL,
    nombre1 character varying(15),
    nombre2 character varying(15),
    apellido1 character varying(15),
    apellido2 character varying(15),
    direccion character varying(40),
    sexo character(1),
    celular character varying(15),
    email character varying(30),
    cod_comuna character varying(2),
    cod_barrio character varying(2),
    CONSTRAINT ck_sexo CHECK ((sexo = ANY (ARRAY['M'::bpchar, 'F'::bpchar]))),
    CONSTRAINT nn_celuar CHECK ((celular IS NOT NULL))
);


ALTER TABLE tienda.cliente OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 57351)
-- Name: comuna; Type: TABLE; Schema: tienda; Owner: postgres
--

CREATE TABLE tienda.comuna (
    cod_comuna character varying(2) NOT NULL,
    nombre character varying(40),
    kms_2 numeric,
    CONSTRAINT nn_nombre CHECK ((nombre IS NOT NULL))
);


ALTER TABLE tienda.comuna OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 57419)
-- Name: detalle; Type: TABLE; Schema: tienda; Owner: postgres
--

CREATE TABLE tienda.detalle (
    consecutivo integer NOT NULL,
    ordinal character varying(2) NOT NULL,
    cod_articulo character varying(4),
    cantidad integer,
    precio_venta integer,
    subtotal integer,
    descuento numeric,
    vlr_descuento numeric,
    CONSTRAINT ck_cantidad CHECK ((cantidad > 0)),
    CONSTRAINT nn_ordinal CHECK ((ordinal IS NOT NULL))
);


ALTER TABLE tienda.detalle OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 57418)
-- Name: detalle_consecutivo_seq; Type: SEQUENCE; Schema: tienda; Owner: postgres
--

CREATE SEQUENCE tienda.detalle_consecutivo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tienda.detalle_consecutivo_seq OWNER TO postgres;

--
-- TOC entry 4856 (class 0 OID 0)
-- Dependencies: 223
-- Name: detalle_consecutivo_seq; Type: SEQUENCE OWNED BY; Schema: tienda; Owner: postgres
--

ALTER SEQUENCE tienda.detalle_consecutivo_seq OWNED BY tienda.detalle.consecutivo;


--
-- TOC entry 222 (class 1259 OID 57403)
-- Name: factura; Type: TABLE; Schema: tienda; Owner: postgres
--

CREATE TABLE tienda.factura (
    consecutivo integer NOT NULL,
    fecha date,
    documento character varying(15),
    descuento numeric,
    total numeric,
    CONSTRAINT nn_fecha CHECK ((fecha IS NOT NULL))
);


ALTER TABLE tienda.factura OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 57402)
-- Name: factura_consecutivo_seq; Type: SEQUENCE; Schema: tienda; Owner: postgres
--

CREATE SEQUENCE tienda.factura_consecutivo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tienda.factura_consecutivo_seq OWNER TO postgres;

--
-- TOC entry 4857 (class 0 OID 0)
-- Dependencies: 221
-- Name: factura_consecutivo_seq; Type: SEQUENCE OWNED BY; Schema: tienda; Owner: postgres
--

ALTER SEQUENCE tienda.factura_consecutivo_seq OWNED BY tienda.factura.consecutivo;


--
-- TOC entry 217 (class 1259 OID 57359)
-- Name: proveedor; Type: TABLE; Schema: tienda; Owner: postgres
--

CREATE TABLE tienda.proveedor (
    nit character varying(20) NOT NULL,
    nombre character varying(20),
    direccion character varying(40),
    celular character varying(15),
    CONSTRAINT nn_celular CHECK ((celular IS NOT NULL)),
    CONSTRAINT nn_nombre CHECK ((nombre IS NOT NULL))
);


ALTER TABLE tienda.proveedor OWNER TO postgres;

--
-- TOC entry 4663 (class 2604 OID 57422)
-- Name: detalle consecutivo; Type: DEFAULT; Schema: tienda; Owner: postgres
--

ALTER TABLE ONLY tienda.detalle ALTER COLUMN consecutivo SET DEFAULT nextval('tienda.detalle_consecutivo_seq'::regclass);


--
-- TOC entry 4662 (class 2604 OID 57406)
-- Name: factura consecutivo; Type: DEFAULT; Schema: tienda; Owner: postgres
--

ALTER TABLE ONLY tienda.factura ALTER COLUMN consecutivo SET DEFAULT nextval('tienda.factura_consecutivo_seq'::regclass);


--
-- TOC entry 4845 (class 0 OID 57389)
-- Dependencies: 220
-- Data for Name: articulo; Type: TABLE DATA; Schema: tienda; Owner: postgres
--

COPY tienda.articulo (cod_articulo, descripcion, valor, talla, color, nit) FROM stdin;
1000	Cuffed Drawstring Overalls	75000	S	NEGRO	800333222
1001	Ankle Socks	20200	M	ROSADO	800777897
1002	High-Rise Knit Leggings	16200	XL	GRIS	800345800
1003	Corduroy Mini Skirt	60600	M	NARANJA	800789456
1004	Camison	16200	L	ROJO	800777897
1005	Faux Shearling-Trim Denim Jacket	141400	M	CREAMA	800789456
1006	Grid Print Skirt	80800	L	NEGRO	800333222
1007	Faux Patent Leather Platform Oxfords	121200	XL	NEGRO	900565780
1008	Plush Colorblock Pouch	36000	M	NEGRO	800777897
1009	Cutout Sleeve Sweater	153600	S	MARFIL	900565780
1010	Corduroy Mini Skirt	60600	S	MARRON	800789456
1011	Floral Print Mini Dress	101000	M	ORO	800777897
1012	Pinstriped Denim Suspender Pants	121200	S	NEGRO	900565780
1013	Worldwide Graphic Tee	40400	L	ROJO	900565780
1014	Faux Suede Tee	72700	XL	MARRON	800345800
1015	Falda	72800	S	ROJO	900565780
1016	Vaqueros pitillo desgastados	80900	M	GRIS	900565780
1017	Camiseta larga de felpa francesa	48500	L	NEGRO	900565780
1018	Camiseta con estampado de loro	52200	L	BLANCO	800777897
1019	Pantalones ajustados con cordon	72800	S	MARRON	900565780
1020	Top de manga larga para ninas	60600	S	ROJO	800333222
1021	Mini vestido de terciopelo plisado	88900	M	NEGRO	900565780
1022	Mini vestido de terciopelo fruncido	113200	L	VERDE	800789456
1023	Cami de mezcla de algodon	11800	M	BLANCO	800777897
1024	Zapatillas K-Swiss Altezo para hombre	262700	XL	BLANCO	900565780
1025	Top de punto	92900	M	ROJO	900565780
1026	Sueter de punto acanalado grueso	80800	S	AZUL	800587444
1027	Sueter acanalado con cuello simulado	72700	S	ORO	900565780
1028	Mini vestido de punto	72800	M	GRIS	800777897
1029	Blusa manga arga	61800	L	GRIS	900565780
1030	Marled Foldover Beanie	24200	L	GRIS	900565780
1031	Advertencia Graphic Dad Cap	40000	S	NEGRO	800587444
1032	Tinted Cutout Sunglasses	24200	M	NEGRO	900565780
1033	Men Wallet Curb Chain	32300	XL	PLATA	800789456
1034	Do Not Touch Embroidered Graphic	101000	M	BLANCO	800777897
1035	Striped-Trim Drawstring Shorts	72700	L	NEGRO	900565780
1036	Racing Graphic Wind Shorts	80400	L	BLANCO	900565780
1037	French Terry Hoodie	48500	S	BALNCO	800333222
1038	Varsity Striped Hoodie	48500	L	BALNCO	900565780
1039	Camo-Sleeve Raglan Tee	52000	XL	ROJO	900565780
1040	Chunky cable	153600	S	MORADO	800789456
1041	Chenille Knit	52900	M	NARANJA	800777897
1042	Ribbed Knit Swater	61000	L	GRIS	900565780
1043	Ribbed knit bodysuit featuring	40700	S	NEGRO	800587444
1045	Mameluco de tiras 	56900	M	GRIS	900565780
1046	Pantalones con cinturon acanalado	170700	S	ROJO	800777897
1047	Top corto acanalado con hombros 	101700	S	ROJO	900565780
1048	Sudadera con estampado de camuflaje 	72800	L	NARANJA	800789456
1049	Jersey de media cremallera 	101200	S	MORADO	800333222
1050	Sueter de manga recortada	153600	S	AZUL	900565780
1051	Chaqueta larga con capucha	194000	M	BLANCO	800777897
1052	Botas	101700	L	NARANJA	900565780
1053	zapatillas K-Swiss 	81300	M	AZUL	900565780
1054	Polo	113800	S	ROSADO	800587444
1055	Men K-Swiss Memory Foam Sneakers	223600	XL	AZUL	900565780
1056	High Voltage Graphic Hoodie	121600	L	ROJO	800656650
1057	Men Tinted Sunglasses	24400	S	NEGRO	900565780
1058	Plus Size Sculpted Ripped Knee Jeans	141900	M	ROJO	800777897
1059	Nylon Mini	52500	L	ROJO	900565780
1060	Correa	101600	M	NEGRO	800777897
1061	Minivestido de tul satinado	113800	S	ROJO	800587444
1062	Jeans acampanados de tiro alto	142300	L	ROJO	900565780
1063	Body acanalado con cordones	81300	S	ROJO	800656650
1064	Brillo labial de alto brillo	73200	S	ROJO	800333222
1044	Girls Panda Print Ankle Socks (Kids)	8100	M	ROJO	900565780
\.


--
-- TOC entry 4843 (class 0 OID 57366)
-- Dependencies: 218
-- Data for Name: barrio; Type: TABLE DATA; Schema: tienda; Owner: postgres
--

COPY tienda.barrio (cod_comuna, cod_barrio, nombre) FROM stdin;
01	01	SAN FRANCISCO
04	02	JUAN XXIII
02	03	CRISTO REY
05	04	MARABELITO
03	05	LOS ALMENDROS
02	06	CAMINO REAL
05	07	LA PRIMAVERA
05	08	LOS LAGOS
04	09	EL DORADO
05	10	PRIMERO DE MAYO
02	11	ACOLSURE
05	12	BUENOS AIRES
05	13	LLANADAS
06	14	SANTA CLARA
02	15	EL CARMEN
06	16	SAUCES
\.


--
-- TOC entry 4844 (class 0 OID 57377)
-- Dependencies: 219
-- Data for Name: cliente; Type: TABLE DATA; Schema: tienda; Owner: postgres
--

COPY tienda.cliente (documento, nombre1, nombre2, apellido1, apellido2, direccion, sexo, celular, email, cod_comuna, cod_barrio) FROM stdin;
27760635	EDOCILDA	\N	AREVALO	DE CLARO	MZ 7 CASA 10 PISO2	F	3195289869	ZOLANLLYMOLINA@GMAIL.COM 	01	01
1017330259	GINNA	PAOLA	CLARO	GARCIA	PROMESA DE DIOS	F	3214748970	GPCLAROG@GMAIL.COM 	01	01
1023564789	WILMAR 	FRANCISCO	MAYOR	QUINTERO	CL8 #3-28	M	3296519744	SUPERCK@GMAIL.COM	01	01
1024578123	JHOEL 	JOSE	CONSUEGRA	DIAZ	CL8 #3-30	M	3235632744	SINTI@GMAIL.COM	01	01
1035689478	KEVIN	JOSE	NUNES	MUNES	CL8 #3-26	M	3435919744	PACK@GMAIL.COM	01	01
1042378976	MATEO	MICHEL	VARGAS	DIAZ	CL8 #9-34	M	3142587981	taringa@gmail.com	01	01
1052169814	JUAN	FERNANDO	MAYORCA	HERNANDEZ	CL8 #9-36	M	3142507986	elsenor@gmail.com	01	01
1064542398	NICOLAS	\N	MADURO	MEJIA	CALLE 11B 28 e 64	M	3125253887	NICOLAS@UFPSO.EDU.CO	01	01
1091645648	QUIRICU	\N	LOPEZ 	CUESTA	CALLE 54	M	3153264285	QUIRICU@UFPSO.EDU.CO	01	01
1091645789	YARID	MARIA 	QUINTERO	SCUTMAN 	PRIMAVERA	F	5671254	YARID@UFPSO.EDU.CO	01	01
1091675001	MARIA 	DAYANA	ANTOLINEZ	SUAREZ	CRA 24E #18-26	F	3203863010	SUAREZ@UFPSO.EDU.CO	01	01
1091678801	CARLOS	JOSE	LOPEZ	AVILA	CALLE 65 CRR33 SANTA CLARA	M	3208547890	CARLITOSPAPI@GMAIL.COM	01	01
1091680152	MARIA	JOSE	RAMOS	PEREZ	CRA 20B # 16-22	F	3101670631	MJRAMOP@UFPSO.EDU.CO	01	01
1095843746	JHOEL	\N	CASTRO	AMAYA	CRA  23#43-34	M	3013726493	JHOEL@UFPSO.EDU.CO	01	01
7481956235	KEVIN	\N	CUESTAS	JIMENEZ	Av. Ciudad de Cali No. 6C-09	M	4023620150	kcuestasj@gmail.com	01	01
37331838	REINA	DIOSMIRA	CLARO	AREVALO	MZ 7 CASA 10 PISO2	F	3182170718	REBOS30@HOTMAIL.COM 	04	02
1023456789	YAN	LEANDRO	PEDROSO	DRAXLER	CL8 #3-29	M	3274119744	ELSENOR@GMAIL.COM	04	02
1091440121	ANDREA	JISED	CRIADO 	AMAYA	CALLE 12 #15-24	F	3147859620	andreac@hotmail.com	04	02
1091674998	CARLOS	CAMILO	PEREZ	PEREZ	CRA 24E #18-23	M	3203863007	PEREZ@UFPSO.EDU.CO	04	02
1091678306	PEDRO	MARIA	CAVIEDES	CAVIEDES	ABREGO	M	3275468975	PE@GMAIL.COM	04	02
1091680156	NATALIA	MARIA	MANZANO	MORA	CRA 21C # 23-03	F	3027914871	NMMANZANOM@UFPSO.EDU.CO	04	02
1203256785	JUAN	CAMILO	RODRIGUEZ	MAYORCA	CL8 #3-27	M	3245919744	SPACK@GMAIL.COM	04	02
9012365478	CARLA	MARGARITA	TORRADO	TRIGOS	AV. INDEPENDENCIA NO. 562	F	3456201236	Cmacamiwa@eoffice.top	04	02
88276220	BOLMAR	FABIAN	MOLINA	RINCON	MZ 7 CASA 10 PISO2	M	3214083138	BOFAMORE@HOTMAIL.COM 	02	03
1017250334	JOSE 	JULIAN	CLARO	CARRASCAL	BAMBO	M	3127621380	JJCLAROC@GMAIL.COM 	02	03
1062814250	JAMES 	DAVID 	SANCHEZ	LOBO	CL8 #3-23	M	3235919744	SUPERPACK@GMAIL.COM	02	03
1091600015	SOFIA	\N	CORONEL	JAIME 	BUENOS AIRES 	F	5690125	SOFIA@UFPSO.EDU.CO	02	03
1091646568	JUANES	ESTEBAN	 MORA	PEREZ	CALLE 12	M	3153268498	JUAN@UFPSO.EDU.CO	02	03
1091674999	CAMILO	CARLOS	PEREZ	PEREIRA	CRA 24E #18-24	M	3203863008	PEREIRA@UFPSO.EDU.CO	02	03
1091675004	MARIA 	FERNANDA	MANZANO	MANZANO	CRA 24E #18-29	M	3203863013	MANZANO@UFPSO.EDU.CO	02	03
1091675005	FERNANDA 	MARIA 	MANZANO	SANCHEZ	CRA 24E #18-30	F	3203863014	MARIA@UFPSO.EDU.CO	02	03
1091677340	KENIA 	YOCASTA	PAEZ	GUERREO	CRA 5A N 23	F	3128392781	KYPG@GMAIL.COM	02	03
1091678309	STEFANIA	CELENA	CARVAJALINO	RAMOZ	CALI	F	3132564754	ST@GMAIL.COM	02	03
1091680151	CAMILA 	ANDREA	PEREZ	RODRIGUEZ	CRA 20B # 16-21	F	3120109571	CAPEREZR@UFPSO.EDU.CO	02	03
1093734273	ANGUIE	MARIA	PEREZ 	CAICEDO	CRA 43#82-23	F	3187439283	ang@ufpso.edu.co	02	03
1901298374	JUAN 	PABLO	MARQUEZ 	ORTIZ	CRA 23#34-32	M	3128392781	JUAN@UFPSO.EDU.CO	02	03
9382714685	BRAYAN	ANDRES	BAYONA	MORENO	Calle 48b sur No. 21-13	M	6032020201	babayonam@gmail.com	02	03
9685231456	JHAN	MARCOS	MANZANO	MARTINES	Calle 24 N 5-60	M	3201654892	jmmanzanom@gmail.com	02	03
36589794	MIRIAM	\N	YANEZ	ALFONZO	CALLE 5 LOS SAUCES	F	3235891426	GATITASEXY@HOTMAIL.COM	05	04
37335466	MARIA	YOLEIDA	CANO	TORRES	CRA 11 35-70	F	3204584452	MARYOLCA@GMAIL.COM	05	04
88278749	YURGEN	\N	QUINTERO	RINCON	CRA 11 35-70	M	3204578415	YURGEN33@GMAIL.COM	05	04
1004864151	KELLY	TATIANA	ORTEGA	ORTEGA	CALLE 9B 388 e 57	F	3017253867	KELLY@UFPSO.EDU.CO	05	04
1035428825	MARIA 	JOSE	CASTANO	MONTOYA	CRA 45 78-45	F	3102589548	MARIAJOSE@GMAIL.COM	05	04
1043861994	KEVIN	HERNANDO	LOBO	PACHECO	CL8 #9-35	M	3142597982	megauploaded@gmail.com	05	04
1064840381	KEVIN	\N	BONILLA	ORTEGA	CALLE 11B 28 e 55	M	3013283887	KBONILLAO@UFPSO.EDU.CO	05	04
1091547855	FREDY	MAURICIO	ROJAS	QUINTERO	CRA 10 35-40	M	3165412153	MAURICIOC@UFPSO.EDU.CO	05	04
1091600345	BRAYAN	ANTONIO	HERNANDEZ	AREVALO	CRA 4B N 28	M	3182231674	BAHA@GMAIL.COM	05	04
1091665470	MARIANA	\N	CHINCHILLA	OROZCO	CALLE 11	F	5690012	MARIANA@UFPSO.EDU.CO	05	04
1091675003	CAMILO 	ANDREZ	SANCHEZ 	PEREZ	CRA 24E #18-28	M	3203863012	ANDREZ@UFPSO.EDU.CO	05	04
1091677342	WILMAR 	\N	PAEZ 	GUERREO	CRA 5A N 25	M	3157633229	WPG@GMAIL.COM	05	04
1091678302	JUAN	MARTIN	CACERES	CONSUEGRA	CUCUTA	M	3126583214	JU@GMAIL.COM	05	04
1091678304	ESTEBAN	DAMIAN	CUESTA	CUESTA	CARTAGENA	M	3112548794	ES@GMAIL.COM	05	04
1091678307	MARIA	CARLA	GIL	MARTINES	SAN GIL	F	3214569782	MA@GMAIL.COM	05	04
1091678310	LUCIA	LUCENITH	MESSI	GOMEZ	MEDELLIN	F	3215456467	LU@GMAIL.COM	05	04
1091678800	YORMAN	EDUARDO	RINCON	CANO	CRA 11 35-70	M	3184960071	YERINCONC@UFPSO.EDU.CO	05	04
1091678808	NAILA	ZOLANLLY	MOLINA	CLARO	MZ 7 CASA 10 PISO2	F	3153480048	NZMOLINAC@UFPSO.EDU.CO 	05	04
1091680149	FABIAN	EDUARDO	ROJAS	PALLAREZ	CRA 24A # 20-24	M	3156987451	FBROJASL@UFPSO.EDU.CO	05	04
1091680153	ANDRES	MAURICIO	MORA	LOPEZ	CRA 20B # 16-23	M	3083231691	AMMORAL@UFPSO.EDU.CO	05	04
1091680155	LUZ	DANIELA	NAVARRO	RODRIGUEZ	CRA 21C # 23-02	F	3046353811	LDNAVARROR@UFPSO.EDU.CO	05	04
1091680157	JOSE	ALEJANDRO	TORRES	GUERRERO	CRA 21C # 23-04	M	3009475931	JATORRESG@UFPSO.EDU.CO	05	04
1091780255	ESTEBAN	\N	ARENAS	QUINTERO	CALLE 28 #6-12	M	3002561476	estebana@ufpso.edu.co	05	04
1099167971	WILMAR	FERNANDO	ORTIZ	MORA	CALLE 10 	M	3123234285	WFORTIZM@UFPSO.EDU.CO	05	04
1254897664	FRANCISCO	JAVIER	QUINTERO	LEYRA	CL8 #9-30	M	3142547982	prueba@gmail.com	05	04
4152637485	JUAN	CAMILO	SANCHES	RAMIRES 	Calle 11 No. 4 - 14	M	3021025480	jcsanchesr@gmail.com	05	04
7942865479	ANDRES	CAMILO	LOPEZ	MOLANO	Avenida Cra. 60 No. 57-60	M	6032015048	aclopezm@gmail.com	05	04
37328801	NUBIA	MARIA	YANEZ	ALFONZO	CALLE3 LOS SAUCES	F	3123365858	NUBIAMA26@HOTMAIL.COM	03	05
88219349	JAVIER 	HERNESTIO	PUENTES	PABON	CRA 23#63-34	M	3158773773	JAVI@UFPSO.EDU.CO	03	05
1004567890	JAIDER 	JAHIR	MOLINA	CLARO	MZ 7 CASA 10 PISO2	M	3152225968	JAIDERJAHIRMOLINA@GMAIL.COM 	03	05
1017196865	PEDRO	ROJAS	CONTRERAS	\N	CRA 45 45-78	M	5690428	\N	03	05
1054843224	PINA	ISBELIA	QUINTERO	LEYRA	CL8 #9-32	F	3142567981	elpapipro@gmail.com	03	05
1091589693	RONALD 	ESTIVEN	PEREZ	YANEZ	CALLE3 LOS SAUCES	M	3211458789	RONALD1258@GMAIL.COM	03	05
1091675000	DAYANA	MARIA 	ANTOLINEZ	ANTOLINEZ	CRA 24E #18-25	F	3203863009	ANTOLINEZ@UFPSO.EDU.CO	03	05
1091678308	JUANA	DELMIRA	ORTIZ	ORTIZ	OCANA	F	3112564897	JUA@GMAIL.COM	03	05
1091680154	JULIAN	ALEJANDRO	MARTINEZ	ORTIZ	CRA 20B # 16-24	M	3064792751	JAMARTINEZO@UFPSO.EDU.CO	03	05
1091766346	YISETH	\N	HERNANDEZ	AREVALO	CRA 4B N 29	F	3145837434	YHA@GMAIL.COM	03	05
1091766347	JEILY	DARIANA	HERNANDEZ	AREVALO	CRA 4B N 30	F	3158773773	JHA@GMAIL.COM	03	05
1091766348	ANDREA	NURY	PAREDES	VIVAS	CRA 6C N 31	F	3129483475	KYPG@GMAIL.COM	03	05
1091766349	CRISTIAN	\N	PAREDES	VIVAS	CRA 6C N 32	M	3162839467	CSPV@GMAIL.COM	03	05
1092155155	LORENA	\N	MORALES	ASCANIO	CRA 10 #3-25	F	3204588441	lorenam@gmail.com	03	05
1094728398	MARIA 	JOSE	BACCA	LANZIANO	CRA 93#93-28	F	3182231674	MAJO@UFPSO.EDU.CO	03	05
1094843498	MARIELA	NURY	CASTRO	PALLAREZ	CRA 38#92-32	F	3129483475	MARI@UFPSO.EDU.CO	03	05
1095345645	MONICA	\N	TARAZONA	VELAZQUES	CRA 74#83-23	F	3162839467	MONI@UFPSO.EDU.CO	03	05
1096387463	ANDREA	SOFIA	SANCHEZ	CALDERON	CRA 92#38-32	F	3128394093	AND@UFPSO.EDU.CO	03	05
1102345786	MICHEL	MATEO	CUESTAS	PEREZ	CL8 #3-32	M	3235914544	EUSTROGIO@GMAIL.COM	03	05
1152455479	JOSE	MAIRA	GALLO 	BURITICA	CRA 7 45-78	M	3004512588	\N	03	05
1216976435	DIEGO	DE JESUS	QUINTERO	PEDROZO	CL8 #9-33	M	3142577989	superman@gmail.com	03	05
1245875626	ALFREDO	 DE JESUS	QUINTERO	LEYRA	CL8 #9-29	M	3148759326	superpackpro@gmail.com	03	05
1658247952	JUAN	SEBASTIAN	VEGA	TRIGOS	Carrera 3 # 18- 45	M	5647895412	jsvegat@gmail.com	03	05
2326874596	PEDRO	FERNANDEZ	BACCA	GARCIA	AV. INDEPENDENCIA NO. 241	M	3501264578	Pfipofawewe@directmail24.net	03	05
3032547863	JUDAS	\N	ROPERO	TORRES	CALLE MATAMOROS NO. 127	M	3167852024	JRijetokog@digital-message.com	03	05
7230456780	ANASTACIO	\N	PABON	JIMENEZ	BLVD. BENITO JUAREZ S / N	M	3224567892	Apivup@directmail24.net	03	05
37325801	NAILA	ALEJANDRA	PEREZ	VEGA	CALLE 44 SANTA LUCIA	F	3156540042	NAILAM@GMAIL.COM	02	06
37343985	YAQUELIE	\N	RENTERIA 	VALENCIA	CRA 45#94-44	F	3145837434	YAQUE@UFPSO.EDU.CO	02	06
37854120	ANA	DILIA	AMAYA	JULIO	CALLE 12 #15-24	F	3194526150	anaj@hotmail.com	02	06
1004849372	DAYANA	\N	CALDERON	MORALES	CALLE 11B 28 e 63	F	3013288887	DAYANA@UFPSO.EDU.CO	02	06
1039596374	DIEGO	EMILIO	AGUIRRE 	MESA	CRA 9 20-45	M	3204542157	DIEGOEMILIO777@GMAIL.COM	02	06
1075946121	WILMAR	JAVIER	RODRIGUES	DIAZ	CL8 #9-37	M	3142517985	harrypotter@gmail.com	02	06
1091675002	ANRES	CAMILO	SANCHEZ	SANCHEZ	CRA 24E #18-27	M	3203863011	SANCHEZ@UFPSO.EDU.CO	02	06
1091678305	JULIAN	PATRICIO	GARCIA	MORA	PEREIRA	M	3512546897	JU@GMAIL.COM	02	06
1091693898	PEDRO	JOSE	PEREZ	JARAMILLO	CALLE 54 CRR 43 ARANJUEZ	M	3136895878	PEDROPEREZY@HOTMAIL.COM	02	06
1125489654	DIEGO 	EUSTROGIO	LAZARO	LEYRA	CL8 #3-25	M	3835919744	SUPER@GMAIL.COM	02	06
5286847596	MARIA	JOSE	LOPEZ	HERNANDEZ	Calle 4  5 - 10	F	8745685120	mjlopezh@gmail.com	02	06
8547985472	ESTELA	\N	BACCA	GONZALES	Carrera 20 No. 37-54	F	4052010203	ebaccag@gmail.com	02	06
88457888	JAIME	EDUARDO	ORTIZ	CARVAJAL	CALLE 15 #5-19	M	3002145660	jaimeo@outlook.com	05	07
1004942381	EDWIN	CAMILO	HERNANDEZ	ALVAREZ	CALLE 11B 28 e 61	M	3019254999	EDWIN@UFPSO.EDU.CO	05	07
1050919821	DIANA	MARCELA	LOZANO	COBA	CALLE3 LOS CRISTALES	F	3214139937	DMLOZANOC@UFPSO.EDU.CO	05	07
1064648682	ANDERSON	STIVEN	CORONEL	PEREZ	CALLE 11B 28 e 62	M	3013583887	ANDERSON@UFPSO.EDU.CO	05	07
1068196325	BRAYAN	JESUS	SALCEDO	VARGAS	CL8 #3-24	M	3235719744	SUPERACK@GMAIL.COM	05	07
1091152301	SARA	DANIELA	GOMEZ	AREVALO	CRA 6 #15-33	F	3502644861	sarad@hotmail.com	05	07
1091547822	JHOAN	SEBASTIAN	PABA 	PABON	CRA 10 #3-22	M	3145962177	jspabap@ufpso.edu.co	05	07
1091600344	EDUARD	ALFONSO	HERNANDEZ	CALDERON	CRA 4B N 27	M	3187439283	EAHC@GMAIL.COM	05	07
1091645532	HERSON	HERNANDO 	CARVAJALINO	MARTINEZ 	CRA 45	M	5612478	HERSON@UFPSO.EDU.CO	05	07
1091645978	VALENCIA	\N	GUERRERO	ORTIZ 	CALLE 54	M	3176985636	VALENCIA@UFPSO.EDU.CO	05	07
1091675006	MARIA 	JULIANA	LESMES	ROJAS	CRA 24E #18-31	F	3203863015	LESMES@UFPSO.EDU.CO	05	07
1091675007	YEISON	FERNANDO	ROJAS 	ROJAS	CRA 24E #18-32	M	3203863016	ROJAS@UFPSO.EDU.CO	05	07
1091677341	SAUL	\N	PAEZ	GUERREO	CRA 5A N 24	M	3013726493	SPG@GMAIL.COM   	05	07
1091678806	VALERIN	DANIELA	NAVARRO	CLARO	PROMESA DE DIOS	F	3124847268	VDNAVARROC@GMAIL.COM 	05	07
1091679879	SEBASTIAN	MANUEL	RINCON	CANO	CRA98	M	5612348	SEBATIAN@UFPSO.EDU.CO	05	07
1091680148	JHOAM	HACIP	ROJAS	PALLAREZ	CRA 24A # 20-24	M	3175426391	JHROJASP@UFPSO.EDU.CO	05	07
1091680150	MARTHA	JULIETH	PALLAREZ	NAVARRO	CRA 24A # 20-24	F	3138548511	MJPALLAREZO@UFPSO.EDU.CO	05	07
1092834736	WILMAR 	JAVIER	ORTIZ	PEREZ	CRA 24#48-09	M	3157633229	WIL@UFPSO.EDU.CO	05	07
1456328756	JULIAN	ANDRES	VACA	GONZALES	CALLE AGUSTIN LARA NO. 69-B	M	3201456789	Javodekuso@nextmail.info	05	07
1523768747	JHAN	PILATO	NUEVA	CALLE	CL8 #9-38	M	3142257987	voldemort@gmail.com	05	07
1578965203	ROBERTO	DE JESUS	PENARANDA	RODRIGUEZ	MATAMOROS NO. 327	M	3001254679	Rdjowuze@directmail24.net	05	07
4256478901	TIMOTEO	\N	LOPEZ	NUNEZ	MATAMOROS NO 85 ESQ. 20 DE NOVIEMBRE	M	3175648921	Tlhiribar@digital-message.com	05	07
5032569874	FELIPE	\N	ASCANIO	DIAZ	AV. INDEPENDENCIA NO. 670	M	3104578953	Faemiga@webmail24.top	05	07
6023645789	TADEO	\N	SANCHEZ	MORENO	AV.INDEPENDENCIA NO.1010	M	3115896201	Taewomac@ask-mail.com	05	07
7319824650	DIEGO	\N	ROPERO	\N	Calle 109a N 17-10 Sede Norte	M	2032015029	dropero@gmail.com	05	07
7598412369	JHON	ESTEBAN	ASCANIO	RODRIGUEZ	Carrera 7 # 84- 72	M	3214568978	jeascanior@gmail.com	05	07
8031564780	WILFRAN	MATEO	MARTINEZ	HERNANDEZ	AV. 5 DE MAYO NO 1100-A	M	3524567821	Wmaka@digital-message.com	05	07
88789652	PABLO	EMILIO	CASTRO	GUERRERO	CALLE 12 #15-24	M	3189654712	pabloc@hotmail.com	05	08
1017250330	JOSE	MARIA	PEREZ	YANEZ	CALLE3 LOS SAUCES	M	3148681124	JMPEREZY@UFPSO.EDU.CO	05	08
1004654233	BOLMAR	ADRIAN	MOLINA	CLARO	MZ 7 CASA 10 PISO2	M	3154418372	BOLMARMOLINA@GMAIL.COM 	04	09
1024568953	JHON	FELIPE	QUINTERO	BAZZA	CL8 #3-31	M	3235914784	LENAS@GMAIL.COM	04	09
1064560281	ANDREA	CAMILA	ORTEGA	\N	CALLE 20B 24 e 60	F	3253283886	ANDREA@UFPSO.EDU.CO	04	09
1091646457	CHAPARRO	\N	CASERES	MORA	CALLE 11	M	3213215498	CAHPARRO@UFPSO.EDU.CO	04	09
1004840381	JUAN	YAMID	BONILLA	PADILLA	CALLE 10A 28 e 56	M	3112283887	JFMAMMM@UFPSO.EDU.CO	05	10
1004880281	ANDRES	JOSE	VERA	HERNANDEZ	CALLE 5B 28 e 59	M	3203982866	ANDRES@UFPSO.EDU.CO	05	10
1017216097	WILMAR	FERNANDO	ORTIZ 	MORA	CRA 10 34-70	M	3205244136	WILMARELPRO777@GMAIL.COM	05	10
1050919822	YIMMI	JOSE	CLARO	AREVALO	PROMESA DE DIOS	M	3118932687	YJCLAROA@GMAIL.COM 	05	10
1064840356	CARLOS	MAURICIO	ARENAS	QUINTERO	CALLE 21B 28 e 58	M	3103283887	CARLOS@UFPSO.EDU.CO	05	10
1091600343	ANDRES	FELIPE	PAEZ	GUERREO	CRA 5A N 26	M	3128394093	AFPG@GMAIL.COM	05	10
1091673517	KEVIN	RICARDO	CONSUEGRA	RUEDA	CRA 11A 40-54	M	3154637144	KRCONSUEGRAR@UFPSO.EDU.CO	05	10
1091678303	KAN	CARLOS	PEREZ	MARTINEZ	BARRANQUILLA	M	3111526478	KA@GMAIL.COM	05	10
1017330258	PEDRO	ALEXANDER	PEREZ	YANEZ	CALLE3 LOS SAUCES	M	3136589877	PEDROPEREZA45@HOTMAIL.COM	02	11
1045846312	LUISA	MARIA	LEYRA	GARCIA	CL8 #9-31	F	3142557984	domingo@gmail.com	02	11
1091552478	DANIEL	JOSE	PEREZ	LOBO	CRA 22 #15-70	M	3502452109	danielP@hotmail.com	02	11
1091678702	JULIAN	\N	VEGA	VERGARA	CALLE5 LOS SAUCES	M	3215896978	JULIAN5897@HOTMAIL.COM	05	13
1091680256	CARLOS	\N	MARTINEZ	PEREZ	CRA 15 #20-18	M	3125446120	carlosm@hotmail.com	05	13
1091678301	JHAN	PABLO	CARVAJALINO	CARRANZA	OCANA	M	3125645789	JP@UFPSO.EDU.CO	06	14
\.


--
-- TOC entry 4841 (class 0 OID 57351)
-- Dependencies: 216
-- Data for Name: comuna; Type: TABLE DATA; Schema: tienda; Owner: postgres
--

COPY tienda.comuna (cod_comuna, nombre, kms_2) FROM stdin;
01	CENTRAL: JOSE EUSEBIO CARO	1.87
02	NOR-ORIENTAL: CRISTO REY 	1.51
03	SUR-ORIENTAL: OLAYA HERRERA	2.63
04	SUR-OCCIDENTAL: ADOLFO MILANES	1.07
05	FRANCISCO FERNANDEZ DE CONTRERAS	1.14
06	CIUDADERA NORTE	0.80
\.


--
-- TOC entry 4849 (class 0 OID 57419)
-- Dependencies: 224
-- Data for Name: detalle; Type: TABLE DATA; Schema: tienda; Owner: postgres
--

COPY tienda.detalle (consecutivo, ordinal, cod_articulo, cantidad, precio_venta, subtotal, descuento, vlr_descuento) FROM stdin;
1	01	1004	5	16200	76950	5	4050.00
1	02	1017	2	48500	93120	4	3880.00
\.


--
-- TOC entry 4847 (class 0 OID 57403)
-- Dependencies: 222
-- Data for Name: factura; Type: TABLE DATA; Schema: tienda; Owner: postgres
--

COPY tienda.factura (consecutivo, fecha, documento, descuento, total) FROM stdin;
1	2020-04-14	27760635	7930.00	170070
\.


--
-- TOC entry 4842 (class 0 OID 57359)
-- Dependencies: 217
-- Data for Name: proveedor; Type: TABLE DATA; Schema: tienda; Owner: postgres
--

COPY tienda.proveedor (nit, nombre, direccion, celular) FROM stdin;
800333222	TRENDGAL	CALLE 7 PADD120	3157894562
800587444	DEAR LOVER	TRANSVERSAL 1 UK	(+888)997890000
8001115000	CHINABRANDS	CHIN 1247 CALLE 8	(+888)99666562
800345800	PARISIAN	CARRERA 89 +24	(+088)997897777
800777897	Q CLOTHING	BALTIMORE 987	(+055)995555562
800789456	J5 FASHION	AVENIDA FERROCARRIL	999874562
800656650	ANNABELLE	AVENIDA TRANS	99798762
900978546	WHOLESALE CENTRAL	CALLE HOUSTON	(+088)995658562
900565780	LA SHOWROOM	STREET MASON 8777	(+035)997333362
900111130	COCOTASHI	GALERIAS	(+077)878562
900447897	OBJECT OF DESIRE	UK TRAVEL	(+099)4545562
\.


--
-- TOC entry 4858 (class 0 OID 0)
-- Dependencies: 223
-- Name: detalle_consecutivo_seq; Type: SEQUENCE SET; Schema: tienda; Owner: postgres
--

SELECT pg_catalog.setval('tienda.detalle_consecutivo_seq', 1, false);


--
-- TOC entry 4859 (class 0 OID 0)
-- Dependencies: 221
-- Name: factura_consecutivo_seq; Type: SEQUENCE SET; Schema: tienda; Owner: postgres
--

SELECT pg_catalog.setval('tienda.factura_consecutivo_seq', 1, true);


--
-- TOC entry 4685 (class 2606 OID 57396)
-- Name: articulo pk_articulo; Type: CONSTRAINT; Schema: tienda; Owner: postgres
--

ALTER TABLE ONLY tienda.articulo
    ADD CONSTRAINT pk_articulo PRIMARY KEY (cod_articulo);


--
-- TOC entry 4681 (class 2606 OID 57371)
-- Name: barrio pk_barrio; Type: CONSTRAINT; Schema: tienda; Owner: postgres
--

ALTER TABLE ONLY tienda.barrio
    ADD CONSTRAINT pk_barrio PRIMARY KEY (cod_comuna, cod_barrio);


--
-- TOC entry 4683 (class 2606 OID 57383)
-- Name: cliente pk_cliente; Type: CONSTRAINT; Schema: tienda; Owner: postgres
--

ALTER TABLE ONLY tienda.cliente
    ADD CONSTRAINT pk_cliente PRIMARY KEY (documento);


--
-- TOC entry 4677 (class 2606 OID 57358)
-- Name: comuna pk_comuna; Type: CONSTRAINT; Schema: tienda; Owner: postgres
--

ALTER TABLE ONLY tienda.comuna
    ADD CONSTRAINT pk_comuna PRIMARY KEY (cod_comuna);


--
-- TOC entry 4689 (class 2606 OID 57428)
-- Name: detalle pk_detalle; Type: CONSTRAINT; Schema: tienda; Owner: postgres
--

ALTER TABLE ONLY tienda.detalle
    ADD CONSTRAINT pk_detalle PRIMARY KEY (consecutivo, ordinal);


--
-- TOC entry 4687 (class 2606 OID 57411)
-- Name: factura pk_factura; Type: CONSTRAINT; Schema: tienda; Owner: postgres
--

ALTER TABLE ONLY tienda.factura
    ADD CONSTRAINT pk_factura PRIMARY KEY (consecutivo);


--
-- TOC entry 4679 (class 2606 OID 57365)
-- Name: proveedor pk_proveedor; Type: CONSTRAINT; Schema: tienda; Owner: postgres
--

ALTER TABLE ONLY tienda.proveedor
    ADD CONSTRAINT pk_proveedor PRIMARY KEY (nit);


--
-- TOC entry 4696 (class 2620 OID 57440)
-- Name: detalle llenar_subtotal; Type: TRIGGER; Schema: tienda; Owner: postgres
--

CREATE TRIGGER llenar_subtotal BEFORE INSERT OR UPDATE ON tienda.detalle FOR EACH ROW EXECUTE FUNCTION tienda.subtotal();


--
-- TOC entry 4697 (class 2620 OID 57442)
-- Name: detalle llenar_total; Type: TRIGGER; Schema: tienda; Owner: postgres
--

CREATE TRIGGER llenar_total AFTER INSERT OR UPDATE ON tienda.detalle FOR EACH ROW EXECUTE FUNCTION tienda.total();


--
-- TOC entry 4694 (class 2606 OID 57429)
-- Name: detalle fk_articulo_detalle; Type: FK CONSTRAINT; Schema: tienda; Owner: postgres
--

ALTER TABLE ONLY tienda.detalle
    ADD CONSTRAINT fk_articulo_detalle FOREIGN KEY (cod_articulo) REFERENCES tienda.articulo(cod_articulo);


--
-- TOC entry 4692 (class 2606 OID 57397)
-- Name: articulo fk_articulo_proveedor; Type: FK CONSTRAINT; Schema: tienda; Owner: postgres
--

ALTER TABLE ONLY tienda.articulo
    ADD CONSTRAINT fk_articulo_proveedor FOREIGN KEY (nit) REFERENCES tienda.proveedor(nit);


--
-- TOC entry 4691 (class 2606 OID 57384)
-- Name: cliente fk_barrio_cliente; Type: FK CONSTRAINT; Schema: tienda; Owner: postgres
--

ALTER TABLE ONLY tienda.cliente
    ADD CONSTRAINT fk_barrio_cliente FOREIGN KEY (cod_comuna, cod_barrio) REFERENCES tienda.barrio(cod_comuna, cod_barrio);


--
-- TOC entry 4693 (class 2606 OID 57412)
-- Name: factura fk_cliente_factura; Type: FK CONSTRAINT; Schema: tienda; Owner: postgres
--

ALTER TABLE ONLY tienda.factura
    ADD CONSTRAINT fk_cliente_factura FOREIGN KEY (documento) REFERENCES tienda.cliente(documento);


--
-- TOC entry 4690 (class 2606 OID 57372)
-- Name: barrio fk_comuna_barrio; Type: FK CONSTRAINT; Schema: tienda; Owner: postgres
--

ALTER TABLE ONLY tienda.barrio
    ADD CONSTRAINT fk_comuna_barrio FOREIGN KEY (cod_comuna) REFERENCES tienda.comuna(cod_comuna);


--
-- TOC entry 4695 (class 2606 OID 57434)
-- Name: detalle fk_factura_detalle; Type: FK CONSTRAINT; Schema: tienda; Owner: postgres
--

ALTER TABLE ONLY tienda.detalle
    ADD CONSTRAINT fk_factura_detalle FOREIGN KEY (consecutivo) REFERENCES tienda.factura(consecutivo);


-- Completed on 2024-06-19 18:07:40

--
-- PostgreSQL database dump complete
--

--
-- Database "empresa" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-06-19 18:07:40

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4791 (class 1262 OID 32847)
-- Name: empresa; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE empresa WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';


ALTER DATABASE empresa OWNER TO postgres;

\connect empresa

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 32848)
-- Name: login; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA login;


ALTER SCHEMA login OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 32898)
-- Name: usuario; Type: TABLE; Schema: login; Owner: postgres
--

CREATE TABLE login.usuario (
    cod_usuario integer NOT NULL,
    usuario character varying(30),
    contrasena character varying(20),
    fecha_creacion timestamp without time zone,
    activo boolean,
    ciudad character varying(30),
    CONSTRAINT nn_contrasena CHECK ((contrasena IS NOT NULL))
);


ALTER TABLE login.usuario OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 32897)
-- Name: usuario_cod_usuario_seq; Type: SEQUENCE; Schema: login; Owner: postgres
--

CREATE SEQUENCE login.usuario_cod_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE login.usuario_cod_usuario_seq OWNER TO postgres;

--
-- TOC entry 4792 (class 0 OID 0)
-- Dependencies: 216
-- Name: usuario_cod_usuario_seq; Type: SEQUENCE OWNED BY; Schema: login; Owner: postgres
--

ALTER SEQUENCE login.usuario_cod_usuario_seq OWNED BY login.usuario.cod_usuario;


--
-- TOC entry 4635 (class 2604 OID 32901)
-- Name: usuario cod_usuario; Type: DEFAULT; Schema: login; Owner: postgres
--

ALTER TABLE ONLY login.usuario ALTER COLUMN cod_usuario SET DEFAULT nextval('login.usuario_cod_usuario_seq'::regclass);


--
-- TOC entry 4785 (class 0 OID 32898)
-- Dependencies: 217
-- Data for Name: usuario; Type: TABLE DATA; Schema: login; Owner: postgres
--

COPY login.usuario (cod_usuario, usuario, contrasena, fecha_creacion, activo, ciudad) FROM stdin;
1	JDURAN	JOSE	2024-03-02 21:20:00	t	OCAÑA
2	FPIPE	FELIPE	2024-03-02 16:00:00	t	OCAÑA
3	ACAMILO	CAMILO	2024-03-02 16:35:00	t	OCAÑA
4	LACOSTA	LUIS	2024-03-02 16:39:00	t	BOGOTA
5	BASTI	SEBASTIAN	2024-03-02 18:55:00	t	MEDELLIN
\.


--
-- TOC entry 4793 (class 0 OID 0)
-- Dependencies: 216
-- Name: usuario_cod_usuario_seq; Type: SEQUENCE SET; Schema: login; Owner: postgres
--

SELECT pg_catalog.setval('login.usuario_cod_usuario_seq', 5, true);


--
-- TOC entry 4638 (class 2606 OID 32904)
-- Name: usuario pk_cod_usuario; Type: CONSTRAINT; Schema: login; Owner: postgres
--

ALTER TABLE ONLY login.usuario
    ADD CONSTRAINT pk_cod_usuario PRIMARY KEY (cod_usuario);


--
-- TOC entry 4640 (class 2606 OID 32906)
-- Name: usuario uc_usuario; Type: CONSTRAINT; Schema: login; Owner: postgres
--

ALTER TABLE ONLY login.usuario
    ADD CONSTRAINT uc_usuario UNIQUE (usuario);


-- Completed on 2024-06-19 18:07:40

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-06-19 18:07:40

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 24593)
-- Name: tienda; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tienda;


ALTER SCHEMA tienda OWNER TO postgres;

--
-- TOC entry 4779 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA tienda; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA tienda IS 'Esquema para gestinar la infromación de una cadena de tiendas de ropa.';


--
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 4780 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


-- Completed on 2024-06-19 18:07:40

--
-- PostgreSQL database dump complete
--

-- Completed on 2024-06-19 18:07:40

--
-- PostgreSQL database cluster dump complete
--

