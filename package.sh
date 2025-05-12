#!/bin/bash

# Проверяем, установлен ли linuxdeployqt
#if ! command -v linuxdeployqt &> /dev/null; then
#    echo "linuxdeployqt не найден. Устанавливаем..."
    
#    # Скачиваем linuxdeployqt
#    wget -c -nv "https://github.com/probonopd/linuxdeployqt/releases/download/continuous/linuxdeployqt-continuous-x86_64.AppImage"
#    chmod a+x linuxdeployqt-continuous-x86_64.AppImage
#    sudo mv linuxdeployqt-continuous-x86_64.AppImage /usr/local/bin/linuxdeployqt
#fi

# Проверяем аргументы
if [ "$#" -ne 1 ]; then
    echo "Использование: $0 <путь_к_бинарному_файлу>"
    exit 1
fi

BINARY_PATH="$1"
BINARY_NAME=$(basename "$BINARY_PATH")
APP_DIR="AppDir"

echo "Создаем структуру AppDir..."
rm -rf "$APP_DIR"
mkdir -p "$APP_DIR/usr/bin"
mkdir -p "$APP_DIR/usr/share/applications"
mkdir -p "$APP_DIR/usr/share/icons/hicolor/256x256/apps"

# Копируем бинарный файл
cp "$BINARY_PATH" "$APP_DIR/usr/bin/"

# Создаем .desktop файл
cat > "$APP_DIR/usr/share/applications/$BINARY_NAME.desktop" <<EOL
[Desktop Entry]
Type=Application
Name=My Test Application
Exec=$BINARY_NAME
Categories=Utility;
EOL

# Создаем временную иконку (можно заменить на реальную)
convert -size 256x256 xc:white "$APP_DIR/usr/share/icons/hicolor/256x256/apps/$BINARY_NAME.png"

echo "Запускаем linuxdeployqt..."
./squashfs-root/usr/bin/linuxdeployqt "$APP_DIR/usr/share/applications/$BINARY_NAME.desktop" -appimage -qmake=/opt/Qt5.15.2/bin/qmake -verbose=2

echo "Готово! AppImage создан в текущей директории."