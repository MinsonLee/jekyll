# Jekyll + Github Page 搭建静态博客
FROM ubuntu:latest
# 作者：李明双-Wehcat:MinsonLee1994
MAINTAINER limingshuang MinsonLee1994

# 1. 替换镜像源为国内镜像源
# 2. 安装Ruby服务、RubyGems
# 3. 替换gem源
# 4. 更新gem
# 5. 安装Jekyll
# 6. 删除不必要扩展及文件目录
# 7. 创建 /blog 目录进行默认挂载博客
RUN sed -i 's/security.ubuntu/mirrors.aliyun/g' /etc/apt/sources.list \
    && sed -i 's/archive.ubuntu/mirrors.aliyun/g' /etc/apt/sources.list \
    && apt -y update && apt -y upgrade \
    && apt -y install gcc g++ make \
                   ruby ruby-dev \
    && gem sources --add https://mirrors.ustc.edu.cn/rubygems/ --remove https://rubygems.org/ \
    && gem install --no-document bundler jekyll \
    && mkdir /blog
#    && gem install --no-document redcarpet jekyll-paginate jekyll-sitemap \
#    && apt --no-cache add libatomic readline readline-dev libxml2 libxml2-dev \
#                          ncurses-terminfo-base ncurses-terminfo \
#                          libxslt libxslt-dev zlib-dev zlib \
#                          ruby ruby-dev yaml yaml-dev \
#                          libffi-dev build-base \
#                          ruby-io-console ruby-irb ruby-json ruby-rake \
#    && gem sources --add https://mirrors.ustc.edu.cn/rubygems/ --remove https://rubygems.org/ \
#    && gem install --no-document redcarpet kramdown maruku rdiscount RedCloth liquid pygments.rb \
#    && gem install --no-document sass safe_yaml \
#    && gem install --no-document bundler jekyll redcarpet jekyll-paginate jekyll-sitemap jekyll-feed jekyll-redirect-from \
#    && rm -rf /root/src /tmp/* /usr/share/man /var/cache/apt/* \
#    && apt del build-base zlib-dev ruby-dev readline-dev yaml-dev libffi-dev libxml2-dev \

# 暴露 4000 端口
EXPOSE 4000
# 设置工作目录
WORKDIR /blog

STOPSIGNAL SIGQUIT

ENTRYPOINT ["jekyll"]

