import os
from flask import request, Flask

app = Flask(__name__)

@app.route('/execute')
def execute():
    # 🚨 Blatant Command Injection: taking user input directly into the OS
    user_cmd = request.args.get('cmd')
    os.system(user_cmd)
    return "Command executed!"
