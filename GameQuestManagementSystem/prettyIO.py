"""Module for printing messages to the console in a pretty and well formated way."""

# Importing rich for pretty printing.
from rich.console import Console
from rich.theme import Theme
from rich.panel import Panel
from rich.table import Table
import traceback

# Defining the color palette.
color_palette = {
    "primary": "#33658A",
    "secondary": "#86BBD8",
    "tertiary": "#95AF6E",
    "quaternary": "#F6AE2D",
    "quinary": "#F26419",
}

# color_palette = {
#    "primary": "#4281A4",
#    "secondary": "#48A9A6",
#    "tertiary": "#E4DFDA",
#    "quaternary": "#D4B483",
#    "quinary": "#C1666B",
# }

# Defining the themes for the rich console.
themes = Theme(
    {
        "error": color_palette["quinary"],
        "warning": color_palette["quaternary"],
        "command": color_palette["primary"],
        "string": color_palette["secondary"],
        "content": color_palette["secondary"],
        "panel": f"bold {color_palette['tertiary']}",
        "title": f"bold {color_palette['primary']}",
        "header": f"bold {color_palette['secondary']}",
        "success": f"bold {color_palette['tertiary']}",
        "info": f"italic {color_palette['quaternary']}",
    }
)
rich_console = Console(theme=themes)


def _create_padded_panel(title, content, border_style="panel", style="content"):
    """Function for creating a panel with a title and content."""

    return Panel(
        content,
        title=title,
        border_style=border_style,
        style=style,
        title_align="left",
        padding=(1, 2),
        expand=False,
    )


def _format_error_output(err):
    """Function for formatting an error output."""

    return f"{type(err)}: {err}\n\n{traceback.format_exc()}"


def pprint(message, style="content"):
    """Function for printing a message through the rich console."""

    rich_console.print(message, style=style)


def print_success(message):
    """Printing a success message."""

    rich_console.print(message, style="success")


def print_fail(message):
    """Printing a fail message."""

    rich_console.print(message, style="error")


def print_error(message):
    """Printing an error message."""

    rich_console.print("[bold underline]ERROR:[/] " + message, style="error")


def print_warning(message):
    """Printing an warning message."""

    rich_console.print("[bold underline]WARNING:[/] " + message, style="warning")


def print_info(message):
    """Printing an info message."""

    rich_console.print(message, style="info")


def print_error_panel(title, content):
    """Printing an error panel."""

    panel = _create_padded_panel(title, content, border_style="error", style="warning")
    rich_console.print(panel)


def print_exception_info(err_msg, err):
    """Printing an exception log with traceback."""

    err_content = _format_error_output(err)
    print_error_panel(err_msg, err_content)


def print_command(command, message):
    """Printing a command message with specified command and message."""

    rich_console.print(f"[command]{command}:[/]\n'{message}'\n")


def print_info_panel(title, content):
    """Function for printing an info panel."""

    panel = _create_padded_panel(title, content)
    rich_console.print(panel)


def print_header(text):
    """Prints a header type text."""

    separator = "-" * 10
    rich_console.print(f"\n{separator} {text} {separator}\n", style="header")


def print_title(title):
    """Prints a title type text."""

    separator = "=" * 30
    rich_console.print(f"\n{separator} {title} {separator}\n", style="title")


def print_table(column_names, rows, title=None):
    """Function for printing and creating a table."""

    table = Table(title=title)

    for column_name in column_names:
        table.add_column(column_name)

    for row in rows:
        # Rows that contain binary string should be converted to a normal string.
        # Rows that contain None should be converted to "None".
        # Rows that contain empty string should be converted to "Empty"
        # Rows that contain decimals/floats should be converted to strings.
        row = [
            str(item, "utf-8")
            if isinstance(item, bytes)
            else "None"
            if item is None or item == ""
            else str(item)
            for item in row
        ]
        table.add_row(*row)

    rich_console.print(table)


def print_command_list(command_list):
    """Function for printing a command list."""

    command_print_style = "white"

    # Print the command usages with prettyprinter and style
    pprint("[bold underline]Commands:[/]", style=command_print_style)
    for command, (arguments, description) in command_list.items():
        print("")
        pprint(
            f"[bold]'{command}'[/] {arguments}\n{description}",
            style=command_print_style,
        )

    print("")


def get_general_user_input(prompt):
    """Function for getting general user input."""

    print("")
    pprint(prompt)
    user_input = input(">> ").strip()
    print("")

    return user_input


def parse_valid_bool_argument(argument):
    """Function for parsing a valid boolean argument"""

    argument = argument.lower().strip()
    if argument in ("on", "1", "true", "yes", "y"):
        return True
    elif argument in ("off", "0", "false", "no", "n"):
        return False
    else:
        return None


def get_yes_no_input(prompt):
    """Function for getting yes or no input from the user."""

    user_input = get_general_user_input(prompt + " (y/n)")
    return parse_valid_bool_argument(user_input)
