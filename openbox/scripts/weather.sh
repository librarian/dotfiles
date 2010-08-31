#! /bin/sh
#
# Скрипт для выборки погоды при помощи скрипта weather.py и сохранения ее в 
# pipe-sctipt для меню OpenBox'а.
# v. 1.0.2
#
# ВНИМАНИЕ! Для работы скрипта нужен пакет elinks.
# Устанавливается командой "sudo apt-get install elinks".
#
# Changelog:
#
# 1. Добавлена обработка разрыва соединения с инетом.
# Теперь при разрыве соединения выводится инфа о последней
# полученной погоде.
# 2. 90% скрипта переписано для увеличения
# удобочитаемости облегчения настройки.
#  3. Убраны пути вида /home/user, заменены на ~/
# 4. Добавлены дополнительные данные.


# Переменные:

# Местоположение. Задается кодом. Для Москвы RSXX0063
LOC="RSXX0091"

# Путь к скриптам.
SCR_Path=~/.config/openbox/scripts

# Название pipe скрипта:
PIPE="tellmeweather.sh"

PATH=$SCR_Path/$PIPE

# Путь до elinks (мне кажется, можно использовать links, lynx, и пр. 
# Главное - если соединение есть прога должна возвращать 0,
# а если нет - не 0. =)
LINKS="/usr/bin/elinks"

# Проверка наличия соединения с xoap.weather.com
if ( $LINKS  xoap.weather.com >> /dev/null )
 then
 # Если соединение есть - качаем погоду и пишем в пайп-скрипт.

   # Сегодня:
   # День:
   # Кондиции (типа "Ясно", "Ураган"..)
   Condition_day_T=`$SCR_Path/weather.py --location=$LOC --datatype=CC --refetch`
   # Высокая температура
   Temp_day_H_T=`$SCR_Path/weather.py --location=$LOC --datatype=HT --refetch`
   # Низкая температура
   Temp_day_L_T=`$SCR_Path/weather.py --location=$LOC --datatype=LT --refetch`
   # Влажность
   Humidity_day_T=`$SCR_Path/weather.py --location=$LOC --datatype=HM --refetch`
   # Направление ветра
   Winddir_day_T=`$SCR_Path/weather.py --location=$LOC --datatype=WD --refetch`
   # Скорость ветра
   Windsp_day_T=`$SCR_Path/weather.py --location=$LOC --datatype=WS --refetch`
   # Ночь.
   Condition_night_T=`$SCR_Path/weather.py --location=$LOC --datatype=CC --night --refetch`
   Temp_night_H_T=`$SCR_Path/weather.py --location=$LOC --datatype=HT --night --refetch`
   Temp_night_L_T=`$SCR_Path/weather.py --location=$LOC --datatype=LT --night --refetch`
   Humidity_night_T=`$SCR_Path/weather.py --location=$LOC --datatype=HM --night --refetch`
   Winddir_night_T=`$SCR_Path/weather.py --location=$LOC --datatype=WD --night --refetch`
   Windsp_night_T=`$SCR_Path/weather.py --location=$LOC --datatype=WS --night --refetch`
   # Общее.
   # Ддавление (доступно только текущее)
   Press_T=`$SCR_Path/weather.py --location=$LOC --datatype=BR --refetch`
   # Рассвет
   Sunrice_T=`$SCR_Path/weather.py --location=$LOC --datatype=SR --refetch`
   # Закат
   Sunset_T=`$SCR_Path/weather.py --location=$LOC --datatype=SS --refetch`
   # Завтра:
   # День:
   Condition_day_Tm=`$SCR_Path/weather.py --location=$LOC --startday=1 --endday=1 --datatype=CC --refetch`
   Temp_day_H_Tm=`$SCR_Path/weather.py --location=$LOC --startday=1 --endday=1 --datatype=HT --refetch`
   Temp_day_L_Tm=`$SCR_Path/weather.py --location=$LOC --startday=1 --endday=1 --datatype=LT --refetch`
   Humidity_day_Tm=`$SCR_Path/weather.py --location=$LOC --startday=1 --endday=1 --datatype=HM --refetch`
   Winddir_day_Tm=`$SCR_Path/weather.py --location=$LOC --startday=1 --endday=1 --datatype=WD --refetch`
   Windsp_day_Tm=`$SCR_Path/weather.py --location=$LOC --startday=1 --endday=1 --datatype=WS --refetch`
   # Ночь.
   Condition_night_Tm=`$SCR_Path/weather.py --location=$LOC --startday=1 --endday=1 --datatype=CC --night --refetch`
   Temp_night_H_Tm=`$SCR_Path/weather.py --location=$LOC --startday=1 --endday=1 --datatype=HT --night --refetch`
   Temp_night_L_Tm=`$SCR_Path/weather.py --location=$LOC --startday=1 --endday=1 --datatype=LT --night --refetch`
   Humidity_night_Tm=`$SCR_Path/weather.py --location=$LOC --startday=1 --endday=1 --datatype=HM --night --refetch`
   Winddir_night_Tm=`$SCR_Path/weather.py --location=$LOC --startday=1 --endday=1 --datatype=WD --night --refetch`
   Windsp_night_Tm=`$SCR_Path/weather.py --location=$LOC --startday=1 --endday=1 --datatype=WS --night --refetch`   
   # Общее.
   # День недели.
   DOW_Tm=`$SCR_Path/weather.py --location=$LOC  --startday=1 --endday=1 --datatype=DW --refetch`
   Sunrice_Tm=`$SCR_Path/weather.py --location=$LOC --startday=1 --endday=1 --datatype=SR --refetch`
   Sunset_Tm=`$SCR_Path/weather.py --location=$LOC --startday=1 --endday=1 --datatype=SS --refetch`
    # Послезавтра:
   # День:
   Condition_day_DaTm=`$SCR_Path/weather.py --location=$LOC --startday=2 --endday=2 --datatype=CC --refetch`
   Temp_day_H_DaTm=`$SCR_Path/weather.py --location=$LOC --startday=2 --endday=2 --datatype=HT --refetch`
   Temp_day_L_DaTm=`$SCR_Path/weather.py --location=$LOC --startday=2 --endday=2 --datatype=LT --refetch`
   Humidity_day_DaTm=`$SCR_Path/weather.py --location=$LOC --startday=2 --endday=2 --datatype=HM --refetch`
   Winddir_day_DaTm=`$SCR_Path/weather.py --location=$LOC --startday=2 --endday=2 --datatype=WD --refetch`
   Windsp_day_DaTm=`$SCR_Path/weather.py --location=$LOC --startday=2 --endday=2 --datatype=WS --refetch`
   # Ночь.
   Condition_night_DaTm=`$SCR_Path/weather.py --location=$LOC --startday=2 --endday=2 --datatype=CC --night --refetch`
   Temp_night_H_DaTm=`$SCR_Path/weather.py --location=$LOC --startday=2 --endday=2 --datatype=HT --night --refetch`
   Temp_night_L_DaTm=`$SCR_Path/weather.py --location=$LOC --startday=2 --endday=2 --datatype=LT --night --refetch`
   Humidity_night_DaTm=`$SCR_Path/weather.py --location=$LOC --startday=2 --endday=2 --datatype=HM --night --refetch`
   Winddir_night_DaTm=`$SCR_Path/weather.py --location=$LOC --startday=2 --endday=2 --datatype=WD --night --refetch`
   Windsp_night_DaTm=`$SCR_Path/weather.py --location=$LOC --startday=2 --endday=2 --datatype=WS --night --refetch`   
   # Общее.
   DOW_DaTm=`$SCR_Path/weather.py --location=$LOC  --startday=2 --endday=2 --datatype=DW --refetch`
   Sunrice_DaTm=`$SCR_Path/weather.py --location=$LOC --startday=2 --endday=2 --datatype=SR --refetch`
   Sunset_DaTm=`$SCR_Path/weather.py --location=$LOC --startday=2 --endday=2 --datatype=SS --refetch`
   # Формируем строки для меню.
    # Сегодня:
    #
    Today_Str1=`echo "Сегодня"`
    Today_Str2=`echo "Рассвет: "$Sunrice_T", закат "$Sunset_T`
    Today_Str3=`echo "Днем: "$Condition_day_T`
    Today_Str4=`echo "Температура: "$Temp_day_H_T - $Temp_day_L_T`
    Today_Str5=`echo "Влажность: "$Humidity_day_T`
    Today_Str6=`echo "Давление: "$Press_T`
    Today_Str7=`echo "Ветер: "$Winddir_day_T", скорость "$Windsp_day_T`
    Today_Str8=`echo "Ночью: "$Condition_night_T`
    Today_Str9=`echo "Температура: "$Temp_night_H_T - $Temp_night_L_T`
    Today_Str10=`echo "Влажность: "$Humidity_night_T`
    Today_Str11=`echo "Ветер: "$Winddir_night_T", скорость "$Windsp_night_T`
    # Завтра:
    Tomorrow_Str1=`echo $DOW_Tm`
    Tomorrow_Str2=`echo "Рассвет:"$Sunrice_Tm", закат "$Sunset_Tm`
    Tomorrow_Str3=`echo "Днем: "$Condition_day_Tm`
    Tomorrow_Str4=`echo "Температура: "$Temp_day_H_Tm - $Temp_day_L_Tm`
    Tomorrow_Str5=`echo "Влажность: "$Humidity_day_Tm`
    Tomorrow_Str6=`echo "Ветер: "$Winddir_day_Tm", скорость "$Windsp_day_Tm`
    Tomorrow_Str7=`echo "Ночью: "$Condition_night_Tm`
    Tomorrow_Str8=`echo "Температура: "$Temp_night_H_Tm - $Temp_night_L_Tm`
    Tomorrow_Str9=`echo "Влажность: "$Humidity_night_Tm`
    Tomorrow_Str10=`echo "Ветер: "$Winddir_night_Tm", скорость "$Windsp_night_Tm`
    # Послезавтра:
    DayAfterTomorrow_Str1=`echo $DOW_DaTm`
    DayAfterTomorrow_Str2=`echo "Рассвет: "$Sunrice_DaTm", закат"$Sunset_DaTm`
    DayAfterTomorrow_Str3=`echo "Днем: "$Condition_day_DaTm`
    DayAfterTomorrow_Str4=`echo "Температура: "$Temp_day_H_DaTm - $Temp_day_L_DaTm`
    DayAfterTomorrow_Str5=`echo "Влажность: "$Humidity_day_DaTm`
    DayAfterTomorrow_Str6=`echo "Ветер: "$Winddir_day_DaTm", скорость "$Windsp_day_DaTm`
    DayAfterTomorrow_Str7=`echo "Ночью: "$Condition_night_DaTm`
    DayAfterTomorrow_Str8=`echo "Температура: "$Temp_night_H_DaTm - $Temp_night_L_DaTm`
    DayAfterTomorrow_Str9=`echo "Влажность: "$Humidity_night_DaTm`
    DayAfterTomorrow_Str10=`echo "Ветер: "$Winddir_night_DaTm", скорость "$Windsp_night_DaTm`
    # Дата/время создания файла.
    BuildDate=`/bin/date`

    # Пишем скрипт для пайп-меню:
      echo "#! /bin/sh" > $PATH
      echo "#" >> $PATH
      echo "str1="\"$Today_Str1\" >> $PATH
      echo "str2="\"$Today_Str2\" >> $PATH
      echo "str3="\"$Today_Str3\" >> $PATH
      echo "str4="\"$Today_Str4\" >> $PATH
      echo "str5="\"$Today_Str5\" >> $PATH
      echo "str6="\"$Today_Str6\" >> $PATH
      echo "str7="\"$Today_Str7\" >> $PATH
      echo "str8="\"$Today_Str8\" >> $PATH
      echo "str9="\"$Today_Str9\" >> $PATH
      echo "str10="\"$Today_Str10\" >> $PATH
      echo "str11="\"$Today_Str11\" >> $PATH
      echo "str12="\"$Tomorrow_Str1\" >> $PATH
      echo "str13="\"$Tomorrow_Str2\" >> $PATH
      echo "str14="\"$Tomorrow_Str3\" >> $PATH
      echo "str15="\"$Tomorrow_Str4\" >> $PATH
      echo "str16="\"$Tomorrow_Str5\" >> $PATH
      echo "str17="\"$Tomorrow_Str6\" >> $PATH
      echo "str18="\"$Tomorrow_Str7\" >> $PATH
      echo "str19="\"$Tomorrow_Str8\" >> $PATH
      echo "str20="\"$Tomorrow_Str9\" >> $PATH
      echo "str21="\"$Tomorrow_Str10\" >> $PATH
      echo "str22="\"$DayAfterTomorrow_Str1\" >> $PATH
      echo "str23="\"$DayAfterTomorrow_Str2\" >> $PATH
      echo "str24="\"$DayAfterTomorrow_Str3\" >> $PATH
      echo "str25="\"$DayAfterTomorrow_Str4\" >> $PATH
      echo "str26="\"$DayAfterTomorrow_Str5\" >> $PATH
      echo "str27="\"$DayAfterTomorrow_Str6\" >> $PATH
      echo "str28="\"$DayAfterTomorrow_Str7\" >> $PATH
      echo "str29="\"$DayAfterTomorrow_Str8\" >> $PATH
      echo "str30="\"$DayAfterTomorrow_Str9\" >> $PATH
      echo "str31="\"$DayAfterTomorrow_Str10\" >> $PATH
      echo "str32="\"$BuildDate\" >> $PATH

      echo "echo \"<openbox_pipe_menu>\" " >> $PATH
      echo 'echo "<menu id=\"today\" label="\"$str1\"">"' >> $PATH
      echo 'echo "<item label="\"$str2\""/>"' >> $PATH
      echo 'echo "<separator label="\"$str3\""/>"' >> $PATH
      echo 'echo "<item label="\"$str4\""/>"' >> $PATH
      echo 'echo "<item label="\"$str5\""/>"' >> $PATH
      echo 'echo "<item label="\"$str6\""/>"' >> $PATH
      echo 'echo "<item label="\"$str7\""/>"' >> $PATH
      echo 'echo "<separator label="\"$str8\""/>"' >> $PATH
      echo 'echo "<item label="\"$str9\""/>"' >> $PATH
      echo 'echo "<item label="\"$str10\""/>"' >> $PATH
      echo 'echo "<item label="\"$str11\""/>"' >> $PATH
      echo 'echo "</menu>"' >> $PATH
      echo 'echo "<menu id=\"tommor\" label="\"$str12\"">"' >> $PATH
      echo 'echo "<item label="\"$str13\""/>"' >> $PATH
      echo 'echo "<separator label="\"$str14\""/>"' >> $PATH
      echo 'echo "<item label="\"$str15\""/>"' >> $PATH
      echo 'echo "<item label="\"$str16\""/>"' >> $PATH
      echo 'echo "<item label="\"$str17\""/>"' >> $PATH
      echo 'echo "<separator label="\"$str18\""/>"' >> $PATH
      echo 'echo "<item label="\"$str19\""/>"' >> $PATH
      echo 'echo "<item label="\"$str20\""/>"' >> $PATH
      echo 'echo "<item label="\"$str21\""/>"' >> $PATH
      echo 'echo "</menu>"' >> $PATH
      echo 'echo "<menu id=\"datommor\" label="\"$str22\"">"' >> $PATH
      echo 'echo "<item label="\"$str23\""/>"' >> $PATH
      echo 'echo "<separator label="\"$str24\""/>"' >> $PATH
      echo 'echo "<item label="\"$str25\""/>"' >> $PATH
      echo 'echo "<item label="\"$str26\""/>"' >> $PATH
      echo 'echo "<item label="\"$str27\""/>"' >> $PATH
      echo 'echo "<separator label="\"$str28\""/>"' >> $PATH
      echo 'echo "<item label="\"$str29\""/>"' >> $PATH
      echo 'echo "<item label="\"$str30\""/>"' >> $PATH
      echo 'echo "<item label="\"$str31\""/>"' >> $PATH
      echo 'echo "</menu>"' >> $PATH
      echo "echo \"</openbox_pipe_menu>\"" >> $PATH

 else
 # Если соединения нет - читаем скрипт, созданный в прошлый раз.

    param1=`/bin/cat $PATH | /bin/grep str1=`
    param2=`/bin/cat $PATH | /bin/grep str2=`
    param3=`/bin/cat $PATH | /bin/grep str3=`
    param4=`/bin/cat $PATH | /bin/grep str4=`
    param5=`/bin/cat $PATH | /bin/grep str5=`
    param6=`/bin/cat $PATH | /bin/grep str6=`
    param7=`/bin/cat $PATH | /bin/grep str7=`
    param8=`/bin/cat $PATH | /bin/grep str8=`
    param9=`/bin/cat $PATH | /bin/grep str9=`
    param10=`/bin/cat $PATH | /bin/grep str10=`
    param11=`/bin/cat $PATH | /bin/grep str11=`
    param12=`/bin/cat $PATH | /bin/grep str12=`
    param13=`/bin/cat $PATH | /bin/grep str13=`
    param14=`/bin/cat $PATH | /bin/grep str14=`
    param15=`/bin/cat $PATH | /bin/grep str15=`
    param16=`/bin/cat $PATH | /bin/grep str16=`
    param17=`/bin/cat $PATH | /bin/grep str17=`
    param18=`/bin/cat $PATH | /bin/grep str18=`
    param19=`/bin/cat $PATH | /bin/grep str19=`
    param20=`/bin/cat $PATH | /bin/grep str20=`
    param21=`/bin/cat $PATH | /bin/grep str21=`
    param22=`/bin/cat $PATH | /bin/grep str22=`
    param23=`/bin/cat $PATH | /bin/grep str23=`
    param24=`/bin/cat $PATH | /bin/grep str24=`
    param25=`/bin/cat $PATH | /bin/grep str25=`
    param26=`/bin/cat $PATH | /bin/grep str26=`
    param27=`/bin/cat $PATH | /bin/grep str27=`
    param28=`/bin/cat $PATH | /bin/grep str28=`
    param29=`/bin/cat $PATH | /bin/grep str29=`
    param30=`/bin/cat $PATH | /bin/grep str30=`
    param31=`/bin/cat $PATH | /bin/grep str31=`
    param32=`/bin/cat $PATH | /bin/grep str32=`
    Explain_1='expl1="Сервис недоступен,"'
    Explain_2='expl2="последнее обновление от:"'

    # И пишем в него инфу о том, что 
    # обновить его не удалось...
      echo "#! /bin/sh" > $PATH
      echo "#" >> $PATH
      echo $Explain_1 >> $PATH
      echo $Explain_2 >> $PATH
      echo $param32 >> $PATH
      echo $param1 >> $PATH
      echo $param2 >> $PATH
      echo $param3 >> $PATH
      echo $param4 >> $PATH
      echo $param5 >> $PATH
      echo $param6 >> $PATH
      echo $param7 >> $PATH
      echo $param8 >> $PATH
      echo $param9 >> $PATH
      echo $param10 >> $PATH
      echo $param11 >> $PATH
      echo $param12 >> $PATH
      echo $param13 >> $PATH
      echo $param14 >> $PATH
      echo $param15 >> $PATH
      echo $param16 >> $PATH
      echo $param17 >> $PATH
      echo $param18 >> $PATH
      echo $param19 >> $PATH
      echo $param20 >> $PATH
      echo $param21 >> $PATH
      echo $param22 >> $PATH
      echo $param23 >> $PATH
      echo $param24 >> $PATH
      echo $param25 >> $PATH
      echo $param26 >> $PATH
      echo $param27 >> $PATH
      echo $param28 >> $PATH
      echo $param29 >> $PATH
      echo $param30 >> $PATH
      echo $param31 >> $PATH
      echo "echo \"<openbox_pipe_menu>\" " >> $PATH
      echo 'echo "<item label="\"$expl1\""/>"' >> $PATH
      echo 'echo "<item label="\"$expl2\""/>"' >> $PATH
      echo 'echo "<item label="\"$str32\""/>"' >> $PATH
      echo "echo \"<separator />\"" >> $PATH
      echo 'echo "<menu id=\"today\" label="\"$str1\"">"' >> $PATH
      echo 'echo "<item label="\"$str2\""/>"' >> $PATH
      echo 'echo "<separator label="\"$str3\""/>"' >> $PATH
      echo 'echo "<item label="\"$str4\""/>"' >> $PATH
      echo 'echo "<item label="\"$str5\""/>"' >> $PATH
      echo 'echo "<item label="\"$str6\""/>"' >> $PATH
      echo 'echo "<item label="\"$str7\""/>"' >> $PATH
      echo 'echo "<separator label="\"$str8\""/>"' >> $PATH
      echo 'echo "<item label="\"$str9\""/>"' >> $PATH
      echo 'echo "<item label="\"$str10\""/>"' >> $PATH
      echo 'echo "<item label="\"$str11\""/>"' >> $PATH
      echo 'echo "</menu>"' >> $PATH
      echo 'echo "<menu id=\"tommor\" label="\"$str12\"">"' >> $PATH
      echo 'echo "<item label="\"$str13\""/>"' >> $PATH
      echo 'echo "<separator label="\"$str14\""/>"' >> $PATH
      echo 'echo "<item label="\"$str15\""/>"' >> $PATH
      echo 'echo "<item label="\"$str16\""/>"' >> $PATH
      echo 'echo "<item label="\"$str17\""/>"' >> $PATH
      echo 'echo "<separator label="\"$str18\""/>"' >> $PATH
      echo 'echo "<item label="\"$str19\""/>"' >> $PATH
      echo 'echo "<item label="\"$str20\""/>"' >> $PATH
      echo 'echo "<item label="\"$str21\""/>"' >> $PATH
      echo 'echo "</menu>"' >> $PATH
      echo 'echo "<menu id=\"datommor\" label="\"$str22\"">"' >> $PATH
      echo 'echo "<item label="\"$str23\""/>"' >> $PATH
      echo 'echo "<separator label="\"$str24\""/>"' >> $PATH
      echo 'echo "<item label="\"$str25\""/>"' >> $PATH
      echo 'echo "<item label="\"$str26\""/>"' >> $PATH
      echo 'echo "<item label="\"$str27\""/>"' >> $PATH
      echo 'echo "<separator label="\"$str28\""/>"' >> $PATH
      echo 'echo "<item label="\"$str29\""/>"' >> $PATH
      echo 'echo "<item label="\"$str30\""/>"' >> $PATH
      echo 'echo "<item label="\"$str31\""/>"' >> $PATH
      echo 'echo "</menu>"' >> $PATH
      echo "echo \"</openbox_pipe_menu>\"" >> $PATH
fi
exit 0
