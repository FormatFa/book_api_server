--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8 (Debian 12.8-1.pgdg110+1)
-- Dumped by pg_dump version 12.8 (Debian 12.8-1.pgdg110+1)

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
-- Name: book; Type: SCHEMA; Schema: -; Owner: book
--

CREATE SCHEMA book;


ALTER SCHEMA book OWNER TO book;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: book; Type: TABLE; Schema: book; Owner: book
--

CREATE TABLE book.book (
    id bigint NOT NULL,
    name character varying(45),
    author character varying(45),
    category bigint,
    status character varying(45),
    word_count bigint
);


ALTER TABLE book.book OWNER TO book;

--
-- Name: book_category; Type: TABLE; Schema: book; Owner: book
--

CREATE TABLE book.book_category (
    id bigint NOT NULL,
    parent_id bigint,
    category character varying(10)
);


ALTER TABLE book.book_category OWNER TO book;

--
-- Name: book_category_id_seq; Type: SEQUENCE; Schema: book; Owner: book
--

CREATE SEQUENCE book.book_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE book.book_category_id_seq OWNER TO book;

--
-- Name: book_category_id_seq; Type: SEQUENCE OWNED BY; Schema: book; Owner: book
--

ALTER SEQUENCE book.book_category_id_seq OWNED BY book.book_category.id;


--
-- Name: book_chapter; Type: TABLE; Schema: book; Owner: book
--

CREATE TABLE book.book_chapter (
    chapter_id bigint NOT NULL,
    book_id bigint NOT NULL,
    content text,
    price bigint,
    title character varying(45)
);


ALTER TABLE book.book_chapter OWNER TO book;

--
-- Name: book_chapter_chapter_id_seq; Type: SEQUENCE; Schema: book; Owner: book
--

CREATE SEQUENCE book.book_chapter_chapter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE book.book_chapter_chapter_id_seq OWNER TO book;

--
-- Name: book_chapter_chapter_id_seq; Type: SEQUENCE OWNED BY; Schema: book; Owner: book
--

ALTER SEQUENCE book.book_chapter_chapter_id_seq OWNED BY book.book_chapter.chapter_id;


--
-- Name: book_collection; Type: TABLE; Schema: book; Owner: book
--

CREATE TABLE book.book_collection (
    collection_id bigint NOT NULL,
    book_id bigint NOT NULL
);


ALTER TABLE book.book_collection OWNER TO book;

--
-- Name: book_id_seq; Type: SEQUENCE; Schema: book; Owner: book
--

CREATE SEQUENCE book.book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE book.book_id_seq OWNER TO book;

--
-- Name: book_id_seq; Type: SEQUENCE OWNED BY; Schema: book; Owner: book
--

ALTER SEQUENCE book.book_id_seq OWNED BY book.book.id;


--
-- Name: book_shelf; Type: TABLE; Schema: book; Owner: book
--

CREATE TABLE book.book_shelf (
    user_id bigint NOT NULL,
    book_id bigint NOT NULL,
    add_time timestamp with time zone
);


ALTER TABLE book.book_shelf OWNER TO book;

--
-- Name: book_tag; Type: TABLE; Schema: book; Owner: book
--

CREATE TABLE book.book_tag (
    id bigint NOT NULL,
    book_id bigint,
    tag character varying(45)
);


ALTER TABLE book.book_tag OWNER TO book;

--
-- Name: COLUMN book_tag.tag; Type: COMMENT; Schema: book; Owner: book
--

COMMENT ON COLUMN book.book_tag.tag IS 'tag is from categories , depth 1';


--
-- Name: book_tag_id_seq; Type: SEQUENCE; Schema: book; Owner: book
--

CREATE SEQUENCE book.book_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE book.book_tag_id_seq OWNER TO book;

--
-- Name: book_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: book; Owner: book
--

ALTER SEQUENCE book.book_tag_id_seq OWNED BY book.book_tag.id;


--
-- Name: buy_record; Type: TABLE; Schema: book; Owner: book
--

CREATE TABLE book.buy_record (
    user_id bigint NOT NULL,
    book_id bigint NOT NULL,
    chapter_id bigint NOT NULL,
    buy_time timestamp with time zone,
    cost bigint,
    balance bigint,
    summary character varying(45)
);


ALTER TABLE book.buy_record OWNER TO book;

--
-- Name: check_in; Type: TABLE; Schema: book; Owner: book
--

CREATE TABLE book.check_in (
    id bigint NOT NULL,
    user_id bigint,
    check_in_time timestamp with time zone,
    add_point bigint
);


ALTER TABLE book.check_in OWNER TO book;

--
-- Name: check_in_id_seq; Type: SEQUENCE; Schema: book; Owner: book
--

CREATE SEQUENCE book.check_in_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE book.check_in_id_seq OWNER TO book;

--
-- Name: check_in_id_seq; Type: SEQUENCE OWNED BY; Schema: book; Owner: book
--

ALTER SEQUENCE book.check_in_id_seq OWNED BY book.check_in.id;


--
-- Name: collection; Type: TABLE; Schema: book; Owner: book
--

CREATE TABLE book.collection (
    id bigint NOT NULL,
    name character varying(45)
);


ALTER TABLE book.collection OWNER TO book;

--
-- Name: collection_id_seq; Type: SEQUENCE; Schema: book; Owner: book
--

CREATE SEQUENCE book.collection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE book.collection_id_seq OWNER TO book;

--
-- Name: collection_id_seq; Type: SEQUENCE OWNED BY; Schema: book; Owner: book
--

ALTER SEQUENCE book.collection_id_seq OWNED BY book.collection.id;


--
-- Name: content; Type: TABLE; Schema: book; Owner: book
--

CREATE TABLE book.content (
    book_id bigint NOT NULL,
    chapter_id character varying(45) NOT NULL,
    content text
);


ALTER TABLE book.content OWNER TO book;

--
-- Name: message; Type: TABLE; Schema: book; Owner: book
--

CREATE TABLE book.message (
    id bigint NOT NULL,
    sender bigint,
    receiver bigint,
    content character varying(300),
    send_time date
);


ALTER TABLE book.message OWNER TO book;

--
-- Name: tags; Type: TABLE; Schema: book; Owner: book
--

CREATE TABLE book.tags (
    id bigint NOT NULL,
    tag character varying(45)
);


ALTER TABLE book.tags OWNER TO book;

--
-- Name: user; Type: TABLE; Schema: book; Owner: book
--

CREATE TABLE book."user" (
    id bigint NOT NULL,
    openid character varying(45),
    avatar_url character varying(45),
    nickname character varying(45),
    email character varying(45),
    sex character varying(45),
    password character varying(60),
    create_time timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    coin bigint
);


ALTER TABLE book."user" OWNER TO book;

--
-- Name: user_friend; Type: TABLE; Schema: book; Owner: book
--

CREATE TABLE book.user_friend (
    user_id bigint NOT NULL,
    friend_id bigint,
    add_time timestamp with time zone
);


ALTER TABLE book.user_friend OWNER TO book;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: book; Owner: book
--

CREATE SEQUENCE book.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE book.user_id_seq OWNER TO book;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: book; Owner: book
--

ALTER SEQUENCE book.user_id_seq OWNED BY book."user".id;


--
-- Name: book id; Type: DEFAULT; Schema: book; Owner: book
--

ALTER TABLE ONLY book.book ALTER COLUMN id SET DEFAULT nextval('book.book_id_seq'::regclass);


--
-- Name: book_category id; Type: DEFAULT; Schema: book; Owner: book
--

ALTER TABLE ONLY book.book_category ALTER COLUMN id SET DEFAULT nextval('book.book_category_id_seq'::regclass);


--
-- Name: book_chapter chapter_id; Type: DEFAULT; Schema: book; Owner: book
--

ALTER TABLE ONLY book.book_chapter ALTER COLUMN chapter_id SET DEFAULT nextval('book.book_chapter_chapter_id_seq'::regclass);


--
-- Name: book_tag id; Type: DEFAULT; Schema: book; Owner: book
--

ALTER TABLE ONLY book.book_tag ALTER COLUMN id SET DEFAULT nextval('book.book_tag_id_seq'::regclass);


--
-- Name: check_in id; Type: DEFAULT; Schema: book; Owner: book
--

ALTER TABLE ONLY book.check_in ALTER COLUMN id SET DEFAULT nextval('book.check_in_id_seq'::regclass);


--
-- Name: collection id; Type: DEFAULT; Schema: book; Owner: book
--

ALTER TABLE ONLY book.collection ALTER COLUMN id SET DEFAULT nextval('book.collection_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: book; Owner: book
--

ALTER TABLE ONLY book."user" ALTER COLUMN id SET DEFAULT nextval('book.user_id_seq'::regclass);


--
-- Data for Name: book; Type: TABLE DATA; Schema: book; Owner: book
--

COPY book.book (id, name, author, category, status, word_count) FROM stdin;
\.


--
-- Data for Name: book_category; Type: TABLE DATA; Schema: book; Owner: book
--

COPY book.book_category (id, parent_id, category) FROM stdin;
\.


--
-- Data for Name: book_chapter; Type: TABLE DATA; Schema: book; Owner: book
--

COPY book.book_chapter (chapter_id, book_id, content, price, title) FROM stdin;
\.


--
-- Data for Name: book_collection; Type: TABLE DATA; Schema: book; Owner: book
--

COPY book.book_collection (collection_id, book_id) FROM stdin;
\.


--
-- Data for Name: book_shelf; Type: TABLE DATA; Schema: book; Owner: book
--

COPY book.book_shelf (user_id, book_id, add_time) FROM stdin;
\.


--
-- Data for Name: book_tag; Type: TABLE DATA; Schema: book; Owner: book
--

COPY book.book_tag (id, book_id, tag) FROM stdin;
\.


--
-- Data for Name: buy_record; Type: TABLE DATA; Schema: book; Owner: book
--

COPY book.buy_record (user_id, book_id, chapter_id, buy_time, cost, balance, summary) FROM stdin;
\.


--
-- Data for Name: check_in; Type: TABLE DATA; Schema: book; Owner: book
--

COPY book.check_in (id, user_id, check_in_time, add_point) FROM stdin;
\.


--
-- Data for Name: collection; Type: TABLE DATA; Schema: book; Owner: book
--

COPY book.collection (id, name) FROM stdin;
\.


--
-- Data for Name: content; Type: TABLE DATA; Schema: book; Owner: book
--

COPY book.content (book_id, chapter_id, content) FROM stdin;
\.


--
-- Data for Name: message; Type: TABLE DATA; Schema: book; Owner: book
--

COPY book.message (id, sender, receiver, content, send_time) FROM stdin;
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: book; Owner: book
--

COPY book.tags (id, tag) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: book; Owner: book
--

COPY book."user" (id, openid, avatar_url, nickname, email, sex, password, create_time, coin) FROM stdin;
1	\N	\N	\N	gg	\N	$2a$10$Fcf88RaZ/YP5vrFFXvaXwuu66mv.mJT1U/OasqBm0dnirDWurC7b6	2021-10-08 14:30:53+00	\N
2	\N	\N	\N	formatfa	\N	$2a$10$k2glyjlrlpS8lpytc9pche/NdL6oQOs9aW44yl18lNpdAqXnQWWQS	2021-10-10 13:18:34.303697+00	\N
\.


--
-- Data for Name: user_friend; Type: TABLE DATA; Schema: book; Owner: book
--

COPY book.user_friend (user_id, friend_id, add_time) FROM stdin;
\.


--
-- Name: book_category_id_seq; Type: SEQUENCE SET; Schema: book; Owner: book
--

SELECT pg_catalog.setval('book.book_category_id_seq', 1, true);


--
-- Name: book_chapter_chapter_id_seq; Type: SEQUENCE SET; Schema: book; Owner: book
--

SELECT pg_catalog.setval('book.book_chapter_chapter_id_seq', 1, true);


--
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: book; Owner: book
--

SELECT pg_catalog.setval('book.book_id_seq', 1, true);


--
-- Name: book_tag_id_seq; Type: SEQUENCE SET; Schema: book; Owner: book
--

SELECT pg_catalog.setval('book.book_tag_id_seq', 1, true);


--
-- Name: check_in_id_seq; Type: SEQUENCE SET; Schema: book; Owner: book
--

SELECT pg_catalog.setval('book.check_in_id_seq', 1, true);


--
-- Name: collection_id_seq; Type: SEQUENCE SET; Schema: book; Owner: book
--

SELECT pg_catalog.setval('book.collection_id_seq', 1, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: book; Owner: book
--

SELECT pg_catalog.setval('book.user_id_seq', 2, true);


--
-- Name: book idx_16388_primary; Type: CONSTRAINT; Schema: book; Owner: book
--

ALTER TABLE ONLY book.book
    ADD CONSTRAINT idx_16388_primary PRIMARY KEY (id);


--
-- Name: book_category idx_16394_primary; Type: CONSTRAINT; Schema: book; Owner: book
--

ALTER TABLE ONLY book.book_category
    ADD CONSTRAINT idx_16394_primary PRIMARY KEY (id);


--
-- Name: book_chapter idx_16400_primary; Type: CONSTRAINT; Schema: book; Owner: book
--

ALTER TABLE ONLY book.book_chapter
    ADD CONSTRAINT idx_16400_primary PRIMARY KEY (chapter_id, book_id);


--
-- Name: book_collection idx_16407_primary; Type: CONSTRAINT; Schema: book; Owner: book
--

ALTER TABLE ONLY book.book_collection
    ADD CONSTRAINT idx_16407_primary PRIMARY KEY (collection_id, book_id);


--
-- Name: book_shelf idx_16410_primary; Type: CONSTRAINT; Schema: book; Owner: book
--

ALTER TABLE ONLY book.book_shelf
    ADD CONSTRAINT idx_16410_primary PRIMARY KEY (book_id, user_id);


--
-- Name: book_tag idx_16415_primary; Type: CONSTRAINT; Schema: book; Owner: book
--

ALTER TABLE ONLY book.book_tag
    ADD CONSTRAINT idx_16415_primary PRIMARY KEY (id);


--
-- Name: buy_record idx_16419_primary; Type: CONSTRAINT; Schema: book; Owner: book
--

ALTER TABLE ONLY book.buy_record
    ADD CONSTRAINT idx_16419_primary PRIMARY KEY (user_id, book_id, chapter_id);


--
-- Name: check_in idx_16424_primary; Type: CONSTRAINT; Schema: book; Owner: book
--

ALTER TABLE ONLY book.check_in
    ADD CONSTRAINT idx_16424_primary PRIMARY KEY (id);


--
-- Name: collection idx_16430_primary; Type: CONSTRAINT; Schema: book; Owner: book
--

ALTER TABLE ONLY book.collection
    ADD CONSTRAINT idx_16430_primary PRIMARY KEY (id);


--
-- Name: content idx_16434_primary; Type: CONSTRAINT; Schema: book; Owner: book
--

ALTER TABLE ONLY book.content
    ADD CONSTRAINT idx_16434_primary PRIMARY KEY (book_id, chapter_id);


--
-- Name: message idx_16440_primary; Type: CONSTRAINT; Schema: book; Owner: book
--

ALTER TABLE ONLY book.message
    ADD CONSTRAINT idx_16440_primary PRIMARY KEY (id);


--
-- Name: tags idx_16443_primary; Type: CONSTRAINT; Schema: book; Owner: book
--

ALTER TABLE ONLY book.tags
    ADD CONSTRAINT idx_16443_primary PRIMARY KEY (id);


--
-- Name: user idx_16448_primary; Type: CONSTRAINT; Schema: book; Owner: book
--

ALTER TABLE ONLY book."user"
    ADD CONSTRAINT idx_16448_primary PRIMARY KEY (id);


--
-- Name: user_friend idx_16453_primary; Type: CONSTRAINT; Schema: book; Owner: book
--

ALTER TABLE ONLY book.user_friend
    ADD CONSTRAINT idx_16453_primary PRIMARY KEY (user_id);


--
-- Name: idx_16388_fk_category_book_id_idx; Type: INDEX; Schema: book; Owner: book
--

CREATE INDEX idx_16388_fk_category_book_id_idx ON book.book USING btree (category);


--
-- Name: idx_16407_fk_book_bookid_idx; Type: INDEX; Schema: book; Owner: book
--

CREATE INDEX idx_16407_fk_book_bookid_idx ON book.book_collection USING btree (book_id);


--
-- Name: idx_16410_fk_book_id_idx; Type: INDEX; Schema: book; Owner: book
--

CREATE INDEX idx_16410_fk_book_id_idx ON book.book_shelf USING btree (book_id);


--
-- Name: idx_16410_fk_user_id_idx; Type: INDEX; Schema: book; Owner: book
--

CREATE INDEX idx_16410_fk_user_id_idx ON book.book_shelf USING btree (user_id);


--
-- Name: idx_16415_fk_book_id_idx; Type: INDEX; Schema: book; Owner: book
--

CREATE INDEX idx_16415_fk_book_id_idx ON book.book_tag USING btree (book_id);


--
-- Name: book_collection fk_bc_collection; Type: FK CONSTRAINT; Schema: book; Owner: book
--

ALTER TABLE ONLY book.book_collection
    ADD CONSTRAINT fk_bc_collection FOREIGN KEY (collection_id) REFERENCES book.collection(id);


--
-- Name: book_collection fk_book_bookid; Type: FK CONSTRAINT; Schema: book; Owner: book
--

ALTER TABLE ONLY book.book_collection
    ADD CONSTRAINT fk_book_bookid FOREIGN KEY (book_id) REFERENCES book.book(id);


--
-- Name: book_tag fk_book_id; Type: FK CONSTRAINT; Schema: book; Owner: book
--

ALTER TABLE ONLY book.book_tag
    ADD CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES book.book(id) ON DELETE CASCADE;


--
-- Name: book_shelf fk_book_shelf_id; Type: FK CONSTRAINT; Schema: book; Owner: book
--

ALTER TABLE ONLY book.book_shelf
    ADD CONSTRAINT fk_book_shelf_id FOREIGN KEY (book_id) REFERENCES book.book(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: book fk_category_book_id; Type: FK CONSTRAINT; Schema: book; Owner: book
--

ALTER TABLE ONLY book.book
    ADD CONSTRAINT fk_category_book_id FOREIGN KEY (category) REFERENCES book.book_category(id);


--
-- Name: user_friend fk_user_friend_1; Type: FK CONSTRAINT; Schema: book; Owner: book
--

ALTER TABLE ONLY book.user_friend
    ADD CONSTRAINT fk_user_friend_1 FOREIGN KEY (user_id) REFERENCES book."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: book_shelf fk_user_shelf_id; Type: FK CONSTRAINT; Schema: book; Owner: book
--

ALTER TABLE ONLY book.book_shelf
    ADD CONSTRAINT fk_user_shelf_id FOREIGN KEY (user_id) REFERENCES book."user"(id);


--
-- PostgreSQL database dump complete
--

