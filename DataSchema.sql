-- Таблиця користувачів
CREATE TABLE User (
    user_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL CHECK (name ~ '^[A-Za-zА-Яа-я]+$'), -- Тільки букви
    age SMALLINT CHECK (age BETWEEN 10 AND 100), -- Вік у межах від 10 до 100 років
    videoPreferences VARCHAR(100) CHECK (videoPreferences ~ '^[A-Za-z, ]+$') -- Тільки букви, коми та пробіли
);

-- Таблиця розкладів
CREATE TABLE Schedule (
    schedule_id INT PRIMARY KEY,
    time TIME NOT NULL,
    affairs VARCHAR(255) CHECK (affairs ~ '^[A-Za-zА-Яа-я0-9, ]+$'), -- Тільки букви, цифри, коми та пробіли
    user_id INT NOT NULL,
    system_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (system_id) REFERENCES System(system_id)
);

-- Таблиця відеопрограм
CREATE TABLE VideoProgram (
    videoProgram_id INT PRIMARY KEY,
    genres VARCHAR(255) CHECK (genres ~ '^[A-Za-z, ]+$'), -- Тільки букви, коми та пробіли
    user_id INT NOT NULL,
    system_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (system_id) REFERENCES System(system_id)
);

-- Таблиця відеоуроків
CREATE TABLE Videolesson (
    lesson_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL CHECK (title ~ '^[A-Za-z0-9 ]+$'), -- Тільки букви, цифри та пробіли
    duration INTERVAL HOUR TO SECOND NOT NULL,
    videoProgram_id INT NOT NULL,
    FOREIGN KEY (videoProgram_id) REFERENCES VideoProgram(videoProgram_id)
);

-- Таблиця систем
CREATE TABLE System (
    system_id INT PRIMARY KEY
);
