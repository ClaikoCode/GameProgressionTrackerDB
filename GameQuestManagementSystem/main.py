"""Main file of the program. Contains the main function and the main loop of the program."""

import dbmanager
import prettyIO as pio
import projectinitializer as projinit
import projectinterface as projintf

DATABASE_NAME = "gameprogresstrackerdb"
DEBUGGING = False


def is_quit_command(command):
    """Function for checking if the command is a quit command"""

    return command in ("q", "quit")


def handle_query_command(cursor, query):
    """Function for handling the query command"""

    # Execute the query
    dbmanager.execute_query(cursor, query, also_print=True)


def handle_fake_command(cursor, argument):
    """Function for handling fake command"""

    arguments = argument.split(" ")

    if len(arguments) != 2:
        pio.print_error("Invalid number of arguments for 'fake' command (2 required).")
        return

    table_name = arguments[0]
    num_rows = arguments[1]

    # Generate the dummy data
    # dbmanager.generate_dummy_data(cursor, table_name, num_rows)


def handle_settings_command(database, argument):
    """Function for handling settings command"""

    # Get first word of input (defined as command)
    setting = argument.split(" ")[0]
    # Get rest of input (defined as argument)
    setting_arguments = argument.replace(setting, "").strip()

    bool_argument = pio.parse_valid_bool_argument(setting_arguments)
    if setting == "autocommit":
        if bool_argument is not None:
            dbmanager.set_auto_commit(database, bool_argument)
        else:
            pio.print_error("Invalid boolean argument.")


def handle_help_command(argument):
    """Function for handling help command"""

    arguments = argument.split(" ")

    if len(arguments) > 1:
        pio.print_error("Invalid number of arguments for 'help' command (1 or less).")
        return

    if argument == "":
        show_command_usages()

    elif argument == "builtin":
        show_builtin_command_usages()


def handle_builtin_command(cursor, argument):
    """Function for handling builtin command"""

    arguments = argument.split(" ")

    inner_command = arguments[0]
    command_arguments = arguments[1:]

    if inner_command == "player_achievements":
        if len(command_arguments) < 1:
            pio.print_error(
                "Invalid number of arguments for 'player_achievements' command (1 required)."
            )
            return

        player_id = command_arguments[0]
        projintf.get_player_achievements(cursor, int(player_id))

    elif inner_command == "total_playtime":
        projintf.get_total_playtime(cursor)

    elif inner_command == "avg_items_collected":
        projintf.get_avg_items_collected(cursor)

    elif inner_command == "players_who_completed_quest":
        if len(command_arguments) < 1:
            pio.print_error(
                "Invalid number of arguments for 'players_who_completed_quest' command (1 required)."
            )
            return

        quest_id = command_arguments[0]
        projintf.get_players_who_completed_quest(cursor, int(quest_id))

    elif inner_command == "top_players":
        projintf.get_top_players(cursor)

    elif inner_command == "add_new_player":
        if len(command_arguments) < 1:
            pio.print_error(
                "Invalid number of arguments for 'add_new_player' command (1 required)."
            )
            return
        
        player_name = command_arguments[0]
        projintf.add_new_player(cursor, player_name)

    else:
        pio.print_error("Invalid builtin command.")


def handle_user_commands(cursor, database, command, argument):
    """Handle all user input"""

    if command == "help":
        handle_help_command(argument)

    elif command == "commit":
        dbmanager.commit(database)

    elif command == "rollback":
        dbmanager.rollback(database)

    elif command == "setting":
        handle_settings_command(database, argument)

    elif command == "builtin":
        handle_builtin_command(cursor, argument)

    elif command == "query":
        handle_query_command(cursor, argument)

    else:
        pio.pprint("Invalid command.")


def show_command_usages():
    """Function for showing the command usages"""

    # Dict of commands and a pair of arguments and their descriptions
    command_usages = {
        "commit": ("", "Commits the changes to the database."),
        "rollback": ("", "Rollbacks the changes to the database."),
        "setting": (
            "[SettingName] [Value]",
            "Sets setting value.\nExample: 'setting autocommit on'",
        ),
        "query": ("[SQLQuery]", "Executes user typed SQL query and prints the output."),
        "builtin": (
            "[Command] [Arguments]",
            "Executes a builtin command. See 'help builtin' for more info.",
        ),
        "help": (
            "[Command]",
            "Shows the command usages.\nSpecific command help: 'builtin'",
        ),
        "(q)uit": ("", "Exits the program."),
    }

    pio.print_command_list(command_usages)


def show_builtin_command_usages():
    """Function for showing the builtin command usages"""

    # Dict of commands and a pair of arguments and their descriptions
    command_usages = {
        "player_achievements": (
            "[PlayerID]",
            "Prints achievements for a given player.",
        ),
        "total_playtime": ("", "Prints the total playtime of all players combined."),
        "avg_items_collected": (
            "",
            "Prints the average items collected per player in each level.",
        ),
        "players_who_completed_quest": (
            "[QuestID]",
            "Prints the players who have completed all quests.",
        ),
        "top_players": ("", "Prints the top 10 players with most achievements."),
        "add_new_player": (
            "[PlayerName]",
            "Adds a new player with given name to the database through a stored procedure.",
        ),
    }

    pio.print_command_list(command_usages)


def get_user_command():
    """Gets the user input with a prompt and proper formatting."""

    # Multiline input prompt
    general_info_prompt = "Type 'help' to show command usages. Type 'quit'/'q' to exit."
    extra_info_promp = "Remember to commit changes to the database after a change."
    input_prompt = f"{general_info_prompt}\n{extra_info_promp}"

    user_input = pio.get_general_user_input(input_prompt)

    # Get first word of input (defined as command)
    command = user_input.split(" ")[0]
    # Get rest of input (defined as argument)
    argument = user_input.replace(command, "").strip()

    return command, argument


def run_app(database, cursor):
    """Main loop of the program."""

    pio.print_header("Game Progress Tracker Interface")

    # Main loop of the program
    run_program = True
    while run_program:
        (command, argument) = get_user_command()

        if is_quit_command(command):
            pio.print_info("Exiting application...")
            run_program = False
            continue

        handle_user_commands(cursor, database, command, argument)

    pio.print_success("Application exited.\n")


def exit_program(database, cursor):
    """Function for exiting the program"""

    pio.print_info("Exiting program...")

    # Commit changes to the database
    if pio.get_yes_no_input("Commit changes to the database?"):
        dbmanager.commit(database)

    # Set autocommit to false before closing the database connection
    dbmanager.set_auto_commit(database, False)

    # Clear unread results.
    # This is necessary because the cursor is NOT buffered and will
    # give an error if not cleared before closing.
    if cursor.description is not None:
        pio.print_info("Clearing any leftover cursor results...")
        cursor.fetchall()

    # Close the database connection
    cursor.close()
    database.close()

    pio.print_success("Database and cursor connection closed successfully.")


def main():
    """Main function of the program."""

    pio.print_title("DATABASE PROJECT APP")

    pio.print_info("Starting program...")

    database_cnx = None
    cursor = None

    if DEBUGGING:
        database = dbmanager.connect_to_mysql_database("localhost", "root", "root")
        (database_cnx, cursor) = (database, database.cursor(dictionary=True))
        result = dbmanager.use_database(cursor, DATABASE_NAME)
    else:
        result = projinit.init()
        (database_cnx, cursor) = result

    if result:
        run_app(database_cnx, cursor)
        exit_program(database_cnx, cursor)
    else:
        dbmanager.rollback(database_cnx)
        pio.print_error("Initialization failed. Exiting...")

    pio.print_success("Program exited.")


if __name__ == "__main__":
    main()
