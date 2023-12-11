/* Esercitazione 1 */

CREATE TABLE utente (
    email                     VARCHAR2(150) NOT NULL,
    nome                      VARCHAR2(150) NOT NULL,
    cognome                   VARCHAR2(150) NOT NULL,
    password                  VARCHAR2(150) NOT NULL,
    videogiochi_codiceunivoco INTEGER NOT NULL,
    idsessione                INTEGER NOT NULL,
    orainizio                 DATE NOT NULL,
    orafine                   DATE NOT NULL,
    livelloraggiunto          INTEGER NOT NULL
);

ALTER TABLE utente ADD CONSTRAINT utente_pk PRIMARY KEY ( email );

CREATE TABLE videogiochi (
    codiceunivoco INTEGER NOT NULL,
    titolo        VARCHAR2(150) NOT NULL,
    descrizione   VARCHAR2(150) NOT NULL
);

ALTER TABLE videogiochi ADD CONSTRAINT videogiochi_pk PRIMARY KEY ( codiceunivoco );

ALTER TABLE utente
    ADD CONSTRAINT utente_videogiochi_fk FOREIGN KEY ( videogiochi_codiceunivoco )
        REFERENCES videogiochi ( codiceunivoco );

      
       
       
