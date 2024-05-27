# Використовуємо базовий образ Nginx
FROM nginx:latest

# Копіюємо локальні файли в образ
COPY ./index.html /usr/share/nginx/html
COPY ./50x.html /usr/share/nginx/html
COPY ./index_files /usr/share/nginx/html
# Відкриваємо порт 80
EXPOSE 80

# Запускаємо Nginx
CMD ["nginx", "-g", "daemon off;"]

