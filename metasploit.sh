#!/data/data/com.termux/files/usr/bin/bash
echo "##############################################"
echo " I  AM  DEVIL (Lokesh) , PLZ SUBSCRIBE MY CHANNEL"
echo "##############################################"

echo "WAIT UNTIL INSTALLING............" 

echo "####################################"
apt install autoconf bison clang coreutils curl findutils git apr apr-util libffi-dev libgmp-dev libpcap-dev postgresql-dev readline-dev libsqlite-dev openssl-dev libtool libxml2-dev libxslt-dev ncurses-dev pkg-config postgresql-contrib wget make ruby-dev libgrpc-dev ncurses-utils termux-tools -y
echo "####################################"
echo "Downloading & Extracting....."

curl -L https://github.com/rapid7/metasploit-framework/archive/4.16.2.tar.gz | tar xz

cd metasploit-framework-4.16.2

sed 's|git ls-files|find -type f|' -i metasploit-framework.gemspec

sed -i 's/grpc (1.3.4)/grpc (1.4.1)/g' Gemfile.lock
sed -i 's/grpc (0.0.1)/grpc (0.0.2)/g' Gemfile.lock
sed '/rbnacl/d' -i Gemfile.lock
sed '/rbnacl/d' -i metasploit-framework.gemspec
echo "\n"

#Install bundler
echo "Bundler is installing"
gem install bundler
#Install nokogiri
echo "nokogiri is installing......"
gem install nokogiri -- --use-system-libraries
#Install gems
gem unpack grpc -v 1.4.1
cd grpc-1.4.1
curl -LO https://raw.githubusercontent.com/grpc/grpc/v1.4.1/grpc.gemspec
curl -L https://wiki.termux.com/images/b/bf/Grpc_extconf.patch -o extconf.patch
patch -p1 < extconf.patch
gem build grpc.gemspec
echo "grpc is installing"
gem install grpc-1.4.1.gem
cd ..
rm -r grpc-1.4.1

#Bundle Install
echo "bundle and all other dependencies are installing......"
bundle install -j5

#Fixing Shebang
$PREFIX/bin/find -type f -executable -exec termux-fix-shebang \{\} \;

cd metasploit-framework-4.16.2

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
echo " NOW YOU CAN LAUNCH METASPLOIT BY JUST EXECUTE THE COMMAND :=>  ./msfconsole"
echo "####################################"
exec bash
