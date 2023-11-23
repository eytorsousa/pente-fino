-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 20/11/2023 às 01:06
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.0.28

-- O Banco de dados já está criado no phpMyAdmin, basta acessar e rodar os comandos abaixo e não se esqueçam, que ao rodar docker-compose down, tu destrói todas as configs e queries executadas no banco

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `DB_PENTEFINO`
--
USE DB_PENTEFINO;
-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_PRODUCTS`
--

CREATE TABLE `TB_PRODUCTS` (
  `PRODUCT_ID` int(11) NOT NULL,
  `PROUCT_NAME` varchar(30) NOT NULL,
  `PRODUCT_DESCRIPTION` varchar(60) NOT NULL,
  `PRODUCT_VALUE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_SCHEDULES`
--

CREATE TABLE `TB_SCHEDULES` (
  `SCHEDULE_ID` int(11) NOT NULL,
  `SCHEDULE_SERVICES` int(11) NOT NULL,
  `SCHEDULE_CLIENT` int(11) NOT NULL,
  `SCHEDULE_ATTENDANT` int(11) NOT NULL,
  `SCHEDULE_DATE` datetime DEFAULT NULL,
  `SCHEDULE_VALUE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_SELLS`
--

CREATE TABLE `TB_SELLS` (
  `SELLS_ID` int(11) NOT NULL,
  `SELLS_PRODUCTS` int(11) NOT NULL,
  `SELLS_CLIENT` int(11) NOT NULL,
  `SERVICE_VALUE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_SERVICES`
--

CREATE TABLE `TB_SERVICES` (
  `SERVICE_ID` int(11) NOT NULL,
  `SERVICE_NAME` varchar(30) NOT NULL,
  `SERVICE_DESCRIPTION` varchar(60) NOT NULL,
  `SERVICE_VALUE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_USERS`
--

CREATE TABLE `TB_USERS` (
  `USER_ID` int(11) NOT NULL,
  `USER_FIRSTNAME` varchar(30) NOT NULL,
  `USER_LASTNAME` varchar(40) NOT NULL,
  `USER_BIRTH` date DEFAULT NULL,
  `USER_EMAIL` varchar(60) NOT NULL,
  `USER_PASSWORD` varchar(60) NOT NULL,
  `USER_RANK` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `TB_PRODUCTS`
--
ALTER TABLE `TB_PRODUCTS`
  ADD PRIMARY KEY (`PRODUCT_ID`);

--
-- Índices de tabela `TB_SCHEDULES`
--
ALTER TABLE `TB_SCHEDULES`
  ADD PRIMARY KEY (`SCHEDULE_ID`),
  ADD UNIQUE KEY `SCHEDULE_CLIENT` (`SCHEDULE_CLIENT`),
  ADD UNIQUE KEY `SCHEDULE_ATTENDANT` (`SCHEDULE_ATTENDANT`),
  ADD KEY `SCHEDULE_SERVICES` (`SCHEDULE_SERVICES`);

--
-- Índices de tabela `TB_SELLS`
--
ALTER TABLE `TB_SELLS`
  ADD PRIMARY KEY (`SELLS_ID`),
  ADD UNIQUE KEY `SELLS_CLIENT` (`SELLS_CLIENT`),
  ADD KEY `SELLS_PRODUCTS` (`SELLS_PRODUCTS`);

--
-- Índices de tabela `TB_SERVICES`
--
ALTER TABLE `TB_SERVICES`
  ADD PRIMARY KEY (`SERVICE_ID`);

--
-- Índices de tabela `TB_USERS`
--
ALTER TABLE `TB_USERS`
  ADD PRIMARY KEY (`USER_ID`),
  ADD UNIQUE KEY `USER_EMAIL` (`USER_EMAIL`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `TB_PRODUCTS`
--
ALTER TABLE `TB_PRODUCTS`
  MODIFY `PRODUCT_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `TB_SCHEDULES`
--
ALTER TABLE `TB_SCHEDULES`
  MODIFY `SCHEDULE_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `TB_SELLS`
--
ALTER TABLE `TB_SELLS`
  MODIFY `SELLS_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `TB_SERVICES`
--
ALTER TABLE `TB_SERVICES`
  MODIFY `SERVICE_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `TB_USERS`
--
ALTER TABLE `TB_USERS`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `TB_SCHEDULES`
--
ALTER TABLE `TB_SCHEDULES`
  ADD CONSTRAINT `tb_schedules_ibfk_1` FOREIGN KEY (`SCHEDULE_SERVICES`) REFERENCES `TB_SERVICES` (`SERVICE_ID`),
  ADD CONSTRAINT `tb_schedules_ibfk_2` FOREIGN KEY (`SCHEDULE_CLIENT`) REFERENCES `TB_USERS` (`USER_ID`),
  ADD CONSTRAINT `tb_schedules_ibfk_3` FOREIGN KEY (`SCHEDULE_ATTENDANT`) REFERENCES `TB_USERS` (`USER_ID`);

--
-- Restrições para tabelas `TB_SELLS`
--
ALTER TABLE `TB_SELLS`
  ADD CONSTRAINT `tb_sells_ibfk_1` FOREIGN KEY (`SELLS_CLIENT`) REFERENCES `TB_USERS` (`USER_ID`),
  ADD CONSTRAINT `tb_sells_ibfk_2` FOREIGN KEY (`SELLS_PRODUCTS`) REFERENCES `TB_PRODUCTS` (`PRODUCT_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;