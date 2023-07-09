import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email import encoders
from email.mime.application import MIMEApplication

smtp_port = 587
smtp_server = "smtp.gmail.com"

email_from="atharvf14t@gmail.com"
email_to="atharvf14t@gmail.com"

pswd="xjefkjleuwagudsu"

subject = "New email from attachments"

workbook = openpyxl.load_workbook("example.xlsx")
worksheet = workbook.active

body=f"""
    Hi 
    line2
    line3
    ... heres the link for the same https://f1tv.formula1.com/page/1246/chasing-the-dream"""

msg= MIMEMultipart()
msg['From']=email_from
msg['To']=email_to
msg['Subject']=subject

msg.attach(MIMEText(body, 'plain'))

attachment_path="C:/Users/ATHARV SRIVASTAVA/Downloads/jan.pdf"

with open(attachment_path,"rb") as file:
    part=MIMEApplication(file.read(), Name="jan.pdf")
part["Content-Disposition"]='attachment; filename="jan.pdf"'
msg.attach(part)
text=msg.as_string()
server=smtplib.SMTP(smtp_server, smtp_port)
server.starttls()
server.login(email_from, pswd)
server.sendmail(email_from, email_to, text)
print("sent successfully")


# import openpyxl
# import smtplib
# import ssl
# smtp_port=587
# smtp_server="smtp.gmail.com"

# email_from="atharvf14t@gmail.com"
# email_to="atharvf14t@gmail.com"

# pswd="xjefkjleuwagudsu"
# message="dear god, please help me"

# simple_email_context=ssl.create_default_context()

# try:
#     server=smtplib.SMTP(smtp_server, smtp_port)
#     server.starttls(context=simple_email_context)
#     server.login(email_from, pswd)
#     server.sendmail(email_from, email_to, message)
#     print("sent successfully")
# except Exception as e:
#     print(e)
# finally:
#     server.quit()
# # Define email parameters
# subject = "Your subject here"
# body_template = "Dear {name},/n/nYour custom email body here."
# # Define SMTP server details
# smtp_server = "smtp.gmail.com"
# EMAIL_USE_SSL = True
# smtp_port = 587
# smtp_username = "atharvf14t@gmail.com"
# smtp_password = "atharv333"
# email="atharvf14t@gmail.com"
# # # Open the Excel workbook
# # workbook = openpyxl.load_workbook("/Users/ATHARV SRIVASTAVA/Downloads/example.xlsx")
# # worksheet = workbook.active

# # Iterate over rows in the worksheet
# # for row in worksheet.iter_rows(min_row=2, values_only=True):
# #     # Extract name and email address from the current row
# #     name, email = row
    
# #     # Generate the email body using the template and name
# #     body = body_template.format(name=name)
    
# #     # Create the email message
# message = f"Subject: {subject}/n/n{body}"
    
#     # Send the email using SMTP
# # context = ssl.create_default_context()
# server=smtplib.SMTP(smtp_server, smtp_port) 
# server.starttls()
# server.login(smtp_username, smtp_password)
# server.sendmail(smtp_username, email, message)
# print(f"Email sent to {email}")