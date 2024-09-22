curl -fsSL https://ollama.com/install.sh | sh


ollama run llama2

/bye

ollama run mistral












sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install build-essential

git clone https://github.com/imartinez/privateGPT



sudo apt-get install git gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev zlib1g-dev libncursesw5-dev libgdbm-dev libc6-dev zlib1g-dev libsqlite3-dev tk-dev libssl-dev openssl libffi-dev
curl https://pyenv.run | bash
export PATH="/home/ubuntu/.pyenv/bin:$PATH"



export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


source ~/.bashrc


sudo apt-get install lzma
sudo apt-get install liblzma-dev



pyenv install 3.11
pyenv global 3.11
pip install pip --upgrade
pyenv local 3.11


curl -sSL https://install.python-poetry.org | python3 -

sudo apt install python3-poetry

nano ~/.bashrc
export PATH="$HOME/.poetry/bin:$PATH"

# export PATH="/home/ubuntu/.local/bin:$PATH"
source ~/.bashrc
poetry --version 


cd privateGPT
poetry install --extras "ui embeddings-huggingface llms-llama-cpp vector-stores-qdrant"