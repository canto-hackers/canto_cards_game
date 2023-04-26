IP="64.226.99.135"
HOST="root@$IP:/var/www/html"
flutter build web
scp -i id_rsa -r ./build/web $HOST