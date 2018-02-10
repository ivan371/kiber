# coding: utf-8
from celery import task
import smtplib


@task(bind=True)
def send_mail(self, email, username, time=20):
    try:
        server = smtplib.SMTP("smtp.mail.ru", 587)
        server.starttls()
        server.login("kiber.2019@mail.ru", "__track__")
        server.sendmail("kiber.2019@mail.ru", email, """Hello, {}!. Thanks for registration""".format(username))
        server.close()
    except Exception as exc:
        time *= 2
        raise self.retry(exc=exc, countdown=time)