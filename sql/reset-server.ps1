kubectl scale deployment backend --namespace=website-prod --replicas=0
Start-Sleep 5
kubectl exec sql-0 --namespace=website-prod -- su postgres -c "dropdb serverhostingdb;createdb serverhostingdb;psql serverhostingdb < /data/backup/seeded-db.bak"
kubectl scale deployment backend --namespace=website-prod --replicas=1