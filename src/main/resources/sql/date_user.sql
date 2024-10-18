CREATE TABLE date_user (
    USER_ID INT AUTO_INCREMENT PRIMARY KEY,      -- Primary Key with Auto Increment
    USER_USERNAME VARCHAR(50) NOT NULL,          -- Username, max length 50
    USER_NAME VARCHAR(50) NOT NULL,              -- User's real name, max length 50
    USER_PWD VARCHAR(50) NOT NULL,               -- User password, max length 50
    USER_AGE INT,                                -- User age
    USER_GENDER VARCHAR(50),                     -- User gender, max length 50
    USER_EMAIL1 VARCHAR(20),                     -- First part of the user's email, max length 20
    USER_EMAIL2 VARCHAR(20),                     -- Second part of the user's email, max length 20
    USER_TEL1 INT,                               -- First part of the user's phone number
    USER_TEL2 INT,                               -- Second part of the user's phone number
    USER_TEL3 INT,                               -- Third part of the user's phone number
    USER_SPORT VARCHAR(50),                      -- User's favorite sport, max length 50
    USER_ART VARCHAR(50),                        -- User's favorite art, max length 50
    USER_FOOD VARCHAR(50),                       -- User's favorite food, max length 50
    USER_MUSIC VARCHAR(50),                      -- User's favorite music, max length 50
    USER_HOBBY VARCHAR(50),                      -- User's hobbies, max length 50
    USER_TRAVEL VARCHAR(50),                     -- User's travel preferences, max length 50
    USER_SMOKE VARCHAR(10),                      -- User's smoking habits, max length 10
    USER_RELIGION VARCHAR(50),                   -- User's religion, max length 50
    USER_MBTI VARCHAR(4),                        -- User's MBTI personality type, max length 4
    REG_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- User registration date, default to current timestamp
    PROFILE_PIC VARCHAR(100),                    -- Profile picture URL or path, max length 100
    USER_MOVIE VARCHAR(50)                       -- User's favorite movie, max length 50
);
