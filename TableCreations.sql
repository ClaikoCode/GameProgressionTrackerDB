CREATE DATABASE gameprogresstrackerdb;
USE gameprogresstrackerdb;

-- Record tables definitions --

CREATE TABLE Quest (
	QuestID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(64) NOT NULL,
    Description TINYTEXT,
    Objective TINYTEXT NOT NULL,
    Reward VARCHAR(128)
);

CREATE TABLE NPC (
	NPCID INT PRIMARY KEY AUTO_INCREMENT,
	Name TINYTEXT NOT NULL,
	Role VARCHAR(32) NOT NULL,
	Dialogue TINYTEXT,
	Location VARCHAR(64)
);

CREATE TABLE Player (
	PlayerID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(64) NOT NULL,
    RegisterDate DATE NOT NULL,
    TotalPlaytimeHours INT DEFAULT 0
);

CREATE TABLE Achievement (
    AchievementID INT PRIMARY KEY AUTO_INCREMENT,
    Name TINYTEXT NOT NULL,
    Description TINYTEXT
);

-- This table is the individual progress of each character from a player. Maybe this should be renamed.
CREATE TABLE Progress (
    ProgressID INT PRIMARY KEY AUTO_INCREMENT,
    TotalPlaytimeHours INT DEFAULT 0,
    LevelsCompleted INT NOT NULL,
    InGameItemsCollected INT NOT NULL,
    ExperiencePointsEarned INT,
    GoldEarned INT,
    PlayerID INT,
    
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID)
);


-- Join table definitions --

CREATE TABLE Quest_NPC (
	QuestID INT,
	NPCID INT,
    
	FOREIGN KEY (QuestID) REFERENCES Quest(QuestID),
	FOREIGN KEY (NPCID) REFERENCES NPC(NPCID),
	PRIMARY KEY AUTO_INCREMENT (QuestID, NPCID)
);

CREATE TABLE Quest_Prerequisite (
	PrerequisiteQuestID INT,
	DependentQuestID INT,
    
	FOREIGN KEY (PrerequisiteQuestID) REFERENCES Quest(QuestID),
	FOREIGN KEY (DependentQuestID) REFERENCES Quest(QuestID),
	PRIMARY KEY AUTO_INCREMENT (PrerequisiteQuestID, DependentQuestID)
);

CREATE TABLE Player_Quest (
    PlayerID INT,
    QuestID INT,
    CompletionDate DATE DEFAULT (CURDATE()),
    
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
    FOREIGN KEY (QuestID) REFERENCES Quest(QuestID),
    PRIMARY KEY AUTO_INCREMENT (PlayerID, QuestID)
);

CREATE TABLE Player_Achievement (
    PlayerID INT,
    AchievementID INT,
    AchievementDate DATE DEFAULT (CURDATE()),
    
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
    FOREIGN KEY (AchievementID) REFERENCES Achievement(AchievementID),
    PRIMARY KEY AUTO_INCREMENT (PlayerID, AchievementID)
);

-- Trigger definitions

DROP TRIGGER IF EXISTS update_playtime_after_progress_update;

DELIMITER $$

CREATE TRIGGER update_playtime_after_progress_update
AFTER UPDATE ON Progress
FOR EACH ROW
BEGIN
    IF NEW.TotalPlaytimeHours != OLD.TotalPlaytimeHours THEN
        UPDATE Player
        SET TotalPlaytimeHours = TotalPlaytimeHours + (NEW.TotalPlaytimeHours - OLD.TotalPlaytimeHours)
        WHERE PlayerID = NEW.PlayerID;
    END IF;
END$$

DELIMITER ;

-- Procedure definitions

DROP PROCEDURE IF EXISTS AddNewPlayer;

DELIMITER $$

CREATE PROCEDURE AddNewPlayer(IN pUsername VARCHAR(255))
BEGIN
	IF NOT EXISTS (SELECT * FROM Player WHERE Username = pUsername) THEN
		INSERT INTO Player (Username, RegisterDate) VALUES (pUsername, CURDATE());
	ELSE
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Username already exists.';
	END IF;
END$$

DELIMITER ;