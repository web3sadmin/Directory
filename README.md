# Описание
Ruby 2.4.1
Rails 5.1.6
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

  
