CREATE TABLE empresa (
  id serial NOT NULL,
  cnpj varchar(255) NOT NULL,
  data_atualizacao timestamp NOT NULL,
  data_criacao timestamp NOT NULL,
  razao_social varchar(255) NOT NULL
);

CREATE TABLE funcionario (
  id serial NOT NULL,
  cpf varchar(255) NOT NULL,
  data_atualizacao timestamp NOT NULL,
  data_criacao timestamp NOT NULL,
  email varchar(255) NOT NULL,
  nome varchar(255) NOT NULL,
  perfil varchar(255) NOT NULL,
  qtd_horas_almoco float DEFAULT NULL,
  qtd_horas_trabalho_dia float DEFAULT NULL,
  senha varchar(255) NOT NULL,
  valor_hora decimal(19,2) DEFAULT NULL,
  empresa_id integer DEFAULT NULL
);

CREATE TABLE lancamento (
  id serial NOT NULL,
  data timestamp NOT NULL,
  data_atualizacao timestamp NOT NULL,
  data_criacao timestamp NOT NULL,
  descricao varchar(255) DEFAULT NULL,
  localizacao varchar(255) DEFAULT NULL,
  tipo varchar(255) NOT NULL,
  funcionario_id integer DEFAULT NULL
);

--
-- Indexes for table 'empresa'
--
ALTER TABLE empresa
  ADD PRIMARY KEY (id);

--
-- Indexes for table 'funcionario'
--
 ALTER TABLE funcionario
   ADD PRIMARY KEY (id);
--
-- Indexes for table 'lancamento'
--
ALTER TABLE lancamento
 ADD PRIMARY KEY (id);

--
-- Constraints for dumped tables
--

--
-- Constraints for table 'funcionario'
--
ALTER TABLE funcionario
  ADD CONSTRAINT FK_funcionario FOREIGN KEY (empresa_id) REFERENCES empresa (id);

--
-- Constraints for table 'lancamento'
--
ALTER TABLE lancamento
  ADD CONSTRAINT FK_lancamento FOREIGN KEY (funcionario_id) REFERENCES funcionario (id);
