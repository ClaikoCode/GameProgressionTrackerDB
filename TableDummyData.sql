
INSERT INTO Quest (Name, Description, Objective, Reward)
VALUES
    ('The Lost Amulet', 'Help find the ancient amulet lost in the forest', 'Find the amulet and return', '100 gold'),
    ('Bandit''s Lair', 'Eliminate the bandit group in the abandoned mine', 'Defeat all bandits', '200 gold'),
    ('Healing Herbs', 'Collect rare healing herbs from the mountains', 'Gather 5 healing herbs', '50 gold'),
    ('Goblin Trouble', 'Investigate goblin activity in the caves', 'Discover the goblin''s plans', 'Potion of Healing'),
    ('The Secret Key', 'Find the hidden key to unlock the ancient door', 'Search for clues', '150 gold'),
    ('The Enchanted Sword', 'Retrieve the legendary sword from the dragon''s lair', 'Defeat the dragon and claim the sword', '500 gold'),
    ('Missing Artifacts', 'Recover stolen artifacts from the thieves'' hideout', 'Retrieve all stolen artifacts', '250 gold'),
    ('The Haunted Mansion', 'Explore the haunted mansion and unravel its mysteries', 'Investigate strange occurrences', '100 gold'),
    ('The Forbidden Scroll', 'Retrieve the ancient scroll from the forbidden temple', 'Overcome obstacles and retrieve the scroll', '200 gold'),
    ('The Mysterious Mask', 'Find the mysterious mask hidden in the ancient ruins', 'Solve puzzles and uncover the mask''s secrets', '300 gold'),
    ('The Cursed Forest', 'Break the curse that plagues the forest', 'Find the source of the curse and eliminate it', '200 gold'),
    ('The Lost Treasure', 'Embark on a treasure hunt to find the lost treasure', 'Follow the treasure map and dig in the specified location', '400 gold'),
    ('The Guardian Statue', 'Activate the guardian statue to protect the village', 'Collect the required artifacts and activate the statue', '150 gold'),
    ('The Crystal Shard', 'Retrieve the powerful crystal shard from the deep caverns', 'Navigate through dangerous tunnels and retrieve the shard', '250 gold'),
    ('The Ancient Riddle', 'Solve the ancient riddle to unlock the secret chamber', 'Decipher the clues and answer the riddle correctly', '100 gold'),
    ('The Labyrinth', 'Escape from the treacherous labyrinth', 'Find the correct path and avoid deadly traps', '200 gold'),
    ('The Lost Companions', 'Rescue the lost companions trapped in the underground dungeon', 'Defeat the dungeon boss and free the companions', '300 gold'),
    ('The Magical Potion', 'Brew a powerful magical potion for the village healer', 'Gather rare ingredients and follow the recipe', '150 gold'),
    ('The Stolen Crown', 'Reclaim the stolen crown from the enemy castle', 'Infiltrate the castle and defeat the enemy leader', '500 gold'),
    ('The Forbidden Forest', 'Explore the forbidden forest and uncover its secrets', 'Survive the dangers and find hidden treasures', '250 gold');


INSERT INTO NPC (Name, Role, Dialogue, Location)
VALUES
    ('John', 'Blacksmith', 'Welcome, adventurer! What can I do for you?', 'Town'),
    ('Emily', 'Innkeeper', 'Greetings, weary traveler. Care for a room?', 'Town'),
    ('Marcus', 'Quest Giver', 'I have a task for you. Are you interested?', 'Town'),
    ('Sophia', 'Healer', 'Need healing? I can help with that.', 'Town'),
    ('Elijah', 'Guard', 'Halt! No entry without proper authorization.', 'Castle'),
    ('Olivia', 'Merchant', 'Take a look at my wares. I have the finest goods.', 'Market'),
    ('Nathan', 'Explorer', 'I''ve seen wonders in my travels. Want to hear a tale?', 'Tavern'),
    ('Isabella', 'Herbalist', 'Looking for medicinal herbs? You''ve come to the right place.', 'Forest'),
    ('Liam', 'Tavern Owner', 'Welcome to Liam''s Tavern. Grab a drink and enjoy!', 'Tavern'),
    ('Ava', 'Fisher', 'Fishing is my passion. Care to join me?', 'Lake'),
    ('Lucas', 'Scholar', 'Knowledge is power. Seek wisdom in books.', 'Library'),
    ('Mia', 'Thief', 'Need something acquired discreetly? I''m your person.', 'Shady Alley'),
    ('Henry', 'Farmer', 'A hard day''s work brings a bountiful harvest.', 'Fields'),
    ('Victoria', 'Bard', 'Listen to my songs and let your heart soar.', 'Town Square'),
    ('David', 'Priest', 'May the gods guide and bless you on your journey.', 'Temple'),
    ('Grace', 'Dancer', 'Witness the beauty of dance and be mesmerized.', 'Theater'),
    ('Daniel', 'Royal Advisor', 'The kingdom relies on wise decisions. I offer guidance.', 'Palace'),
    ('Chloe', 'Animal Trainer', 'Training animals is my expertise. Want to see a trick?', 'Circus'),
    ('Michael', 'Black Market Dealer', 'Looking for rare and forbidden goods? I can get them.', 'Hidden Den'),
    ('Emma', 'Archery Instructor', 'Master the art of archery under my guidance.', 'Archery Range');


INSERT INTO Player (Name, RegisterDate, TotalPlaytimeHours)
VALUES
    ('JohnDoe', '2023-01-15', 50),
    ('JaneSmith', '2023-02-10', 80),
    ('AlexJohnson', '2023-03-05', 120),
    ('EmilyWilson', '2023-04-20', 40),
    ('MichaelBrown', '2023-05-01', 90),
    ('OliviaDavis', '2023-06-18', 70),
    ('DanielMiller', '2023-07-12', 110),
    ('SophiaGarcia', '2023-08-09', 60),
    ('MatthewMartinez', '2023-09-25', 95),
    ('EmmaAnderson', '2023-10-30', 130),
    ('JamesTaylor', '2023-11-21', 75),
    ('AbigailThomas', '2023-12-05', 55),
    ('BenjaminLee', '2024-01-02', 85),
    ('VictoriaHarris', '2024-02-14', 100),
    ('WilliamClark', '2024-03-19', 45),
    ('EllaLewis', '2024-04-27', 65),
    ('SamuelWalker', '2024-05-11', 150),
    ('AveryGreen', '2024-06-06', 125),
    ('GraceHall', '2024-07-24', 80),
    ('HenryBaker', '2024-08-15', 105);


INSERT INTO Achievement (Name, Description)
VALUES
    ('Novice Adventurer', 'Complete your first quest'),
    ('Treasure Hunter', 'Discover hidden treasures in 10 different locations'),
    ('Master Craftsman', 'Craft 50 items'),
    ('Legendary Hero', 'Defeat the final boss and save the kingdom'),
    ('Swift Runner', 'Complete a quest in under 30 minutes'),
    ('Master Alchemist', 'Brew 100 potions'),
    ('Master Angler', 'Catch 50 different types of fish'),
    ('Puzzle Solver', 'Solve 50 puzzles'),
    ('Champion of the Arena', 'Win 10 consecutive battles in the arena'),
    ('Mighty Explorer', 'Visit every location in the game'),
    ('Mastery Unlocked', 'Reach maximum level in a skill'),
    ('Legendary Weaponsmith', 'Forge 10 legendary weapons'),
    ('Collector Extraordinaire', 'Collect 500 unique in-game items'),
    ('Master of Magic', 'Learn and cast 100 different spells'),
    ('Legendary Mount', 'Acquire a rare and powerful mount'),
    ('King of the Leaderboards', 'Achieve the highest rank in PvP battles'),
    ('Architect of the Realm', 'Build and customize 10 unique structures'),
    ('Master of Disguise', 'Complete 50 stealth-based quests'),
    ('Master of Strategy', 'Win 100 turn-based strategy battles'),
    ('Legendary Scholar', 'Unlock all in-game lore entries');


INSERT INTO Progress (LevelsCompleted, InGameItemsCollected, ExperiencePointsEarned, GoldEarned, PlayerID)
VALUES
    (10, 50, 5000, 10000, 1),
    (5, 20, 2500, 5000, 2),
    (15, 70, 8000, 15000, 3),
    (8, 40, 3500, 7000, 4),
    (12, 60, 6000, 12000, 5),
    (6, 30, 3000, 6000, 6),
    (18, 80, 10000, 20000, 7),
    (9, 45, 4000, 8000, 8),
    (14, 55, 7000, 14000, 9),
    (20, 100, 12000, 25000, 10),
    (7, 35, 4000, 7500, 11),
    (11, 65, 5500, 11000, 12),
    (4, 25, 2000, 4000, 13),
    (17, 75, 9000, 18000, 14),
    (3, 15, 1500, 3000, 15),
    (13, 50, 6000, 11000, 16),
    (19, 90, 11000, 22000, 17),
    (2, 10, 1000, 2000, 18),
    (16, 70, 8500, 16000, 19),
    (1, 5, 500, 1000, 20);


INSERT INTO Quest_NPC (QuestID, NPCID)
VALUES
    (1, 3),
    (1, 6),
    (2, 4),
    (3, 9),
    (4, 8),
    (5, 7),
    (6, 11),
    (7, 12),
    (8, 13),
    (9, 5),
    (10, 2),
    (11, 14),
    (12, 10),
    (13, 15),
    (14, 16),
    (15, 17),
    (16, 18),
    (17, 19),
    (18, 20),
    (19, 1);
    
    
INSERT INTO Quest_Prerequisite (PrerequisiteQuestID, DependentQuestID)
VALUES
    (1, 2),
    (2, 5),
    (3, 4),
    (6, 7),
    (8, 9),
    (9, 10),
    (11, 12),
    (12, 13),
    (14, 15),
    (15, 16),
    (16, 17),
    (17, 18),
    (18, 19),
    (19, 20),
    (1, 3),
    (2, 6),
    (3, 9),
    (4, 8),
    (5, 7),
    (10, 11);



INSERT INTO Player_Quest (PlayerID, QuestID, CompletionDate)
VALUES
    (1, 1, '2023-03-10'),
    (1, 3, '2023-03-15'),
    (2, 2, '2023-04-02'),
    (2, 4, '2023-04-10'),
    (3, 1, '2023-05-05'),
    (3, 2, '2023-05-12'),
    (4, 3, '2023-06-01'),
    (4, 4, '2023-06-08'),
    (5, 1, '2023-07-10'),
    (5, 2, '2023-07-18'),
    (6, 3, '2023-08-15'),
    (6, 4, '2023-08-22'),
    (7, 1, '2023-09-25'),
    (7, 2, '2023-10-01'),
    (8, 3, '2023-11-05'),
    (8, 4, '2023-11-12'),
    (9, 1, '2023-12-20'),
    (9, 2, '2023-12-28'),
    (10, 3, '2024-01-30'),
    (10, 4, '2024-02-07');



INSERT INTO Player_Achievement (PlayerID, AchievementID, AchievementDate)
VALUES
    (1, 1, '2023-03-12'),
    (1, 2, '2023-03-18'),
    (2, 3, '2023-04-05'),
    (2, 4, '2023-04-13'),
    (3, 1, '2023-05-08'),
    (3, 2, '2023-05-15'),
    (4, 3, '2023-06-03'),
    (4, 4, '2023-06-10'),
    (5, 1, '2023-07-12'),
    (5, 2, '2023-07-20'),
    (6, 3, '2023-08-18'),
    (6, 4, '2023-08-25'),
    (7, 1, '2023-09-28'),
    (7, 2, '2023-10-04'),
    (8, 3, '2023-11-08'),
    (8, 4, '2023-11-15'),
    (9, 1, '2023-12-22'),
    (9, 2, '2023-12-30'),
    (10, 3, '2024-01-31'),
    (10, 4, '2024-02-08');

