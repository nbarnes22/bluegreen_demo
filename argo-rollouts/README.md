# Argo Rollouts
These YAML files are used to roll out v1.0.1 and then
do a blue/green deployment to v1.0.2.

In Kubernetes, run "kubectl apply -f bluegreen-v1.0.1.yaml"
first which will deploy the first version. Then run "kubectl
apply -f bluegreen-v1.0.2.yaml" to stage the next version. 

Run "kubectl argo rollouts get rollout blizzard-demo --watch"
to see the status of the blue/green strategy. 

Use "kubectl argo rollouts promote blizzard-demo" to cut over
to the v1.0.2 version. If you need to roll back, you can use
"kubectl argo rollouts undo blizzard-demo" followed by "kubectl
argo rollouts promote blizzard-demo".

You can see all rollouts at anytime by running "kubectl argo rollouts list rollouts".

More details can be found here: https://argoproj.github.io/argo-rollouts/

