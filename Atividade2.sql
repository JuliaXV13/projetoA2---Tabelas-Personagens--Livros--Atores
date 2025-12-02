-- Configurações iniciais de charset e criação do banco
CREATE DATABASE IF NOT EXISTS Atividade2;
USE Atividade2;

SET NAMES utf8mb4;
SET foreign_key_checks = 0; -- Desativa verificação temporariamente para evitar erros na criação

-- --------------------------------------------------------
-- Estrutura da tabela `personagem`
-- --------------------------------------------------------
CREATE TABLE `Personagens` (
  `id_personagem` int(11) NOT NULL AUTO_INCREMENT,
  `nomelivroslivroslivros` text NOT NULL,
  `local` text DEFAULT NULL,
  `idade` int DEFAULT NULL,
  `altura` float DEFAULT NULL,
  PRIMARY KEY (`id_personagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Inserindo dados em `personagem`
INSERT INTO `Personagens` (`nome`, `local`, `idade`, `altura`) VALUES
('Cloud Strife', 'Midgar', 21, 1.73),
('Tifa Lockhart', 'Nibelheim', 20, 1.67),
('Geralt de Rívia', 'Kaer Morhen', 95, 1.85),
('Link', 'Hyrule', 17, 1.70),
('Princesa Peach', 'Reino do Cogumelo', 25, 1.75),
('Kratos', 'Esparta', 50, 1.98),
('Lara Croft', 'Londres', 28, 1.75),
('Fran', 'Eruyt Village', NULL, 1.87), -- Exemplo com idade NULL (desconhecida)
('Solid Snake', 'Alaska', 33, 1.82),
('Pikachu', 'Pallet Town', 5, 0.40);

-- --------------------------------------------------------
-- Estrutura da tabela `livro`
-- --------------------------------------------------------
CREATE TABLE `livros` (
  `id_livro` int(11) NOT NULL AUTO_INCREMENT,
  `nome` text NOT NULL,
  `descricao` text NOT NULL,
  `autor` text DEFAULT NULL,
  `genero` text NOT NULL,
  PRIMARY KEY (`id_livro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Inserindo dados em `livro`
INSERT INTO `livros` (`nome`, `descricao`, `autor`, `genero`) VALUES
('Dom Casmurro', 'A história de Bentinho e sua dúvida eterna se Capitu o traiu ou não.', 'Machado de Assis', 'Literatura Brasileira'),
('O Senhor dos Anéis: A Sociedade do Anel', 'Um hobbit recebe a missão de destruir um anel poderoso antes que o mal domine o mundo.', 'J.R.R. Tolkien', 'Fantasia'),
('1984', 'Uma distopia assustadora sobre um regime totalitário onde o Grande Irmão tudo vê.', 'George Orwell', 'Ficção Científica'),
('Clean Code', 'Um guia de boas práticas para escrever códigos limpos e manuteníveis.', 'Robert C. Martin', 'Técnico'),
('O Iluminado', 'Uma família cuida de um hotel isolado durante o inverno, onde forças malignas influenciam o pai.', 'Stephen King', 'Terror'),
('A Hora da Estrela', 'A vida simples e trágica da nordestina Macabéa no Rio de Janeiro.', 'Clarice Lispector', 'Drama'),
('Duna', 'A disputa política e religiosa pelo controle do planeta deserto Arrakis e sua especiaria.', 'Frank Herbert', 'Ficção Científica'),
('O Código Da Vinci', 'Um simbologista tenta desvendar um assassinato no Louvre e descobre segredos religiosos.', 'Dan Brown', 'Suspense'),
('Harry Potter e a Pedra Filosofal', 'Um garoto descobre que é um bruxo e vai estudar na escola de magia de Hogwarts.', 'J.K. Rowling', 'Fantasia'),
('A Arte da Guerra', 'Antigo tratado militar chinês com estratégias aplicáveis a diversas áreas da vida.', 'Sun Tzu', 'Filosofia');
-- --------------------------------------------------------
-- Estrutura da tabela `atores`
-- --------------------------------------------------------
CREATE TABLE `atores` (
  `id_ator` int(11) NOT NULL AUTO_INCREMENT,
  `nome` text NOT NULL,            
  `num_oscars` int DEFAULT 0,   
  `idade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_ator`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `atores` (`nome`, `num_oscars`, `idade`) VALUES
('Fernanda Montenegro', 0, 94),
('Leonardo DiCaprio', 1, 49),
('Meryl Streep', 3, 75),
('Tom Hanks', 2, 68),
('Viola Davis', 1, 59),
('Anthony Hopkins', 2, 86),
('Denzel Washington', 2, 69),
('Wagner Moura', 0, 48),
('Robert Downey Jr.', 1, 59),
('Emma Stone', 2, 35);



-- Reativa as verificações de chave estrangeira
SET foreign_key_checks = 1;