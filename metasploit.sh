#!/data/data/com.termux/files/usr/bin/bash
echo "##############################################"
echo " I  AM  DEVIL (Lokesh) , PLZ SUBSCRIBE MY CHANNEL"
echo "##############################################"

echo "WAIT UNTIL INSTALLING............" 

echo "####################################"
apt install autoconf bison clang coreutils curl findutils git apr apr-util libffi-dev libgmp-dev libpcap-dev postgresql-dev readline-dev libsqlite-dev openssl-dev libtool libxml2-dev libxslt-dev ncurses-dev pkg-config postgresql-contrib wget make ruby-dev libgrpc-dev ncurses-utils termux-tools -y
echo "####################################"
echo "Downloading & Extracting....."

cd $HOME
curl -L https://github.com/rapid7/metasploit-framework/archive/4.14.28.tar.gz | tar xz

mv $HOME/metasploit-framework-4.14.28 $HOME/metasploit-framework
cd $HOME/metasploit-framework
sed 's|git ls-files|find -type f|' -i metasploit-framework.gemspec
sed -i 's/grpc (1.3.4)/grpc (1.4.1)/g' Gemfile.lock

gem unpack network_interface -v 0.0.1
cd network_interface-0.0.1
sed 's|git ls-files|find -type f|' -i network_interface.gemspec
curl -L https://wiki.termux.com/images/6/6b/Netifaces.patch -o netifaces.patch
patch -p1 < netifaces.patch
gem build network_interface.gemspec
echo "network_interface is installing........"
gem install network_interface-0.0.1.gem
cd ..
rm -r network_interface-0.0.1
gem install bundler


gem install nokogiri -v 1.8.0 -- --use-system-libraries
 
gem unpack grpc -v 1.4.1
cd grpc-1.4.1
curl -LO https://raw.githubusercontent.com/grpc/grpc/v1.4.1/grpc.gemspec
curl -L https://wiki.termux.com/images/b/bf/Grpc_extconf.patch -o extconf.patch
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
