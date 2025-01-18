#install docker fist before setting up your node app


git clone https://github.com/Peernetics-Ltd/loyalty-club.git

cd loyalty-club


apt install npm -y

npm i

cp .env.template .env 

nano .env
# Add this inside the .env file
DATABASE_URL=postgresql://postgres:password@database:5432/database

nano docker-compose.yml

nano Caddyfile

# run this to build the docker images
docker-compose up -d












# if needed






# run this inside the web container 
npx prisma db push

PORT=3000 npm run dev



# to check database (postgres)

docker exec -it peer-web3-postgres-1 bash

pg_dump -U postgres -d database -F c -f /var/backup/peer_web3_user.backup

psql -U postgres -d database


\l


\c database

\dt



mysqldump -u root -p autofixer > autofixer_backup.sql

scp root@140.82.13.150:/var/www/html/autofixer/autofixer_backup.sql /home/cloud/Desktop/autofixer_backup.sql
