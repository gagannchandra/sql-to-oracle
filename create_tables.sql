-- Creating tables for the Factory Database in Oracle
-- Tables are created in order to satisfy foreign key dependencies

CREATE TABLE FACTORY (
    factory_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    location VARCHAR2(100)
);

CREATE TABLE MACHINE (
    machine_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    factory_id NUMBER,
    CONSTRAINT fk_machine_factory FOREIGN KEY (factory_id) REFERENCES FACTORY(factory_id)
);

CREATE TABLE WORKER (
    worker_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    role VARCHAR2(50),
    machine_id NUMBER,
    CONSTRAINT fk_worker_machine FOREIGN KEY (machine_id) REFERENCES MACHINE(machine_id)
);

CREATE TABLE PRODUCT (
    product_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    produced_by_machine NUMBER,
    CONSTRAINT fk_product_machine FOREIGN KEY (produced_by_machine) REFERENCES MACHINE(machine_id)
);
/
