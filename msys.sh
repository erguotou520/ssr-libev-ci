pacman -Syu
pacman -Su
# pacman -S git gcc make pcre-devel zlib-devel openssl-devel --noconfirm
pacman -S mingw64/mingw-w64-x86_64-gcc mingw64/mingw-w64-x86_64-pcre mingw64/mingw-w64-x86_64-zlib mingw64/mingw-w64-x86_64-openssl --noconfirm
git clone https://github.com/shadowsocksr-backup/shadowsocksr-libev.git
cd shadowsocksr-libev
./configure --prefix=$HOME/ss --with-openssl=$HOME/prebuilt --disable-documentation --enable-static
make && make install
