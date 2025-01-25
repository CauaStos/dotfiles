import os
import subprocess

def hex_color_split(hex_color_raw):
    hex_split = []
    for i in range(0, len(hex_color_raw), 2):
       hex_color = hex_color_raw[i:i+2]
       hex_split.append(hex_color)

    print(f"Split hex color: {hex_split}")
    return hex_split

def hex_to_rgb(hex):
    #the letters in hex range from A-F, valuing from 10 - 15
    #the hex 0 - 9 range from 0 - 9.
    #to convert a hexadecimal to an rgb value, you need to do the following:
    #
    # from right to left in the hexadecimal, the values are multiplied in an ascending order starting with 16⁰
    #
    # Example:
    #
    # HEXADECIMAL: #FAB
    # the first digit, A, is going to be multiplied by 16⁰
    # the second digit, F, is going to be multiplied by 16¹
    # the third digit, B, is going to be multiplied by 16²
    #
    # IMPORTANT!
    # --remember that any number raised to the power of 0 is 1
    # --remember that any number raised to the power of 1 is itself. (16¹ = 16)
    # --remember that jteh values are multiplied from RIGHT to LEFT
    #
    #
    #
    # B is valued at 11, so:
    # 11 * 1 = 11
    #
    # A is valued at 10, so:
    # 10 * 16 = 160
    #
    # F is valued at 15, so:
    # 15 * 256 = 3840
    #
    # F + A + B = result
    # 3840 + 160 + 11 = 4011
    #
    # The hexadecimal #FAB has the value of 4011
    #

    hex_letter_table = {
        'a': 10,
        'b': 11,
        'c': 12,
        'd': 13,
        'e': 14,
        'f': 15,
        'A': 10,
        'B': 11,
        'C': 12,
        'D': 13,
        'E': 14,
        'F': 15
    }

    inverse_counter = 0 # used to calculate the place value in hexadecimal
    rgb_value = 0

    for i in range(len(hex), 0, -1):
        hex_decimal_value = 0

        try:
            hex_decimal_value = int(hex[i-1:i])
        except ValueError:
            hex_decimal_value = hex_letter_table.get(hex[i-1:i])

        rgb_value+= hex_decimal_value * (16**(inverse_counter))
        inverse_counter+=1

    print(f"rgb_value for {hex}: {rgb_value}")
    return rgb_value

color_path = os.path.expanduser("~/Documents/Scripts/icon_color_input.txt")
cat_command = subprocess.run(["cat", color_path], capture_output=True, text=True)
hex_color_treated = cat_command.stdout.strip()
hex_color_split = hex_color_split(hex_color_treated) # pyright: ignore

input_color = tuple(hex_to_rgb(color) for color in hex_color_split) # Stores the converted input color RGB

# Define available colors for Papirus Folders
folder_colors = {
    "adwaita": (255, 255, 255),
    "black": (0, 0, 0),
    "blue": (0, 0, 255),
    "bluegrey": (96, 125, 139),
    "breeze": (255, 255, 200),
    "brown": (139, 69, 19),
    "carmine": (255, 0, 56),
    "cyan": (0, 255, 255),
    "darkcyan": (0, 139, 139),
    "deeporange": (255, 87, 34),
    "green": (0, 255, 0),
    "grey": (128, 128, 128),
    "indigo": (75, 0, 130),
    "magenta": (255, 0, 255),
    "nordic": (59, 66, 82),
    "orange": (255, 152, 0),
    "palebrown": (110, 76, 30),
    "paleorange": (255, 167, 38),
    "pink": (255, 128, 171),
    "red": (255, 0, 0),
    "teal": (0, 128, 128),
    "violet": (142, 36, 170),
    "white": (255, 255, 255),
    "yaru": (53, 152, 219),
    "yellow": (255, 255, 0),
}

for available_folder_color in folder_colors:
    print(f"Comparing input color {input_color} to {available_folder_color} ({folder_colors[available_folder_color]})")

    for rgb_value in input_color:
        print(rgb_value)
