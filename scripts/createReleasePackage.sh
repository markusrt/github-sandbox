tag=$1

echo "Pulling images"
docker pull -q nginx:latest
docker pull -q maven:latest

echo "Gather files for archival"
mkdir -p /tmp/release/images
docker save nginx -o /tmp/release/images/nginx-latest.tar
docker save maven -o /tmp/release/maven-latest.tar
cp ./README.md /tmp/release

echo "Create ZIP archive"
cd /tmp/release && zip -r /tmp/My-App-v$tag.zip * && cd -