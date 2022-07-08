# EKS Instrumentation
This will walk you through how to configure the Elastic Beats
framework for observability and how to install 

# Install Argo Rollouts into K8s
1. $ kubectl create namespace argo-rollouts
2. $ kubectl apply -n argo-rollouts -f argo-rollouts-1.2.1.yaml
3. Check for resources using "k get all -n argo-rollouts"
4. $ curl -LO https://github.com/argoproj/argo-rollouts/releases/latest/download/kubectl-argo-rollouts-linux-amd64
5. $ chmod +x ./kubectl-argo-rollouts-linux-amd64
6. $ sudo mv ./kubectl-argo-rollouts-linux-amd64 /usr/local/bin/kubectl-argo-rollouts
7. Test by running "kubectl argo rollouts version"

# Install metrics server
1. $ kubectl apply -f metrics-server-0.6.1.yaml
2. $ kubectl get deployment metrics-server -n kube-system

# Install kube-state-metrics (necessary for metricbeat)
1. $ kubectl apply -f kube-state-metrics-v2.5.0/
2. Watch the deployment using "watch kubectl get pods -n kube-system"

# Install Metricbeat
1. Modify metricbeat-kubernetes-8.3.1.yaml for env section.
2. You will need to enter the ELASTICSEARCH_HOST, ELASTICSEARCH_PASSWORD,
and the ELASTIC_CLOUD_ID for the Elastic.co cloud deployment
3. $ kubectl apply -f metricbeat-kubernetes-8.3.1.yaml
4. Verify with "kubectl get pods -n kube-system"

# Install Filebeat
1. Modify filebeat-kubernetes-8.3.1.yaml for env section.
2. $ kubectl apply -f filebeat-kubernetes-8.3.1.yaml

# Install Heartbeat
1. Modify heartbeat-kubernetes-8.3.1.yaml for env section.
2. Add any checks you would like, such as:
   heartbeat.monitors:
   #Monitor the Cluster IP on the Node Port
    - type: http
      id: blizzard-demo
      enabled: true
      schedule: '@every 1s'
      urls: ["http://172.31.20.153:32222"]
      ipv4: true
      ipv6: true
      mode: any
      timeout: 1s
      check.request:
      method: "GET"
      check.response:
      status: 200
3. $ kubectl apply -f heartbeat-kubernetes-8.3.1.yaml

# Out of scope for this demo
1. Use IaC such as Terraform and Github Actions to configure
the EKS cluster with a bastion host
