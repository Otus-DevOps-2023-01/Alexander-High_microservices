<<<<<<< HEAD
# Alexander-High_microservices
Alexander-High microservices repository
=====================================
#docker-2  
Запуск VM с установленным Docker Engine при помощи Docker Machine. Написание Dockerfile и сборка образа с тестовым приложением. Сохранение образа на DockerHub.
=====================================
Установил Docker
Запустил ВМ Docker в YandexCloud
Посмотрел разницу между образом и контейнером (в контейнере много информации по составу ВМ. А так - оба файла key:value)
Сервисы mogodb и raddis запущены в локальном докер контейнере

=====================================
#docker-3  
Разбиение приложения на несколько микросервисов. Выбор базового образа. Подключение volume к контейнеру.
=====================================
Разделили приложение на несколько контейнеров
Запустили приложение с помощью созданных контейнеров
Оптимизируем сервис ui приложени
Используем volume раздел для сохранения данных в mongodb

=====================================
#docker-4  
Практика работы с основными типами Docker сетей. Декларативное описание Docker инфраструктуры при помощи Docker Compose.
=====================================
Установлен Docker-compose
Внесены изменения для множества сетей
Параметризирован порт, версии, сетевые настройки
Записано в .env + env.example

Используя настройку в разделе 
services:
  post_db:
    image: mongo:${DB_VERSION}
    container_name: mongodb_container  #  Позволяет задать имя контейнера
    hostname: mongodb_host             #  Позволяет задать имя хоста

====================================
#gitlab-ci-1  
Устройство Gitlab CI. Построение процесса непрерывной поставки 
=====================================
Клонируем приложение и вносим правки по заданию ДЗ
Добавляем динамическин окружения
Проводим тесты согласно ДЗ
Проверяем работу

====================================
#monitoring-1 
Введение в мониторинг. Системы мониторинга. 
=====================================
Изучил работу с Prometheus
Собрал докер образы для приложений
Запушил образы на DockerHub

docker image ls                                                            
REPOSITORY            TAG       IMAGE ID       CREATED          SIZE
alexhigh-comment      latest    2e9e61344d01   25 minutes ago   900MB
alexhigh-post         latest    3a0bd01089d7   27 minutes ago   924MB
alexhigh-ui           latest    0b43abc2f85f   29 minutes ago   481MB
alexhigh-prometheus   latest    047145a96c35   5 years ago      112MB

Очень неприятно удилен сильно тличающимся синтаксисом
 docker tag 2e9e61344d01 alexhigh/alexhigh-microservice:alexhigh-comment
 docker push alexhigh/alexhigh-microservice:alexhigh-comment

Ссылка на репозиторий: 
https://hub.docker.com/repository/docker/alexhigh/alexhigh-microservice/tags?page=1&ordering=last_updated

====================================
#logging-1 
Логирование приложений.
=====================================

Выполнил ДЗ согласно плану, ознакомился в общих чертах с ELK.
Выполнена утановка Fluentd
Пересобраны контейнеры
Сбор структурированных и неструктурированных логов
Распределенный трейсинг

====================================
#kubernetes-1
Введение в kubernetes
=====================================

подготовлены Deployment-манифесты для reddit-приложения
развернут k8s-кластер на двух нодах при помощи kubeadm
применены манифесты reddit-приложения в созданном кластере

====================================
#kubernetes-2
Kubernetes. Запуск кластера и приложения.Модель безопасности
=====================================

Развернул локальное окружение для работы с Kubernetes
Развернул Kubernetes в Yandex Cloud
Запустил reddit в Kubernetes

====================================
#kubernetes-3
Настройка балансировщиков нагрузки в Kubernetes и SSLTerminating.
=====================================

Получил основы работы с элементами окружения k8s
Ingress Controller
Ingress
Secret
TLS
LoadBalancer Service
Network Policies
PersistentVolumes
PersistentVolumeClaims

====================================
#kubernetes-4
Создание Helm Chart’ов для компонент приложения, управление зависимостями Helm.
=====================================

Работа с Helm
Развертывание Gitlab в Kubernetes
Запуск CI/CD конвейера в Kubernetes