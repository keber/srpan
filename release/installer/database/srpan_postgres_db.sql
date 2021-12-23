--
-- PostgreSQL database dump
--

-- Started on 2008-12-11 19:39:08 Hora de ver. del Pac�fico SA

SET client_encoding = 'UTF8';
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1592 (class 1262 OID 60503)
-- Name: srpan; Type: DATABASE; Schema: -; Owner: srpan_root
--

CREATE DATABASE srpan WITH TEMPLATE = template0 ENCODING = 'UTF8';


ALTER DATABASE srpan OWNER TO srpan_root;

\connect srpan

SET client_encoding = 'UTF8';
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1593 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


--
-- TOC entry 279 (class 2612 OID 60506)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: 
--

CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

--
-- TOC entry 13 (class 1255 OID 60507)
-- Dependencies: 279 5
-- Name: fn_crear_usuario(numeric, character varying, character varying, character varying, numeric, character varying); Type: FUNCTION; Schema: public; Owner: srpan_root
--

CREATE FUNCTION fn_crear_usuario(p_usu_id numeric, p_usu_nombre character varying, p_usu_ap_pat character varying, p_usu_ap_mat character varying, p_usu_tipo numeric, p_usu_pass character varying) RETURNS numeric
    AS $$
DECLARE
	var_res1 numeric;
	var_res2 numeric;
	var_res3 numeric;
BEGIN
	BEGIN
		select ins_usuario_app(p_usu_id,p_usu_pass) into var_res1;
		select ins_uapp_conexion(p_usu_id , p_usu_tipo ) into var_res2;
		select ins_usuario(p_usu_id,p_usu_nombre,p_usu_ap_pat,p_usu_ap_mat) into var_res3;
		IF (var_res1+var_res2+var_res3 != 3) THEN
			RETURN 0;
		END IF;
	EXCEPTION
		WHEN OTHERS THEN
		RETURN 0;
	END;
	RETURN 1;
END
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.fn_crear_usuario(p_usu_id numeric, p_usu_nombre character varying, p_usu_ap_pat character varying, p_usu_ap_mat character varying, p_usu_tipo numeric, p_usu_pass character varying) OWNER TO srpan_root;

--
-- TOC entry 33 (class 1255 OID 60508)
-- Dependencies: 5 279
-- Name: ins_analisis(numeric, numeric, numeric, character varying); Type: FUNCTION; Schema: public; Owner: srpan_root
--

CREATE FUNCTION ins_analisis(p_ana_usuario numeric, p_ana_eventos numeric, p_ana_muestra numeric, p_ana_desc character varying) RETURNS numeric
    AS $$
DECLARE
	cur refcursor;
	result integer;
BEGIN
	BEGIN
		INSERT into analisis(ana_usuario,ana_fecha,ana_eventos,ana_muestra,ana_desc) VALUES 
				    (p_ana_usuario, now()::date, p_ana_eventos, p_ana_muestra, p_ana_desc); 
		OPEN cur FOR select ana_id from analisis order by ana_id desc;
		FETCH cur into result;
		CLOSE cur;
	EXCEPTION
		WHEN unique_violation THEN
			OPEN cur FOR select ana_id from analisis order by ana_id desc;
			FETCH cur into result;
			CLOSE cur;
			RAISE EXCEPTION 'El Analisis % ya existe - %',result,SQLERRM;
		WHEN OTHERS THEN
	 		RAISE EXCEPTION 'Error por % NÃºmero %', SQLERRM,SQLSTATE;
	END;
	RETURN result;
END
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_analisis(p_ana_usuario numeric, p_ana_eventos numeric, p_ana_muestra numeric, p_ana_desc character varying) OWNER TO srpan_root;

--
-- TOC entry 18 (class 1255 OID 60509)
-- Dependencies: 5 279
-- Name: ins_bias(numeric, numeric, double precision); Type: FUNCTION; Schema: public; Owner: srpan_root
--

CREATE FUNCTION ins_bias(p_b_patron numeric, p_b_id numeric, p_b_value double precision) RETURNS numeric
    AS $$

BEGIN
	BEGIN
		INSERT into bias VALUES (p_b_id,p_b_patron,p_b_value);
	EXCEPTION
		WHEN unique_violation THEN
			RAISE EXCEPTION 'Operacion no valida - %',SQLERRM;
			
		WHEN OTHERS THEN
	 		RAISE EXCEPTION 'Error por % Número %', SQLERRM,SQLSTATE;
			
	END;
	RETURN 1;
END
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_bias(p_b_patron numeric, p_b_id numeric, p_b_value double precision) OWNER TO srpan_root;

--
-- TOC entry 19 (class 1255 OID 60510)
-- Dependencies: 5 279
-- Name: ins_bias(numeric, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: srpan_root
--

CREATE FUNCTION ins_bias(p_b_patron numeric, p_v1 double precision, p_v2 double precision, p_v3 double precision, p_v4 double precision, p_v5 double precision, p_v6 double precision) RETURNS numeric
    AS $$
DECLARE
	var_res1 numeric;
	var_res2 numeric;
	var_res3 numeric;
	var_res4 numeric;
	var_res5 numeric;
	var_res6 numeric;

BEGIN
	BEGIN
		select ins_bias(p_b_patron,1,p_v1) into var_res1;
		select ins_bias(p_b_patron,2,p_v2) into var_res2;
		select ins_bias(p_b_patron,3,p_v3) into var_res3;
		select ins_bias(p_b_patron,4,p_v4) into var_res4;
		select ins_bias(p_b_patron,5,p_v5) into var_res5;
		select ins_bias(p_b_patron,6,p_v6) into var_res6;
	EXCEPTION
		WHEN unique_violation THEN
			RAISE EXCEPTION 'Operacion no valida - %',SQLERRM;
			
		WHEN OTHERS THEN
	 		RAISE EXCEPTION 'Error por % Número %', SQLERRM,SQLSTATE;
			
	END;
	RETURN 1;
END
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_bias(p_b_patron numeric, p_v1 double precision, p_v2 double precision, p_v3 double precision, p_v4 double precision, p_v5 double precision, p_v6 double precision) OWNER TO srpan_root;

--
-- TOC entry 20 (class 1255 OID 60512)
-- Dependencies: 5 279
-- Name: ins_conjentr(numeric, numeric, boolean); Type: FUNCTION; Schema: public; Owner: srpan_root
--

CREATE FUNCTION ins_conjentr(p_con_analisis numeric, p_con_evento numeric, p_con_seleccionado boolean) RETURNS numeric
    AS $$

BEGIN
	BEGIN
		INSERT into conjentr VALUES (p_con_analisis,p_con_evento, p_con_seleccionado);
	EXCEPTION
		WHEN unique_violation THEN
			RAISE EXCEPTION 'Operacion no valida - %',SQLERRM;
			
		WHEN OTHERS THEN
	 		RAISE EXCEPTION 'Error por % Número %', SQLERRM,SQLSTATE;
			
	END;
	RETURN 1;
END
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_conjentr(p_con_analisis numeric, p_con_evento numeric, p_con_seleccionado boolean) OWNER TO srpan_root;

--
-- TOC entry 21 (class 1255 OID 60513)
-- Dependencies: 5 279
-- Name: ins_evento(numeric, numeric, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: srpan_root
--

CREATE FUNCTION ins_evento(p_eve_analisis numeric, p_eve_id numeric, p_eve_inicio double precision, p_eve_fin double precision, p_eve_duracion double precision, p_eve_area double precision, p_eve_maximo double precision, p_eve_stdv double precision, p_eve_promedio double precision, p_eve_durciclo double precision) RETURNS numeric
    AS $$

BEGIN
	BEGIN
		INSERT into evento VALUES (p_eve_analisis,p_eve_id, p_eve_inicio, p_eve_fin, p_eve_duracion, p_eve_area, p_eve_maximo, p_eve_stdv, p_eve_promedio, p_eve_durCiclo); 
	EXCEPTION
		WHEN unique_violation THEN
			RAISE EXCEPTION 'Operacion no valida - %',SQLERRM;
			
		WHEN OTHERS THEN
	 		RAISE EXCEPTION 'Error por % Número %', SQLERRM,SQLSTATE;
			
	END;
	RETURN 1;
END
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_evento(p_eve_analisis numeric, p_eve_id numeric, p_eve_inicio double precision, p_eve_fin double precision, p_eve_duracion double precision, p_eve_area double precision, p_eve_maximo double precision, p_eve_stdv double precision, p_eve_promedio double precision, p_eve_durciclo double precision) OWNER TO srpan_root;

--
-- TOC entry 22 (class 1255 OID 60514)
-- Dependencies: 5 279
-- Name: ins_eventoce(numeric, numeric, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: srpan_root
--

CREATE FUNCTION ins_eventoce(p_eve_analisis numeric, p_eve_id numeric, p_eve_inicio double precision, p_eve_fin double precision, p_eve_duracion double precision, p_eve_area double precision, p_eve_maximo double precision, p_eve_stdv double precision, p_eve_promedio double precision, p_eve_durciclo double precision) RETURNS numeric
    AS $$

BEGIN
	BEGIN
		INSERT into evento_ce VALUES (p_eve_analisis,p_eve_id, p_eve_inicio, p_eve_fin, p_eve_duracion, p_eve_area, p_eve_maximo, p_eve_stdv, p_eve_promedio, p_eve_durCiclo); 
	EXCEPTION
		WHEN unique_violation THEN
			RAISE EXCEPTION 'Operacion no valida - %',SQLERRM;
			
		WHEN OTHERS THEN
	 		RAISE EXCEPTION 'Error por % Número %', SQLERRM,SQLSTATE;
			
	END;
	RETURN 1;
END
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_eventoce(p_eve_analisis numeric, p_eve_id numeric, p_eve_inicio double precision, p_eve_fin double precision, p_eve_duracion double precision, p_eve_area double precision, p_eve_maximo double precision, p_eve_stdv double precision, p_eve_promedio double precision, p_eve_durciclo double precision) OWNER TO srpan_root;

--
-- TOC entry 23 (class 1255 OID 60515)
-- Dependencies: 5 279
-- Name: ins_iw(numeric, numeric, double precision); Type: FUNCTION; Schema: public; Owner: srpan_root
--

CREATE FUNCTION ins_iw(p_iw_patron numeric, p_iw_id numeric, p_iw_value double precision) RETURNS numeric
    AS $$

BEGIN
	BEGIN
		INSERT into InputWeights VALUES (p_iw_id,p_iw_patron,p_iw_value);
	EXCEPTION
		WHEN unique_violation THEN
			RAISE EXCEPTION 'Operacion no valida - %',SQLERRM;
			
		WHEN OTHERS THEN
	 		RAISE EXCEPTION 'Error por % Número %', SQLERRM,SQLSTATE;
			
	END;
	RETURN 1;
END
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_iw(p_iw_patron numeric, p_iw_id numeric, p_iw_value double precision) OWNER TO srpan_root;

--
-- TOC entry 24 (class 1255 OID 60516)
-- Dependencies: 279 5
-- Name: ins_lw(numeric, numeric, double precision); Type: FUNCTION; Schema: public; Owner: srpan_root
--

CREATE FUNCTION ins_lw(p_lw_patron numeric, p_lw_id numeric, p_lw_value double precision) RETURNS numeric
    AS $$

BEGIN
	BEGIN
		INSERT into LayerWeights VALUES (p_lw_id,p_lw_patron,p_lw_value);
	EXCEPTION
		WHEN unique_violation THEN
			RAISE EXCEPTION 'Operacion no valida - %',SQLERRM;
			
		WHEN OTHERS THEN
	 		RAISE EXCEPTION 'Error por % Número %', SQLERRM,SQLSTATE;
			
	END;
	RETURN 1;
END
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_lw(p_lw_patron numeric, p_lw_id numeric, p_lw_value double precision) OWNER TO srpan_root;

--
-- TOC entry 25 (class 1255 OID 60517)
-- Dependencies: 5 279
-- Name: ins_muestra(character varying, numeric, numeric, character varying); Type: FUNCTION; Schema: public; Owner: srpan_root
--

CREATE FUNCTION ins_muestra(p_mue_path character varying, p_mue_id numeric, p_mue_tam numeric, p_mue_obs character varying) RETURNS numeric
    AS $$

BEGIN
	BEGIN
		INSERT into muestra  VALUES (p_mue_id, p_mue_tam, now()::date, p_mue_obs,p_mue_path); 
	EXCEPTION
		WHEN unique_violation THEN
			RAISE EXCEPTION 'La muestra % ya existe - %',p_mue_id,SQLERRM;
			
		WHEN OTHERS THEN
	 		RAISE EXCEPTION 'Error por % Número %', SQLERRM,SQLSTATE;
			
	END;
	RETURN 1;
END
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_muestra(p_mue_path character varying, p_mue_id numeric, p_mue_tam numeric, p_mue_obs character varying) OWNER TO srpan_root;

--
-- TOC entry 26 (class 1255 OID 60518)
-- Dependencies: 5 279
-- Name: ins_patron(numeric); Type: FUNCTION; Schema: public; Owner: srpan_root
--

CREATE FUNCTION ins_patron(p_pat_analisis numeric) RETURNS numeric
    AS $$
DECLARE 
	cur refcursor;
	result integer;
BEGIN
	BEGIN
		INSERT into patron(pat_analisis) VALUES (p_pat_analisis); -- pat_id es autonumerico (serial)
		OPEN cur FOR select pat_id from patron order by pat_id desc;
		FETCH cur into result;		
	EXCEPTION
		WHEN unique_violation THEN
			RAISE EXCEPTION 'Operacion no valida - %',p_mue_id,SQLERRM;
			
		WHEN OTHERS THEN
	 		RAISE EXCEPTION 'Error por % Número %', SQLERRM,SQLSTATE;
			
	END;
	RETURN result;
END
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_patron(p_pat_analisis numeric) OWNER TO srpan_root;

--
-- TOC entry 27 (class 1255 OID 60520)
-- Dependencies: 5 279
-- Name: ins_tipo_conexion(numeric, character varying); Type: FUNCTION; Schema: public; Owner: srpan_root
--

CREATE FUNCTION ins_tipo_conexion(p_tpcon_cod numeric, p_tpcon_desc character varying) RETURNS numeric
    AS $$

BEGIN
	BEGIN
		INSERT into tipo_conexion VALUES (p_tpcon_cod, p_tpcon_desc); 
	EXCEPTION
		WHEN OTHERS THEN
	 		RAISE EXCEPTION 'Error por % Número %', SQLERRM,SQLSTATE;
			
	END;
	RETURN 1;
END
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_tipo_conexion(p_tpcon_cod numeric, p_tpcon_desc character varying) OWNER TO srpan_root;

--
-- TOC entry 28 (class 1255 OID 60521)
-- Dependencies: 279 5
-- Name: ins_uapp_conexion(numeric, numeric); Type: FUNCTION; Schema: public; Owner: srpan_root
--

CREATE FUNCTION ins_uapp_conexion(p_uacon_id numeric, p_uacon_tip numeric) RETURNS numeric
    AS $$

BEGIN
	BEGIN
		INSERT into uapp_conexion VALUES (p_uacon_id, p_uacon_tip); 
	EXCEPTION
		WHEN unique_violation THEN
			RAISE EXCEPTION 'La clave ya existe - %',SQLERRM;
			
		WHEN foreign_key_violation THEN
			RAISE EXCEPTION 'El tipo de usuario ingresado no es valido ';
			
		WHEN OTHERS THEN
	 		RAISE EXCEPTION 'Error por % Número %', SQLERRM,SQLSTATE;
			
	END;
	RETURN 1;
END
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_uapp_conexion(p_uacon_id numeric, p_uacon_tip numeric) OWNER TO srpan_root;

--
-- TOC entry 29 (class 1255 OID 60522)
-- Dependencies: 5 279
-- Name: ins_usuario(numeric, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: srpan_root
--

CREATE FUNCTION ins_usuario(p_usu_id numeric, p_usu_nombre character varying, p_usu_ap_pat character varying, p_usu_ap_mat character varying) RETURNS numeric
    AS $$

BEGIN
	BEGIN		
		INSERT into usuario VALUES (p_usu_id, p_usu_nombre,p_usu_ap_pat,p_usu_ap_mat,now()::date); 
	EXCEPTION
		WHEN unique_violation THEN
			RAISE EXCEPTION 'El Usuario ya existe - %',SQLERRM;
			
		WHEN OTHERS THEN
	 		RAISE EXCEPTION 'Error por % Número %', SQLERRM,SQLSTATE;
			
	END;
	RETURN 1;
END
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_usuario(p_usu_id numeric, p_usu_nombre character varying, p_usu_ap_pat character varying, p_usu_ap_mat character varying) OWNER TO srpan_root;

--
-- TOC entry 30 (class 1255 OID 60523)
-- Dependencies: 5 279
-- Name: ins_usuario_app(numeric, character varying); Type: FUNCTION; Schema: public; Owner: srpan_root
--

CREATE FUNCTION ins_usuario_app(p_uapp_id numeric, p_uapp_pass character varying) RETURNS numeric
    AS $$

BEGIN
	BEGIN
		INSERT into usuario_app VALUES (p_uapp_id, p_uapp_pass); 
		
		EXCEPTION
			WHEN unique_violation THEN
				RAISE EXCEPTION 'La clave ya existe - %',SQLERRM;
				
			WHEN OTHERS THEN
				RAISE EXCEPTION 'Error por % Número %', SQLERRM,SQLSTATE;
				
	END;
	RETURN 1;
END
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_usuario_app(p_uapp_id numeric, p_uapp_pass character varying) OWNER TO srpan_root;

--
-- TOC entry 31 (class 1255 OID 60524)
-- Dependencies: 5
-- Name: plpgsql_call_handler(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION plpgsql_call_handler() RETURNS language_handler
    AS '$libdir/plpgsql', 'plpgsql_call_handler'
    LANGUAGE c;


ALTER FUNCTION public.plpgsql_call_handler() OWNER TO postgres;

--
-- TOC entry 32 (class 1255 OID 60525)
-- Dependencies: 5
-- Name: plpgsql_validator(oid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION plpgsql_validator(oid) RETURNS void
    AS '$libdir/plpgsql', 'plpgsql_validator'
    LANGUAGE c;


ALTER FUNCTION public.plpgsql_validator(oid) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1214 (class 1259 OID 60528)
-- Dependencies: 5
-- Name: analisis; Type: TABLE; Schema: public; Owner: srpan_root; Tablespace: 
--

CREATE TABLE analisis (
    ana_id serial NOT NULL,
    ana_usuario numeric(8,0) NOT NULL,
    ana_fecha date NOT NULL,
    ana_eventos numeric(8,0) NOT NULL,
    ana_muestra numeric(8,0) NOT NULL,
    ana_desc character varying(20)
);


ALTER TABLE public.analisis OWNER TO srpan_root;

--
-- TOC entry 1227 (class 1259 OID 60753)
-- Dependencies: 5
-- Name: bias; Type: TABLE; Schema: public; Owner: srpan_root; Tablespace: 
--

CREATE TABLE bias (
    b_id numeric(8,0) NOT NULL,
    b_patron integer NOT NULL,
    b_value double precision NOT NULL
);


ALTER TABLE public.bias OWNER TO srpan_root;

--
-- TOC entry 1215 (class 1259 OID 60536)
-- Dependencies: 5
-- Name: conjentr; Type: TABLE; Schema: public; Owner: srpan_root; Tablespace: 
--

CREATE TABLE conjentr (
    con_analisis numeric(8,0) NOT NULL,
    con_evento numeric(8,0) NOT NULL,
    con_seleccionado boolean NOT NULL
);


ALTER TABLE public.conjentr OWNER TO srpan_root;

--
-- TOC entry 1216 (class 1259 OID 60538)
-- Dependencies: 5
-- Name: evento; Type: TABLE; Schema: public; Owner: srpan_root; Tablespace: 
--

CREATE TABLE evento (
    eve_analisis numeric(8,0) NOT NULL,
    eve_id numeric(8,0) NOT NULL,
    eve_inicio double precision NOT NULL,
    eve_fin double precision NOT NULL,
    eve_duracion double precision NOT NULL,
    eve_area double precision NOT NULL,
    eve_maximo double precision NOT NULL,
    eve_stdv double precision NOT NULL,
    eve_promedio double precision NOT NULL,
    eve_durciclo double precision NOT NULL
);


ALTER TABLE public.evento OWNER TO srpan_root;

--
-- TOC entry 1217 (class 1259 OID 60540)
-- Dependencies: 5
-- Name: evento_ce; Type: TABLE; Schema: public; Owner: srpan_root; Tablespace: 
--

CREATE TABLE evento_ce (
    eve_analisis numeric(8,0) NOT NULL,
    eve_id numeric(8,0) NOT NULL,
    eve_inicio double precision NOT NULL,
    eve_fin double precision NOT NULL,
    eve_duracion double precision NOT NULL,
    eve_area double precision NOT NULL,
    eve_maximo double precision NOT NULL,
    eve_stdv double precision NOT NULL,
    eve_promedio double precision NOT NULL,
    eve_durciclo double precision NOT NULL
);


ALTER TABLE public.evento_ce OWNER TO srpan_root;

--
-- TOC entry 1225 (class 1259 OID 60735)
-- Dependencies: 5
-- Name: inputweights; Type: TABLE; Schema: public; Owner: srpan_root; Tablespace: 
--

CREATE TABLE inputweights (
    iw_id numeric(8,0) NOT NULL,
    iw_patron integer NOT NULL,
    iw_value double precision NOT NULL
);


ALTER TABLE public.inputweights OWNER TO srpan_root;

--
-- TOC entry 1226 (class 1259 OID 60744)
-- Dependencies: 5
-- Name: layerweights; Type: TABLE; Schema: public; Owner: srpan_root; Tablespace: 
--

CREATE TABLE layerweights (
    lw_id numeric(8,0) NOT NULL,
    lw_patron integer NOT NULL,
    lw_value double precision NOT NULL
);


ALTER TABLE public.layerweights OWNER TO srpan_root;

--
-- TOC entry 1218 (class 1259 OID 60552)
-- Dependencies: 5
-- Name: muestra; Type: TABLE; Schema: public; Owner: srpan_root; Tablespace: 
--

CREATE TABLE muestra (
    mue_id numeric(8,0) NOT NULL,
    mue_tam numeric(10,0) NOT NULL,
    mue_fecha date NOT NULL,
    mue_obs character varying(80),
    mue_path character varying(255) NOT NULL
);


ALTER TABLE public.muestra OWNER TO srpan_root;

--
-- TOC entry 1596 (class 0 OID 0)
-- Dependencies: 1218
-- Name: COLUMN muestra.mue_path; Type: COMMENT; Schema: public; Owner: srpan_root
--

COMMENT ON COLUMN muestra.mue_path IS 'Ruta del archivo ''mue_id''. RutaArchivo: mue_path || mue_id.';


--
-- TOC entry 1224 (class 1259 OID 60725)
-- Dependencies: 5
-- Name: patron; Type: TABLE; Schema: public; Owner: srpan_root; Tablespace: 
--

CREATE TABLE patron (
    pat_id serial NOT NULL,
    pat_analisis integer NOT NULL
);


ALTER TABLE public.patron OWNER TO srpan_root;

--
-- TOC entry 1219 (class 1259 OID 60559)
-- Dependencies: 5
-- Name: tipo_conexion; Type: TABLE; Schema: public; Owner: srpan_root; Tablespace: 
--

CREATE TABLE tipo_conexion (
    tpcon__cod numeric(8,0) NOT NULL,
    tpcon_desc character varying(20) NOT NULL
);


ALTER TABLE public.tipo_conexion OWNER TO srpan_root;

--
-- TOC entry 1220 (class 1259 OID 60561)
-- Dependencies: 5
-- Name: uapp_conexion; Type: TABLE; Schema: public; Owner: srpan_root; Tablespace: 
--

CREATE TABLE uapp_conexion (
    uacon_id numeric(8,0) NOT NULL,
    uacon_tip numeric(8,0) NOT NULL
);


ALTER TABLE public.uapp_conexion OWNER TO srpan_root;

--
-- TOC entry 1221 (class 1259 OID 60563)
-- Dependencies: 5
-- Name: usuario; Type: TABLE; Schema: public; Owner: srpan_root; Tablespace: 
--

CREATE TABLE usuario (
    usu_id numeric(8,0) NOT NULL,
    usu_nombre character varying(20) NOT NULL,
    usu_ap_pat character varying(20) NOT NULL,
    usu_ap_mat character varying(20) NOT NULL,
    usu_fecha date NOT NULL
);


ALTER TABLE public.usuario OWNER TO srpan_root;

--
-- TOC entry 1222 (class 1259 OID 60565)
-- Dependencies: 5
-- Name: usuario_app; Type: TABLE; Schema: public; Owner: srpan_root; Tablespace: 
--

CREATE TABLE usuario_app (
    uapp_id numeric(8,0) NOT NULL,
    uapp_pass character varying(32) NOT NULL
);


ALTER TABLE public.usuario_app OWNER TO srpan_root;

--
-- TOC entry 1552 (class 2606 OID 60568)
-- Dependencies: 1214 1214
-- Name: pk_analisis; Type: CONSTRAINT; Schema: public; Owner: srpan_root; Tablespace: 
--

ALTER TABLE ONLY analisis
    ADD CONSTRAINT pk_analisis PRIMARY KEY (ana_id);


--
-- TOC entry 1578 (class 2606 OID 60756)
-- Dependencies: 1227 1227 1227
-- Name: pk_bias; Type: CONSTRAINT; Schema: public; Owner: srpan_root; Tablespace: 
--

ALTER TABLE ONLY bias
    ADD CONSTRAINT pk_bias PRIMARY KEY (b_id, b_patron);


--
-- TOC entry 1554 (class 2606 OID 60572)
-- Dependencies: 1215 1215 1215
-- Name: pk_conjentr; Type: CONSTRAINT; Schema: public; Owner: srpan_root; Tablespace: 
--

ALTER TABLE ONLY conjentr
    ADD CONSTRAINT pk_conjentr PRIMARY KEY (con_analisis, con_evento);


--
-- TOC entry 1556 (class 2606 OID 60574)
-- Dependencies: 1216 1216 1216
-- Name: pk_evento; Type: CONSTRAINT; Schema: public; Owner: srpan_root; Tablespace: 
--

ALTER TABLE ONLY evento
    ADD CONSTRAINT pk_evento PRIMARY KEY (eve_analisis, eve_id);


--
-- TOC entry 1559 (class 2606 OID 60576)
-- Dependencies: 1217 1217 1217
-- Name: pk_eventoce; Type: CONSTRAINT; Schema: public; Owner: srpan_root; Tablespace: 
--

ALTER TABLE ONLY evento_ce
    ADD CONSTRAINT pk_eventoce PRIMARY KEY (eve_analisis, eve_id);


--
-- TOC entry 1574 (class 2606 OID 60738)
-- Dependencies: 1225 1225 1225
-- Name: pk_inputweights; Type: CONSTRAINT; Schema: public; Owner: srpan_root; Tablespace: 
--

ALTER TABLE ONLY inputweights
    ADD CONSTRAINT pk_inputweights PRIMARY KEY (iw_id, iw_patron);


--
-- TOC entry 1576 (class 2606 OID 60747)
-- Dependencies: 1226 1226 1226
-- Name: pk_layerweights; Type: CONSTRAINT; Schema: public; Owner: srpan_root; Tablespace: 
--

ALTER TABLE ONLY layerweights
    ADD CONSTRAINT pk_layerweights PRIMARY KEY (lw_id, lw_patron);


--
-- TOC entry 1562 (class 2606 OID 60582)
-- Dependencies: 1218 1218
-- Name: pk_muestra; Type: CONSTRAINT; Schema: public; Owner: srpan_root; Tablespace: 
--

ALTER TABLE ONLY muestra
    ADD CONSTRAINT pk_muestra PRIMARY KEY (mue_id);


--
-- TOC entry 1572 (class 2606 OID 60729)
-- Dependencies: 1224 1224
-- Name: pk_patron; Type: CONSTRAINT; Schema: public; Owner: srpan_root; Tablespace: 
--

ALTER TABLE ONLY patron
    ADD CONSTRAINT pk_patron PRIMARY KEY (pat_id);


--
-- TOC entry 1564 (class 2606 OID 60586)
-- Dependencies: 1219 1219
-- Name: pk_tipo_conexion; Type: CONSTRAINT; Schema: public; Owner: srpan_root; Tablespace: 
--

ALTER TABLE ONLY tipo_conexion
    ADD CONSTRAINT pk_tipo_conexion PRIMARY KEY (tpcon__cod);


--
-- TOC entry 1566 (class 2606 OID 60588)
-- Dependencies: 1220 1220 1220
-- Name: pk_uapp_conexion; Type: CONSTRAINT; Schema: public; Owner: srpan_root; Tablespace: 
--

ALTER TABLE ONLY uapp_conexion
    ADD CONSTRAINT pk_uapp_conexion PRIMARY KEY (uacon_id, uacon_tip);


--
-- TOC entry 1568 (class 2606 OID 60590)
-- Dependencies: 1221 1221
-- Name: pk_usuario; Type: CONSTRAINT; Schema: public; Owner: srpan_root; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_usuario PRIMARY KEY (usu_id);


--
-- TOC entry 1570 (class 2606 OID 60592)
-- Dependencies: 1222 1222
-- Name: pk_usuario_app; Type: CONSTRAINT; Schema: public; Owner: srpan_root; Tablespace: 
--

ALTER TABLE ONLY usuario_app
    ADD CONSTRAINT pk_usuario_app PRIMARY KEY (uapp_id);


--
-- TOC entry 1557 (class 1259 OID 60593)
-- Dependencies: 1217 1217
-- Name: eve_analisis; Type: INDEX; Schema: public; Owner: srpan_root; Tablespace: 
--

CREATE UNIQUE INDEX eve_analisis ON evento_ce USING btree (eve_analisis, eve_id);


--
-- TOC entry 1560 (class 1259 OID 60594)
-- Dependencies: 1218
-- Name: mue_id; Type: INDEX; Schema: public; Owner: srpan_root; Tablespace: 
--

CREATE UNIQUE INDEX mue_id ON muestra USING btree (mue_id);


--
-- TOC entry 1579 (class 2606 OID 60595)
-- Dependencies: 1561 1218 1214
-- Name: fk_analisis_reference_muestra; Type: FK CONSTRAINT; Schema: public; Owner: srpan_root
--

ALTER TABLE ONLY analisis
    ADD CONSTRAINT fk_analisis_reference_muestra FOREIGN KEY (ana_muestra) REFERENCES muestra(mue_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1580 (class 2606 OID 60600)
-- Dependencies: 1567 1221 1214
-- Name: fk_analisis_reference_usuario; Type: FK CONSTRAINT; Schema: public; Owner: srpan_root
--

ALTER TABLE ONLY analisis
    ADD CONSTRAINT fk_analisis_reference_usuario FOREIGN KEY (ana_usuario) REFERENCES usuario(usu_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1590 (class 2606 OID 60757)
-- Dependencies: 1571 1227 1224
-- Name: fk_bias_reference_patron; Type: FK CONSTRAINT; Schema: public; Owner: srpan_root
--

ALTER TABLE ONLY bias
    ADD CONSTRAINT fk_bias_reference_patron FOREIGN KEY (b_patron) REFERENCES patron(pat_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1581 (class 2606 OID 60610)
-- Dependencies: 1214 1551 1215
-- Name: fk_conjentr_fk_conjen_analisis; Type: FK CONSTRAINT; Schema: public; Owner: srpan_root
--

ALTER TABLE ONLY conjentr
    ADD CONSTRAINT fk_conjentr_fk_conjen_analisis FOREIGN KEY (con_analisis) REFERENCES analisis(ana_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1582 (class 2606 OID 60615)
-- Dependencies: 1215 1215 1217 1558 1217
-- Name: fk_conjentr_fk_conjen_evento_c; Type: FK CONSTRAINT; Schema: public; Owner: srpan_root
--

ALTER TABLE ONLY conjentr
    ADD CONSTRAINT fk_conjentr_fk_conjen_evento_c FOREIGN KEY (con_analisis, con_evento) REFERENCES evento_ce(eve_analisis, eve_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1584 (class 2606 OID 60620)
-- Dependencies: 1214 1551 1217
-- Name: fk_evento_c_fk_evece__analisis; Type: FK CONSTRAINT; Schema: public; Owner: srpan_root
--

ALTER TABLE ONLY evento_ce
    ADD CONSTRAINT fk_evento_c_fk_evece__analisis FOREIGN KEY (eve_analisis) REFERENCES analisis(ana_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1583 (class 2606 OID 60625)
-- Dependencies: 1214 1551 1216
-- Name: fk_evento_reference_analisis; Type: FK CONSTRAINT; Schema: public; Owner: srpan_root
--

ALTER TABLE ONLY evento
    ADD CONSTRAINT fk_evento_reference_analisis FOREIGN KEY (eve_analisis) REFERENCES analisis(ana_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1588 (class 2606 OID 60739)
-- Dependencies: 1224 1571 1225
-- Name: fk_inputwei_reference_patron; Type: FK CONSTRAINT; Schema: public; Owner: srpan_root
--

ALTER TABLE ONLY inputweights
    ADD CONSTRAINT fk_inputwei_reference_patron FOREIGN KEY (iw_patron) REFERENCES patron(pat_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1589 (class 2606 OID 60748)
-- Dependencies: 1224 1571 1226
-- Name: fk_layerwei_reference_patron; Type: FK CONSTRAINT; Schema: public; Owner: srpan_root
--

ALTER TABLE ONLY layerweights
    ADD CONSTRAINT fk_layerwei_reference_patron FOREIGN KEY (lw_patron) REFERENCES patron(pat_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1587 (class 2606 OID 60730)
-- Dependencies: 1224 1214 1551
-- Name: fk_patron_reference_analisis; Type: FK CONSTRAINT; Schema: public; Owner: srpan_root
--

ALTER TABLE ONLY patron
    ADD CONSTRAINT fk_patron_reference_analisis FOREIGN KEY (pat_analisis) REFERENCES analisis(ana_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1585 (class 2606 OID 60645)
-- Dependencies: 1563 1220 1219
-- Name: fk_uapp_con_reference_tipo_con; Type: FK CONSTRAINT; Schema: public; Owner: srpan_root
--

ALTER TABLE ONLY uapp_conexion
    ADD CONSTRAINT fk_uapp_con_reference_tipo_con FOREIGN KEY (uacon_tip) REFERENCES tipo_conexion(tpcon__cod) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1586 (class 2606 OID 60650)
-- Dependencies: 1569 1220 1222
-- Name: fk_uapp_con_reference_usuario_; Type: FK CONSTRAINT; Schema: public; Owner: srpan_root
--

ALTER TABLE ONLY uapp_conexion
    ADD CONSTRAINT fk_uapp_con_reference_usuario_ FOREIGN KEY (uacon_id) REFERENCES usuario_app(uapp_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1594 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 1595 (class 0 OID 0)
-- Dependencies: 279
-- Name: plpgsql; Type: ACL; Schema: -; Owner: 
--

REVOKE ALL ON LANGUAGE plpgsql FROM PUBLIC;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON LANGUAGE plpgsql TO postgres;
RESET SESSION AUTHORIZATION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON LANGUAGE plpgsql TO PUBLIC;
RESET SESSION AUTHORIZATION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON LANGUAGE plpgsql TO srpan_root;
RESET SESSION AUTHORIZATION;


-- Completed on 2008-12-11 19:39:09 Hora de ver. del Pac�fico SA

--
-- PostgreSQL database dump complete
--

