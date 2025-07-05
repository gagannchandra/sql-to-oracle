-- Inserting sample data into the Factory Database
-- Inserts are ordered to satisfy foreign key constraints

-- Insert factories
INSERT INTO FACTORY (name, location) VALUES ('North Plant', 'Chicago, IL');
INSERT INTO FACTORY (name, location) VALUES ('South Plant', 'Austin, TX');

-- Insert machines (referencing factory_id)
INSERT INTO MACHINE (name, factory_id) VALUES ('CNC Machine A', 1);
INSERT INTO MACHINE (name, factory_id) VALUES ('Assembly Line B', 1);
INSERT INTO MACHINE (name, factory_id) VALUES ('3D Printer C', 2);

-- Insert workers (referencing machine_id)
INSERT INTO WORKER (name, role, machine_id) VALUES ('Alice Smith', 'Operator', 1);
INSERT INTO WORKER (name, role, machine_id) VALUES ('Bob Johnson', 'Technician', 1);
INSERT INTO WORKER (name, role, machine_id) VALUES ('Carol White', 'Supervisor', 2);
INSERT INTO WORKER (name, role, machine_id) VALUES ('David Lee', 'Operator', 3);

-- Insert products (referencing produced_by_machine)
INSERT INTO PRODUCT (name, produced_by_machine) VALUES ('Gearbox', 1);
INSERT INTO PRODUCT (name, produced_by_machine) VALUES ('Widget', 2);
INSERT INTO PRODUCT (name, produced_by_machine) VALUES ('Gizmo', 3);
/
