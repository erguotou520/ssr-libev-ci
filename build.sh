mount c:/mingw /mingw
mingw-get upgrade "w32api<5.0.2"
autoreconf -f -i
cd openssl-1.0.2o
echo "Start configure openssl"
./config --prefix=$HOME/prebuilt --openssldir=$HOME/prebuilt/openssl
echo "Make openssl"
make && make install
cd ../pcre-8.42
echo "Start configure pcre"
./configure --prefix=/mingw --disable-shared --disable-cpp --enable-newline-is-anycrlf --enable-utf8 --enable-unicode -properties
echo "Make pcre"
make && make install
cd ../shadowsocksr-libev
echo "Start configure ssr"
./configure --prefix=$HOME/ss --with-openssl=$HOME/prebuilt --disable-documentation --enable-static
echo "Make ssr"
make && make install
curl -O https://gist.githubusercontent.com/stefanbuck/ce788fee19ab6eb0b4447a85fc99f447/raw/dbadd7d310ce8446de89c4ffdf1db0b400d0f6c3/upload-github-release-asset.sh
bash upload-github-release-asset.sh github_api_token=$GITHUB_TOKEN owner=erguotou520 repo=ssr-libev-ci tag=0.0.2 filename=~/ss/bin/ss-local.exe
