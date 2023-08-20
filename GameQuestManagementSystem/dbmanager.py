"""Module for managing the database connection and queries"""

from dataclasses import dataclass
import mysql.connector
from faker import Faker

import prettyIO as pio


MAX_DUMMY_ROWS = 300  # Maximum number of rows to generate for a table


@dataclass
class ColumnDescription:
    """Dataclass for storing the description of a table column"""

    name: str
    data_type: str
    can_be_null: bool
    is_primary_key: bool
    default_val: str
    extra_info: str


def _collect_rows(fetch_result):
    """Function for collecting text rows from a fetch result"""

    fetch_content = ""
    for row in fetch_result:
        fetch_content += str(row)

        # Only add newline if not last row
        if row != fetch_result[-1]:
            fetch_content += "\n"

    return fetch_content


def _parse_table_description(table_description) -> list[ColumnDescription]:
    """
    Parses the columns of a table description.
    Each row in the description is assumed to be in the format:
    "('column_name', b'column_type', 'can_be_null', 'key_info', 'default_val', 'extra_info')"

    This format is based on the output of the MySQL DESCRIBE command.
    Returns a list of ColumnDescription objects.
    """

    lines = table_description.strip().split("\n")

    strip_chars = " '"
    columns = []
    for line in lines:
        parts = line.strip("()").split(",")

        # Column name is the first part of the description
        column_name = parts[0].strip(strip_chars)

        # Column type is the second part of the description
        column_type = parts[1].strip(
            "b" + strip_chars
        )  # Strip the 'b' string literal from the beginning of the type string

        # Determine if column can be null
        can_be_null = parts[2].strip(strip_chars) == "YES"

        # Primary key is True if the column is a primary key
        is_primary_key = parts[3].strip(strip_chars) == "PRI"

        # Default value is originally Null if the default value is 'None'
        default_string_val = parts[4].strip(strip_chars)
        default_val = None if default_string_val == "None" else default_string_val

        # Any extra info about the column
        extra = parts[5].strip(strip_chars)

        columns.append(
            ColumnDescription(
                column_name,
                column_type,
                can_be_null,
                is_primary_key,
                default_val,
                extra,
            )
        )

    return columns


def _get_varchar_length(varchar_type_string):
    """Function for getting the length of a VARCHAR column type"""
    return int(varchar_type_string.strip("varchar()"))


def _handle_query_warnings(cursor):
    """Function for handling warnings from a query."""

    warning_results = cursor.fetchwarnings()
    if warning_results:
        warning_content = _collect_rows(warning_results)
        pio.print_error_panel("MySQL Warnings", warning_content)
    else:
        pio.print_success("Executed query without warnings.")


def connect_to_mysql_database(host, user, password):
    """Function for connecting to the database."""

    database = mysql.connector.connect(host=host, user=user, passwd=password)

    if database.is_connected():
        pio.print_success("Connected to database successfully.")
        database.get_warnings = True
    else:
        pio.print_error("Failed to connect to database.")
        database = None

    return database


def commit(database_cnx):
    """Function for committing changes to the database"""

    pio.print_info("Committing changes to database...")
    database_cnx.commit()
    pio.print_success("Changes committed to database.")


def rollback(database_cnx):
    """Function for aborting changes to the database"""

    pio.print_info("Aborting changes to database...")
    database_cnx.rollback()
    pio.print_success("Changes aborted form database.")


def set_auto_commit(database_cnx, auto_commit):
    """Function for setting auto commit to True"""

    database_cnx.autocommit = auto_commit
    pio.pprint(f"Auto commit set to {auto_commit}.")


def print_db_output(cursor):
    """Function for printing the output of a database query."""
    query_results = cursor.fetchall()
    output_content = _collect_rows(query_results)

    pio.print_info_panel("MySQL Output", output_content)


def print_db_dict_output(cursor):
    """Function for printing the output of a database query as a dictionary."""

    # Get results
    query_results_dict = cursor.fetchall()
    # Get column names. These will be used as keys for the dictionary
    column_names = cursor.column_names
    # Extract rows from results dictionary
    rows = []

    for row in query_results_dict:
        rows.append(list(row.values()))

    pio.print_table(column_names, rows, "MySQL Output")


def _execute_query_general(cursor, query, exec_many, values, also_print=False):
    """
    Function for executing and handling both normal and 'many' queries.
    Only to be used internally.
    Returns True if the query was successful, False otherwise.
    """

    try:
        # Change command message depending on if it is a 'many' query
        command_text = "Executing query" if not exec_many else "Executing many query"
        pio.print_command(command_text, query)

        if exec_many:
            if values is None:
                raise ValueError("Values must be provided for a 'many' query.")
            cursor.executemany(query, values)
        else:
            cursor.execute(query, values)

        if also_print:
            print_db_dict_output(cursor)

        _handle_query_warnings(cursor)

        return True

    except Exception as err:
        error_text = "Failed SQL Query" if not exec_many else "Failed SQL Many Query"
        pio.print_exception_info(error_text, err)
        return False


def execute_query(cursor, query, values=None, also_print=False):
    """Function for executing a query on the database."""

    should_exec_many = False
    return _execute_query_general(cursor, query, should_exec_many, values, also_print)


def execute_many_query(cursor, query, values, also_print=False):
    """Function for executing a 'many' query on the database."""

    should_exec_many = True
    return _execute_query_general(cursor, query, should_exec_many, values, also_print)


def execute_procedure(cursor, procedure_name, args=None, also_print=False):
    """Function for executing a stored procedure on the database."""

    try:
        # Change command message depending on if it is a 'many' query
        command_text = "Executing procedure"
        pio.print_command(command_text, procedure_name)

        if args is None:
            cursor.callproc(procedure_name)
        else:
            cursor.callproc(procedure_name, args)

        if also_print:
            print_db_dict_output(cursor)

        _handle_query_warnings(cursor)

        return True

    except Exception as err:
        error_text = "Failed SQL Procedure"
        pio.print_exception_info(error_text, err)
        return False


# def generate_dummy_data(cursor, table_name, num_rows):
#    """Function for generating dummy data for a table"""
#
#    # Check if num_rows is a valid integer
#    if not num_rows.isdigit():
#        pio.print_error("Number of rows must be an integer.")
#        return
#
#    num_rows = int(num_rows)
#    # Check if num_rows is within range
#    if num_rows < 1 or num_rows > MAX_DUMMY_ROWS:
#        pio.print_error(f"Number of rows must be between 1 and {MAX_DUMMY_ROWS}.")
#        return
#
#    # Get the table description
#    try:
#        execute_query(cursor, f"DESCRIBE {table_name}")
#        table_desc = _collect_rows(cursor.fetchall())
#
#        columns = [
#            column
#            for column in _parse_table_description(table_desc)
#            if not (column.is_primary_key and "auto_increment" in column.extra_info)
#        ]
#
#        # Get the column names
#        column_names = [column.name for column in columns]
#
#        # Get the column types
#        column_types = [column.data_type for column in columns]
#
#        # Generate the dummy data
#        fake = Faker()
#        row_values = []
#        for _ in range(num_rows):
#            # Generate the values
#            values = []
#            for i in range(len(column_names)):
#                column_type = column_types[i]
#
#                if column_type == "int":
#                    values.append(fake.pyint())
#                elif column_type.startswith("varchar"):
#                    values.append(
#                        fake.pystr(max_chars=_get_varchar_length(column_type))
#                    )
#                elif column_type == "tinytext":
#                    values.append(fake.text(max_nb_chars=255))
#                elif column_type == "date":
#                    values.append(fake.date())
#                elif column_type == "datetime":
#                    values.append(fake.date_time())
#                elif column_type == "float":
#                    values.append(fake.pyfloat())
#                elif column_type == "tinyint":
#                    values.append(fake.pyint())
#                elif column_type == "text":
#                    values.append(fake.text())
#                else:
#                    pio.print_error(f"Unknown type '{column_type}'. Aborting...")
#                    return
#
#            # Transform the values into a tuple
#            row_values.append(tuple(values))
#
#        # Generate the query
#        column_names_str = ",".join(column_names)  # column names separated by commas
#        values_str = ",".join(["%s"] * len(column_names))  # %s for each column
#        query_statment = (
#            f"INSERT INTO {table_name} ({column_names_str}) VALUES ({values_str})"
#        )
#
#        # Execute the query as a 'many' query for efficiency
#        execute_many_query(cursor, query_statment, row_values)
#
#        pio.print_success(
#            f"Generated {num_rows} rows of dummy data for table {table_name}."
#        )
#
#    except Exception as err:
#        pio.print_exception_info("Failed To Generate Dummy Data", err)


def create_schema(cursor, schema_name):
    """Function for creating a schema"""
    pio.print_info("Initializing schema...")

    result = execute_query(cursor, f"CREATE DATABASE IF NOT EXISTS {schema_name}")

    if result:
        pio.print_success(f"Created schema '{schema_name}'.")
    else:
        pio.print_error(f"Failed to create schema '{schema_name}'.")

    return result


def use_database(cursor, schema_name):
    """Function for connecting to a schema"""

    pio.print_info(f"Connecting to schema '{schema_name}'...")

    result = execute_query(cursor, f"USE {schema_name}")

    if result:
        pio.print_success(f"Connected to schema '{schema_name}'.")
    else:
        pio.print_error(f"Failed to connect to schema '{schema_name}'.")

    return result


def create_table(cursor, table_name, columns):
    """
    Function for creating a table with the given columns.
    Assumes columns is a tuple of strings of the form:
    ("column1 type1 KEY1 extra1", "column1 type1 KEY1 extra1", "...").
    """

    # Stringify the columns
    columns_str = ",".join(columns)
    # Generate the query
    query_statment = f"CREATE TABLE IF NOT EXISTS {table_name} ({columns_str})"
    # Execute the query
    result = execute_query(cursor, query_statment)
    if result:
        pio.print_success(f"Created table {table_name}.")
    else:
        pio.print_error(f"Failed to create table {table_name}.")

    return result


def execute_sql_file(cursor, sql_file_name):
    """Function for executing an SQL file. Assumes simpler queries (not nested)."""

    # Open and read the file
    sql_file = ""
    with open(sql_file_name, "r") as filed:
        sql_file = filed.read()

    # Remove comments (lines starting with '--')
    sql_file = "\n".join(
        [line for line in sql_file.split("\n") if not line.strip().startswith("--")]
    )

    # Tested solution for handling extra delimiters. Not functional or done.
    # sql_commands = []
    #
    # current_delimiter = ";"
    # current_command = ""
    # for line in sql_file.split("\n"):
    #    line = line.strip()
    #
    #    if line == "":
    #        continue
    #
    #    if line.startswith("DELIMITER"):
    #        current_delimiter = line.split(" ")[1]
    #        continue
    #
    #    if line.endswith(current_delimiter):
    #        if current_delimiter != ";":
    #            # Remove delimiter from the end of the line (if it's not ';')
    #            line = line[: -len(current_delimiter)]
    #
    #        sql_commands.append(current_command)
    #        current_command = ""
    #        continue

    # Split all SQL commands (split on ';'). Also remove whitespace and empty strings
    sql_commands = [
        command.strip() for command in sql_file.split(";") if command.strip() != ""
    ]

    # Execute every command from the input file
    for query in sql_commands:
        result = execute_query(cursor, query)
        if not result:
            pio.print_error("Failed to execute SQL file '" + sql_file_name + "'.")
            return False

    pio.print_success("SQL file '" + sql_file_name + "' executed successfully.")
    return True
