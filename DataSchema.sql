-- Таблица пользователей
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL CHECK (name ~ '^[A-Za-zА-Яа-я]+$'),
    age SMALLINT CHECK (age BETWEEN 10 AND 100),
    video_preferences VARCHAR(100) CHECK (video_preferences ~ '^[A-Za-z, ]+$')
);

-- Таблица расписаний
CREATE TABLE schedule (
    schedule_id INT PRIMARY KEY,
    time TIME NOT NULL,
    affairs VARCHAR(255) CHECK (affairs ~ '^[A-Za-zА-Яа-я0-9, ]+$'),
    user_id INT NOT NULL,
    system_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (system_id) REFERENCES system (system_id)
);

-- Таблица видеопрограмм
CREATE TABLE video_programs (
    video_program_id INT PRIMARY KEY,
    genres VARCHAR(255) CHECK (genres ~ '^[A-Za-z, ]+$'),
    user_id INT NOT NULL,
    system_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (system_id) REFERENCES system (system_id)
);

CREATE TABLE video_lessons (
    lesson_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL CHECK (title ~ '^[A-Za-z0-9 ]+$'),
    duration INTERVAL NOT NULL, -- Заменен тип данных на стандартный INTERVAL
    video_program_id INT NOT NULL,
    FOREIGN KEY (video_program_id) REFERENCES video_programs (video_program_id)
);

-- Таблица систем
CREATE TABLE system (
    system_id INT PRIMARY KEY
);
