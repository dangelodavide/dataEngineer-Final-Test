CREATE TABLE test.attore (
    idattore    INT,
    datanascita DATE NOT NULL,
    nome        VARCHAR(150),
    cognome     VARCHAR(150) NOT NULL,
    film_id     INT NOT NULL
);

CREATE TABLE test.film (
    id      INT NOT NULL,
    regista VARCHAR(150) NOT NULL,
    titolo  VARCHAR(150) NOT NULL,
    anno    DATE NOT NULL
);

ALTER TABLE test.film ADD CONSTRAINT film_pk PRIMARY KEY ( id );

CREATE TABLE test.proiezione (
    orainizio     DATE NOT NULL,
    orafine       DATE NOT NULL,
    film_id       INTEGER NOT NULL,
    proiezione_id NUMBER NOT NULL,
    datetime      DATE NOT NULL
);

ALTER TABLE test.proiezione ADD CONSTRAINT proiezione_pk PRIMARY KEY ( proiezione_id );

ALTER TABLE test.proiezione ADD CONSTRAINT proiezione_datetime_un UNIQUE ( datetime );

CREATE TABLE test.sala (
    id                       INTEGER NOT NULL,
    capienzamax              INTEGER NOT NULL,
    proiezione_proiezione_id NUMBER NOT NULL,
    datetime                 DATE NOT NULL
);

ALTER TABLE test.sala ADD CONSTRAINT sala_pk PRIMARY KEY ( id );

ALTER TABLE test.attore
    ADD CONSTRAINT attore_film_fk FOREIGN KEY ( film_id )
        REFERENCES film ( id );

ALTER TABLE test.proiezione
    ADD CONSTRAINT proiezione_film_fk FOREIGN KEY ( film_id )
        REFERENCES film ( id );

ALTER TABLE test.sala
    ADD CONSTRAINT sala_proiezione_fk FOREIGN KEY ( datetime )
        REFERENCES proiezione ( proiezione_id );

CREATE SEQUENCE proiezione_proiezione_id_seq START WITH 1 NO CACHE ORDER;

CREATE OR REPLACE TRIGGER proiezione_proiezione_id_trg BEFORE
    INSERT ON proiezione
    FOR EACH ROW
    WHEN ( new.proiezione_id IS NULL )
BEGIN
    :new.proiezione_id := proiezione_proiezione_id_seq.nextval;
END;
