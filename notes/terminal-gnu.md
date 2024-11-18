## find

find files
```bash
find . -type f -name ".*yaml" -o -name ".yml"
```

## diff
diff two files
```bash
diff file1 file2 -y
diff file1 file2 -y --suppress-common-lines
```

## tail
get starting from N line
```bash
kubectl get pods | tail -n +2 # will start from second line (skip headers)
```

## cut
get second column
```bash
kubectl get pods | cut -d ' ' -f 1
```
