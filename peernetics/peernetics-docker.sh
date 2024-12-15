git clone https://github.com/Peernetics-Ltd/loyalty-club.git

cd loyalty-club


apt install npm -y

npm i

cp .env.template .env 


# Add this inside the .env file
DATABASE_URL=postgresql://postgres:password@172.19.0.2:5432/database

# run this to build the docker images
docker-compose up -d


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
