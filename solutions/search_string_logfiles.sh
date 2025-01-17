dir=$1

if [ ! -d $dir ]; then
  echo "Error: Directory not found"
  exit 1
fi
search_string=$2
for file in $dir/*.log; do
  echo $file
  grep -in $search_string $file
done
