
FROM cirrusci/flutter:latest AS build


WORKDIR /app


COPY . .


RUN flutter pub get


RUN flutter build web


FROM nginx:alpine


RUN rm -rf /usr/share/nginx/html/*


COPY --from=build /app/build/web /usr/share/nginx/html


EXPOSE 80


CMD ["nginx", "-g", "daemon off;"]
