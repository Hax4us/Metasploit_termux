#!/data/data/com.termux/files/usr/bin/bash

# Remove  Old Folder if exist 
find $HOME -name "metasploit*" -type d -exec rm -rf {} \;


cwd=$(pwd)
msfvar=4.17.40
msfpath='/data/data/com.termux/files/home'

apt update
apt install -y autoconf bison clang coreutils curl findutils git apr apr-util libffi-dev libgmp-dev libpcap-dev postgresql-dev readline-dev libsqlite-dev openssl-dev libtool libxml2-dev libxslt-dev ncurses-dev pkg-config wget make ruby-dev libgrpc-dev termux-tools ncurses-utils ncurses unzip zip tar postgresql termux-elf-cleaner
# Many phones are claiming libxml2 not found error
ln -sf $PREFIX/include/libxml2/libxml $PREFIX/include/

cd $msfpath
curl -LO https://github.com/rapid7/metasploit-framework/archive/$msfvar.tar.gz

tar -xf $msfpath/$msfvar.tar.gz
mv $msfpath/metasploit-framework-$msfvar $msfpath/metasploit-framework
cd $msfpath/metasploit-framework
sed '/rbnacl/d' -i Gemfile.lock
sed '/rbnacl/d' -i metasploit-framework.gemspec
gem install bundler

isNokogiri=$(gem list nokogiri -i)

sed 's|nokogiri (1.*)|nokogiri (1.8.0)|g' -i Gemfile.lock

if [ $isNokogiri == "false" ];
then
      gem install nokogiri -v '1.8.0' -- --use-system-libraries
else
	echo "nokogiri already installed"
fi

cd $msfpath/metasploit-framework
gem update --system
bundle install -j5

echo "Gems installed"
$PREFIX/bin/find -type f -executable -exec termux-fix-shebang \{\} \;
rm ./modules/auxiliary/gather/http_pdf_authors.rb

#ln -sf $msfpath/metasploit-framework/msfconsole /data/data/com.termux/files/usr/bin/
#ln -sf $msfpath/metasploit-framework/msfvenom /data/data/com.termux/files/usr/bin/

termux-elf-cleaner /data/data/com.termux/files/usr/lib/ruby/gems/2.6.0/gems/pg-0.20.0/lib/pg_ext.so
echo "Creating database"

cd $msfpath/metasploit-framework/config

curl -LO https://raw.githubusercontent.com/Hax4us/Metasploit_termux/master/database.yml


mkdir -p $PREFIX/var/lib/postgresql
initdb $PREFIX/var/lib/postgresql

pg_ctl -D $PREFIX/var/lib/postgresql start
createuser msf
createdb msf_database

rm $msfpath/$msfvar.tar.gz

cd ${PREFIX}/bin && curl -LO https://hax4us.github.io/files/msfconsole && chmod +x msfconsole
ln -sf $(which msfconsole) $PREFIX/bin/msfvenom

echo "you can directly use msfvenom or msfconsole rather than ./msfvenom or ./msfconsole."
