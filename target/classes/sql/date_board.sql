CREATE TABLE date_board (
    USER_ID INT,                                  -- User ID (foreign key candidate)
    IMAGE_SEQ INT AUTO_INCREMENT PRIMARY KEY,     -- Image sequence (Primary Key with Auto Increment)
    IMAGE_NAME VARCHAR(50),                       -- Name of the image, max length 50
    FILE_NAME VARCHAR(50),                        -- File name for the image, max length 50
    IMAGE_ORIGINAL_FILE_NAME VARCHAR(100),        -- Original file name of the image, max length 100
    LOGTIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP,   -- Timestamp for the image upload, default to current timestamp
    FOREIGN KEY (USER_ID) REFERENCES date_user(USER_ID)
);
