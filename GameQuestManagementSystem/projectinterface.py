"""File for functions that will interface with the project database"""

import dbmanager


def get_player_achievements(cursor, player_id):
    """Function for getting all achievements for a player"""

    sql_query = """
        SELECT A.Name, A.Description, PA.AchievementDate
        FROM Player_Achievement PA
        JOIN Achievement A ON PA.AchievementID = A.AchievementID
        WHERE PA.PlayerID = %s;
    """

    result = dbmanager.execute_query(cursor, sql_query, (player_id,), also_print=True)

    return result


def get_total_playtime(cursor):
    """Function for getting the total playtime of all players"""

    sql_query = """
        SELECT SUM(TotalPlaytimeHours) AS TotalPlaytime 
        FROM Player;
    """

    result = dbmanager.execute_query(cursor, sql_query, also_print=True)

    return result


def get_avg_items_collected(cursor):
    """Function for getting the average number of items collected by players in each level"""

    sql_query = """
        SELECT LevelsCompleted, AVG(InGameItemsCollected) AS AvgItemsCollected
        FROM Progress
        GROUP BY LevelsCompleted
        ORDER BY LevelsCompleted DESC;
    """

    result = dbmanager.execute_query(cursor, sql_query, also_print=True)

    return result


def get_players_who_completed_quest(cursor, quest_id):
    """Function for getting all players who have completed a quest"""

    sql_query = """
        SELECT P.Username, P.TotalPlaytimeHours
        FROM Player P
        JOIN Player_Quest PQ 
        ON P.PlayerID = PQ.PlayerID
        WHERE PQ.QuestID = %s
        AND PQ.CompletionDate IS NOT NULL;
    """

    result = dbmanager.execute_query(cursor, sql_query, (quest_id,), also_print=True)

    return result


def get_top_players(cursor):
    """Function for getting top 10 players with most achievements"""

    sql_query = """
        SELECT P.Username, COUNT(PA.AchievementID) AS NumAchievements
        FROM Player P
        JOIN Player_Achievement PA ON P.PlayerID = PA.PlayerID
        GROUP BY P.PlayerID
        ORDER BY NumAchievements DESC
        LIMIT 10;
    """

    result = dbmanager.execute_query(cursor, sql_query, also_print=True)

    return result


def add_new_player(cursor, username):
    """Function for adding a new player to the database"""

    result = dbmanager.execute_procedure(cursor, "AddNewPlayer", (username,))

    return result
