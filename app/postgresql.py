#!/usr/bin/env python
import json
import psycopg2
from os import path
from time import sleep
from sys import stdout as out

if path.exists('/home/dotcloud/environment.json'):
    with open('/home/dotcloud/environment.json') as f:
        env = json.load(f)
else:
        env = {
        'DOTCLOUD_DB_SQL_LOGIN': 'root',
        'DOTCLOUD_DB_SQL_PASSWORD': 'root',
        'DOTCLOUD_DB_SQL_HOST': 'localhost',
        'DOTCLOUD_DB_SQL_PORT': '5432',
    }

dbname = "test"

out.write("Creating the database...")
out.flush()
for i in xrange(1,30):
    try:
        conn = psycopg2.connect(
                                user=env['DOTCLOUD_DB_SQL_LOGIN'],
                                password=env['DOTCLOUD_DB_SQL_PASSWORD'],
                                host=env['DOTCLOUD_DB_SQL_HOST'],
                                port=env['DOTCLOUD_DB_SQL_PORT'],
                                database='postgres')
        conn.set_isolation_level(0)
        cur = conn.cursor()
        cur.execute("CREATE DATABASE %s" % dbname)
        out.write("\n")
        break
    except Exception as e:
        raise e
        sleep(1)
        out.write(".")
        out.flush()

if __name__ == '__main__':
    import sys