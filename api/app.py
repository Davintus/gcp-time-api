from flask import Flask  
from datetime import datetime  

app = Flask(__name__)  

@app.route('/current_time', methods=['GET'])  
def current_time():  
    now = datetime.utcnow()  
    return {"current_time": now.strftime("%Y-%m-%d %H:%M:%S")}, 200  

if __name__ == '__main__':  
    app.run(host='0.0.0.0', port=8080)