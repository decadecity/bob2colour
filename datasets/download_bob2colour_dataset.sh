FILE=$1

if [[ $FILE != "hurricane" && $FILE != "bob" ]]; then
  echo "Available datasets are hurricane and bob"
  exit 1
fi

echo "Specified [$FILE]"

URL=https://battle-of-britain-diary.org.uk/datasets/$FILE.tar.gz
TAR_FILE=./datasets/$FILE.tar.gz
TARGET_DIR=./datasets/$FILE/
wget -N $URL -O $TAR_FILE
mkdir -p $TARGET_DIR
tar -zxvf $TAR_FILE -C ./datasets/
rm $TAR_FILE
