import requests, json

url = "https://jsonplaceholder.typicode.com/comments"

def consumir(url):
    res = requests.get(url)
    valida(res)

def valida(request):
    for i in request.json():
        object_str = json.dumps(i)
        data = json.loads(object_str)
        email = data['email']
        context = "tlyn.org"
        if context in email:
            imprime(data)

def imprime(data):
    print(data)

if __name__ == '__main__':
    consumir(url)