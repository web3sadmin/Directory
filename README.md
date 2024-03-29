# Описание
Ruby 2.4.1
Rails 5.1.6
![image](https://user-images.githubusercontent.com/41944205/174310392-3c74d354-ac5c-4553-98c5-b06b33f9d71f.png)

Данное приложение представляет из себя справочник. Данные для справочника берутся из Active Directory.
Справочник позволяет имортировать пользователей из AD в свою БД, каждая запись может редактироваться по желанию.
Так же приложение отображает разницу в записях между БД и AD, что позваляет кадровой службе добавлять в справочник новых сотрудников, что будет видно системному администратору, и обладая полной информацией о пользователе позволяет без лишней волокиты добавлять пользователя в AD и видеть соответствия или не соответствия.

# Возможности
Приложение позволяет имортировать фото из AD
Позволяет импортировать все учетные записи или по отдельности
Позволяет создавать пользователей непостредственно в справочнике, что несколько упращает работу системного администратора, и избавляет от необходимости разработки бюракратической процедуры регистрации учетных данных пользователя в AD
Работает сортировка по полям.
Работает поиск по всем полям.

# Настройка
Приложение настроено на работу с MySQL но вы можете использовать любую другую БД на ваше усмотрение
Для настройки подключения к AD необходимо отредактировать файл /config/ldap.yml
Для настройки отправки почты /config/environments/development.rb
Для запуска в режиме daemon записать в puma.rb daemonize true

# INSTALL
* sudo yum install mysql-devel
* rbenv install -v 2.5.0
* rbenv rehash
* rbenv install -v 2.4.4
* rbenv rehash
* rbenv install -v 2.4.1
* rbenv rehash
* rbenv global 2.4.4
* rbenv global 2.5.0
* gem install rails
* rbenv rehash

* gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

* curl -sSL https://get.rvm.io | bash -s stable
* source /etc/profile.d/rvm.sh
* gem install rails
* cd app
* bundle install
* cd Directory
* rbenv global 2.4.1
* bundle exec rake db:reset db:setup db:migrate rails s 
