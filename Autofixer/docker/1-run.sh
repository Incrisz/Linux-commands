git clone https://github.com/mis-technologies/Autofixer-solution.git

mkdir Autofixer-solution/db_data

cp autofixer_backup.sql Autofixer-solution/db_data/

cd Autofixer-solution

nano Dockerfile
nano docker-compose.yml

docker-compose up -d