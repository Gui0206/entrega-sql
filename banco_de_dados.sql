CREATE TABLE alunos (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  curso TEXT NOT NULL,
);

CREATE TABLE cursos (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  duracao_anos INT
);

CREATE TABLE matriculas (
  id SERIAL PRIMARY KEY,
  aluno_id INT REFERENCES alunos(id) ON DELETE CASCADE,
  curso_id INT REFERENCES cursos(id) ON DELETE CASCADE,
);

INSERT INTO alunos (nome, curso)
VALUES ('Guilherme Holanda', 'CC'),
       ('Isaac Santos', 'ES'),
       ('Adriana Policia', 'ADM'),
       ('Bruno Kadayan', 'CC'),
       ('Francisco Filho', 'CC'),
       ('Marcela Costa', 'SI'),
       ('Yan Ribeiro', 'EC'),
       ('Danilo de Catro', 'ES'),
       ('Rodrigo Ferraz', 'ADM'),
       ('Victor Grycajuk', 'CC');

INSERT INTO cursos (nome)
VALUES ('ADM'),
       ('CC'),
       ('ES'),
       ('EC'),
       ('SI');

INSERT INTO matriculas (aluno_id, curso_id)
VALUES 
  (1, 2),
  (2, 3),
  (3, 1),
  (4, 2),
  (5, 2),
  (6, 5),
  (7, 4),
  (8, 3),
  (9, 1),
  (10, 2);

SELECT a.nome AS aluno, c.nome AS curso, m.data_matricula
FROM matriculas m
JOIN alunos a ON m.aluno_id = a.id
JOIN cursos c ON m.curso_id = c.id;
