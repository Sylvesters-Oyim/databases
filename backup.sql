--
-- PostgreSQL database dump
--

\restrict sqC5JGvfja1Oh9SvoJvelbKE9nuWiduWkatF8TTFSH9zcvYj966YYKJj5r9sR4E

-- Dumped from database version 16.15 (Ubuntu 16.15-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.15 (Ubuntu 16.15-0ubuntu0.24.04.1)

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
-- Name: drug_gene; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.drug_gene (
    drug_id integer NOT NULL,
    gene text NOT NULL,
    guideline_source text NOT NULL
);


ALTER TABLE public.drug_gene OWNER TO ubuntu;

--
-- Name: drugs; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.drugs (
    drug_id integer NOT NULL,
    generic_name text NOT NULL,
    drug_class text NOT NULL,
    unit_price numeric NOT NULL,
    stock_qty integer DEFAULT 0 NOT NULL,
    CONSTRAINT drugs_stock_qty_check CHECK ((stock_qty >= 0)),
    CONSTRAINT drugs_unit_price_check CHECK ((unit_price >= (0)::numeric))
);


ALTER TABLE public.drugs OWNER TO ubuntu;

--
-- Name: patients; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.patients (
    patient_id integer NOT NULL,
    full_name text NOT NULL,
    birth_year integer NOT NULL,
    city text NOT NULL,
    CONSTRAINT patients_birth_year_check CHECK (((birth_year >= 1900) AND (birth_year <= 2026)))
);


ALTER TABLE public.patients OWNER TO ubuntu;

--
-- Name: prescribers; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.prescribers (
    prescriber_id integer NOT NULL,
    full_name text NOT NULL,
    specialty text NOT NULL
);


ALTER TABLE public.prescribers OWNER TO ubuntu;

--
-- Name: prescriptions; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.prescriptions (
    rx_id integer NOT NULL,
    patient_id integer NOT NULL,
    prescriber_id integer NOT NULL,
    drug_id integer NOT NULL,
    quantity integer NOT NULL,
    rx_date text NOT NULL,
    CONSTRAINT prescriptions_quantity_check CHECK ((quantity > 0))
);


ALTER TABLE public.prescriptions OWNER TO ubuntu;

--
-- Name: variants; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.variants (
    variant_id integer NOT NULL,
    gene text NOT NULL,
    star_allele text NOT NULL,
    rsid text,
    function_class text NOT NULL
);


ALTER TABLE public.variants OWNER TO ubuntu;

--
-- Data for Name: drug_gene; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.drug_gene (drug_id, gene, guideline_source) FROM stdin;
1	CYP2C9	CPIC
2	CYP2C19	CPIC
3	CYP2C9	CPIC
4	CYP2C19	CPIC
8	CYP2C9	CPIC
\.


--
-- Data for Name: drugs; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.drugs (drug_id, generic_name, drug_class, unit_price, stock_qty) FROM stdin;
1	Warfarin	Anticoagulant	2.10	480
2	Clopidogrel	Antiplatelet	4.75	300
3	Phenytoin	Antiepileptic	1.60	150
4	Omeprazole	Proton pump inhibitor	1.95	620
5	Metformin	Antidiabetic	0.85	1200
6	Amlodipine	Antihypertensive	1.20	900
7	Atorvastatin	Statin	3.40	40
8	Celecoxib	Anti-inflammatory	6.30	0
9	Losartan	Antihypertensive	2.25	510
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.patients (patient_id, full_name, birth_year, city) FROM stdin;
1	Amina Otieno	1958	Kisumu
2	Thabo Mokoena	1972	Makhanda
3	Lerato Dlamini	1990	Gqeberha
4	Wanjiru Kamau	1965	Nairobi
5	Sipho Ndlovu	1949	Makhanda
6	Fatuma Hassan	1983	Mombasa
7	Pieter Botha	1955	Gqeberha
8	Achieng Odhiambo	1997	Kisumu
9	Nomsa Zulu	1961	Makhanda
10	Brian Mwangi	2001	Nairobi
11	Zanele Khumalo	1978	East London
12	Kiprop Cheruiyot	1969	Eldoret
\.


--
-- Data for Name: prescribers; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.prescribers (prescriber_id, full_name, specialty) FROM stdin;
1	Dr Naledi Sithole	Cardiology
2	Dr James Omondi	General Practice
3	Dr Priya Naidoo	Neurology
4	Dr Hannah Meyer	Gastroenterology
5	Dr Samuel Kiptoo	Rheumatology
\.


--
-- Data for Name: prescriptions; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.prescriptions (rx_id, patient_id, prescriber_id, drug_id, quantity, rx_date) FROM stdin;
1	1	1	1	30	2026-01-12
2	1	1	6	30	2026-01-12
3	2	2	5	60	2026-01-20
4	3	2	4	28	2026-02-03
5	4	1	2	30	2026-02-10
6	4	1	7	30	2026-02-10
7	5	1	1	30	2026-02-14
8	5	2	5	60	2026-02-14
9	6	3	3	90	2026-03-01
10	7	1	2	30	2026-03-05
11	7	4	4	28	2026-03-05
12	8	2	4	14	2026-03-18
13	9	1	6	30	2026-04-02
14	9	1	9	30	2026-04-02
15	10	3	3	60	2026-04-11
16	11	2	5	60	2026-04-20
17	1	1	1	30	2026-05-12
18	5	1	1	30	2026-05-15
19	2	2	5	60	2026-05-20
20	4	1	2	30	2026-06-09
\.


--
-- Data for Name: variants; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.variants (variant_id, gene, star_allele, rsid, function_class) FROM stdin;
1	CYP2C9	*2	rs1799853	Decreased function
2	CYP2C9	*3	rs1057910	No function
3	CYP2C9	*5	rs28371686	Decreased function
4	CYP2C9	*6	rs9332131	No function
5	CYP2C9	*8	rs7900194	Decreased function
6	CYP2C9	*11	rs28371685	Decreased function
7	CYP2C19	*2	rs4244285	No function
8	CYP2C19	*3	rs4986893	No function
9	CYP2C19	*17	rs12248560	Increased function
\.


--
-- Name: drug_gene drug_gene_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.drug_gene
    ADD CONSTRAINT drug_gene_pkey PRIMARY KEY (drug_id, gene);


--
-- Name: drugs drugs_generic_name_key; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.drugs
    ADD CONSTRAINT drugs_generic_name_key UNIQUE (generic_name);


--
-- Name: drugs drugs_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.drugs
    ADD CONSTRAINT drugs_pkey PRIMARY KEY (drug_id);


--
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (patient_id);


--
-- Name: prescribers prescribers_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prescribers
    ADD CONSTRAINT prescribers_pkey PRIMARY KEY (prescriber_id);


--
-- Name: prescriptions prescriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT prescriptions_pkey PRIMARY KEY (rx_id);


--
-- Name: variants variants_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.variants
    ADD CONSTRAINT variants_pkey PRIMARY KEY (variant_id);


--
-- Name: variants variants_rsid_key; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.variants
    ADD CONSTRAINT variants_rsid_key UNIQUE (rsid);


--
-- Name: drug_gene drug_gene_drug_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.drug_gene
    ADD CONSTRAINT drug_gene_drug_id_fkey FOREIGN KEY (drug_id) REFERENCES public.drugs(drug_id);


--
-- Name: prescriptions prescriptions_drug_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT prescriptions_drug_id_fkey FOREIGN KEY (drug_id) REFERENCES public.drugs(drug_id);


--
-- Name: prescriptions prescriptions_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT prescriptions_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(patient_id);


--
-- Name: prescriptions prescriptions_prescriber_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT prescriptions_prescriber_id_fkey FOREIGN KEY (prescriber_id) REFERENCES public.prescribers(prescriber_id);


--
-- PostgreSQL database dump complete
--

\unrestrict sqC5JGvfja1Oh9SvoJvelbKE9nuWiduWkatF8TTFSH9zcvYj966YYKJj5r9sR4E

