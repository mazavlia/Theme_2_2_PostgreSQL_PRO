CREATE TABLE IF NOT EXISTS public.authors
(
    author_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    author_name character varying(150) COLLATE pg_catalog."default",
    CONSTRAINT author_pkey PRIMARY KEY (author_id)
);


CREATE TABLE IF NOT EXISTS public.publish_houses
(
    publ_house_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    house_name character varying(120) COLLATE pg_catalog."default" NOT NULL,
    city character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT publish_house_pkey PRIMARY KEY (publ_house_id)
);



CREATE TABLE IF NOT EXISTS public.readers
(
    readers_ticket_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    full_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    adress character varying(200) COLLATE pg_catalog."default",
    telephone character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT "Readers_pkey" PRIMARY KEY (readers_ticket_id)
);


CREATE TABLE IF NOT EXISTS public.books
(
    book_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    title character varying(100) COLLATE pg_catalog."default" NOT NULL,
    author_id bigint NOT NULL,
    public_year integer NOT NULL,
    amount_pages integer NOT NULL,
    price money NOT NULL,
    amount integer NOT NULL,
    publ_house_id bigint,
    CONSTRAINT books_pkey PRIMARY KEY (book_id),
    CONSTRAINT author_id FOREIGN KEY (author_id)
        REFERENCES public.authors (author_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT publ_house_fk FOREIGN KEY (publ_house_id)
        REFERENCES public.publish_houses (publ_house_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);



CREATE TABLE IF NOT EXISTS public.book_rentals
(
    rent_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    readers_ticket_id bigint NOT NULL,
    book_id bigint NOT NULL,
    start_rental time without time zone NOT NULL,
    stop_rental time without time zone,
    CONSTRAINT book_rental_pkey PRIMARY KEY (rent_id),
    CONSTRAINT book_rental_book_id_fkey FOREIGN KEY (book_id)
        REFERENCES public.books (book_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT book_rental_readers_ticket_id_fkey FOREIGN KEY (readers_ticket_id)
        REFERENCES public.readers (readers_ticket_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);