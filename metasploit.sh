#!/data/data/com.termux/files/usr/bin/bash
echo "##############################################"
echo " I  AM  DEVIL (Lokesh) , PLZ SUBSCRIBE MY CHANNEL"
echo "##############################################"

echo "WAIT UNTIL INSTALLING............" 

echo "####################################"
apt install -y autoconf bison clang coreutils curl findutils git apr apr-util libffi-dev libgmp-dev libpcap-dev postgresql-dev readline-dev libsqlite-dev openssl-dev libtool libxml2-dev libxslt-dev ncurses-dev pkg-config postgresql-contrib wget make ruby-dev libgrpc-dev termux-tools ncurses-utils ncurses unzip zip tar postgresql
echo "####################################"
apt update && apt upgrade
echo "Downloading & Extracting....."

cd $HOME
curl -LO https://github.com/rapid7/metasploit-framework/archive/4.16.4.tar.gz
tar -xf $HOME/4.16.4.tar.gz
mv $HOME/metasploit-framework-4.16.4 $HOME/metasploit-framework
rm $HOME/4.16.4.tar.gz
cd $HOME/metasploit-framework
sed '/rbnacl/d' -i Gemfile.lock
sed '/rbnacl/d' -i metasploit-framework.gemspec
gem install bundler
sed 's|nokogiri (1.*)|nokogiri (1.8.0)|g' -i Gemfile.lock

gem install nokogiri -v 1.8.0 -- --use-system-libraries
 
sed 's|grpc (.*|grpc (1.4.1)|g' -i $HOME/metasploit-framework/Gemfile.lock
gem unpack grpc -v 1.4.1
cd grpc-1.4.1
curl -LO https://raw.githubusercontent.com/grpc/grpc/v1.4.1/grpc.gemspec
curl -L https://raw.githubusercontent.com/Hax4us/Hax4us.github.io/master/extconf.patch
patch -p1 < extconf.patch
gem build grpc.gemspec
gem install grpc-1.4.1.gem
cd ..
rm -r grpc-1.4.1


cd $HOME/metasploit-framework
bundle install -j5
$PREFIX/bin/find -type f -executable -exec termux-fix-shebang \{\} \;
rm ./modules/auxiliary/gather/http_pdf_authors.rb
ln -s $HOME/metasploit-framework/msfconsole /data/data/com.termux/files/usr/bin/
echo "###############################"
echo "Thanx  To  Vishalbiswani"
echo "###############################"

echo "###############################################"
echo "Hello  I  Am  Devil  (Lokesh) ,  Subscribe  My  Channel  To  Motivate  My  Work"
echo "###############################################"
echo "###############################"
echo "For  More. Tricks. Visit  At  hax4us.com"
echo "###############################"
echo "####################################"
echo " NOW YOU CAN LAUNCH METASPLOIT BY JUST EXECUTE THE COMMAND :=> msfconsole"
echo "####################################"
