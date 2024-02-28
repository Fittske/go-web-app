# go-web-app
Незамысловатое приложение на GO, которое возвращает 200 ответ с текстом «Hello from Go!».

## Требования для локального запуска
* OS - Debian based / WSL
* Docker
* Minikube & Helm (optional)

### Клонирование удаленного репозитория
```
$ git clone https://github.com/Fittske/go-web-app.git
$ cd go-web-app
```

### Запуск приложения с помощью Docker
```
# Перед сборкой и запуском необходимо убедиться, что на локальной машине установлен Docker
$ docker --version
# Сборка
$ docker build -t go-web-app -f ./Docker/Dockerfile .
# Запуск
$ docker run -d -p 8000:8000 -it go-web-app
```
После запуска можно убедиться, что контейнеры запущены и прослушивают указанные в настройках порты:
```
$ docker ps
```
Также проверим, что HTTP-запрос GET к серверу возвращает статическое содержимое страницы:
```
$ curl localhost:8000

### Запуск приложения с помощью Helm и Minikube
```
# Перед запуском необходимо убедиться, что на локальной машине установлен Helm и Minikube
$ minikube version
$ helm version
# Запуск
$ minikube start
$ cd Deploy/Helm
$ helm upgrade --install go-web-app ./go-web-app
# Убедимся, что релиз успешно задеплоен
$ helm ls --all
$ kubectl get pods
# Настройка обратного прокси для доступа к сервису с локального компьютера
$ kubectl port-forward <pod name> 8000:8000
```
