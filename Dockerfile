# Базовый образ для Jenkins
FROM jenkins/jenkins:lts

# Установка необходимых зависимостей
USER root
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip3 install selenium

# Установка Chrome и ChromeDriver
RUN apt-get install -y wget unzip && \
    wget https://dl.google.com/chrome/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt-get install -y ./google-chrome-stable_current_amd64.deb && \
    CHROME_VERSION=$(google-chrome --version | sed 's/.* \([0-9]*\.[0-9]*.[0-9]*\).*/\1/') && \
    wget https://chromedriver.storage.googleapis.com/$CHROME_VERSION/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip && \
    mv chromedriver /usr/bin/ && \
    chmod +x /usr/bin/chromedriver && \
    rm google-chrome-stable_current_amd64.deb chromedriver_linux64.zip

# Переключаемся обратно на пользователя Jenkin
USER jenkins

# Открываем порты для Jenkins и Selenium
EXPOSE 8080 4444

# Запуск Jenkins
CMD ["jenkins"]