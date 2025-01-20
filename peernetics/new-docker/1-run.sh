git clone https://github.com/Peernetics-Ltd/loyalty-club.git

mkdir loyalty-club/db_data


cp database_dump.sql loyalty-club/db_data/

cd loyalty-club

nano Dockerfile
nano docker-compose.yml

cp .env.template .env 

sed -i 's|^DATABASE_URL=postgresql://postgres:Qwerty.1234@3.11.67.148:5432/postgres_testing| DATABASE_URL=postgresql://postgres:password@postgres-database:5432/database|' .env

docker-compose up -d