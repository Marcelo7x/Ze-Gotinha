-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Out-2021 às 04:10
-- Versão do servidor: 10.4.18-MariaDB
-- versão do PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ze_gotinha`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cartao_vacina`
--

CREATE TABLE `cartao_vacina` (
  `cpf` char(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cartao_vacina`
--

INSERT INTO `cartao_vacina` (`cpf`, `nome`) VALUES
('14921391491', 'Clara Rayssa Olivia Ribeiro'),
('20446707120', 'Elza Mariah da Cunha'),
('57726598638', 'Pedro Ramos'),
('58196919891', 'Diego Hugo Breno Moraes');

-- --------------------------------------------------------

--
-- Estrutura da tabela `consulta`
--

CREATE TABLE `consulta` (
  `id_consulta` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `sintomas` varchar(500) DEFAULT NULL,
  `pedidos_exames` varchar(500) DEFAULT NULL,
  `receita` varchar(500) DEFAULT NULL,
  `cpf` char(11) DEFAULT NULL,
  `crm` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `consulta`
--

INSERT INTO `consulta` (`id_consulta`, `data`, `sintomas`, `pedidos_exames`, `receita`, `cpf`, `crm`) VALUES
(1, '2021-10-07', 'Dor de cabeça', 'Exame de sangue', 'Dipirona 500mg', '14921391491', '56782-ES'),
(2, '2021-10-14', 'Febre, tosse', 'Ressonância', 'Paracetamol 1000mg', '58196919891', '56782-ES'),
(3, '2021-10-14', 'Dor de cabeça', 'Exame de sangue', 'Dipirona 500mg', '57726598638', '32474-GO'),
(4, '2021-10-14', 'Febre, tosse', 'Exame de sangue', 'Resfenol', '20446707120', '32474-GO'),
(5, '2021-10-04', 'Dor no peito, falta de ar', 'Eletrocardiograma', 'Dipirona 1000mg', '57726598638', '56782-ES'),
(6, '2021-10-07', 'Dor nas articulações', 'Raio-X', 'Paracetamol 1000mg', '10488620031', '56782-ES');

-- --------------------------------------------------------

--
-- Estrutura da tabela `dose`
--

CREATE TABLE `dose` (
  `lote` varchar(10) DEFAULT NULL,
  `numero_dose` int(11) DEFAULT NULL,
  `data_aplicacao` date DEFAULT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `cpf` char(11) NOT NULL,
  `id_dose` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `dose`
--

INSERT INTO `dose` (`lote`, `numero_dose`, `data_aplicacao`, `nome`, `cpf`, `id_dose`) VALUES
('02/2021', 1, '2021-10-05', 'AstraZeneca', '14921391491', 2),
('04/2021', 2, '2021-10-20', 'AstraZeneca', '14921391491', 3),
('08/2021', 1, '2021-10-05', 'Pfizer', '58196919891', 5),
('10/2021', 2, '2021-10-20', 'Pfizer', '58196919891', 6),
('08/2021', 1, '2021-10-07', 'Janssen', '57726598638', 7),
('08/2021', 1, '2021-10-07', 'Pfizer', '20446707120', 8),
('10/2021', 2, '2021-11-17', 'Pfizer', '20446707120', 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `enfermeiro`
--

CREATE TABLE `enfermeiro` (
  `cpf` char(11) DEFAULT NULL,
  `coren` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `enfermeiro`
--

INSERT INTO `enfermeiro` (`cpf`, `coren`) VALUES
('10488620031', '12345-RS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `historico`
--

CREATE TABLE `historico` (
  `cpf` char(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `historico`
--

INSERT INTO `historico` (`cpf`, `nome`) VALUES
('14921391491', 'Clara Rayssa Olivia Ribeiro'),
('20446707120', 'Elza Mariah da Cunha'),
('57726598638', 'Pedro Ramos'),
('58196919891', 'Diego Hugo Breno Moraes');

-- --------------------------------------------------------

--
-- Estrutura da tabela `medico`
--

CREATE TABLE `medico` (
  `cpf` char(11) DEFAULT NULL,
  `crm` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `medico`
--

INSERT INTO `medico` (`cpf`, `crm`) VALUES
('24066389600', '32474-GO'),
('28609252604', '56782-ES');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `nome` varchar(50) DEFAULT NULL,
  `cpf` char(11) NOT NULL,
  `senha` varchar(20) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `telefone` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`nome`, `cpf`, `senha`, `email`, `data_nascimento`, `sexo`, `telefone`) VALUES
('Henry Lorenzo Vinicius Jesus', '10488620031', '8zkZoYB6ZG', 'henrylorenzoviniciusjesus@milimoveis.com.br', '2000-10-01', 'M', '68999865775'),
('Clara Rayssa Olivia Ribeiro', '14921391491', '01234', 'clararayssaoliviaribeiro_@grupoitamaraty.com.br', '1978-08-02', 'F', '71996740517'),
('Elza Mariah da Cunha', '20446707120', 'Y0C2OpmUZs', 'elzamariahdacunha_@db9.com.br', '2000-05-17', 'F', '21989036259'),
('Lorenzo Giovanni Fogaça', '24066389600', '1jZ3LCPE94', 'lorenzogiovannifogaca-95@csjsistemas.com.br', '1972-08-06', 'M', '92982462039'),
('Fátima Cecília Jéssica Silva', '28609252604', 'xHQaINqoeR', 'fatimaceciliajessicasilva__fatimaceciliajessicasilva@montcalm.com.br', '1957-11-25', 'F', '31995861584'),
('Pedro Ramos', '57726598638', '43boHEOG84', 'pedroramos@gmail.com', '1988-11-07', 'M', '67992113436'),
('Diego Hugo Breno Moraes', '58196919891', '12345', 'diegohugobrenomoraes@folha.com.br', '1998-07-14', 'M', '28992513251');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vacina`
--

CREATE TABLE `vacina` (
  `nome` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `vacina`
--

INSERT INTO `vacina` (`nome`) VALUES
('AstraZeneca'),
('Janssen'),
('Moderna'),
('Pfizer');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vinculo`
--

CREATE TABLE `vinculo` (
  `cpf` char(11) NOT NULL,
  `crm` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `vinculo`
--

INSERT INTO `vinculo` (`cpf`, `crm`) VALUES
('14921391491', '32474-GO'),
('14921391491', '56782-ES'),
('20446707120', '32474-GO'),
('57726598638', '32474-GO'),
('58196919891', '32474-GO'),
('58196919891', '56782-ES');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cartao_vacina`
--
ALTER TABLE `cartao_vacina`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices para tabela `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id_consulta`),
  ADD KEY `cpf` (`cpf`),
  ADD KEY `crm` (`crm`);

--
-- Índices para tabela `dose`
--
ALTER TABLE `dose`
  ADD PRIMARY KEY (`id_dose`),
  ADD KEY `nome` (`nome`),
  ADD KEY `cpf` (`cpf`);

--
-- Índices para tabela `enfermeiro`
--
ALTER TABLE `enfermeiro`
  ADD PRIMARY KEY (`coren`),
  ADD KEY `cpf` (`cpf`);

--
-- Índices para tabela `historico`
--
ALTER TABLE `historico`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices para tabela `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`crm`),
  ADD KEY `cpf` (`cpf`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices para tabela `vacina`
--
ALTER TABLE `vacina`
  ADD PRIMARY KEY (`nome`);

--
-- Índices para tabela `vinculo`
--
ALTER TABLE `vinculo`
  ADD PRIMARY KEY (`cpf`,`crm`),
  ADD KEY `crm` (`crm`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id_consulta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `dose`
--
ALTER TABLE `dose`
  MODIFY `id_dose` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cartao_vacina`
--
ALTER TABLE `cartao_vacina`
  ADD CONSTRAINT `cartao_vacina_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `usuario` (`cpf`);

--
-- Limitadores para a tabela `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `usuario` (`cpf`),
  ADD CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`crm`) REFERENCES `medico` (`crm`);

--
-- Limitadores para a tabela `dose`
--
ALTER TABLE `dose`
  ADD CONSTRAINT `dose_ibfk_1` FOREIGN KEY (`nome`) REFERENCES `vacina` (`nome`),
  ADD CONSTRAINT `dose_ibfk_2` FOREIGN KEY (`cpf`) REFERENCES `usuario` (`cpf`);

--
-- Limitadores para a tabela `enfermeiro`
--
ALTER TABLE `enfermeiro`
  ADD CONSTRAINT `enfermeiro_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `usuario` (`cpf`);

--
-- Limitadores para a tabela `historico`
--
ALTER TABLE `historico`
  ADD CONSTRAINT `historico_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `usuario` (`cpf`);

--
-- Limitadores para a tabela `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `usuario` (`cpf`);

--
-- Limitadores para a tabela `vinculo`
--
ALTER TABLE `vinculo`
  ADD CONSTRAINT `vinculo_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `usuario` (`cpf`),
  ADD CONSTRAINT `vinculo_ibfk_2` FOREIGN KEY (`crm`) REFERENCES `medico` (`crm`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
