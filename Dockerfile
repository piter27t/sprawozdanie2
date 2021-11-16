# Obraz bazowy
FROM alpine

# Imie i nazwisko studenta
LABEL author = "Piotr Tracz"

# Podlaczenie wolumenu
VOLUME ["/logi"]

# Folder roboczy
WORKDIR /usr/app

# Kopiowanie skryptu
COPY pluto.sh pluto.sh

ENTRYPOINT [ "./pluto.sh" ]
