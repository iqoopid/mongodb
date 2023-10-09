"""Module to compress and store expired log files"""
import os
import re

PWD = os.getcwd()


def main():
    """main function"""
    try:
        # Get a list of all files in the folder

        parent_dir = PWD+'/backups'
        folder_path = os.path.join(parent_dir, folder)
        files = os.listdir(folder_path)

        # Filter files with the specified filename pattern
        filtered_files = [
            file for file in files if re.search(r"(\d{14})", file)]

        filtered_files = [file for file in filtered_files if os.path.isfile(
            os.path.join(folder_path, file))]

        # Sort the files based on their names (assuming the filenames have timestamp information)
        sorted_files = sorted(filtered_files, reverse=True)

        # Keep the latest 3 files and delete the rest
        files_to_keep = sorted_files[:3]
        files_to_delete = sorted_files[3:]

        for file in files_to_delete:
            file_path = os.path.join(folder_path, file)
            os.remove(file_path)
            print(f"Deleted: {file_path}")

        print("Kept files:", files_to_keep)

    except Exception as exc:
        print("Error:", exc)


if __name__ == "__main__":

    threshold = 3
    # Directory path where the files are located
    folder = 'dumps'
    main()

    folder = 'audit_log'
    main()

    folder = 'keycloak_postgres'
    main()
