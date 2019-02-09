# discount-catalog

### Установка:

```cd /usr/

git clone https://github.com/andrewkiko/discount-catalog.git

cp discount_catalog/misc/programms/apache/discounts.conf /etc/apache2/sites-enabled/

mysql < discount_catalog/misc/programms/mysql/mysql.sql
```

### Зависимости Perl:

```cpanm install Template```

```curl -L https://cpanmin.us | perl - -M https://cpan.metacpan.org -n Mercury```


### Запуск weboscket
```mercury broker -l http://[% IP %]:3000```

**[% IP %]** - адрес виртуалки куда будет подключаться ws