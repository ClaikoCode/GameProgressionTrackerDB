"""Main file of the program. Contains the main function and the main loop of the program."""

import dbmanager
import prettyIO as pio
import projectinitializer as projinit

DATABASE_NAME = "gameprogresstrackerdb"
DEBUGGING = True


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
    dbmanager.generate_dummy_data(cursor, table_name, num_rows)


def handle_settings(cursor, database, argument):
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


def handle_user_command(cursor, database, command, argument):
    """Handle all user input"""

    if command == "help":
        show_command_usages()

    elif command == "commit":
        dbmanager.commit(database)

    elif command == "rollback":
        dbmanager.rollback(database)

    elif command == "setting":
        handle_settings(cursor, database, argument)

    elif command == "query":
        handle_query_command(cursor, argument)

    elif command == "fake":
        handle_fake_command(cursor, argument)

    else:
        pio.pprint("Invalid command.")


def show_command_usages():
    """Function for showing the command usages"""

    command_print_style = "white"

    # Dict of commands and a pair of arguments and their descriptions
    command_usages = {
        "commit": ("", "Commits the changes to the database."),
        "rollback": ("", "Rollbacks the changes to the database."),
        "setting": (
            "[SettingName] [Value]",
            "Sets setting value.\nExample: 'setting autocommit on'",
        ),
        "query": ("[SQLQuery]", "Executes user typed SQL query and prints the output."),
        "fake": (
            "[TableName] [NumRows]",
            "Generates given number of rows with dummy data into a table.",
        ),
        "help": ("", "Shows the command usages."),
        "(q)uit": ("", "Exits the program."),
    }

    # Print the command usages with prettyprinter and style
    pio.pprint("[bold underline]Commands:[/]", style=command_print_style)
    for command, (arguments, description) in command_usages.items():
        print("")
        pio.pprint(
            f"[bold]'{command}'[/] {arguments}\n{description}",
            style=command_print_style,
        )

    print("")


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

    # dbmanager.execute_sql_file(
    #    cursor, "E:/Skola/Åk 3/Databasteknik/Project/TableDummyData.sql"
    # )

    # Main loop of the program
    run_program = True
    while run_program:
        (command, argument) = get_user_command()

        if is_quit_command(command):
            pio.print_info("Exiting application...")
            run_program = False
            continue

        handle_user_command(cursor, database, command, argument)

    pio.print_success("Application exited.\n")


def exit_program(database, cursor):
    """Function for exiting the program"""

    pio.print_info("Exiting program...")

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

    if DEBUGGING:
        database = dbmanager.connect_to_mysql_database("localhost", "root", "root")
        result = (database, database.cursor(dictionary=True))
        dbmanager.use_database(result[1], DATABASE_NAME)
    else:
        result = projinit.init()

    if result:
        (database_cnx, cursor) = result
        run_app(database_cnx, cursor)
        exit_program(database_cnx, cursor)
    else:
        dbmanager.rollback(database_cnx)
        pio.print_error("Initialization failed. Exiting...")

    pio.print_success("Program exited.")


if __name__ == "__main__":
    main()
