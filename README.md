# Sprawozdanie numer 2

## Zadanie 4Z3

### 2
Aby zbudować obraz wykonałem polecenie: ```docker build -t lab4docker .```

### 3
Niestety nie udało mi się utworzyć wolumenu w taki sposób aby miejsce przechowywania danych znajdowało sie na systemie macierzystym na systemie Windows, dlatego stworzyłem wolumen o nazwie ```LocalVol``` lokalnie na maszynie wirtualnej.
Aby stworzyć wolumen lokalnie wykonałem następujące polecenie: ```docker volume create LocalVol```

### 4
Aby uruchomić kontener o nazwie alpine4 na bazie zbudowanego obrazu lab4docker i podłączyć do niego utworzony lokalnie wolumen LocalVol w miejsce katalogu /logi w systemie plików kontenera i ograniczyć ilość wykorzystywanej pamięci RAM do 512MB użyłem polecenia:
```docker run -it --name alpine4 --memory=512m --mount source=LocalVol,target=/logi lab4docker```

### 5
Aby potwierdzić, że skrypt pluto.sh generuje wymagane dane i umieszcza je w pliku info.log na wolumenie wykonałem nastepujące polecenie:
```docker volume inspect LocalVol```
Następnie skopiowałem ścieżkę montowania którą otrzymałem przez wykonanie powyższej komendy i wykonałem polecenie wykorzystując skopiowaną ścieżkę dopisując do niej plik info.log:
```cat /var/lib/docker/volumes/LocalVol/_data/info.log```
Po wykonaniu tego polecenia została wyświetlona zawartość pliku info.log.

Aby sprawdzić czy plik znajduje się w katalogu /logi dodałem do skryptu pluto.sh następującą linijkę ```echo $(cat /logi/info.log)``` Następnie buduję obraz i kontener przy wykorzystaniu poleceń podanych wyżej i jako wynik na konsoli otrzymuję zawartość pliku info.log co dowodzi że plik o takiej ścieżce istnieje.

Aby potwierdzić, że kontener alpine4 ma ograniczoną ilość pamięci RAM wykonałem polecenie ```docker inspect alpine4```
Jedną ze zwróconych linijek była linijka: "Memory": 536870912 co po podzieleniu tej wartości dwa razy przez 1024 dało 512MB co potwierdza założenia zadania.
