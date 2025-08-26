import configparser
import os
from pathlib import Path

class config:
    @staticmethod
    def load_properties(sep='=', comment_char='#'):
        # Dynamically determine the project root directory
        project_dir = Path(__file__).resolve().parent.parent

        # Construct the file path for credentials.properties
        filepath = project_dir / 'resources' / 'variables' / 'credentials.properties'

        props = {}
        with open(filepath, "rt") as f:
            for line in f:
                l = line.strip()
                if l and not l.startswith('#'):  # Use the provided comment_char
                    key_value = l.split('=', maxsplit=1)  # Use the provided separator
                    key = key_value[0].strip()
                    value = key_value[1].strip()
                    props[key] = value 
                    
        return props

