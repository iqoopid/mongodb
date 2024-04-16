#!/usr/bin/env python3
"""Backup DB"""
import os
import sys

PWD = os.getcwd()


def main():
    """The main function is responsible for executing the backup process of the database."""

    # ======================== Backup DB ===============================#

    bash_script_name = 'backup_mongo.sh'
    bash_script_path = f'{PWD}/{bash_script_name}'

    chmod = os.system(f'chmod +rwx {bash_script_path}')
    if chmod != 0:
        print(
            f"Error running chmod for script '{bash_script_name}'. Exit code: {chmod}")
        sys.exit(1)

    print("\n-------------------------------------------------------------------")
    print("chmod successful.")
    print("-------------------------------------------------------------------\n")

    exit_code = os.system(bash_script_path)
    if exit_code != 0:
        print(
            f"Error running Bash script '{bash_script_name}'. Exit code: {exit_code}")
        sys.exit(1)

    print("\n-------------------------------------------------------------------")
    print("DB backup successful.")
    print("-------------------------------------------------------------------\n")

    # ======================== Backup DB ===============================#


if __name__ == '__main__':
    main()
