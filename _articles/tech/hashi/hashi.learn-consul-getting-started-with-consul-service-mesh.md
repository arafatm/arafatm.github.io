---
categories: tech
tags: hashi devops consul kube
source: https://learn.hashicorp.com/consul?track=gs-consul-service-mesh#gs-consul-service-mesh
title: Getting Started with Consul Service Mesh
---







## Understand Consul Service Mesh | Consul

> Consul can be deployed as a service mesh control plane that provides
> service-to-service connection authorization and encryption using mutual TLS.
> In this guide you will learn how to configure Consul as your Kubernetes
> service mesh to encrypt and control traffic between services.

Service mesh solves the networking and security challenges of operating
microservices and cloud infrastructure. Consul is a service mesh solution that
offers a software-driven approach to routing and segmentation. It also brings
additional benefits such as failure handling, retries, and network
observability.

Consul "connect", HashiCorp's service mesh feature, provides
**service-to-service networking** and **security through connection
authorization** and encryption using mutual Transport Layer Security
(**mTLS**). 

Applications deployed with the "connect" feature can use **sidecar proxies** in
a service mesh configuration to establish TLS connections for inbound and
outbound connections, without being aware of Consul at all.

![Services and sidecar proxies](http://learn.hashicorp.com/img/consul/basic-proxy.png) 

This track of five guides will give you a basic introduction to Consul service
mesh with a focus on Kubernetes deployments. You will learn how to deploy
services in Kubernetes taking advantage of the features provided by Consul.

In this guide, you will learn about the service mesh features of Consul and
prepare a Kubernetes cluster for your Consul deployment.

The guides in this track use Shipyard as the default environment. Even though
the example commands and output are based on Shipyard, the same command should
be applicable to any Kubernetes cluster.

Note, Consul is designed to be compatible with every Kubernetes flavor. If you
have an existing Kubernetes cluster, or would like to use MiniKube, you can
still follow along with these guides.

### Prerequisites

To successfully complete the exercises in these guides, you will need:

- A Kubernetes cluster.
- [Helm](https://helm.sh/docs/using_helm/) to deploy Consul.
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) to
  interact with your Kubernetes cluster and deploy services.

If you decide to use Shipyard, you will also need
[Docker](https://docs.docker.com/) installed in your test machine.

### Discover Consul service mesh benefits

The adoption of microservices architectures and cloud infrastructure is
offering new approaches to networking. There are many different vendors and
tools, each attempting to solve the problem in different ways. The Consul
service mesh solution makes no assumptions about the underlying network and
uses a pure software approach with a focus on simplicity and broad
compatibility.

Consul addresses the new microservices architecture challenges with service
discovery and allowing operators to deploy applications into a zero-trust
network.

##### Provide service discovery

When new versions of a service/app are constantly deployed and have to exist
alongside other instances of the same application, often on different
versions, the capability to reflect changes in the service landscape in your
network becomes crucial. Consul helps you by offering a service catalog,
health checks, automatic load balancing, and geo-failover across multiple
instances of the same service.

##### Introduce zero-trust security model

The increasing complexity in the deployment scenarios also puts a heavy
burden on network security and shows the limitation of any sort of manual
configuration. Environments like Kubernetes, or cloud providers, where IP
addresses change often or are unknown adds to the overall complexity of the
configuration.

Under the hood, a service mesh is made up of proxies deployed locally
alongside each service instance, which control network communication between
their local instance and other services on the network. A per-service proxy
sidecar transparently handles inbound and outbound service connections,
automatically verifying and encrptying TLS connections between services.

Consul service mesh uses mutual TLS (mTLS) and will automatically generate
and distribute the TLS certificates for every service in the mesh. The
certificates are used for both:
- service identity verification
- service communication encryption

##### Simplify application security

Once the service sidecar proxies are deployed, it is still necessary to
authorize communication between services. Consul helps you secure service
communication at the network level by enabling you to manage
service-to-service communication permissions using intentions. Intentions
define service based access control for services in the Consul service mesh
and are used to control which services are allowed or not allowed to
establish connections.

### Consul platform compatibility

##### First-class Kubernetes support

Consul offers first-class Kubernetes support by providing an official Helm
chart for installing, configuring, and upgrading Consul on Kubernetes. The
chart helps you automate the installation and configuration of Consul
service mesh for Kubernetes.

##### Platform agnostic and multi-cluster mesh

While offering a first class integration with Kubernetes, Consul is also
compatible with all architectures and cloud providers. The service catalog
sync and auto-join features permit you to extend the boundaries of your
Kubernetes cluster to include services running outside of Kubernetes.

### Setup a Kubernetes environment with Shipyard

Shipyard enables you quickly deploy a local Kubernetes cluster. It runs on
MacOS, Linux, and Windows (with WSL). All applications, including Consul,
run in Docker containers so it only requires a recent version of Docker as
dependency.

You can configure Shipyard using blueprints. A blueprint is a scenario
configuration which allows you to run cloud native applications on your
computer with Docker. For this guide you will use the
[`learn-consul-service-mesh`](https://github.com/shipyard-run/blueprints/tree/master/learn-consul-service-mesh)
blueprint available in the default blueprint repository.

You can install Shipyard and run the blueprint with a single command. The
entire process should last no more than a couple of minutes in modern
systems.

    $ curl https://shipyard.run/apply | \
     bash -s github.com/shipyard-run/blueprints//learn-consul-service-mesh
    
    #
    
    Installing Shipyard to /usr/local/bin/shipyard
    
    #
    
    To remove Shipyard and all configuration use the command "shipyard uninstall"
    
    #
    
    Running configuration from:  github.com/shipyard-run/blueprints//learn-consul-service-mesh
    
    #
    
       Set the following environment variables to interact with this blueprint.
    
       export KUBECONFIG="$HOME/.shipyard/config/k8s/kubeconfig.yaml"
    
    #
    
       #
    
       To access the Kubernetes dashboard visit the following location in your browser. Note
       authentication is disabled, press "Skip" when prompted:
       http://localhost:18443
     
      #
    
         Run `shipyard delete` to cleanup all resources
    
    

**Piping to bash is controversial** as it prevents you from reading code that is about to run on your system. You can also install Shipyard by downloading the appropriate [release from GitHub](https://github.com/shipyard-run/shipyard/releases) and copying the executable in your `$PATH`.

### Next Steps

In this guide you learned the basic concepts of a service mesh network and how Consul features can help you implement one in your environment.

In the [next guide](http://learn.hashicorp.com/consul/gs-consul-service-mesh/deploy-consul-service-mesh) we will learn how to deploy Consul service mesh in a Kubernetes cluster using the Helm chart.> Consul can be deployed as a service mesh control plane that provides service-to-service connection authorization and encryption using mutual TLS. In this guide you will learn how to configure Consul as your Kubernetes service mesh to encrypt and control traffic between services.

## Deploy Consul Service Mesh on Kubernetes | Consul
This guide covers the necessary steps to install and configure Consul service mesh on an existing Kubernetes cluster.

By the end of this guide, you will be able to identify the installation prerequisites, download and configure the [official Helm chart](https://github.com/hashicorp/consul-helm) for Consul, and deploy Consul service mesh in your Kubernetes cluster.

**Security Warning:** This guide is not for production use. By default, the chart will install an insecure configuration of Consul. Please refer to the [Kubernetes documentation](https://www.consul.io/docs/platform/k8s/index.html) to determine how you can secure Consul on Kubernetes in production. Additionally, it is highly recommended to use a properly secured Kubernetes cluster or make sure that you understand and enable the recommended security features.

### Prerequisites

Kubernetes cluster. In the [previous guide](http://learn.hashicorp.com/consul/gs-consul-service-mesh/understand-consul-service-mesh) you used **Shipyard to create a Kubernetes cluster locally** on your test machine. You will be using that cluster to test the commands provided in this guide.

- [Helm](https://helm.sh/docs/using_helm/) locally to deploy your Consul service mesh.
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) locally to interact with your Kubernetes cluster and deploy services.

##### Configure kubectl to talk to your cluster

At the end of the Kubernetes cluster creation process, Shipyard creates a `kubectl` configuration file in your home directory, `~/.shipyard/config/k8s/kubeconfig.yaml`. This file configures your `kubectl` command line tool to communicate with your Kubernetes cluster.

To use the Shipyard generated configuration, define the `KUBECONFIG` environment variable to locate that file.

    $ export KUBECONFIG="$HOME/.shipyard/config/k8s/kubeconfig.yaml"
    

Before continuing, you should test that the `kubectl` is configured to interact with your Kubernetes cluster by using `kubectl get pods` to query for pods.

    $ kubectl get pods --all-namespaces
    NAMESPACE              NAME                                         READY   STATUS    RESTARTS   AGE
    kube-system            metrics-server-6d684c7b5-86mn5               1/1     Running   0          119s
    kube-system            local-path-provisioner-58fb86bdfd-6v7s5      1/1     Running   0          119s
    kube-system            coredns-d798c9dd-t6gxx                       1/1     Running   0          119s
    kubernetes-dashboard   dashboard-metrics-scraper-566cddb686-chxwz   1/1     Running   0          36s
    kubernetes-dashboard   kubernetes-dashboard-77f85889d5-n69wr        1/1     Running   0          36s
    

### Get the official Helm chart

Consul offers first-class Kubernetes support by providing an official Helm chart. The chart helps you automate the installation and configuration of Consul’s core features for Kubernetes, listed below.

- **Auto-join for Kubernetes**. Consul's cloud auto-join feature supports discovering and joining Kubernetes-based agents. This enables external Consul agents in different datacenters to join a Consul datacenter running in Kubernetes.
- **Service Catalog Sync**:
    *   Kubernetes to Consul. Kubernetes services will be automatically synced to the Consul catalog, enabling non-Kubernetes services to discover and connect to services running within Kubernetes. The Kubernetes services will be discoverable with the Consul UI, CLI, and API.
    *   Consul to Kubernetes. Consul services will be synced to Kubernetes services so that applications can use Kubernetes-native service discovery to discover and connect to services running outside of Kubernetes. The non-Kubernetes services will be discoverable with the Kubernetes UI and `kubectl`.
- **Connect Auto-Inject**. Pods deployed in Kubernetes can be configured to automatically use Consul to securely communicate using mutual TLS.

To deploy Consul service mesh using Helm you need a copy of the official chart.

Using the blueprint for Shipyard you can use the `helm-charts` folder inside the blueprint folder. The blueprint you are using for this guide ships with `consul-helm-0.18.0` so you can deploy Consul using that chart version out-of-the-box.

The Helm chart resides in the `blueprints` folder in your Shipyard configuration directory.

    $ cd ~/.shipyard/blueprints/github.com/shipyard-run/blueprints/learn-consul-service-mesh/helm-charts
    

### Configure the Helm chart

The Helm chart directory contains a `values.yaml` file with default configuration values. For this guide you will override these values by creating your own `consul-values.yml` file and passing it to `helm install` with the `-f` flag, e.g. `helm install hashicorp ./consul-helm -f consul-values.yml`.

The Shipyard blueprint provides a sample configuration file located at `helm-charts/consul-values.yml`. In this guide you will use this file to provision Consul as your Kubernetes service mesh, however you should consider your particular production needs when configuring your chart for production environments.

    $ cat consul-values.yml
    

    global:
      domain: consul
      datacenter: hashidc1
      image: "consul:1.7.0"
    
    server:
      replicas: 1
      bootstrapExpect: 1
      storage: 64Mi
      storageClass: local-path
    
    client:
      enabled: true
      grpc: true
    
    ui:
      enabled: true
    
    connectInject:
      enabled: true
      imageEnvoy: envoyproxy/envoy:v1.13.1
    

You can find additional details on the different sections configured in the sections below.

##### Global configuration

The values under the global key will affect all the other parameters in the chart.

- [`image`](#image) is the name and tag of the Consul Docker image.
- [`datacenter`](#datacenter) is the name of your Consul datacenter.
- [`domain`](#domain) is the domain Consul uses for DNS queries.

##### Server and client configuration

The server key contains parameters related to the server pods. The chart is configured to create one Consul server per Kubernetes node.

The blueprint used for this guide creates a single node Kubernetes cluster so the configuration creates one `replica` and sets `bootstrapExpect :1`. The other two keys in the default configuration `storage` and `storageClass` help you define the storage resources assigned to the server instances.

A Consul client is deployed on every Kubernetes node, so you do not need to specify the number of clients for your deployments. However, you will need to specify resources.

##### Consul UI configuration

To enable the Consul web UI update the `ui` section and set `enabled` to `true`.

Note, you can also set up a LoadBalancer resource or other service type in Kubernetes to make it easier to access the UI.

##### Consul connectInject security configuration

You can enable the Consul “connect” service mesh by setting the `connectInject` key to true.

When the “connect” injector is installed, then a sidecar proxy is automatically added to all pods. This sidecar can both accept and establish connections using Consul, enabling the pod to communicate to clients and dependencies exclusively over authorized and encrypted connections.

### Deploy Consul service mesh

You will use `helm install` to deploy Consul using the configuration defined in `consul-values.yml`. This should only take a few minutes. The Consul pods should appear in the Kubernetes dashboard immediately and you can monitor the deployment process there.

    $ helm install hashicorp ./consul-helm-0.18.0 -f consul-values.yml
    

    NAME: hashicorp
    ## ... 
    NAMESPACE: default
    STATUS: deployed
    REVISION: 1
    NOTES:
    Thank you for installing HashiCorp Consul!
    
    Now that you have deployed Consul, you should look over the docs on using
    Consul with Kubernetes available here:
    
    https://www.consul.io/docs/platform/k8s/index.html
    
    Your release is named hashicorp. To learn more about the release, try:
    
      $ helm status hashicorp
      $ helm get hashicorp
    

To check the deployment process on the command line you can use `kubectl get pods --all-namespaces` to get the list of pods created or use `kubectl get services` to see which services are being exposed from the Kubernetes cluster.

    $ kubectl get services
    NAME                                    TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)                                                                   AGE
    kubernetes                              ClusterIP   10.43.0.1     <none>        443/TCP                                                                   22m
    hashicorp-consul-server                 ClusterIP   None          <none>        8500/TCP,8301/TCP,8301/UDP,8302/TCP,8302/UDP,8300/TCP,8600/TCP,8600/UDP   15m
    hashicorp-consul-connect-injector-svc   ClusterIP   10.43.2.103   <none>        443/TCP                                                                   15m
    hashicorp-consul-dns                    ClusterIP   10.43.22.2    <none>        53/TCP,53/UDP                                                             15m
    hashicorp-consul-ui                     ClusterIP   10.43.85.85   <none>        80/TCP                                                                    15m
    

### Interact with Consul service mesh

Kubernetes requires you to create an ingress in order to access services from outside the cluster. An ingress exposes HTTP and HTTPS routes from outside the cluster to services within the cluster.

Ingresses can be created using several different ingress controllers to manage the traffic. An example file for this guide is provided by the blueprint in the `ingress_config` folder.

This configuration creates an ingress that permits you to access the `svc/hashicorp-consul-ui` service in Kubernetes listening on port `80` using port `18500` on your local machine at http://localhost:18500.

    $ cd ~/.shipyard/blueprints/github.com/shipyard-run/blueprints/learn-consul-service-mesh/ingresses
    

    $ cat consul-ui.hcl
    

    ingress "consul-ui" {
      target = "k8s_cluster.k8s"
      service  = "svc/hashicorp-consul-ui"
        
      network  {
        name = "network.local"
      }
    
      port {
        local  = 80
        remote = 80
        host   = 18500
      }
    }
    

Use `shipyard run` to apply the ingress to your Kubernetes cluster.

    $ shipyard run ./consul-ui.hcl
    Running configuration from:  ./blueprints/consul-base-lab/ingresses/consul-ui.hcl
    
    2020-02-20T15:19:04.386+0100 [INFO]  Creating Ingress: ref=consul-ui
    2020-02-20T15:19:04.389+0100 [DEBUG] Image exists in local cache: image=shipyardrun/ingress:latest
    2020-02-20T15:19:04.389+0100 [INFO]  Creating Container: ref=consul-ui
    2020-02-20T15:19:04.420+0100 [DEBUG] Attaching container to network: ref=consul-ui network=network.local
    

Once the command completes, use `docker ps` to verify the ingress is running.

    $ docker ps
    CONTAINER ID        IMAGE                        COMMAND                  CREATED             STATUS              PORTS                      NAMES
    2cfd74201e82        shipyardrun/ingress:latest   "ingress --proxy-typ…"   18 seconds ago      Up 17 seconds       0.0.0.0:18500->80/tcp      consul-ui.ingress.shipyard
    #
    

##### Access Consul UI

Once the Shipyard ingress is created the Consul UI is available at http://localhost:18500.

![consul ui showing nodes tab with consul server and k8s](http://learn.hashicorp.com/img/consul/gs-connect-service-mesh/consul-ui-services-default-good.png)

Explore the Consul UI by viewing the nodes and services tabs.

##### Access Consul containers

You can use `kubectl exec` to get direct access to any container, including Consul containers.

    $ kubectl exec -it hashicorp-consul-server-0 /bin/sh
    

    /#   
    

Once you have access to one of the Consul agents, use the `consul` command to interact with your datacenter.

    $ consul members
    Node                       Address          Status  Type    Build  Protocol  DC        Segment
    hashicorp-consul-server-0  10.42.0.10:8301  alive   server  1.7.0  2         hashidc1  <all>
    server.k8s                 10.42.0.7:8301   alive   client  1.7.0  2         hashidc1  <default>
    

##### Using Consul environment variable

If you have the `consul` binary installed on your test machine you can interact with the datacenter directly.

Set the `CONSUL_HTTP_ADDR` to point to the ingress you created earlier in the guide.

    $ export CONSUL_HTTP_ADDR="http://localhost:18500"
    

You can now use the `consul` command locally to interact with your datacenter.

    $ consul members
    Node                       Address          Status  Type    Build  Protocol  DC        Segment
    hashicorp-consul-server-0  10.42.0.10:8301  alive   server  1.7.0  2         hashidc1  <all>
    server.k8s                 10.42.0.7:8301   alive   client  1.7.0  2         hashidc1  <default>
    

### Next steps

In this guide you configured Consul “connect” service mesh on an existing Kubernetes cluster using the official Helm chart. You enabled the UI and configured an ingress to access it. Finally, you used `kubectl` to interact with your service mesh.

In the [next guide](http://learn.hashicorp.com/consul/gs-consul-service-mesh/secure-applications-with-consul-service-mesh) you will learn how to deploy “connect” enabled services on Kubernetes using Envoy as sidecar proxy.> Consul can be deployed as a service mesh control plane that provides service-to-service connection authorization and encryption using mutual TLS. In this guide you will learn how to deploy applications on Kubernetes using Consul service mesh to encrypt and control traffic between services.

## Secure Applications with Consul Service Mesh | Consul
Consul service mesh allows you to deploy applications into a zero-trust network. A zero-trust network is a network where nothing is trusted automatically: all connections must be verified and authorized. This paradigm is important in microservices and multi-cloud environments where many applications and services are running in the same network.

In this guide you will deploy two services, `web` and `api`, into Consul's service mesh running on a Kubernetes cluster. The two services will use Consul to discover each other and communicate over mTLS with sidecar proxies. This is the first step in deploying application into a zero-trust network.

![Services with sidecar proxies](http://learn.hashicorp.com/img/consul/web-api-proxy.png "Web and API service on seperate Consul clients communciation through their sidecar proxies.")

The two services represent a simple two-tier application made of a backend `api` service and a frontend that communicates with the `api` service over HTTP and exposes the results in a web ui.

### Prerequisites

- Kubernetes cluster with Consul service mesh. In the [previous guide](http://learn.hashicorp.com/consul/gs-consul-service-mesh/deploy-consul-service-mesh) you used Helm to deploy Consul service mesh and enabled the use of Envoy as a sidecar proxy on a Kubernetes cluster locally on your test machine. You will be using that cluster to test the commands provided in this guide.
    
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) to interact with your Kubernetes cluster and deploy services.
    

### Deploy services with sidecar proxies in Kubernetes

With the Consul `connectInject` option enabled in the `consul-values.yaml` file, you have ensured that all the services deployed in the service mesh, using the exposed annotations, are automatically registered in the Consul catalog.

    "consul.hashicorp.com/connect-inject": "true"
    

When you use the above annotation, a sidecar proxy is automatically added to your pod. This proxy will handle inbound and outbound service connections, automatically wrapping and verifying TLS connections. Using local sidecar proxies enables simple application integration.

### Define the services

Move into the blueprint folder. The blueprint folder was automatically created when you ran Shipyard for the first time.

    $ cd ~/.shipyard/blueprints/github.com/shipyard-run/blueprints/learn-consul-service-mesh
    

The blueprint folder contains the example files for these services under the `k8s_config` folder. You should use the `api.yml` and `web.yml` files.

##### Define the backend service

The `api.yml` file contains the configuration for a deployment of the `api` service.

    $ cat ./k8s_config/api.yml
    

    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: api-deployment-v1
      labels:
        app: api-v1
    spec:
      replicas: 1
      selector:
        matchLabels:
          app: api-v1
      template:
        metadata:
          labels:
            app: api-v1
          annotations:
            "consul.hashicorp.com/connect-inject": "true"
        spec:
          containers:
          - name: api
            image: nicholasjackson/fake-service:v0.7.8
            ports:
            - containerPort: 9090
            env:
            - name: "LISTEN_ADDR"
              value: "127.0.0.1:9090"
            - name: "NAME"
              value: "api-v1"
            - name: "MESSAGE"
              value: "Response from API v1"
    

##### Define the frontend service

The `web.yml` file contains the configuration for a deployment of the web ui service.

    $ cat ./k8s_config/web.yml
    

    ---
    
    
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: web-deployment
      labels:
        app: web
    spec:
      replicas: 1
      selector:
        matchLabels:
          app: web
      template:
        metadata:
          labels:
            app: web
          annotations:
            "consul.hashicorp.com/connect-inject": "true"
            "consul.hashicorp.com/connect-service-upstreams": "api:9091"
        spec:
          containers:
          - name: web
            image: nicholasjackson/fake-service:v0.7.8
            ports:
            - containerPort: 9090
            env:
            - name: "LISTEN_ADDR"
              value: "0.0.0.0:9090"
            - name: "UPSTREAM_URIS"
              value: "http://localhost:9091"
            - name: "NAME"
              value: "web"
            - name: "MESSAGE"
              value: "Hello World"
    
    ---
    
    
    apiVersion: v1
    kind: Service
    metadata:
      name: web
    spec:
      selector:
        app: web
      ports:
      - name: http
        protocol: TCP
        port: 9090
        targetPort: 9090
    

###### Understand the upstream concept

In this example, the `web` frontend service depends on the `api` backend service to operate properly. You can define this by saying that:

- The `web` frontend service is _downstream_ from the `api` service.
- The `api` service is _upstream_ from the `web` service.

The `web` service definition includes another annotation, `consul.hashicorp.com/connect-service-upstreams`.

    "consul.hashicorp.com/connect-service-upstreams": "api:9091"
    

By using the `consul.hashicorp.com/connect-service-upstreams` annotation, you are explicitly declaring the upstream for the `web` service.

Using the format `name:addr`, such as `api:9091` will make the `api` service available on `localhost:9091` in the `web` service pod. When the `web` service makes a request to `localhost:9091`, the sidecar proxy will establish a secure mTLS connection with the `api` service and forward the request.

### Deploy the services

Once the configuration is completed you can deploy the applications by using `kubectl apply`.

    $ kubectl apply -f ./k8s_config/api.yml
    

    $ kubectl apply -f ./k8s_config/web.yml
    

After a few seconds you will be able to monitor the application's pods being created and running.

    $ kubectl get pods --all-namespaces
    # ...
    api-deployment-v1-85cc8c9977-z9sv2                                3/3     Running   0          35s
    web-deployment-76dcfdcc8f-d7f25                                   3/3     Running   0          32s
    

You can also confirm the status of the deployment in the Consul UI, http://localhost:18500.

![consul_ui_services_k8s_service_mesh](http://learn.hashicorp.com/img/consul/gs-connect-service-mesh/consul-ui-services-and-sidecars-good.png)

### Access the services

You are able to connect to Consul UI due to the ingress created in the previous guide. Similarly, to gain access to the ui exposed by the `web` service, you will create a new Shipyard ingress using the example file provided in the blueprint.

    $ shipyard run ./ingresses/web-app.hcl
    

Ingresses are a good approach to permanently expose a service outside your Kubernetes cluster. For test scenarios, or if you are not using Shipyard you can use `kubectl port-forward web 9090:9090` to create a temporary tunnel between your machine and your test environment.

Once the Shipyard ingress is created you can access the web UI by visiting http://localhost:9090/ui.

![web_service_ui_all_good](http://learn.hashicorp.com/img/consul/gs-connect-service-mesh/web-service-ui-good.png)

### Next steps

In this guide you deployed a two-tier application in the Consul service mesh and defined the ports and dependencies for each of the services composing your application. Finally, you configured an ingress to access the frontend for your `web` service.

This configuration ensures that all the communication between the `web` and the `api` services is passing through the Envoy sidecar proxies and, therefore, is encrypted using mTLS.

In the [next guide](http://learn.hashicorp.com/consul/gs-consul-service-mesh/network-security-with-consul-service-mesh) you will learn how to configure _intentions_ to define access control between services in the Consul service mesh and control which services are allowed or not allowed to establish connections.> Consul provides you a simplified approach to network security. In this guide you will learn how to define intentions to introduce a zero-trust network security approact in your Kubernetes cluster.

## Enforce a Zero-trust Network with Consul Service Mesh | Consul
In the [previous guide](http://learn.hashicorp.com/consul/gs-consul-service-mesh/secure-applications-with-consul-service-mesh), you deployed two services into your Consul service mesh and secured service-to-service communication with sidecar proxies. This is the first step to configure a zero-trust network and ensure that the communication between your services is automatically verified and encrypted using mutual TLS (mTLS). The second step is to ensure all connections are authorized. Before microservices, authorization was defined with firewall rules and routing tables.

Consul simplifies the definition for communication rules between services with "intentions". Intentions define service-to-service communication permission by service name. Intentions are the foundation for zero-trust networking.

In this guide you will define high level privileges to secure network traffic using Consul intentions.

### Prerequisites

- Kubernetes cluster with Consul service mesh. In the [previous guide](http://learn.hashicorp.com/consul/gs-consul-service-mesh/secure-applications-with-consul-service-mesh) you used `kubectl` to deploy two services, acting as a two-tier web application into your Consul service mesh on a local Kubernetes cluster. You will be using that cluster to test the commands provided in this guide.
    
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) to interact with your Kubernetes cluster and connect to Consul containers.
    

### Create your first intention

The default policy for intentions is to permit all traffic. This allows all the services to communicate with each other when you first setup your Consul service mesh.

In case you have Consul ACLs enabled, then the default intentions policy is inherited from the default ACL policy.

##### Create the intention

The first intention you will create changes the _blacklist_ approach where all traffic is allowed unless denied in specific rules, to a _whitelist_ approach where all traffic is denied and only specific connections are enabled.

First, access the Consul server container using \`kubectl exec\`.

    $ kubectl exec -it hashicorp-consul-server-0 /bin/sh
    / #
    

Once on the Consul container, you can use the `consul intention create` command.

    $ consul intention create -deny "*" "*" 
    Created: * => * (deny)
    

##### Check intentions

Once created this intention will prevent all the service-to-service communication, preventing also traffic between your two services previously deployed.

    $ consul intention check web api
    Denied
    

### Permit service communication with intentions

Once you have defined the default policy as _deny all_, you can authorize traffic between your two services _web_ and _api_.

First, access the Consul server container using \`kubectl exec\`.

    $ kubectl exec -it hashicorp-consul-server-0 /bin/sh
    / #
    

You can verify that the communication between `web` and `api` is now denied using the `consul intention check` command.

    $ consul intention check web api
    Denied
    

Create the intention using `consul intention` command. You will use the service names as source and destination and assign the desired permission to the communication rule you are creating.

    $ consul intention create -allow web api
    Created: web => api (allow)
    

At this point you can confirm the communication is permitted by using the same `consul intention check` command again.

    $ consul intention check web api
    Allowed
    

### Understand the anatomy of an intention

Intentions control which services can communicate with each another and are enforced by the sidecar proxy on inbound connections. The identity of the inbound service is verified by its TLS client certificate. The sidecar proxy then checks if an intention exists that authorizes the inbound service to communicate with the destination service. If the inbound service is not authorized, the connection will be terminated.

An intention has four parts:

- Source service. Defines the service that initiates the communication. It can be the full name of a service or `*` to refer to all services.
- Destination service. Defines the service that receives the communication, this will be the _upstream_ you configured in your service definition. It can be the full name of a service or `*` to refer to all services.
- Permission. Defines whether the communication between source and destination is permitted. This can be set to either `allow` or `deny`.
- Description. Optional component to associate a description to the intention.

For both source and destination, the Consul UI will provide you with a dropdown that lists all the services inside your service mesh. In case you want to define intentions for services that are not already deployed, you can add any service name into the text box and it will be applied to future services with that name.

### Next steps

At this point you have learned how to define traffic rules for your service mesh without the need to manually add firewall rules or use any other traffic shaping software. You learned how to create intentions using the UI and the CLI interface for Consul.

Using Consul as your service mesh solution allows you to also leverage the functionalities exposed by the sidecar proxies to obtain observability and traffic shaping for your L7 traffic. The [next guide](http://learn.hashicorp.com/consul/gs-consul-service-mesh/features-of-consul-service-mesh) will give you some more information on the use cases available.> Consul can be deployed as a service mesh control plane that provides service-to-service connection authorization and encryption using mutual TLS. In this guide you will get an overview of observability and L7 traffic management features for Consul service mesh.

## Observe Network Traffic with Consul Service Mesh | Consul
In the process of migrating from monolithic architecture to microservices, there are several best practices that can help you keep a tighter control over the status of your infrastructure. Consul gives you a unified solution to both managing and monitoring the traffic and services you have deployed.

You can get valuable metrics about your traffic by deploying sidecar proxies. The sidecar proxies are capable of collecting Layer 7 (L7) metrics, like HTTP status codes or request latency from your services. This data can be exported to monitoring tools like Prometheus.

The necessity to speed up deployments or to leverage testing techniques, such as Canary deployment or A/B testing, increases the complexity of network management and generates new security issues that were not present, at least not to this extent, in older fashioned deployments. Consul offers you a unified interface for traffic shaping in your network.

### Prerequisites

To implement the use cases discussed in this guide you will need a Kubernetes cluster with Consul service mesh enabled. In case you do not have one and are interested in testing the use cases you can follow [Understand Consul service mesh](http://learn.hashicorp.com/consul/gs-consul-service-mesh/understand-consul-service-mesh) to deploy a Kubernetes cluster locally and deploy Consul as service mesh.

### Choose a proxy as data plane

Once deployed, Consul service mesh becomes your control plane and allows you to choose between multiple proxies as the data plane.

- Consul includes its own built-in Layer 4 (L4) proxy for testing and development with Consul. The built-in proxy is useful when testing configuration entries and when checking mTLS or intentions but it doesn't have the L7 capabilities necessary for the observability features, released with Consul 1.5, that you are going to learn in this guide.
    
- Consul service mesh has first class support for _Envoy_ as a proxy. Consul can configure Envoy sidecars to proxy `http/1.1`, `http2`, or `gRPC` traffic at L7 or any other TCP-based protocol at L4. Also permits you to inject custom Envoy configuration in the proxy service definition allowing you to use the more powerful features of Envoy that might not yet be exposed by Consul. Envoy is the default choice for the official Consul Helm chart.
    

Any proxy can be extended to support Consul service mesh as long as it is able to accept inbound connections and/or establish outbound connections identified as a particular service. Consul exposes `/v1/agent/connect/*` API endpoints that permit a proxy to validate certificates for the mTLS connection and authorize or deny it based on the Consul configuration.

### Observability with sidecar proxies

If the proxy you use as your data plane exposes L7 metrics Consul permits you to configure the metrics destination and service protocol you want to monitor and aggregate the results in your monitoring pipeline.

Starting with version 1.5, Consul is able to configure Envoy proxies to collect L7 metrics including HTTP status codes and request latency, along with many others, and export those to monitoring tools like Prometheus. If you are using Kubernetes, the Consul official Helm chart can simplify much of the necessary configuration, which you can learn about in the [observability guide](http://learn.hashicorp.com/consul/kubernetes/l7-observability-k8s).

### Understand L7 traffic management

In addition to helping you introduce observability practices in your infrastructure, Consul service mesh offers a flexible traffic management set of options.

Techniques such as canary deployment, A/B testing, or blue/green deploys, are gaining popularity and their implementation increases the complexity of network management and generates new security issues that were not present, at least not to this extent, in older fashioned deployments. One of the main challenges is how to properly shape the traffic.

Using the service catalog and health checks as a foundation, Consul service mesh provides, on top of that, a three stage traffic management approach. This approach helps you carve up a single datacenter's pool of services beyond simply returning all healthy instances for load balancing and it gives you a finer granularity than the level of a single service when deciding that a specific subset of the service instance should receive traffic.

Proxy upstreams are discovered using a series of stages:

- routing,
- splitting,
- resolution.

These stages represent different ways of managing L7 traffic. Each stage of this discovery process can be dynamically reconfigured via various configuration entries. When a configuration entry is missing, that stage will fall back on default behavior.

##### Routing

Routing is the first step of traffic management and allows the interception of traffic using L7 criteria such as path prefixes or http headers, and changes behavior by sending traffic to a different service or service subset.

A `service-router` configuration entry kind may only reference `service-splitter` or `service-resolver` entries.

##### Splitting

A splitter configuration entry allows for a user to choose to split incoming requests across different subsets of a single service (like during staged canary rollouts), or perhaps across different services (like during a v2 rewrite or other type of codebase migration).

A `service-splitter` configuration may only reference other `service-splitter` or a `service-resolver` entry.

##### Resolution

A resolver configuration entry allows for a user to define which instances of a service should satisfy discovery requests for the provided name.

These configuration entries may only reference other `service-resolver` entries. Examples of things you can do with resolver configuration entries:

- Control where to send traffic if all instances of `api` service in the current datacenter are unhealthy.
- Configure service subsets based on `Service.Meta.version` values.
- Send all traffic for `web` that does not specify a service subset to the version1 subset.
- Send all traffic for `api` to `new-api`.
- Send all traffic for `api` in all datacenters to instances of `api` in `dc2`.
- Create a "virtual service" `api-dc2` that sends traffic to instances of `api` in `dc2`. This can be referenced in upstreams or in other configuration entries.

If no resolver configuration is defined for a service it is assumed 100% of traffic flows to the healthy instances of a service with the same name in the current datacenter/namespace and discovery terminates.

Note: service-resolver configuration entries kinds function at L4 (unlike service-router and service-splitter kinds). These can be created for services of any protocol such as tcp.

### Create service defaults with central configuration

Depending on the stage of your cloud journey you might need different control over both observability and traffic management.

Configuration entries for both can be created to provide cluster-wide defaults for various aspects of your service mesh. When the agent is configured to enable central service configurations, it will look for service configuration defaults that match a registering service instance. If it finds any, the agent will merge those defaults with the service instance configuration. This allows for things like service protocol or proxy configuration to be defined globally and inherited by any affected service registrations.

### Challenge: Deploy more services in your mesh

In [Secure Applications with Consul Service Mesh](http://learn.hashicorp.com/consul/gs-consul-service-mesh/secure-applications-with-consul-service-mesh) you used the `api.yml` and `web.yml` to deploy two services into your Consul service mesh. The blueprint provides you with some other files, `counting-service.yaml` and `dashboard-service.yaml`, containing other services definitions. After completing this track try deploying more services and creating intentions for them.

### Next steps

Prerequisites for the service mesh network approach are the resolution of service discovery and service health monitoring. The service mesh functionalities you used in this track are built on top of Consul service discovery and the availability of the service catalog. Consul is already able to scale to thousands of nodes when used for service discovery and that makes it an excellent primitive for the service mesh functionalities.