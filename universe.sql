--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_age_in_million_years numeric NOT NULL,
    distance_in_light_years numeric,
    number_of_stars integer,
    number_of_star_clusters integer,
    universe_present boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    moon_age_in_million_years numeric NOT NULL,
    distance_from_planet_center numeric,
    brightness integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_age_in_million_years numeric NOT NULL,
    distance_from_star_center numeric,
    brightness integer,
    has_moons boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(255),
    description text,
    has_life boolean,
    is_spherical boolean,
    population_estimate integer DEFAULT 1000000 NOT NULL,
    habitable_zone boolean DEFAULT true NOT NULL
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_age_in_million_years numeric NOT NULL,
    distance_from_galaxy_center numeric,
    luminosity integer,
    is_supernova boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13000, 26000, 200000000, 15000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 14000, 22000, 400000000, 20000, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 9000, 30000, 40000000, 5000, true);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 13000, 29000, 10000000, 3000, false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 12000, 31000, 8000000, 2500, true);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 11000, 34000, 6000000, 1800, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (86, 'Moon 1', 10, 30, 5, 1);
INSERT INTO public.moon VALUES (87, 'Moon 2', 15, 40, 7, 1);
INSERT INTO public.moon VALUES (88, 'Moon 3', 5, 15, 3, 2);
INSERT INTO public.moon VALUES (89, 'Moon 4', 12, 35, 6, 3);
INSERT INTO public.moon VALUES (90, 'Moon 5', 8, 25, 4, 4);
INSERT INTO public.moon VALUES (91, 'Moon 6', 25, 50, 10, 5);
INSERT INTO public.moon VALUES (92, 'Moon 7', 18, 45, 8, 6);
INSERT INTO public.moon VALUES (93, 'Moon 8', 30, 70, 12, 7);
INSERT INTO public.moon VALUES (94, 'Moon 9', 22, 55, 11, 8);
INSERT INTO public.moon VALUES (95, 'Moon 10', 40, 90, 15, 9);
INSERT INTO public.moon VALUES (96, 'Moon 11', 14, 38, 7, 10);
INSERT INTO public.moon VALUES (97, 'Moon 12', 20, 60, 10, 11);
INSERT INTO public.moon VALUES (98, 'Moon 13', 12, 34, 6, 12);
INSERT INTO public.moon VALUES (99, 'Moon 14', 28, 75, 13, 1);
INSERT INTO public.moon VALUES (100, 'Moon 15', 16, 42, 8, 2);
INSERT INTO public.moon VALUES (101, 'Moon 16', 10, 29, 5, 3);
INSERT INTO public.moon VALUES (102, 'Moon 17', 14, 38, 7, 4);
INSERT INTO public.moon VALUES (103, 'Moon 18', 24, 65, 11, 5);
INSERT INTO public.moon VALUES (104, 'Moon 19', 18, 48, 9, 6);
INSERT INTO public.moon VALUES (105, 'Moon 20', 22, 58, 10, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Namek', 100, 150, 30, true, 2);
INSERT INTO public.planet VALUES (2, 'Vegeta', 50, 70, 45, false, 3);
INSERT INTO public.planet VALUES (3, 'Kame House', 10, 30, 10, false, 1);
INSERT INTO public.planet VALUES (4, 'Frieza Planet 79', 200, 300, 70, true, 4);
INSERT INTO public.planet VALUES (5, 'New Namek', 150, 200, 40, true, 2);
INSERT INTO public.planet VALUES (6, 'Yardrat', 40, 60, 25, false, 5);
INSERT INTO public.planet VALUES (7, 'Saiyan Homeworld', 80, 110, 60, false, 3);
INSERT INTO public.planet VALUES (8, 'King Kai''s Planet', 15, 40, 15, false, 1);
INSERT INTO public.planet VALUES (9, 'Planet Namek', 120, 180, 35, true, 2);
INSERT INTO public.planet VALUES (10, 'Makyo Star', 300, 450, 80, false, 4);
INSERT INTO public.planet VALUES (11, 'Arlians'' Planet', 25, 50, 20, false, 6);
INSERT INTO public.planet VALUES (12, 'Bardock''s Planet', 70, 100, 50, false, 3);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (8, 'Gas Giant', 'Large planets composed mainly of gas.', false, true, -1, false);
INSERT INTO public.planet_types VALUES (10, 'Molten World', 'Planets with extremely high temperatures and molten surfaces.', false, true, 0, false);
INSERT INTO public.planet_types VALUES (11, 'Rocky Planet', 'Terrestrial planets with rocky surfaces but no diverse ecosystems.', false, true, 0, false);
INSERT INTO public.planet_types VALUES (12, 'Ocean World', 'Planets with vast oceans covering their surfaces.', true, true, 0, true);
INSERT INTO public.planet_types VALUES (13, 'Frozen Planet', 'Planets with extremely cold and frozen surfaces.', false, true, 0, false);
INSERT INTO public.planet_types VALUES (14, 'Desert World', 'Planets with arid desert-like environments.', false, true, 0, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4500, 0, 1, false, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 6000, 4.22, 0, false, 2);
INSERT INTO public.star VALUES (3, 'Sirius', 200, 8.6, 24, false, 3);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 10000, 640, 140000, false, 4);
INSERT INTO public.star VALUES (5, 'Vega', 450, 25, 40, false, 5);
INSERT INTO public.star VALUES (6, 'Polaris', 70, 433.8, 45, false, 6);
INSERT INTO public.star VALUES (7, 'Antares', 12000, 554, 10000, false, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 105, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: planet_types unique_planet_types_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT unique_planet_types_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

