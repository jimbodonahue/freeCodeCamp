--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    galaxy_name character varying(255) NOT NULL,
    age character varying(255),
    distance integer,
    brightness integer NOT NULL
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
    planet_name character varying(255) NOT NULL,
    moon_name character varying(255) NOT NULL,
    rating integer,
    description character varying(255)
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
    star_name character varying(255) NOT NULL,
    planet_name character varying(255) NOT NULL,
    moons integer NOT NULL,
    composition character varying(255),
    life boolean,
    color character varying(255)
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
    galaxy_name character varying(255) NOT NULL,
    star_name character varying(255) NOT NULL,
    planets boolean NOT NULL,
    distance integer,
    mass integer,
    color character varying(255) NOT NULL,
    rating integer
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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', '11 billion years', 0, -27);
INSERT INTO public.galaxy VALUES (2, 'Sombrero Galaxy', NULL, 31, 8);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', '11 billion years', 1, 0);
INSERT INTO public.galaxy VALUES (4, 'Star Wars', 'A long time ago', 9999, 9999);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth', 'The Moon', 9, 'nice and pale in the night sky (and sometimes day)');
INSERT INTO public.moon VALUES (2, 'Jupiter', 'Ganymede', 8, 'biggest in the solar system');
INSERT INTO public.moon VALUES (3, 'Saturn', 'Titan', 9, 'watch out for sirens');
INSERT INTO public.moon VALUES (4, 'Jupiter', 'Callisto', 5, 'props to Galileo');
INSERT INTO public.moon VALUES (5, 'Jupiter', 'Io', 2, 'needs more_name');
INSERT INTO public.moon VALUES (6, 'Jupiter', 'Europa', 5, 'last of the big 4');
INSERT INTO public.moon VALUES (7, 'Neptune', 'Triton', 8, 'only moon_named after a weapon');
INSERT INTO public.moon VALUES (8, 'Uranus', 'Titania', 6, 'not actually made of cheese');
INSERT INTO public.moon VALUES (9, 'Saturn', 'Rhea', 5, 'second shortest_name');
INSERT INTO public.moon VALUES (11, 'Saturn', 'Iapetus', 3, 'outshone by rings');
INSERT INTO public.moon VALUES (12, 'Uranus', 'Umbriel', 1, 'actually smaller than Charon and Pluto isnt even a real planet');
INSERT INTO public.moon VALUES (16, 'Yavin', 'Yavin 2', 9, 'great but overshadowed by history');
INSERT INTO public.moon VALUES (18, 'Yavin', 'Yavin 4', 7, 'rebel base');
INSERT INTO public.moon VALUES (19, 'Endor', 'Desert Moon', 6, 'if theres a forest moon there must be another biome');
INSERT INTO public.moon VALUES (20, 'Endor', 'Forest Moon', 10, 'EWOKS EWOKS EWOKS');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Sol', 'Earth', 1, 'dirt', true, 'greenish-blue');
INSERT INTO public.planet VALUES (2, 'Sol', 'Jupiter', 96, 'gas giant', false, 'swirly oranges');
INSERT INTO public.planet VALUES (3, 'Sol', 'Saturn', 146, 'gas giant', false, 'Jupiter with better rings');
INSERT INTO public.planet VALUES (4, 'Sol', 'Uranus', 28, 'gas giant', false, 'methane blue');
INSERT INTO public.planet VALUES (5, 'Sol', 'Mars', 2, 'red rocks', false, 'great place for a rover');
INSERT INTO public.planet VALUES (6, 'Sol', 'Neptune', 16, 'gas giant', false, 'methane green');
INSERT INTO public.planet VALUES (7, 'Sol', 'Venus', 0, 'rocky hellscape', false, 'acid for clouds');
INSERT INTO public.planet VALUES (8, 'Sol', 'Mercury', 0, 'rocky', false, 'just a rock');
INSERT INTO public.planet VALUES (9, 'Betelgeuse', 'Ford Prefects Planet', 42, 'rocky', true, 'probably nice');
INSERT INTO public.planet VALUES (10, 'SN 1984A', 'Supernova casualty', 0, 'gone', false, 'destroyed by supernova');
INSERT INTO public.planet VALUES (11, 'Yavin', 'Yavin', 5, 'gas giant', true, 'good place to hide from a Death Star');
INSERT INTO public.planet VALUES (12, 'Endor', 'Endor', 18, 'probably gas', true, 'good place to build a Death Star');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Milky Way', 'Sol', true, 0, 332950, 'yellow', 8);
INSERT INTO public.star VALUES (2, 'Milky Way', 'Betelgeuse', false, 125, 5000000, 'red', 10);
INSERT INTO public.star VALUES (3, 'Sombrero Galaxy', 'unnamed', false, 9550000, NULL, 'pretty', 5);
INSERT INTO public.star VALUES (4, 'Large Magellanic Cloud', 'SN 1984A', false, 51400, 6700000, 'supernova', 2);
INSERT INTO public.star VALUES (5, 'Star Wars', 'Yavin', true, NULL, 2000000, 'red', 6);
INSERT INTO public.star VALUES (6, 'Star Wars', 'Endor', true, NULL, 1500000, 'blue', 8);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (galaxy_name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (moon_name);


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
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (planet_name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (star_name);


--
-- Name: moon moon_planet_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_name_fkey FOREIGN KEY (planet_name) REFERENCES public.planet(planet_name);


--
-- Name: planet planet_star_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_name_fkey FOREIGN KEY (star_name) REFERENCES public.star(star_name);


--
-- Name: star star_galaxy_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_name_fkey FOREIGN KEY (galaxy_name) REFERENCES public.galaxy(galaxy_name);


--
-- PostgreSQL database dump complete
--

