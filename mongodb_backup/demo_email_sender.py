#!/usr/bin/env python3
"""Sending mail"""
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders
import os
import smtplib
import datetime
import glob
from datetime import datetime

PWD = os.getcwd()
Folder_Url = PWD+'/backups/'


filesname_list = []


def main():
    """
    This function is the main entry point of the program. It performs the tasks of
    sending emails, and logging information.
    """

    # ======================== Sending mail ===============================#

    mail_content = '''Hello, PFA file'''
    # The mail addresses and password
    sender_address = 'probeplus_mithra@outlook.com'
    sender_pass = 'Mithra@2023'
    receiver_address = 'ciril@probeplus.in'

    # Setup the MIME
    message = MIMEMultipart()
    message['From'] = sender_address
    message['To'] = receiver_address
    # The subject line
    message['Subject'] = 'ECGVue system Generated Mail'
    # The text for the mail body
    message.attach(MIMEText(mail_content, 'plain'))

    folders = ['audit_log', 'dumps', 'keycloak_postgres']

    for folder in folders:
        list_of_files = glob.glob(Folder_Url+folder+'/*')
        latest_file = max(list_of_files, key=os.path.getctime)
        latest_file = str(latest_file)
        split_str = latest_file.split("/")

        # Getting the file name from the list
        split_str.reverse()

        # The attachments for the mail body
        # Open the file as binary mode
        attach_file = open(Folder_Url+folder+'/'+split_str[0], 'rb')
        payload = MIMEBase('application', 'octate-stream')
        payload.set_payload((attach_file).read())
        encoders.encode_base64(payload)  # encode the attachment

        # add payload header with filename
        payload.add_header('Content-Disposition',
                           'attachment', filename=split_str[0])
        message.attach(payload)

        # for logs
        filesname_list.append(split_str[0])

    # Create SMTP session for sending the mail
    session = smtplib.SMTP('smtp.office365.com', 587)  # use gmail with port
    session.starttls()  # enable security
    # login with mail_id and password
    session.login(sender_address, sender_pass)
    text = message.as_string()
    session.sendmail(sender_address, receiver_address, text)
    session.quit()

    # ======================== Sending mail ===============================#

    # ======================== Logs ===============================#
    date = datetime.now()
    date = str(date)
    print('Mail Sent on ' + date + ' with below files')
    print(filesname_list)
    print("-------------------------------------------------------------------")

    # ======================== Logs ===============================#


if __name__ == '__main__':
    main()
