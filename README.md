
# Chrome headless zh-cn supported
> Forked from nlnwa/docker-chrome-headless

#### Changes:
* apt-get install language-pack-zh-hans fonts-droid-fallback ttf-wqy-zenhei ttf-wqy-microhei fonts-arphic-ukai fonts-arphic-uming
* Change CHROME_VERSION = 70.0.3538.9-1
* ENV LANG=zh_CN.UTF8
* ENV LANGUAGE=zh_CN:zh:en_US:en




> docker run -it --rm -p=0.0.0.0:9222:9222 --name=chrome-headless -e "CHROME_OPTS=--proxy-server=localhost:8080" -v /tmp/chromedata/:/data kinglf/docker-chrome-headless-cn




