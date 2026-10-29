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
    img_dispositivo VARCHAR(MAX) NULL,
    img_logo VARCHAR(MAX) NULL
);

-- depende de plataformas
CREATE TABLE jogos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome NVARCHAR(150) NOT NULL,
    id_plataforma INT NOT NULL,
    img_cover VARCHAR(MAX) NULL,
    img_logo VARCHAR(MAX) NULL,
    img_wallpaper VARCHAR(MAX) NULL,
    img_start_screen VARCHAR(MAX) NULL,
    
    -- definição da Chave Estrangeira
    CONSTRAINT FK_Jogos_Plataformas FOREIGN KEY (id_plataforma) 
        REFERENCES plataformas(id)
        -- ON DELETE CASCADE -- os jogos são apagados caso a plataforma seja excluída
);