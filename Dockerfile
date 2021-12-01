FROM dart:2-sdk as builder
RUN git clone https://github.com/flutter/flutter.git -b stable /usr/local/share/flutter
RUN ln -s /usr/local/share/flutter/bin/flutter /usr/local/bin/flutter
RUN flutter config --no-analytics

WORKDIR /app
COPY . ./
RUN flutter pub get
RUN flutter build web --dart-define=env=prod --release

FROM nginx:stable-alpine
COPY --from=builder /app/build/web/. /usr/share/nginx/html
