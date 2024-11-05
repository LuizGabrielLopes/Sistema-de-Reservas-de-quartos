CREATE DATABASE reservahotel;

\c reservahotel;

CREATE TABLE hospedes (
    id_hospede SERIAL PRIMARY KEY,
    nome VARCHAR (100) NOT NULL,
    email VARCHAR (200)
);

CREATE TABLE quartos (
    id_quarto SERIAL PRIMARY KEY,
    numero INT NOT NULL UNIQUE,
    preco DECIMAL(5,2) NOT NULL
);

CREATE TABLE reservas (
    id_reserva SERIAL PRIMARY KEY,
    data_check_in DATE NOT NULL,
    data_check_out DATE,
    horario_check_in TIME NOT NULL,
    horario_check_out TIME,
    id_hospede INT NOT NULL,
    id_quarto INT NOT NULL,
    CONSTRAINT fk_hospede FOREIGN KEY (id_hospede) REFERENCES hospedes(id_hospede),
    CONSTRAINT fk_quarto FOREIGN KEY (id_quarto) REFERENCES quartos(id_quarto)
);

INSERT INTO hospedes (nome, email) VALUES ('Zani', 'zanin008@yahoo.com'),
('Kevin', 'kevinhotrap@gmail'),
('Caio', 'caio62hz@gmail.com'),
('Leonardo', 'leozera@hotmail.com'),
('Carlos', 'cadu@hotmail.com');

INSERT INTO quartos (numero, preco) VALUES (1, 199.00),
(2, 250.00),
(4, 400.00),
(5, 100.00),
(3, 450.00);

INSERT INTO reservas (horario_check_in, horario_check_out, data_check_in, data_check_out, id_hospede, id_quarto) VALUES ('16:20', '23:30', '2024-05-03', '2024-05-04', 3, 1),
('08:20', '14:30', '2024-08-29', '2024-08-30', 1, 2),
('14:00', '19:00', '2024-11-13', '2024-11-13', 2, 3);

SELECT
    r.id_reserva,
    h.nome,
    h.email,
    q.preco,
    r.id_hospede,
    r.id_quarto,
    r.horario_check_in,
    r.horario_check_out,
    r.data_check_in,
    r.data_check_out
FROM
    reservas r
JOIN
    hospedes h ON r.id_hospede = h.id_hospede
JOIN
    quartos q ON r.id_quarto = q.id_quarto;