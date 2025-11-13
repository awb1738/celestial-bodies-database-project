--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(40),
    light_year_from_milky_in_millions numeric(4,2) NOT NULL,
    galaxy_type character varying(30),
    age_in_billions_years integer
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
    name character varying(40) NOT NULL,
    related_planet character varying(40),
    age_in_billions_of_years numeric(4,3),
    types_of_surfaces text,
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
    name character varying(40),
    has_moon boolean NOT NULL,
    num_of_moons integer,
    orbit_star character varying(50),
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    star_type text,
    temperature_in_f integer,
    age_in_million_years integer,
    is_near_death boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_galaxy (
    name character varying(40) NOT NULL,
    star_galaxy_id integer NOT NULL,
    relationship text NOT NULL
);


ALTER TABLE public.star_galaxy OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star_galaxy.star_galaxy_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_galaxy star_galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_galaxy ALTER COLUMN star_galaxy_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 2.54, 'Spiral', 10);
INSERT INTO public.galaxy VALUES (2, 'Triangulum Galaxy', 2.73, 'Spiral', 10);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 0.16, 'Irregular', 13);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 0.20, 'Irregular', 13);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 31.00, 'Spiral', 11);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', 21.00, 'Spiral', 10);
INSERT INTO public.galaxy VALUES (7, 'Sombrero Galaxy', 29.00, 'Spiral', 13);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 'Earth', 4.500, 'Rocky and dusty', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars', 4.300, 'Rocky and dusty', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars', 4.300, 'Rocky and smooth', 2);
INSERT INTO public.moon VALUES (4, 'Io', 'Jupiter', 4.500, 'Volcanic', 3);
INSERT INTO public.moon VALUES (5, 'Europa', 'Jupiter', 4.500, 'Icy with cracks', 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Jupiter', 4.500, 'Icy and rocky', 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Jupiter', 4.500, 'Icy and cratered', 3);
INSERT INTO public.moon VALUES (8, 'Titan', 'Saturn', 4.500, 'Icy with lakes', 5);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Saturn', 4.500, 'Icy with geysers', 5);
INSERT INTO public.moon VALUES (10, 'Rhea', 'Saturn', 4.500, 'Icy and cratered', 5);
INSERT INTO public.moon VALUES (11, 'Iapetus', 'Saturn', 4.500, 'Two-tone icy and dark', 5);
INSERT INTO public.moon VALUES (12, 'Titania', 'Uranus', 4.500, 'Icy and rocky', 6);
INSERT INTO public.moon VALUES (13, 'Oberon', 'Uranus', 4.500, 'Icy and dark', 6);
INSERT INTO public.moon VALUES (14, 'Miranda', 'Uranus', 4.500, 'Icy and fractured', 6);
INSERT INTO public.moon VALUES (15, 'Triton', 'Neptune', 4.000, 'Icy and geologically active', 7);
INSERT INTO public.moon VALUES (16, 'Nereid', 'Neptune', 4.000, 'Icy and cratered', 7);
INSERT INTO public.moon VALUES (17, 'Charon', 'Pluto', 4.500, 'Icy and rocky', 9);
INSERT INTO public.moon VALUES (18, 'Dysnomia', 'Eris', 4.500, 'Icy', 9);
INSERT INTO public.moon VALUES (19, 'Dione', 'Saturn', 4.500, 'Icy and cratered', 5);
INSERT INTO public.moon VALUES (20, 'Ariel', 'Uranus', 4.500, 'Icy with canyons', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 1, 'The Sun', 3);
INSERT INTO public.planet VALUES (2, 'Mars', true, 2, 'The Sun', 4);
INSERT INTO public.planet VALUES (3, 'Jupiter', true, 95, 'The Sun', 4);
INSERT INTO public.planet VALUES (4, 'Mercury', false, NULL, 'The Sun', 5);
INSERT INTO public.planet VALUES (5, 'Saturn', true, 146, 'The Sun', 6);
INSERT INTO public.planet VALUES (8, 'Venus', false, NULL, 'The Sun', 7);
INSERT INTO public.planet VALUES (6, 'Uranus', true, 27, 'The Sun', 7);
INSERT INTO public.planet VALUES (7, 'Neptune', true, 14, 'The Sun', 5);
INSERT INTO public.planet VALUES (9, 'Pluto', true, 5, 'The Sun', 7);
INSERT INTO public.planet VALUES (10, 'Kepler-10b', false, NULL, 'Kepler-10', 4);
INSERT INTO public.planet VALUES (11, '55 Cancri e', false, NULL, '55 Cancri A', 6);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', false, NULL, 'Proxima Centauri', 7);
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1e', false, NULL, 'TRAPPIST-1', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Red Supergiant', 5840, 14, true, 1);
INSERT INTO public.star VALUES (3, 'Rigel', 'Blue Supergiant', 21280, 9, true, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Red Dwarf', 5030, 5000, false, 2);
INSERT INTO public.star VALUES (5, 'Vega', 'White Star', 16820, 455, false, 4);
INSERT INTO public.star VALUES (6, 'Polaris', 'Yellow Supergiant', 10340, 67, true, 4);
INSERT INTO public.star VALUES (7, 'Antares', 'Red Supergiant', 5840, 17, true, 1);
INSERT INTO public.star VALUES (1, 'Sirius A', 'White Star', 17452, 230, false, 1);


--
-- Data for Name: star_galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_galaxy VALUES ('Small Star', 1, 'In Space');
INSERT INTO public.star_galaxy VALUES ('Larges Star', 2, 'In Space');
INSERT INTO public.star_galaxy VALUES ('Medium Star', 3, 'In Space');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star_galaxy star_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_galaxy
    ADD CONSTRAINT star_galaxy_name_key UNIQUE (name);


--
-- Name: star_galaxy star_galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_galaxy
    ADD CONSTRAINT star_galaxy_pkey PRIMARY KEY (star_galaxy_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

