CREATE TABLE usuarios (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome NVARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    perfil VARCHAR(50) NOT NULL DEFAULT 'visualizador'
);

CREATE TABLE plataformas (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome NVARCHAR(100) NOT NULL,
    marca NVARCHAR(100) NOT NULL,
    ano_lancamento INT NULL,
    imagem_url VARCHAR(500) NULL
);

-- depende de plataformas
CREATE TABLE jogos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome NVARCHAR(150) NOT NULL,
    plataforma_id INT NOT NULL,
    cover_url VARCHAR(500) NULL,
    logo_url VARCHAR(500) NULL,
    wallpaper_url VARCHAR(500) NULL,
    start_screen_url VARCHAR(500) NULL,
    
    -- definição da Chave Estrangeira
    CONSTRAINT FK_Jogos_Plataformas FOREIGN KEY (plataforma_id) 
        REFERENCES plataformas(id)
        -- ON DELETE CASCADE -- os jogos são apagados caso a plataforma seja excluída
);