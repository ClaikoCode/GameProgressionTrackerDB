"""
This file is used to initialize the project.
It contains the database name and the database manager object.
it also contains the functions for initializing the database and tables.
"""

import dbmanager
import prettyIO as pio

DATABASE_NAME = "gameprogresstrackerdb"
DUMMY_DATA_NAME = "TableDummyData.sql"
LARGE_DUMMY_DATA_NAME = "TableDummyDataLarger.sql"
PROCEDURES_NAME = "Procedures.sql"
TRIGGERS_NAME = "Triggers.sql"


def initialize_mysql_connection():
    """Function for initializing the database"""

    try:
        # Get host name from user
        host_name = pio.get_general_user_input("Enter your host name:")

        # Get username from user
        username = pio.get_general_user_input("Enter your username:")

        # Get password from user
        password = pio.get_general_user_input(
            "Enter your password (in memory only for lifetime of application):"
        )

        # Connect to the database
        database = dbmanager.connect_to_mysql_database(host_name, username, password)
        if database is None:
            return None

        cursor = database.cursor(dictionary=True)

        # Return the database object
        return (database, cursor)

    except Exception as err:
        pio.print_exception_info("Failed to initialize database.", err)
        return None


def initialize_tables(cursor):
    """Function for initializing the tables required for the project"""

    result = True

    pio.print_info("Initializing tables...")

    # Record tables definitions

    # Quest table
    result &= dbmanager.create_table(
        cursor,
        "Quest",
        (
            "QuestID INT PRIMARY KEY AUTO_INCREMENT",
            "Name VARCHAR(64) NOT NULL",
            "Description TINYTEXT",
            "Objective TINYTEXT NOT NULL",
            "Reward VARCHAR(128)",
        ),
    )

    # NPC table
    result &= dbmanager.create_table(
        cursor,
        "NPC",
        (
            "NPCID INT PRIMARY KEY AUTO_INCREMENT",
            "Name TINYTEXT NOT NULL",
            "Role VARCHAR(32) NOT NULL",
            "Dialogue TINYTEXT",
            "Location VARCHAR(64)",
        ),
    )

    # Player table
    result &= dbmanager.create_table(
        cursor,
        "Player",
        (
            "PlayerID INT PRIMARY KEY AUTO_INCREMENT",
            "Name VARCHAR(64) NOT NULL",
            "RegisterDate DATE NOT NULL",
            "TotalPlaytimeHours INT",
        ),
    )

    # Achievement table
    result &= dbmanager.create_table(
        cursor,
        "Achievement",
        (
            "AchievementID INT PRIMARY KEY AUTO_INCREMENT",
            "Name TINYTEXT NOT NULL",
            "Description TINYTEXT",
        ),
    )

    # Progress table
    result &= dbmanager.create_table(
        cursor,
        "Progress",
        (
            "ProgressID INT PRIMARY KEY AUTO_INCREMENT",
            "LevelsCompleted INT NOT NULL",
            "InGameItemsCollected INT NOT NULL",
            "ExperiencePointsEarned INT",
            "GoldEarned INT",
            "PlayerID INT",
            "FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID)",
        ),
    )

    # Join table definitions

    # Quest to NPC connected table
    result &= dbmanager.create_table(
        cursor,
        "Quest_NPC",
        (
            "QuestID INT",
            "NPCID INT",
            "FOREIGN KEY (QuestID) REFERENCES Quest(QuestID)",
            "FOREIGN KEY (NPCID) REFERENCES NPC(NPCID)",
            "PRIMARY KEY AUTO_INCREMENT (QuestID, NPCID)",
        ),
    )

    # Quest to Required quest connected table
    result &= dbmanager.create_table(
        cursor,
        "Quest_Prerequisite",
        (
            "PrerequisiteQuestID INT",
            "DependentQuestID INT",
            "FOREIGN KEY (PrerequisiteQuestID) REFERENCES Quest(QuestID)",
            "FOREIGN KEY (DependentQuestID) REFERENCES Quest(QuestID)",
            "PRIMARY KEY AUTO_INCREMENT (PrerequisiteQuestID, DependentQuestID)",
        ),
    )

    # Player to Quest connected table
    result &= dbmanager.create_table(
        cursor,
        "Player_Quest",
        (
            "PlayerID INT",
            "QuestID INT",
            "CompletionDate DATE",
            "FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID)",
            "FOREIGN KEY (QuestID) REFERENCES Quest(QuestID)",
            "PRIMARY KEY AUTO_INCREMENT (PlayerID, QuestID)",
        ),
    )

    # Player to Achievment connected table
    result &= dbmanager.create_table(
        cursor,
        "Player_Achievement",
        (
            "PlayerID INT",
            "AchievementID INT",
            "AchievementDate DATE",
            "FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID)",
            "FOREIGN KEY (AchievementID) REFERENCES Achievement(AchievementID)",
            "PRIMARY KEY AUTO_INCREMENT (PlayerID, AchievementID)",
        ),
    )

    if result:
        pio.print_success("Tables created successfully.")
    else:
        pio.print_error("Some tables failed to be created.")

    return result


def populate_tables(cursor):
    """Function for populating the tables with dummy data"""

    result = dbmanager.execute_sql_file(cursor, "../" + LARGE_DUMMY_DATA_NAME)

    if result:
        pio.print_success("Tables populated successfully.")
    else:
        pio.print_error("Some tables failed to be populated.")

    return result


def add_procedures_and_triggers(cursor):
    """Function for adding the procedures and triggers to the database"""

    result = True

    # Add procedures
    result &= dbmanager.execute_sql_file(cursor, "../" + PROCEDURES_NAME)

    # Add triggers
    result &= dbmanager.execute_sql_file(cursor, "../" + TRIGGERS_NAME)

    if result:
        pio.print_success("Procedures and triggers added successfully.")
    else:
        pio.print_error("Some procedures and triggers failed to be added.")

    return result


def init():
    """Function for initializing the project"""

    result = initialize_mysql_connection()
    (database_cnx, cursor) = result
    dbmanager.use_database(cursor, DATABASE_NAME)

    # Deprecated code. Left for reference.
    if False:
        if not pio.get_yes_no_input(
            "Do you want to initialize the database? This should always be done on first run."
        ):
            pio.print_info("Skipping database initialization.")
            return True

        if pio.get_yes_no_input("Do you want to initialize the schema?"):
            # Create the database
            if not dbmanager.create_schema(cursor, DATABASE_NAME):
                pio.print_error("Failed to create the database.")
                return False
        else:
            pio.print_info("Skipping schema initialization.")

        # Select the database
        dbmanager.use_database(cursor, DATABASE_NAME)

        if pio.get_yes_no_input("Do you want to initialize the tables?"):
            # Create the tables if they don't exist
            if not initialize_tables(cursor):
                return False
        else:
            pio.print_info("Skipping table initialization.")

        if pio.get_yes_no_input("Do you want to populate the tables?"):
            # Populate the tables
            if not populate_tables(cursor):
                return False
        else:
            pio.print_info("Skipping table population.")

        if pio.get_yes_no_input("Do you want to add the procedures and triggers?"):
            # Add the procedures and triggers
            if not add_procedures_and_triggers(cursor):
                return False
        else:
            pio.print_info("Skipping procedure and trigger addition.")

        # Commit all changes
        dbmanager.commit(database_cnx)

    return (database_cnx, cursor)
