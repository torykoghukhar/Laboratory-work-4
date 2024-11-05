-- Таблиця користувачів
CREATE TABLE User (
    user_id INT PRIMARY KEY,
    name VARCHAR(50), -- Вилучено обмеження на регулярний вираз
    age SMALLINT, -- Вилучено обмеження діапазону
    videoPrefs VARCHAR(100) -- Зміна назви колонки та вилучення обмежень
);

-- Таблиця розкладів
CREATE TABLE Schedule (
    schedule_id INT PRIMARY KEY,
    time TIME,
    affairs VARCHAR(255), -- Вилучено обмеження на регулярний вираз
    userId INT, -- Змінено назву колонки user_id
    systemId INT, -- Змінено назву колонки system_id
    FOREIGN KEY (userId) REFERENCES User(user_id)
);

-- Таблиця відеопрограм
CREATE TABLE VideoProgram (
    videoProgram_id INT PRIMARY KEY,
    genres VARCHAR(255), -- Вилучено обмеження на регулярний вираз
    userId INT, -- Змінено назву колонки user_id
    systemId INT, -- Змінено назву колонки system_id
    FOREIGN KEY (userId) REFERENCES User(user_id),
    FOREIGN KEY (systemId) REFERENCES System(system_id)
);

-- Таблиця відеоуроків
CREATE TABLE Videolesson (
    lesson_id INT PRIMARY KEY,
    title VARCHAR(100), -- Вилучено обмеження на регулярний вираз
    duration INTERVAL HOUR TO SECOND,
    videoProg_id INT, -- Змінено назву колонки videoProgram_id
    FOREIGN KEY (videoProg_id) REFERENCES VideoProgram(videoProgram_id)
);

-- Таблиця систем
CREATE TABLE System (
    system_id INT PRIMARY KEY,
    optimizedSchedule VARCHAR(255), -- Додано нове поле без обмежень
    videoProgram VARCHAR(255) -- Додано нове поле без обмежень
);
