### estado de minikube running?
minikube status

# Comenzar
minikube start --driver=virtualbox # o el driver que se desé para windows se recomienda hiperv

# Crear un nuevo deployment (create crea un objeto de kubernet) - imperativo
kubectl create deployment <name> --image=<dockerhub alias>/<cluster image  name>
#### Crea y controla desde un cluster un "mastar node"

# Ver los deployments/pods
kubectl get deployments
kubectl get pods

# Dashboard FTW
minikube dashboard

# Crea un servicio que se encarga de exponer un deployment
kubectl expose deployment <nombre image> --type=LoadBalancer --port=8080
kubectl get services
minikube service <nombre imagen>

# auto Scaling
kubectl scale deployment/<deployment name> --replicas=3
kubectl get pods # deberían salir 3 del mismo container+

# Update deployments
#Cambios en SW la versión es importante pues de otro modo kubernete no verá cambios
docker build -t <dockerhub alias>/<cluster image  name>:<version> .
docker push <dockerhub alias>/<cluster image  name>:<version>
# update <cluster image  name> se puede consultar con: kubectl get pods
kubectl set image deployment/<deployment name> <cluster image  name>=<dockerhub alias>/<cluster image  name>:<version>
# para verificar el resultado
kubectl rollout status deployment/<deployment name>