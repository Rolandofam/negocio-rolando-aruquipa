--
-- PostgreSQL database dump
--

-- Started on 2026-10-18

--
-- TOC entry 171 (class 3079 OID 11638)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

-- CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1915 (class 0 OID 0)
-- Dependencies: 171
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 162 (class 1259 OID 59671)
-- Name: categoria; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE categoria (
    id integer NOT NULL,
    nombre character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 161 (class 1259 OID 59669)
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1916 (class 0 OID 0)
-- Dependencies: 161
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE categoria_id_seq OWNED BY categoria.id;


--
-- TOC entry 164 (class 1259 OID 59680)
-- Name: cliente; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cliente (
    id integer NOT NULL,
    nombre character varying(255) DEFAULT NULL::character varying,
    telefono integer DEFAULT 0,
    email character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 163 (class 1259 OID 59678)
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1917 (class 0 OID 0)
-- Dependencies: 163
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cliente_id_seq OWNED BY cliente.id;


--
-- TOC entry 166 (class 1259 OID 59691)
-- Name: detallepedido; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE detallepedido (
    id integer NOT NULL,
    cantidad integer DEFAULT 0,
    preciounitario numeric DEFAULT 0,
    pedido_id integer DEFAULT 0,
    producto_id integer DEFAULT 0
);


--
-- TOC entry 165 (class 1259 OID 59689)
-- Name: detallepedido_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE detallepedido_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1918 (class 0 OID 0)
-- Dependencies: 165
-- Name: detallepedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE detallepedido_id_seq OWNED BY detallepedido.id;


--
-- TOC entry 168 (class 1259 OID 59701)
-- Name: pedido; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pedido (
    id integer NOT NULL,
    fecha timestamp without time zone,
    estado character varying(255) DEFAULT NULL::character varying,
    cliente_id integer DEFAULT 0
);


--
-- TOC entry 167 (class 1259 OID 59699)
-- Name: pedido_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pedido_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1919 (class 0 OID 0)
-- Dependencies: 167
-- Name: pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pedido_id_seq OWNED BY pedido.id;


--
-- TOC entry 170 (class 1259 OID 59709)
-- Name: producto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE producto (
    id integer NOT NULL,
    nombre character varying(255) DEFAULT NULL::character varying,
    precio integer DEFAULT 0,
    stock integer DEFAULT 0,
    categoria_id integer DEFAULT 0
);


--
-- TOC entry 169 (class 1259 OID 59707)
-- Name: producto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1920 (class 0 OID 0)
-- Dependencies: 169
-- Name: producto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE producto_id_seq OWNED BY producto.id;


--
-- TOC entry 1771 (class 2604 OID 59674)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoria ALTER COLUMN id SET DEFAULT nextval('categoria_id_seq'::regclass);


--
-- TOC entry 1773 (class 2604 OID 59683)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cliente ALTER COLUMN id SET DEFAULT nextval('cliente_id_seq'::regclass);


--
-- TOC entry 1777 (class 2604 OID 59694)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY detallepedido ALTER COLUMN id SET DEFAULT nextval('detallepedido_id_seq'::regclass);


--
-- TOC entry 1782 (class 2604 OID 59704)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pedido ALTER COLUMN id SET DEFAULT nextval('pedido_id_seq'::regclass);


--
-- TOC entry 1785 (class 2604 OID 59712)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY producto ALTER COLUMN id SET DEFAULT nextval('producto_id_seq'::regclass);


--
-- TOC entry 1791 (class 2606 OID 59677)
-- Name: categoria_nombre_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_nombre_key UNIQUE (nombre);


--
-- TOC entry 1793 (class 2606 OID 59718)
-- Name: categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- TOC entry 1795 (class 2606 OID 59688)
-- Name: cliente_nombre_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_nombre_key UNIQUE (nombre);


--
-- TOC entry 1797 (class 2606 OID 59720)
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 1799 (class 2606 OID 59722)
-- Name: detallepedido_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY detallepedido
    ADD CONSTRAINT detallepedido_pkey PRIMARY KEY (id);


--
-- TOC entry 1801 (class 2606 OID 59724)
-- Name: pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id);


--
-- TOC entry 1803 (class 2606 OID 59726)
-- Name: producto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id);


--
-- TOC entry 1804 (class 2606 OID 59727)
-- Name: detallepedido_pedido_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY detallepedido
    ADD CONSTRAINT detallepedido_pedido_id_fkey FOREIGN KEY (pedido_id) REFERENCES pedido(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1805 (class 2606 OID 59732)
-- Name: detallepedido_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY detallepedido
    ADD CONSTRAINT detallepedido_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES producto(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1806 (class 2606 OID 59737)
-- Name: pedido_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT pedido_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES cliente(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1807 (class 2606 OID 59742)
-- Name: producto_categoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT producto_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES categoria(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


-- Completed on 2026-10-18

--
-- PostgreSQL database dump complete
--

