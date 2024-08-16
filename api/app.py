from flask import Flask, jsonify  
from datetime import datetime  

app = Flask(__name__)  

@app.route('/time', methods=['GET'])  
def get_time():  
    now = datetime.utcnow()  
    return jsonify({'current_time': now.isoformat() + 'Z'})  

if __name__ == '__main__':  
    app.run(host='0.0.0.0', port=8080)