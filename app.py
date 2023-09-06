import os
from flask import Flask, render_template, request, redirect, url_for
from flask_mysqlb import MySQL

app = Flask(__name__)

# Configure MySQL from environment variables
app.config['MYSQL_HOST'] = os.environment.get('MYSQL_HOST')
app.config['MYSQL_USER'] = os.environment.get('MYSQL_USER')
app.config['MYSQL_PASSWORD'] = os.environment.get('MYSQL_PASSWORD')
app.config['MYSQL_DB'] = os.environment.get('MYSQL_DB')


# Initialize MySQL
@app.route('/')
def index():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM tasks')
    tasks = cur.fetchall()
    cur.close()
    return render_template('index.html', tasks=tasks)


@app.route('/add', methods=['POST'])
def add():
    new_task = request.form.get('new_task')
    cur = mysql.connection.cursor()
    cur.execute('INSERT INTO tasks (task) VALUES (%s)', [new_task])
    mysql.connection.commit()
    cur.close()
    return redirect(url_for('index'))


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
