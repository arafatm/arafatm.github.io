---
category: tech
tags: hashi consul
source: https://learn.hashicorp.com/consul/getting-started/consul-gs-intro
title: Learn Vault
---

## Install Consul | Consul - HashiCorp Learn

### Installing Consul

<https://www.consul.io/downloads.html>

### Verifying the Installation

:ship: Verify install
```bash
consul
```

## Run the Consul Agent

### Server and Client Agents

:flashlight: Each Consul datacenter must have at least one server, which is
responsible for maintaining Consul's state. 

:warning: We highly discourage single-server production deployments.

:exclamation: In order to make sure that Consul's state is preserved even if a
server fails, you should always run **either three or five servers in
production**.  The odd number of servers (and no more than five of them)
strikes a balance between performance and failure tolerance. You can learn more
about these requirements in Consul's Architecture Documentation
<https://www.consul.io/docs/internals/consensus.html>

:flashlight: A client must be running on every node in the Consul datacenter
that runs services, since clients are the source of truth about service health.

When you're ready to got into production you can find more guidance on
production deployment of servers and clients in this guide
<https://learn.hashicorp.com/consul/datacenter-deploy/deployment-guide>

:warning: Never run Consul in `-dev` mode in production.

### Starting the Agent

:ship: Start the Consul agent in development mode.
```bash
consul agent -dev
```

:warning: **for OS X Users:** Consul uses your hostname as the default node
name. If your hostname contains periods, DNS queries to that node will not work
with Consul. To avoid this, explicitly set the name of your node with the
`-node` flag.

### Datacenter Members

:ship: Check the membership of Consul DataCenter
```bash
consul members
```

:flashlight: The `members` <https://www.consul.io/docs/commands/members.html>
command runs against the Consul client, which gets its information via _gossip
protocol_ <https://www.consul.io/docs/internals/gossip.html>. 

:exclamation: The information that the client has is eventually consistent, but
at any point in time its view of the world may not exactly match the state on
the servers. For a strongly consistent view of the world, query the _HTTP API_
<https://www.consul.io/api/index.html>, which forwards the request to the
Consul servers.

:ship: Query nodes 
```bash
curl localhost:8500/v1/catalog/nodes
```

In addition to the HTTP API, you can use the DNS interface
<https://www.consul.io/docs/agent/dns.html> to discover the nodes. 

The 

DNS
interface will send your query to the Consul servers unless you've enabled
caching. To perform DNS lookups you have to point to the Consul agent's DNS
server, which runs on port `8600` by default. The format of the DNS entries
(such as `Judiths-MBP.node.consul`) will be covered in more detail later.

:ship: DNS Lookup to point to the Consul agent's DNS server
```bash
dig @127.0.0.1 -p 8600 FQDN.node.consul
```

### Stopping the Agent

:ship: Stop the Consul agent by using the `consul leave` command. 
```bash
consul leave
```

:flashlight: When you issue the `leave` command, Consul notifies other members
that the agent left the datacenter. When an agent leaves, its local services
running on the same node and their checks are removed from the catalog and
Consul doesn't try to contact that node again.

:warning: If an agent is operating as a server, a graceful leave is important
to avoid causing a potential availability outage affecting the consensus
protocol <https://www.consul.io/docs/internals/consensus.html>. 

See the Adding and Removing Servers guide
<https://learn.hashicorp.com/consul/day-2-operations/servers> for details on
how to safely add and remove servers.

## Register a Service and Health Check - Service Discovery | Consul

In the previous guide you ran a local Consul agent, and checked for other members of the datacenter. In this guide you will start using Consul by registering a service and a health check.

One of the major use cases for Consul is service discovery. Consul provides a DNS interface that downstream services can use to find the IP addresses of their upstream dependencies.

Consul knows where these services are located because each service registers with its local Consul client. Operators can register services manually, configuration management tools can register services when they are deployed, or container orchestration platforms can register services automatically via integrations.

In this guide, you'll register a service and health check manually by providing Consul with a configuration file, and use Consul discover its location using the DNS interface and HTTP API. Manually registering a service will help you understand the information that your automation tooling will ultimately need to provide Consul in order to take advantage of service discovery.

### Defining a Service

You can register services either by providing a service definition <https://www.consul.io/docs/agent/services.html>, which is the most common way to register services, or by making a call to the [HTTP API <https://www.consul.io/api/agent/service.html#register-service>. Here we will use a service definition.

First, create a directory for Consul configuration. Consul loads all configuration files in the configuration directory, so a common convention on Unix systems is to name the directory something like `/etc/consul.d` (the `.d` suffix implies "this directory contains a set of configuration files").

:ship:
```bash
mkdir ./consul.d
```

    

Next, write a service definition configuration file. Pretend there is a service named "web" running on port 80. Use the following command to create a file called web.json in the configuration directory. This file will contain the service definition: name, port, and an optional tag you can use to find the service later on. (In this case copy the whole code block except for the `$` to run the command and create the file.)

:ship:
```bash
echo '{"service":
```

      {"name": "web",
       "tags": ["rails"],
       "port": 80
      }
    }' > ./consul.d/web.json
    

Now, restart the agent, using command line flags to specify the configuration directory and enable script checks on the agent.

**Security Warning:** Enabling script checks in some configurations may introduce a remote execution vulnerability which is known to be targeted by malware. In production we strongly recommend `-enable-local-script-checks` instead.

:ship:
```bash
consul agent -dev -enable-script-checks -config-dir=./consul.d
```

    ==> Starting Consul agent...
               Version: 'v1.5.2'
               Node ID: '82f64bfa-22c2-5727-0f5d-0bae376f6584'
             Node name: 'Judiths-MBP.lan'
            Datacenter: 'dc1' (Segment: '<all>')
                Server: true (Bootstrap: false)
           Client Addr: [127.0.0.1] (HTTP: 8500, HTTPS: -1, gRPC: 8502, DNS: 8600)
          Cluster Addr: 127.0.0.1 (LAN: 8301, WAN: 8302)
               Encrypt: Gossip: false, TLS-Outgoing: false, TLS-Incoming: false, Auto-Encrypt-TLS: false
    
    ==> Log data will now stream in as it occurs:
    
    ...
    
    2019/07/16 14:09:25 [INFO] agent: Synced service "web"
    2019/07/16 14:09:25 [DEBUG] agent: Node info in sync
    2019/07/16 14:09:25 [DEBUG] agent: Service "web" in sync
    2019/07/16 14:09:25 [DEBUG] agent: Node info in sync
    

You'll notice in the output that Consul "synced" the web service. This means that the agent loaded the service definition from the configuration file, and has successfully registered it in the service catalog.

:warning: We never started a web service in this example. Consul can register services that aren't running yet. It correlates each running service with its registration based on the service's port.

In a multi-agent Consul datacenter, each service would register with its local Consul client, and the clients would forward the registration to the Consul servers, which maintain the service catalog.

If you wanted to register multiple services, you could create multiple service definition files in the Consul configuration directory.

### Querying Services

Once the agent adds the service to Consul's service catalog you can query it using either the DNS interface or HTTP API.

#### » <#dns-interface>DNS Interface

First query the web service using Consul's DNS interface. The DNS name for a service registered with Consul is `NAME.service.consul`, where `NAME` is the name you used to register the service (in this case, `web`). By default, all DNS names are in the `consul` namespace, though this is configurable <https://www.consul.io/docs/agent/options.html#domain>.

The fully-qualified domain name of the web service is `web.service.consul`. Query the DNS interface (which Consul runs by default on port `8600`) for the registered service.

:ship:
```bash
dig @127.0.0.1 -p 8600 web.service.consul
```

    
    ; <<>> DiG 9.10.6 <<>> @127.0.0.1 -p 8600 web.service.consul
    ; (1 server found)
    ;; global options: +cmd
    ;; Got answer:
    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 28340
    ;; flags: qr aa rd; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 2
    ;; WARNING: recursion requested but not available
    
    ;; OPT PSEUDOSECTION:
    ; EDNS: version: 0, flags:; udp: 4096
    ;; QUESTION SECTION:
    ;web.service.consul.        IN  A
    
    ;; ANSWER SECTION:
    web.service.consul. 0   IN  A   127.0.0.1
    
    ;; ADDITIONAL SECTION:
    web.service.consul. 0   IN  TXT "consul-network-segment="
    
    ;; Query time: 2 msec
    ;; SERVER: 127.0.0.1#8600(127.0.0.1)
    ;; WHEN: Tue Jul 16 14:26:53 PDT 2019
    ;; MSG SIZE  rcvd: 99
    

As you can see, an `A` record was returned containing the IP address where the service was registered. `A` records can only hold IP addresses.

**Tip:** Since we started `consul` with a minimal configuration, the `A` record will return local host (`127.0.0.1`). Set the Consul agent `-advertise` argument or the `address` field in the service definition <https://www.consul.io/docs/agent/services.html> if you want to advertise an IP address that is meaningful to other nodes in the datacenter.

You can also use the DNS interface to retrieve the entire address/port pair as a `SRV` record.

:ship:
```bash
dig @127.0.0.1 -p 8600 web.service.consul SRV
```

    
    ; <<>> DiG 9.10.6 <<>> @127.0.0.1 -p 8600 web.service.consul SRV
    ; (1 server found)
    ;; global options: +cmd
    ;; Got answer:
    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 56598
    ;; flags: qr aa rd; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 3
    ;; WARNING: recursion requested but not available
    
    ;; OPT PSEUDOSECTION:
    ; EDNS: version: 0, flags:; udp: 4096
    ;; QUESTION SECTION:
    ;web.service.consul.        IN  SRV
    
    ;; ANSWER SECTION:
    web.service.consul. 0   IN  SRV 1 1 80 Judiths-MBP.lan.node.dc1.consul.
    
    ;; ADDITIONAL SECTION:
    Judiths-MBP.lan.node.dc1.consul. 0 IN   A   127.0.0.1
    Judiths-MBP.lan.node.dc1.consul. 0 IN   TXT "consul-network-segment="
    
    ;; Query time: 2 msec
    ;; SERVER: 127.0.0.1#8600(127.0.0.1)
    ;; WHEN: Tue Jul 16 14:31:13 PDT 2019
    ;; MSG SIZE  rcvd: 150
    

The `SRV` record says that the web service is running on port 80 and exists on the node `Judiths-MBP.lan.node.dc1.consul.`. An additional section is returned by the DNS with the `A` record for that node.

Finally, you can also use the DNS interface to filter services by tags. The format for tag-based service queries is `TAG.NAME.service.consul`. In the example below, you'll ask Consul for all web services with the "rails" tag. You'll get a successful response since you registered the web service with that tag.

:ship:
```bash
dig @127.0.0.1 -p 8600 rails.web.service.consul
```

    
    ; <<>> DiG 9.10.6 <<>> @127.0.0.1 -p 8600 rails.web.service.consul
    ; (1 server found)
    ;; global options: +cmd
    ;; Got answer:
    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 37666
    ;; flags: qr aa rd; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 2
    ;; WARNING: recursion requested but not available
    
    ;; OPT PSEUDOSECTION:
    ; EDNS: version: 0, flags:; udp: 4096
    ;; QUESTION SECTION:
    ;rails.web.service.consul.  IN  A
    
    ;; ANSWER SECTION:
    rails.web.service.consul. 0 IN  A   127.0.0.1
    
    ;; ADDITIONAL SECTION:
    rails.web.service.consul. 0 IN  TXT "consul-network-segment="
    
    ;; Query time: 0 msec
    ;; SERVER: 127.0.0.1#8600(127.0.0.1)
    ;; WHEN: Tue Jul 16 14:32:53 PDT 2019
    ;; MSG SIZE  rcvd: 105
    

#### » <#http-api>HTTP API

In addition to the DNS interface, you can also query for the service using the HTTP API.

:ship:
```bash
curl http://localhost:8500/v1/catalog/service/web
```

    

    [
        {
            "ID": "82f64bfa-22c2-5727-0f5d-0bae376f6584",
            "Node": "Judiths-MBP.lan",
            "Address": "127.0.0.1",
            "Datacenter": "dc1",
            "TaggedAddresses": {
                "lan": "127.0.0.1",
                "wan": "127.0.0.1"
            },
            "NodeMeta": {
                "consul-network-segment": ""
            },
            "ServiceKind": "",
            "ServiceID": "web",
            "ServiceName": "web",
            "ServiceTags": [
                "rails"
            ],
            "ServiceAddress": "",
            "ServiceWeights": {
                "Passing": 1,
                "Warning": 1
            },
            "ServiceMeta": {},
            "ServicePort": 80,
            "ServiceEnableTagOverride": false,
            "ServiceProxyDestination": "",
            "ServiceProxy": {},
            "ServiceConnect": {},
            "CreateIndex": 10,
            "ModifyIndex": 10
        }
    ]
    

The HTTP API lists all nodes hosting a given service. As you will see later when we discuss health checks <#updating-services> you'll typically want to filter your query for only healthy service instances, which DNS does automatically under the hood. Filter your HTTP API query to look for only healthy instances.

:ship:
```bash
curl 'http://localhost:8500/v1/health/service/web?passing'
```

    

    [
        {
            "Node": {
                "ID": "82f64bfa-22c2-5727-0f5d-0bae376f6584",
                "Node": "Judiths-MBP.lan",
                "Address": "127.0.0.1",
                "Datacenter": "dc1",
                "TaggedAddresses": {
                    "lan": "127.0.0.1",
                    "wan": "127.0.0.1"
                },
                "Meta": {
                    "consul-network-segment": ""
                },
                "CreateIndex": 9,
                "ModifyIndex": 10
            },
    ...
            "Checks": [
                {
                    "Node": "Judiths-MBP.lan",
                    "CheckID": "serfHealth",
                    "Name": "Serf Health Status",
                    "Status": "passing",
                    "Notes": "",
                    "Output": "Agent alive and reachable",
                    "ServiceID": "",
                    "ServiceName": "",
                    "ServiceTags": [],
                    "Definition": {},
                    "CreateIndex": 9,
                    "ModifyIndex": 9
                }
            ]
        }
    ]
    

### Updating Services

Next you'll update the web service by registering a health check for it. Remember that because you never started a service on port `80` where you registered web, the health check you register will fail.

You can update service definitions without any downtime by changing the service definition file and sending a `SIGHUP` to the agent or running `consul reload`. Alternatively, you can use the HTTP API to add, remove, and modify services dynamically. In this example, you will update the registration file.

First, edit the registration file by running the following command. Copy and paste the whole code block (excluding the `$`) into your terminal.

:ship:
```bash
echo '{"service":
```

      {"name": "web",
        "tags": ["rails"],
        "port": 80,
        "check": {
          "args": ["curl", "localhost"],
          "interval": "10s"
        }
      }
    }' > ./consul.d/web.json
    

The 'check' stanza of this service definition adds a script-based health check that tries to connect to the web service every 10 seconds via curl. Script based health checks run as the same user that started the Consul process.

If the command exits with an exit code >= 2, then the check will fail and Consul will consider the service unhealthy. An exit code of 1 will be considered as warning state.

Now reload Consul's configuration to make it aware of the new health check.

:ship:
```bash
consul reload
```

    Configuration reload triggered
    

Notice the following lines in Consul's logs, which indicate that the web check is critical.

        2019/08/06 16:35:03 [INFO] agent: Synced service "web"
        2019/08/06 16:35:03 [DEBUG] agent: Check "service:web" in sync
        2019/08/06 16:35:03 [DEBUG] agent: Node info in sync
    ...
        2019/08/06 16:35:06 [WARN] agent: Check "service:web" is now critical
        2019/08/06 16:35:16 [WARN] agent: Check "service:web" is now critical
    ...
    

Consul's DNS server only returns healthy results. Query DNS for the web service again. It shouldn't return any IP addresses since web's health check is failing.

:ship:
```bash
dig @127.0.0.1 -p 8600 web.service.consul
```

    
    ; <<>> DiG 9.10.6 <<>> @127.0.0.1 -p 8600 web.service.consul
    ; (1 server found)
    ;; global options: +cmd
    ;; Got answer:
    ;; ->>HEADER<<- opcode: QUERY, status: NXDOMAIN, id: 28984
    ;; flags: qr aa rd; QUERY: 1, ANSWER: 0, AUTHORITY: 1, ADDITIONAL: 1
    ;; WARNING: recursion requested but not available
    
    ;; OPT PSEUDOSECTION:
    ; EDNS: version: 0, flags:; udp: 4096
    ;; QUESTION SECTION:
    ;web.service.consul.        IN  A
    
    ;; AUTHORITY SECTION:
    consul.         0   IN  SOA ns.consul. hostmaster.consul. 1565134764 3600 600 86400 0
    
    ;; Query time: 0 msec
    ;; SERVER: 127.0.0.1#8600(127.0.0.1)
    ;; WHEN: Tue Aug 06 16:39:24 PDT 2019
    ;; MSG SIZE  rcvd: 97
    

Notice that there is no answer section in the response, because Consul has marked the web service as unhealthy.

### Summary

In this guide you registered a service with Consul and learned how to query it using the HTTP API and DNS interface. You also added a script based health check for the service. You can find a complete list of service registration fields in the API documentation <https://www.consul.io/api/agent/service.html>, or learn more about health checks in the [check definition documentation <https://www.consul.io/docs/agent/checks.html>.

Continue to the next guide to learn how to enable Consul's service mesh control plane called Consul Connect, which allows you to secure and observe network traffic between your services, and allow or deny inter-service communication.> Consul Connect is a service mesh control plane that provides service-to-service connection authorization and encryption using mutual TLS. In this guide you will learn how to configure Connect to encrypt and control traffic between services.

## Connect Services - Service Mesh | Consul

In addition to providing IP addresses directly to services with the DNS interface or HTTP API, Consul can connect services to each other via sidecar proxies that you deploy locally with each service instance <https://www.consul.io/docs/connect/proxies.html>. This type of deployment (local proxies that control network traffic between service instances) is a service mesh. Because sidecar proxies connect your registered services, Consul's service mesh feature is called Consul Connect.

Connect lets you secure and observe communication between your services without modifying their code. Instead Connect configures sidecar proxies to establish mutual TLS between your services and either allow or deny communication between them based on their registered names. Because sidecar proxies control all service-to-service traffic, they can gather metrics about it and export them to a third party aggregator like Prometheus.

You can also natively integrate <https://www.consul.io/docs/connect/native.html> applications with Consul Connect for optimal performance and security.

**Security Warning:** This guide demonstrates Connect features with a dev-mode agent for simplicity, which is not a production-recommended secure way to deploy Connect. Please read the Connect production guide <https://www.consul.io/docs/guides/connect-production.html> to learn about securely deploying Connect.

Registering services that use Connect is similar to registering services normally. In this guide you will:

1.  Start a service.
2.  Register it normally, but with an additional `connect` stanza.
3.  Register a second proxy to communicate with the service.
4.  Start sidecar proxies.
5.  Practice blocking the connection to the service by creating an intention.

### Start a Connect-unaware Service

Begin by starting a service that is unaware of Connect. You will use `socat` to start a basic echo service, which will act as the "upstream" service in this guide. In production, this service would be a database, backend, or any service which another service relies on.

Socat is a decades-old Unix utility that lacks a concept of encryption or the TLS protocol. You will use it to demonstrate that Connect takes care of these concerns for you. If socat isn't installed on your machine, it should be available via a package manager.

Start the socat service and specify that it will listen for TCP connections on port 8181.

:ship:
```bash
socat -v tcp-l:8181,fork exec:"/bin/cat"
```

    

You can verify it is working by using `nc` (netcat) to connect directly to the echo service on the correct port. Once connected, type some text and press enter. The text you typed should be echoed back:

:ship:
```bash
nc 127.0.0.1 8181
```

    hello
    hello
    testing 123
    testing 123
    

### Register the Service and Proxy with Consul

Next, register the service with Consul by writing a new service definition, like you did in the last guide. This time you will include a Connect stanza in the registration that will register a sidecar proxy to handle traffic for this backend service instance.

Add a file called `socat.json` to the `consul.d` directory with the following command (copy the whole code block except the `$`).

:ship:
```bash
echo '{
```

      "service": {
        "name": "socat",
        "port": 8181,
        "connect": { "sidecar_service": {} }
      }
    }' > ./consul.d/socat.json
    

Now run `consul reload` or send a `SIGHUP` signal to Consul so it will read the new configuration.

Take a look at the `"connect"` stanza in the registration you just added. This empty configuration notifies Consul to register a sidecar proxy for this process on a dynamically allocated port. It also creates reasonable defaults that Consul will use to configure the proxy once you start it via the CLI. Consul does not automatically start the proxy process for you. This is because Consul Connect allows you to chose the proxy you'd like to use.

Consul comes with a L4 proxy for testing purposes, and first-class support for Envoy, which you should use for production deployments and layer 7 traffic management. You'll use the L4 proxy in this guide, because, unlike Envoy, it comes with Consul and doesn't require any extra installation.

Start the proxy process in another terminal window using the `consul connect proxy` command, and specify which service instance and proxy registration it corresponds to.

:ship:
```bash
consul connect proxy -sidecar-for socat
```

    ==> Consul Connect proxy starting...
        Configuration mode: Agent API
            Sidecar for ID: socat
                  Proxy ID: socat-sidecar-proxy
    
    ==> Log data will now stream in as it occurs:
    
        2019/07/24 13:27:59 [INFO] Proxy loaded config and ready to serve
        2019/07/24 13:27:59 [INFO] TLS Identity: spiffe://287133f6-3d1e-8fb0-a0c5-fb9d5a95d53c.consul/ns/default/dc/dc1/svc/socat
        2019/07/24 13:27:59 [INFO] TLS Roots   : [Consul CA 7]
        2019/07/24 13:27:59 [INFO] public listener starting on 0.0.0.0:21000
    

### Register a Dependent Service and Proxy

Next, register a downstream service called "web". Like the socat service definition, the configuration file for web will include a connect stanza that specifies a sidecar, but unlike the socat definition, the configuration here isn't empty. Instead it specifies web's upstream dependency on socat, and the port that the proxy will listen on.

:ship:
```bash
echo '{"service": {
```

        "name": "web",
        "port": 8080,
        "connect": {
          "sidecar_service": {
            "proxy": {
              "upstreams": [{
                 "destination_name": "socat",
                 "local_bind_port": 9191
              }]
            }
          }
        }
      }
    }' > ./consul.d/web.json
    

Use `consul reload` or SIGHUP to reload Consul with the new web service definition. This registers a sidecar proxy for the service "web" that will listen on port 9191 to establish mTLS connections to "socat".

If we were running a real web service it would talk to its proxy on a loopback address. The proxy would encrypt its traffic and send it over the network to the sidecar proxy for the socat service. Socat's proxy would decrypt the traffic and send it locally to socat on a loopback address at port 8181. Because there is no web service running, you will pretend to be the web service by talking to its proxy on the port that we specified (9191).

Before you start the proxy process, verify that you aren't able to connect to the socat service on port 9191. The below command should exit immediately, because there is nothing listening on port 9191 (socat is listening on 8181).

:ship:
```bash
nc 127.0.0.1 9191
```

    

Now start the web proxy using the configuration from the sidecar registration.

:ship:
```bash
consul connect proxy -sidecar-for web
```

    ==> Consul Connect proxy starting...
        Configuration mode: Agent API
            Sidecar for ID: web
                  Proxy ID: web-sidecar-proxy
    
    ==> Log data will now stream in as it occurs:
    
        2019/07/24 13:32:10 [INFO] 127.0.0.1:9191->service:default/socat starting on 127.0.0.1:9191
        2019/07/24 13:32:10 [INFO] Proxy loaded config and ready to serve
        2019/07/24 13:32:10 [INFO] TLS Identity: spiffe://287133f6-3d1e-8fb0-a0c5-fb9d5a95d53c.consul/ns/default/dc/dc1/svc/web
        2019/07/24 13:32:10 [INFO] TLS Roots   : [Consul CA 7]
        2019/07/24 13:32:10 [INFO] public listener starting on 0.0.0.0:21001
    

Note in the first log line that the proxy setup a local listener on port 9191 that will proxy to the socat service just as we configured in the sidecar registration. Subsequent log lines list the identity URL of the certificate loaded from the agent, identifying it as the "web" service, and the set of trusted root CAs that the proxy knows about.

Try connecting to socat again on port 9191. This time it should work and echo back your text.

:ship:
```bash
nc 127.0.0.1 9191
```

    hello
    hello
    

Close the connection by typing `Crl+c`.

The communication between the web and socat proxies is encrypted and authorized over a mutual TLS connection, while communication between each service and its sidecar proxy is unencrypted. In production, services should only accept only loopback connections. Any traffic in and out of the machine should travel through the proxies and therefore would always be encrypted.

**Security note:** The Connect security model requires trusting loopback connections when you use proxies. To further secure loopback connections you can use tools like network namespacing.

### Control Communication with Intentions

Intentions define which services are allowed communicate with which other services. The connections above succeeded because in development mode, the ACL system (and therefore the default intention policy) is "allow all" by default.

Create an intention to deny access from web to socat that specifies policy, and the source and destination services.

:ship:
```bash
consul intention create -deny web socat
```

    Created: web => socat (deny)
    

Now, try to connect again. The connection will fail.

:ship:
```bash
nc 127.0.0.1 9191
```

    

Delete the intention.

:ship:
```bash
consul intention delete web socat
```

    Intention deleted.
    

Try the connection again, and it will succeed.

:ship:
```bash
nc 127.0.0.1 9191
```

    hello
    hello
    

Intentions allow you to segment your network much like traditional firewalls, but they rely on the services' logical names (for example "web" or "socat") rather than the IP addresses of each individual service instance. Learn more about intentions <https://www.consul.io/docs/connect/intentions.html> in the documentation.

:warning: Changing intentions does not affect existing connections with the current version of Consul. You must establish a new connection to see the effects of a changed intention.

### Summary

In this guide you configured a service on a single agent and used Connect for automatic connection authorization and encryption. To get hands-on experience with the other features of Consul Connect's service mesh, try the Getting Started with Consul Service Mesh <https://learn.hashicorp.com/consul?track=gs-consul-service-mesh#gs-consul-service-mesh> guides.

Next explore how to use Consul's key value (KV) store for service configuration.> In this guide, we will use the Consul command-line interface to add and manage data in the Consul key value store.

## Add to Consul KV - Service Configuration | Consul

In addition to providing service discovery, integrated health checking, and securing network traffic, Consul includes a key value store, which you can use to dynamically configure applications, coordinate services, manage leader election, or serve as a data backend for Vault, along with a myriad of other uses.

In this guide you will explore the Consul key value store (Consul KV) using the command line. The guide assumes that the Consul agent from the previous guide is still running. If not you can start a new one by running `consul agent -dev`. Consul KV is enabled automatically on Consul agents; you don't need to enable it in Consul's configuration.

There are two ways to interact with the Consul KV store: the HTTP API and the CLI. In this guide we will use the CLI. See the HTTP API documentation <https://www.consul.io/api/kv.html> to learn how applications and services can interact with Consul KV.

### Add Data

First, insert or "put" some values into the KV store with the `consul kv put` command. The first entry after the command is the key, and the second entry is the value.

:ship:
```bash
consul kv put redis/config/minconns 1
```

    Success! Data written to: redis/config/minconns
    

Here the key is `redis/config/maxconns` and the value is set to `25`.

:ship:
```bash
consul kv put redis/config/maxconns 25
```

    Success! Data written to: redis/config/maxconns
    

Notice that with the key entered below ("redis/config/users/admin"), you set a `flags` value of 42. Keys support setting a 64-bit integer flag value that isn't used internally by Consul, but can be used by clients to add metadata to any KV pair.

:ship:
```bash
consul kv put -flags=42 redis/config/users/admin abcd1234
```

    Success! Data written to: redis/config/users/admin
    

### Query Data

Now, query for the value of one of the keys you just entered.

:ship:
```bash
consul kv get redis/config/minconns
```

    1
    

Consul retains some additional metadata about the key-value pair. Retrieve the some metadata (including the "flag" you set) using the `-detailed` command line flag.

:ship:
```bash
consul kv get -detailed redis/config/users/admin
```

    CreateIndex      14
    Flags            42
    Key              redis/config/users/admin
    LockIndex        0
    ModifyIndex      14
    Session          -
    Value            abcd1234
    

List all the keys in the store using the `recurse` options. Results are returned in lexicographical order.

:ship:
```bash
consul kv get -recurse
```

    redis/config/maxconns:25
    redis/config/minconns:1
    redis/config/users/admin:abcd1234
    

### Delete Data

Delete a key from the Consul KV store, issue a "delete" call.

:ship:
```bash
consul kv delete redis/config/minconns
```

    Success! Deleted key: redis/config/minconns
    

Consul lets you interact with keys in a folder-like way. Although all the keys in the KV store are actually stored flat, Consul allows you to manipulate keys that share a certain prefix as a group, as if they were in folders or subfolders.

Delete all the keys with the `redis` prefix using the `recurse` option.

:ship:
```bash
consul kv delete -recurse redis
```

    Success! Deleted keys with prefix: redis
    

### Modify Existing Data

Update the value of an existing key.

:ship:
```bash
consul kv put foo bar
```

    Success! Data written to: foo
    

Get the updated key.

:ship:
```bash
consul kv get foo 
```

    bar
    

Put the new value at an extant "path".

:ship:
```bash
consul kv put foo zip
```

    Success! Data written to: foo
    

Check the updated path.

:ship:
```bash
consul kv get foo
```

    zip
    

### Summary

In this guide you added, viewed, modified, and deleted entries in Consul's key value store.

Consul can perform atomic key updates using a Check-And-Set (CAS) operation, and includes other sophisticated options for writing keys and values. You can explore these options on the help page for the `consul kv put` command.

:ship:
```bash
consul kv put -h
```

    

These are only a few examples of what the API supports. For the complete documentation, please see the HTTP API documentation <https://www.consul.io/api/kv.html> and CLI documentation <https://www.consul.io/docs/commands/kv.html>.

Now that Consul contains some interesting data including service registrations, keys, values, and intentions, continue to the next guide to explore all this data in the Consul web UI.> Consul comes with support for a user-friendly and functional web UI out of the box. In this guide we will explore the web UI.

## Explore the Consul UI | Consul

Consul's web UI allows you to view and interact with Consul via a graphical user interface, which can lower the barrier of entry for new users, and ease troubleshooting.

If you were running Consul in production you would need to enable the UI in Consul's configuration file or using the `-ui` command line flag, but because your agent is running in development mode, the UI is automatically enabled.

### Navigate to the UI

If you have already stopped the agent you were using in the previous guides, you can visit a live demo-instance <https://demo.consul.io/ui/dc1/services> of the Consul Web UI to explore the steps in this guide.

If you are still running the agent that you used for the previous guides, you will be able to follow the activities in this guide more closely. Open a browser window and navigate to the UI, which is available at the `/ui` path on the same port as the HTTP API (port `8500`).

http://localhost:8500/ui <http://localhost:8500/ui>

A page will load that has a pink menu bar across the top. Welcome to the Consul Web UI.

### View Services

![Service Page](https://d33wubrfki0l68.cloudfront.net/24c41d54613afb774bff0a383043f8a47f4d0fd7/b8c35/img/consul-services.png "UI services page")

The landing page for the UI is the services page, which gives you a list of all registered services including their health, tags, type, and source. You can click on a specific service to learn more about its instance count, the health of individual instances, and which agent each instance is registered with.

You can filter the services visible on the page based on their name, tag, status, or other search terms.

**Try it:** filter for sidecar services by typing `sidecar` in the search bar and pressing the enter key.

You can learn about individual services by clicking on them.

**Try it:** click on the `web-sidecar-proxy` service to explore what information is available. Now select the one listed instance of the `web-sidecar-proxy` service to see what information is available on an instance-to-instance basis.

### View Nodes

Next click on the "Nodes" option in the pink top navigation bar to go to the nodes page. There you'll find an overview of the entire datacenter including the health status of each node. You can select individual nodes to learn about their health checks, registered services, round trip time, and lock sessions.

You can also filter the nodes by heath status, or search for them in the search bar.

**Try it:** Select the nodes page from the top menu bar and click on your local machine.

### Manage the Key-Value Store

In the top navigation, click "Key/Value" to view the page for Consul KV. If you are using the same agent that from previous guides, you should see one key, `foo`.

![Key Value Page](https://d33wubrfki0l68.cloudfront.net/3d5bda355f1865c274a634cfc528f49a52160a59/543f5/img/consul-kv.png "Key Value store page")

The keys page has a folder-like structure. Objects appear nested according to their key prefix. For example, you could have a folder for each application, business function, or a nested combination of the two.

**Try it:** From the main page, click the blue "Create" button to add a new key-value pair. Call the key `redis/user` with a value `Alice`. Now create another pair with the key `redis/password` and the value `123`. On the main page, notice that there is only one new entry, called "redis", with a folder icon next to it.

When you are clicked into a folder, Consul will automatically nest new keys under that folder, without you needing to type the prefix.

### Manage Access Control Lists

Consul uses Access Control Lists (ACLs) to secure the UI, API, CLI, service
communications, and agent communications. You need to configure ACLs
<https://learn.hashicorp.com/consul/security-networking/production-acls> in
your Consul datacenter to secure it for production, however, on your
development agent they aren't enabled, so the there isn't much to see on your
"ACL" page at the moment.

You can secure the UI itself with ACLs, by limiting read, write, and update permissions for the various pages in the UI. You do this by creating a token with the appropriate permissions, and adding it to the UI under the ACL page <https://learn.hashicorp.com/consul/security-networking/production-acls#consul-ui-token>. To remove access, simply select "Stop using" from your tokens action menu in the token list.

**Security Warning:** The browser can store tokens that you add to the UI.

### Manage Intentions

Click on the "Intentions" menu item to navigate to the intentions page in the UI. There aren't any intentions there yet, but if you are still running the same agent that you used for the previous guides, you can create an intention to block communication between your web and socat services.

![Intentions Page](https://d33wubrfki0l68.cloudfront.net/2e192ba4ab0e3d31831252853ddf5422c774afbd/46332/img/consul-intentions.png "Intentions page")

**Try it:** Click on the blue "Create" button. On the creation page set the source service to "web" and the destination to "socat". Make a deny intention. Open a terminal window and try to connect to to the socat service with the command `nc 127.0.0.1 9191`. It should exit immediately. Now on the main intentions page, click on the "..." menu item at the right of the new intention. Delete it and try to connect again. This time it should succeed.

### Adjust UI Settings

Click on "Settings" at the far-right of the menu bar. Here you can edit the UI's settings.

If you have set up a metrics dashboard to monitor your services, you can add a link on the settings page that will auto-populate placeholders for there service name and datacenter, and link out to each service's metrics from its UI page.

You can also choose whether or not you would like to set up a blocking query to update the UI in real time, rather than upon refresh. This is off by default because it can have performance implications.

### UI Task Table

As you may have noticed, some pages of the web UI are read-only, while others are interactive. Below is a table with the CRUD actions available for each page.

**Page**

**Action**

Services

Read

Nodes

Read

Key/Value

Create, Read, Update, Delete

Intentions

Create, Read, Update, Delete

ACLs

Create, Read, Update, Delete

### Next Steps

Now that you are comfortable navigating the UI, try using the Consul CLI <https://www.consul.io/docs/commands/index.html> to accomplish the same tasks we listed here.

So far you have explored the core functionality of Consul, including service discovery, securing services with a mesh, and using the key value store. Continue to the next guide to learn how to set up a Consul datacenter by joining multiple Consul agents together.

:warning: The next guide relies on VirtualBox <https://www.virtualbox.org/>, and Vagrant <https://www.vagrantup.com/> to run multiple Consul agents on your computer at once. If you haven't downloaded them yet, now would be a good time to do so.> In this guide you will join two Consul agents together to form a multi-agent Consul datacenter. You will use Vagrant to create the environment for this guide.

## Create a Local Consul Datacenter | Consul

Now that you have practiced using Consul, it's time to learn a bit more about how Consul operates. In this guide, you'll create your first datacenter with multiple members.

When a new Consul agent starts, it doesn't know about other agents; it is essentially a datacenter with one member. Agents learn about each other in two ways. To add a new agent to an existing datacenter you give it the IP address of any other agent in the datacenter (either a client or a server), which causes the new agent to join the datacenter. Once the agent is a member of the new datacenter, it automatically learns about the other agents via gossip.

In this guide, you will join two agents together to create a two-member Consul datacenter.

### Set Up the Environment

Consul is a distributed application that is designed to have one agent per machine. To run two agents on the same computer you will need to install VirtualBox <https://www.virtualbox.org/>, and Vagrant <https://www.vagrantup.com/>, which will run virtual machines to simulate a distributed environment.

Make a directory to store Vagrant's configuration for this guide.

:ship:
```bash
mkdir consul-getting-started-join
```

    

Create a new file in the directory called `Vagrantfile` and paste the content of Consul's demo Vagrant file <https://github.com/hashicorp/consul/blob/master/demo/vagrant-cluster/Vagrantfile> into it. Then save the file. This file will tell Vagrant to create two virtual machines on your computer with the Consul binary preinstalled.

Boot your two virtual machines. This may take a moment to download everything needed for the environment to spin up.

:ship:
```bash
vagrant up
```

    Bringing machine 'n1' up with 'virtualbox' provider...
    Bringing machine 'n2' up with 'virtualbox' provider...
    ...
    

Once the environment is up, ssh into node 1 to begin configuring of your datacenter.

:ship:
```bash
vagrant ssh n1
```

    Linux n1 4.9.0-9-amd64 #1 SMP Debian 4.9.168-1+deb9u2 (2019-05-13) x86_64
    
    The programs included with the Debian GNU/Linux system are free software;
    the exact distribution terms for each program are described in the
    individual files in /usr/share/doc/*/copyright.
    
    Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
    permitted by applicable law.
    You have new mail.
    vagrant@n1:~$
    

### Start the Agents

In previous guides, we used a single agent in development mode to test Consul's functionality. However, you should never run development agents in production. In this guide you will configure your first Consul agent to run in server mode instead, via the following command line flags. (In production you would provide these settings to consul in a configuration file.)

*   `server` switch <https://www.consul.io/docs/agent/options.html#_server> - Providing this flag specifies that we want the agent to start in server mode.
    
*   `-bootstrap-expect` flag <https://www.consul.io/docs/agent/options.html#_bootstrap_expect> - This tells the Consul server how many servers the datacenter should have in total. All the servers will wait for this number to join before bootstrapping the replicated log, which keeps data consistent across all the servers. Because you are setting up a one-server datacenter, you'll set this value to `1`. You can read more about this process in the [bootstrapping guide <https://www.consul.io/docs/guides/bootstrapping.html>.
    
*   `-node` name <https://www.consul.io/docs/agent/options.html#_node> - Each node in a datacenter must have a unique name. By default, Consul uses the hostname of the machine, but we'll manually override it, and set it to `agent-one`.
    
*   `-bind` address <https://www.consul.io/docs/agent/options.html#_bind> - This is the address that this agent will listen on for communication from other cluster members. It must be accessible by all other nodes in the datacenter. If you don't set a bind address Consul will try to listen on all IPv4 interfaces and will fail to start if it finds multiple private IPs. Since production servers often have multiple interfaces, you should always provide a bind address. In this case it is `172.20.20.10`, which you specified as the address of the first VM in your Vagrantfile.
    
*   `data-dir` flag <https://www.consul.io/docs/agent/options.html#_data_dir> - This flag tells Consul agents where they should store their state, which can include sensitive data like ACL tokens for both servers and clients. In production deployments you should be careful about the permissions for this directory. Find more information in the documentation <https://www.consul.io/docs/agent/options.html#_data_dir>. You will set the data directory to a standard location: `/tmp/consul`.
    
*   `config-dir` flag <https://www.consul.io/docs/agent/options.html#_config_dir> - This flag tells consul where to look for its configuration. You will set it to a standard location: `/etc/consul.d`.
    

Start your first Consul agent by running the following command. Consul will start up in the foreground of your terminal window.

:warning: Do not copy the `vagrant@n1:~$` when copying the command. This special prompt reminds you that you are ssh-ed into the first virtual machine).

    # vagrant@n1:~
:ship:
```bash
consul agent \
```

      -server \
      -bootstrap-expect=1 \
      -node=agent-one \
      -bind=172.20.20.10 \
      -data-dir=/tmp/consul \
      -config-dir=/etc/consul.d
    
    ...
    

Open a new terminal window and change directories into `consul-getting-started-join`. Then ssh into your second virtual machine.

:ship:
```bash
vagrant ssh n2
```

    

Now start up your second Consul agent in client mode. You'll set the bind address to the IP address of the second VM (`172.20.20.11`, specified in the Vagrantfile) and the name to `agent-two`. Don't include the `-server` flag and the agent will start in client mode. Consul will run in the foreground of your terminal.

:warning: Do not copy the `vagrant@n2:~$` when copying the command. This special prompt reminds you that you are ssh-ed into the second virtual machine).

    # vagrant@n2:~
:ship:
```bash
consul agent \
```

      -node=agent-two \
      -bind=172.20.20.11 \
      -enable-script-checks=true \
      -data-dir=/tmp/consul \
      -config-dir=/etc/consul.d
    ...
    

Now you have two Consul agents running: one server and one client. The two agents still don't know about each other and each comprise their own single-node datacenters.

Verify this by ssh-ing into each VM and checking each agent's membership information. You'll need to open a new terminal window and change directories into `consul-getting-started-join`.

Check the membership of `agent-two`.

:ship:
```bash
vagrant ssh n2
```

    Linux n2 4.9.0-9-amd64 #1 SMP Debian 4.9.168-1+deb9u2 (2019-05-13) x86_64
    
    The programs included with the Debian GNU/Linux system are free software;
    the exact distribution terms for each program are described in the
    individual files in /usr/share/doc/*/copyright.
    
    Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
    permitted by applicable law.
    You have new mail.
    Last login: Fri Aug  2 23:42:33 2019 from 10.0.2.2
    

    # vagrant@n2:~
:ship:
```bash
consul members
```

    Node       Address            Status  Type    Build  Protocol  DC   Segment
    agent-two  172.20.20.11:8301  alive   client  1.5.3  2         dc1  <default>
    

Open a new terminal window and change directories into `consul-getting-started-join`.

Check the membership of `agent-one`.

:ship:
```bash
vagrant ssh n1
```

    Linux n1 4.9.0-9-amd64 #1 SMP Debian 4.9.168-1+deb9u2 (2019-05-13) x86_64
    
    The programs included with the Debian GNU/Linux system are free software;
    the exact distribution terms for each program are described in the
    individual files in /usr/share/doc/*/copyright.
    
    Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
    permitted by applicable law.
    You have new mail.
    Last login: Fri Aug  2 20:37:46 2019 from 10.0.2.2
    

    # vagrant@n1:~
:ship:
```bash
consul members
```

    Node       Address            Status  Type    Build  Protocol  DC   Segment
    agent-one  172.20.20.10:8301  alive   server  1.5.3  2         dc1  <all>
    

### Join the Agents

You're now ready to create your multi-agent datacenter. Stay in the terminal window where you are ssh-ed into the first VM, and run the `consul join` command on the Consul server, giving it the bind address of the Consul client.

    # vagrant@n1:~
:ship:
```bash
consul join 172.20.20.11
```

    Successfully joined cluster by contacting 1 nodes.
    

In the same window, run `consul members` again and you will see both agents listed.

    # vagrant@n1:~
:ship:
```bash
consul members
```

    Node       Address            Status  Type    Build  Protocol  DC   Segment
    agent-one  172.20.20.10:8301  alive   server  1.5.3  2         dc1  <all>
    agent-two  172.20.20.11:8301  alive   client  1.5.3  2         dc1  <default>
    

Switch to the terminal window where your Consul server is running on the first VM, and you'll notice some log output indicating that agent two joined it.

Now switch to the terminal where your client is running on the second VM. You'll notice that the client had been throwing warnings and errors indicating that no servers were available. When the client learned about the server, it stopped throwing errors and synced its node information.

        2019/08/03 00:09:25 [WARN] manager: No servers available
        2019/08/03 00:09:25 [ERR] agent: failed to sync remote state: No known Consul servers
        2019/08/03 00:09:54 [WARN] manager: No servers available
        2019/08/03 00:09:54 [ERR] agent: failed to sync remote state: No known Consul servers
        2019/08/03 00:10:10 [INFO] serf: EventMemberJoin: agent-one 172.20.20.10
        2019/08/03 00:10:10 [INFO] consul: adding server agent-one (Addr: tcp/172.20.20.10:8300) (DC: dc1)
        2019/08/03 00:10:10 [INFO] consul: New leader elected: agent-one
        2019/08/03 00:10:11 [INFO] agent: Synced node info
    

Consul clients can not function without a server. All datacenters must have at least one agent running in server mode for Consul to function correctly.

In datacenters with more than one server, more than half of the servers must be in communication with each other at all times for the datacenter to function correctly. This is called maintaining quorum. You can learn more about the quorum requirements of servers in the architecture documentation <https://www.consul.io/docs/internals/consensus.html>.

Switch to the window where you are ssh-ed onto the second VM and run `consul members` on the client. The client will also list both agents as members.

    # vagrant@n2:~
:ship:
```bash
consul members
```

    Node       Address            Status  Type    Build  Protocol
    agent-two  172.20.20.11:8301  alive   client  0.5.0  2
    agent-one  172.20.20.10:8301  alive   server  0.5.0  2
    

**Tip:** To join a datacenter, a Consul agent only needs to learn about one other existing member, which can be a client or a server. After joining the datacenter, the agents automatically gossip with each other to propagate full membership information.

### Notes on Auto-join

In production, new Consul agents should automatically join the datacenter without human intervention. You can configure Consul to automatically discover new agents in AWS, Google Cloud or Azure by adding the relevant cloud auto join <https://www.consul.io/docs/agent/cloud-auto-join.html> object to your Consul configuration file. This will allow a new node to join the datacenter without any hard-coded configuration.

Alternatively, you can provide hard-coded addresses of known Consul agents to new agents using the `-join` flag <https://www.consul.io/docs/agent/options.html#_join> or `start_join` setting <https://www.consul.io/docs/agent/options.html#start_join>.

### Query a Node

You can query Consul agents using the DNS interface or HTTP API.

For the DNS API, the structure of the names is `NAME.node.consul` or `NAME.node.DATACENTER.consul`. If the datacenter is omitted, Consul will only search the local datacenter.

From the terminal window where you are ssh-ed into agent one query the DNS interface for the address of agent-two.

    # vagrant@n1:~
:ship:
```bash
dig @127.0.0.1 -p 8600 agent-two.node.consul
```

    ...
    
    ;; QUESTION SECTION:
    ;agent-two.node.consul. IN  A
    
    ;; ANSWER SECTION:
    agent-two.node.consul.  0 IN    A   172.20.20.11
    

The ability to look up nodes in addition to services is useful for system administration, in addition to service discovery. For example, knowing the address of the node to SSH into is as easy as making the node a part of the Consul datacenter and querying it.

### Stop the Agents

Stop both of your agents gracefully by either typing `Ctrl-c` in the terminal windows where they are running, or issuing the `consul leave` command.

### Clean Up the Environment

Vagrant will automatically stop and power down the virtual machines it created, remove their hard disks from your machine, and free up all of the disk space and RAM they consume.

It will not get rid of the directory you created or the Vagrant file it contains, so if you would like to re-run this guide, all you need to do is issue `vagrant up` again from inside the `consul-getting-started-join` directory.

Clean up your virtual environment by running the following command from within the `consul-getting-started-join` directory.

:ship:
```bash
vagrant destroy
```

        n2: Are you sure you want to destroy the 'n2' VM? [y/N] y
    ==> n2: Forcing shutdown of VM...
    ==> n2: Destroying VM and associated drives...
        n1: Are you sure you want to destroy the 'n1' VM? [y/N] y
    ==> n1: Forcing shutdown of VM...
    ==> n1: Destroying VM and associated drives...
    

### Summary

In this guide you set up a multi-agent Consul datacenter, by joining two Consul agents, a server and a client. Continue to the next guide to learn about the operations and development tracks that will help you put Consul into production.> Congratulations on completing the Getting Started track, where you explored   some of Consul's core functionality. In this guide find other resources to help you  continue learning.

## Next Steps | Consul - HashiCorp Learn

Congratulations on completing the Getting Started track, where you explored some of Consul's core functionality. Now that you know the basics, we want to give you some resources to help you continue learning about Consul, and get ready to take it into production.

*   Day 1: Deploying Your First Datacenter <https://learn.hashicorp.com/consul?track=datacenter-deploy#datacenter-deploy> - If you liked the learn experience, continue on to the Day 1 track, which will give you step-by-step instructions on deploying your first production-grade Consul datacenter.
    
*   Documentation <https://www.consul.io/docs/index.html> - The Consul documentation is organized based on Consul's features and components. If you are interested in a specific feature (for example the ACL system or the key-value store) the documentation is a great way to dig in.
    
*   Community Forum <https://discuss.hashicorp.com/c/consul> - Ask questions about Consul in our community forum, where you will find Consul engineers and fellow community members ready to help.
    

Was this guide helpful?