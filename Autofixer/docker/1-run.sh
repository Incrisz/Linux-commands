git clone https://github.com/mis-technologies/Autofixer-solution.git

cd Autofixer-solution

mkdir db_data

cd ..

cp autofixer_backup.sql Autofixer-solution/db_data/

cd Autofixer-solution

nano Dockerfile
nano docker-compose.yml

docker-compose up -d