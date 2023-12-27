---
categories: tech
tags: hashi devops consul
source: https://learn.hashicorp.com/consul/getting-started/consul-gs-intro
title: Learn Consul
---
`code` _underline_ **strong** :ship: 
#hashi 
## Install Consul

### Installing Consul

<https://www.consul.io/downloads.html>

### Verifying the Installation

:shipit: Verify install
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

:shipit: Start the Consul agent in development mode.
```bash
consul agent -dev
```

:warning: **for OS X Users:** Consul uses your hostname as the default node
name. If your hostname contains periods, DNS queries to that node will not work
with Consul. To avoid this, explicitly set the name of your node with the
`-node` flag.

### Datacenter Members

:shipit: Check the membership of Consul DataCenter
```bash
consul members
```

:flashlight: The `members` <https://www.consul.io/docs/commands/members.html>
command runs against the Consul client, which gets its information via _gossip
protocol_ <https://www.consul.io/docs/internals/gossip.html>. 

**[Gossip Protocol](https://en.wikipedia.org/wiki/Gossip_protocol)** := a form
of random "peer selection": with a given frequency, each machine picks another
machine at random and shares any hot rumors.

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

The DNS interface will send your query to the Consul servers unless you've
enabled caching. To perform DNS lookups you have to point to the Consul agent's
DNS server, which runs on port `8600` by default. The format of the DNS entries
(such as `Judiths-MBP.node.consul`) will be covered in more detail later.

:shipit: DNS Lookup to point to the Consul agent's DNS server
```bash
dig @127.0.0.1 -p 8600 FQDN.node.consul
```

### Stopping the Agent

:shipit: Stop the Consul agent by using the `consul leave` command. 
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

## Register a Service and Health Check - Service Discovery

:flashlight: One of the major use cases for Consul is **service discovery**.
Consul provides a DNS interface that downstream services can use to find the IP
addresses of their upstream dependencies.

Consul knows where these services are located because each service registers
with its local Consul client. Operators can register services manually,
configuration management tools can register services when they are deployed, or
container orchestration platforms can register services automatically via
integrations.

In this guide, you'll register a service and health check manually by providing
Consul with a configuration file, and use Consul discover its location using
the DNS interface and HTTP API. Manually registering a service will help you
understand the information that your automation tooling will ultimately need to
provide Consul in order to take advantage of service discovery.

### Defining a Service

You can register services either by providing a service definition
<https://www.consul.io/docs/agent/services.html>, which is the most common way
to register services, or by making a call to the [HTTP API
<https://www.consul.io/api/agent/service.html#register-service>. 

:shipit: Create directory for configuration files
```bash
mkdir ./consul.d
```

Next, write a service definition configuration file. Pretend there is a service
named "web" running on port 80. Use the following command to create a file
called web.json in the configuration directory. This file will contain the
service definition: name, port, and an optional tag you can use to find the
service later on. (In this case copy the whole code block except for the `$` to
run the command and create the file.)

:shipit: Write a **service definition configuration** file
```bash
echo '{"service":
  { "name": "web",        # service name
    "tags": ["rails"],    # optional tag to find service
    "port": 80            # run on port 80
  }
}'    > ./consul.d/web.json
```

:shipit: Restart the agent and enable script checks on the agent.
```bash
consul agent -dev -enable-script-checks -config-dir=./consul.d
```

:warning: **Security Warning:** Enabling script checks in some configurations
may introduce a remote execution vulnerability which is known to be targeted by
malware. In production we strongly recommend `-enable-local-script-checks`
instead.

:warning: We never started a web service in this example. Consul can register
services that aren't running yet. It correlates each running service with its
registration based on the service's port.

In a multi-agent Consul datacenter, each service would register with its local
Consul client, and the clients would forward the registration to the Consul
servers, which maintain the service catalog.

If you wanted to register multiple services, you could create multiple service
definition files in the Consul configuration directory.

### Querying Services

via _DNS Interface_ or _HTTP API_ 

#### DNS Interface

:ship: The fqdn is `web.service.consul`. Query the DNS interface for the
registered service.

```bash
dig @127.0.0.1 -p 8600 web.service.consul
```

As you can see, an `A` record was returned containing the IP address where the
service was registered. `A` records can only hold IP addresses.

:flashlight: Since we started `consul` with a minimal configuration, the `A`
record will return local host (`127.0.0.1`). Set the Consul agent `-advertise`
argument or the `address` field in the service definition
<https://www.consul.io/docs/agent/services.html> if you want to advertise an IP
address that is meaningful to other nodes in the datacenter.

:shipit: You can also use the DNS interface to retrieve the entire address/port pair as a `SRV` record.
```bash
dig @127.0.0.1 -p 8600 web.service.consul SRV
```

:shipit: You can also use the DNS interface to filter services by tags. The
format for tag-based service queries is `TAG.NAME.service.consul`. 
```bash
dig @127.0.0.1 -p 8600 rails.web.service.consul
```

#### HTTP API

:shipit: Query for the service using the HTTP API.
```bash
curl http://localhost:8500/v1/catalog/service/web
```

The HTTP API lists all nodes hosting a given service. 

:flashlight: As you will see later when we discuss health checks
<#updating-services> you'll typically want to filter your query for only
healthy service instances, which DNS does automatically under the hood. Filter
your HTTP API query to look for only healthy instances.

:shipit: Query for the service filtering for healthy service instances
```bash
curl 'http://localhost:8500/v1/health/service/web?passing'
```

### Updating Services

Next you'll update the web service by registering a health check for it.

Remember that because you never started a service on port `80` where you
registered web, the health check you register will fail.

`code` _underline_ **strong** 

:flashlight: You can update service definitions without any downtime by
changing the service definition file and sending a `SIGHUP` to the agent or
running `consul reload`. Alternatively, you can use the HTTP API to add,
remove, and modify services dynamically. In this example, you will update the
registration file.

:shipit: Edit the registration file
```bash
echo '{ "service":
  {"name": "web",
    "tags": ["rails"],
    "port": 80,
    "check": {
      "args": ["curl", "localhost"],
      "interval": "10s"
    }
  }
}'      > ./consul.d/web.json
```

:flashlight: If the command exits with an `exit code >= 2`, then the check will
fail and Consul will consider the service unhealthy. An exit code of 1 will be
considered as warning state.

:shipit: Now reload Consul's configuration to make it aware of the new health check.
```bash
consul reload
```

Notice the following lines in Consul's logs, which indicate that the web check is critical.

        2019/08/06 16:35:03 [INFO] agent: Synced service "web"
        2019/08/06 16:35:03 [DEBUG] agent: Check "service:web" in sync
        2019/08/06 16:35:03 [DEBUG] agent: Node info in sync
    ...
        2019/08/06 16:35:06 [WARN] agent: Check "service:web" is now critical
        2019/08/06 16:35:16 [WARN] agent: Check "service:web" is now critical
    ...
    
:exclamation: Consul's DNS server only returns healthy results. 

:shipit: Query DNS for the web service again. It shouldn't return any IP
addresses since web's health check is failing.
```bash
dig @127.0.0.1 -p 8600 web.service.consul
```

### Summary

You can find a complete list of service registration fields in the API
documentation <https://www.consul.io/api/agent/service.html>, or learn more
about health checks in the [check definition documentation
<https://www.consul.io/docs/agent/checks.html>.

## Connect Services - Service Mesh

Consul's service mesh control plane called _Consul Connect_, allows you to
secure and observe network traffic between your services, and allow or deny
inter-service communication.

_Consul Connect_ is a service mesh control plane that provides
**service-to-service connection authorization and encryption using mutual
TLS**. 

In addition to providing IP addresses directly to services with the DNS
interface or HTTP API, Consul can **connect services to each other via sidecar
proxies** that you deploy locally with each service instance
<https://www.consul.io/docs/connect/proxies.html>. This type of deployment
(local proxies that control network traffic between service instances) is a
**service mesh**. Because sidecar proxies connect your registered services,
Consul's service mesh feature is called Consul Connect.

Connect lets you secure and observe communication between your services without
modifying their code. Instead Connect configures _sidecar proxies_ to establish
mutual TLS between your services and either allow or deny communication between
them based on their registered names. Because sidecar proxies control all
service-to-service traffic, they can gather metrics about it and export them to
a third party aggregator like Prometheus.

You can also natively integrate native
<https://www.consul.io/docs/connect/native.html> applications with Consul
Connect for optimal performance and security.

:warning: **Security Warning:** This guide demonstrates Connect features with a
dev-mode agent for simplicity, which is not a production-recommended secure way
to deploy Connect. Please read the Connect production guide
<https://www.consul.io/docs/guides/connect-production.html> to learn about
securely deploying Connect.

Registering services that use Connect is similar to registering services
normally. In this guide you will:
1.  Start a service.
2.  Register it normally, but with an additional `connect` stanza.
3.  Register a second proxy to communicate with the service.
4.  Start sidecar proxies.
5.  Practice blocking the connection to the service by creating an intention.

### Start a Connect-unaware Service

Use `socat` <https://medium.com/@copyconstruct/socat-29453e9fc8a6> to start a
basic echo service, which will act as the "upstream" service in this guide. In
production, this service would be a database, backend, or any service which
another service relies on.

Socat lacks a concept of encryption or the TLS protocol. You will use it to
demonstrate that Connect takes care of these concerns for you. 

:shipit: Start the socat service and specify that it will listen for TCP
connections on port 8181.
```bash
socat -v tcp-l:8181,fork exec:"/bin/cat"
```

:shipit: verify it's working with `netcat`
```bash
nc 127.0.0.1 8181
```

### Register the Service and Proxy with Consul

:shipit: Register a _sidecar proxy_ to handle traffic for the socat service
instance <https://www.consul.io/docs/connect/registration/sidecar-service.html>
```bash
echo '{
  "service": {
    "name": "socat",
    "port": 8181,
    "connect": { "sidecar_service": {} }  
  }
}'      > ./consul.d/socat.json
```

:shipit: reload the new socat configuration
```bash
consul reload
```

:exclamation: Consul comes with a L4 proxy for testing purposes, and
first-class support for Envoy <https://www.envoyproxy.io/>, which you should
use for production deployments and layer 7 traffic management. 

:exclamation: You'll use the L4 proxy in this guide, because, unlike Envoy, it
comes with Consul and doesn't require any extra installation.

:shipit: Start the proxy process, and specify which service instance and proxy
registration it corresponds to.
```bash
consul connect proxy -sidecar-for socat
```

### Register a Dependent Service and Proxy

:shipit: Register a downstream service called "web" that specifies web's upstream
dependency on socat, and the port that the proxy will listen on.
```bash
echo '{"service": {
        "name": "web",
        "port": 8080,
        "connect": {
          "sidecar_service": {
            "proxy": {
              "upstreams": [{
                 "destination_name": "socat",   # dependency on socat service
                 "local_bind_port": 9191        # listen on port 9191
              }]
            }
          }
        }
      }
    }' > ./consul.d/web.json
```

:shipit: reload the new web service definition
```bash
consul reload
```

If we were running a real web service it would talk to its proxy on a loopback
address. The proxy would encrypt its traffic and send it over the network to
the sidecar proxy for the socat service. 

Socat's proxy would decrypt the traffic and send it locally to socat on a
loopback address at port 8181.

Because there is no web service running, you will _pretend to be the web
service_ by talking to its proxy on the port that we specified (9191).

:shipit: Verify that you aren't able to connect to the socat service on port 9191. 
The below command should exit immediately, because there is nothing listening
on port 9191 _socat is listening on 8181_.
```bash
nc 127.0.0.1 9191
```

:shipit: Start the web proxy using the configuration from the sidecar
registration.
```bash
consul connect proxy -sidecar-for web
```

:flashlight: Note in the first log line that the proxy setup a local listener
on port 9191 that will proxy to the socat service just as we configured in the
sidecar registration. 

Subsequent log lines list the identity URL of the certificate loaded from the
agent, identifying it as the "web" service, and the set of trusted root CAs
that the proxy knows about.

:shipit: Connect to socat again on port 9191. This time it should work and echo
back your text.
```bash
nc 127.0.0.1 9191
```
    
:shipit: Close the connection by typing `Crl+c`.

:flashlight: The communication between the web and socat proxies is encrypted
and authorized over a mutual TLS connection, while communication between each
service and its sidecar proxy is unencrypted. In production, services should
only accept only loopback connections. Any traffic in and out of the machine
should travel through the proxies and therefore would always be encrypted.

:warning: **Security note:** The Connect security model requires trusting
loopback connections when you use proxies. To further secure loopback
connections you can use tools like network namespacing.

### Control Communication with Intentions

**Intentions** <https://www.consul.io/docs/connect/intentions.html> define
which services are allowed communicate with which other services. The
connections above succeeded because in development mode, the ACL system (and
therefore the default intention policy) is "allow all" by default.

:shipit: Create an intention to deny access from web to socat that specifies
policy, and the source and destination services.
```bash
consul intention create -deny web socat
```

:shipit: The connection should fail.
```bash
nc 127.0.0.1 9191
```

:shipit: Delete the intention.
```bash
consul intention delete web socat
```

:shipit: Try the connection again, and it will succeed.
```bash
nc 127.0.0.1 9191
```

**Intentions allow you to segment your network much like traditional
firewalls**, but they rely on the services' logical names (for example "web" or
"socat") rather than the IP addresses of each individual service instance.

:warning: Changing intentions does not affect existing connections with the current version of Consul. You must establish a new connection to see the effects of a changed intention.

### Summary

- [ ] Getting Started with Consul Service Mesh <https://learn.hashicorp.com/consul?track=gs-consul-service-mesh#gs-consul-service-mesh>

## Add to Consul KV - Service Configuration

In addition to providing 
- service discovery, 
- integrated health checking, 
- and securing network traffic, 

**Consul includes a key value store**, which you can use to 
- dynamically configure applications, 
- coordinate services, 
- manage leader election, 
- or serve as a data backend for Vault, 
- along with a myriad of other uses.

There are two ways to interact with the Consul KV store: the HTTP API and the
CLI. In this guide we will use the CLI. 

See the HTTP API documentation <https://www.consul.io/api/kv.html> to learn how
applications and services can interact with Consul KV.

### Add Data

First, insert or "put" some values into the KV store with the `consul kv put` command. The first entry after the command is the key, and the second entry is the value.

:shipit: Insert `put` some values
```bash
consul kv put redis/config/minconns 1

consul kv put redis/config/maxconns 25
```

:shipit: set a **flag** which isn't used internally, but can add metadata
```bash
consul kv put -flags=42 redis/config/users/admin abcd1234
```

### Query Data

:shipit: Query with `get`
```bash
consul kv get redis/config/minconns
```

:shipit: Query including `flag` metadata
```bash
consul kv get -detailed redis/config/users/admin
```

:shipit: list all keys in the store recursively
```bash
consul kv get -recurse
```

### Delete Data

:shipit: Delete a key from the Consul KV store
```bash
consul kv delete redis/config/minconns
```

:flashlight: Consul lets you interact with keys in a folder-like way. Although
all the keys in the KV store are actually stored flat, Consul allows you to
manipulate keys that share a certain prefix as a group, as if they were in
folders or subfolders.

:shipit: Delete all the keys with the `redis` prefix using the `recurse` option.  
```bash
consul kv delete -recurse redis
```

### Modify Existing Data

:shipit: Update the value of an existing key.  
```bash
consul kv put foo bar
```

:shipit: Get the updated key.  
```bash
consul kv get foo 
```

:shipit: Put the new value at an extant "path".  
```bash
consul kv put foo zip
```

:shipit: Check the updated path.
```bash
consul kv get foo
```

### Summary

HTTP API documentation <https://www.consul.io/api/kv.html>

CLI documentation <https://www.consul.io/docs/commands/kv.html>.

## Explore the Consul UI

Consul's web UI allows you to view and interact with Consul via a graphical
user interface.

:exclamation: If you were running Consul in production you would need to enable
the UI in Consul's configuration file or using the `-ui` command line flag, but
because your agent is running in development mode, the UI is automatically
enabled.

### Navigate to the UI

Visit a live demo-instance <https://demo.consul.io/ui/dc1/services> of the
Consul Web UI to explore the steps in this guide.

For local UI access <http://localhost:8500/ui>

### View Services

![Service Page](https://d33wubrfki0l68.cloudfront.net/24c41d54613afb774bff0a383043f8a47f4d0fd7/b8c35/img/consul-services.png "UI services page")

The landing page for the UI is the services page, which gives you a list of all
registered services including their health, tags, type, and source. You can
click on a specific service to learn more about its instance count, the health
of individual instances, and which agent each instance is registered with.

You can filter the services visible on the page based on their name, tag,
status, or other search terms.

**Try it:** filter for sidecar services by typing `sidecar` in the search bar
and pressing the enter key.

You can learn about individual services by clicking on them.

**Try it:** click on the `web-sidecar-proxy` service to explore what
information is available. Now select the one listed instance of the
`web-sidecar-proxy` service to see what information is available on an
instance-to-instance basis.

### View Nodes

Next click on the "Nodes" option in the pink top navigation bar to go to the
nodes page. There you'll find an overview of the entire datacenter including
the health status of each node. You can select individual nodes to learn about
their health checks, registered services, round trip time, and lock sessions.

You can also filter the nodes by heath status, or search for them in the search
bar.

**Try it:** Select the nodes page from the top menu bar and click on your local
machine.

### Manage the Key-Value Store

In the top navigation, click "Key/Value" to view the page for Consul KV. If you
are using the same agent that from previous guides, you should see one key,
`foo`.

![Key Value
Page](https://d33wubrfki0l68.cloudfront.net/3d5bda355f1865c274a634cfc528f49a52160a59/543f5/img/consul-kv.png
"Key Value store page")

The keys page has a folder-like structure. Objects appear nested according to
their key prefix. For example, you could have a folder for each application,
business function, or a nested combination of the two.

**Try it:** From the main page, click the blue "Create" button to add a new
key-value pair. Call the key `redis/user` with a value `Alice`. Now create
another pair with the key `redis/password` and the value `123`. On the main
page, notice that there is only one new entry, called "redis", with a folder
icon next to it.

When you are clicked into a folder, Consul will automatically nest new keys
under that folder, without you needing to type the prefix.

### Manage Access Control Lists

Consul uses Access Control Lists (ACLs) to secure the UI, API, CLI, service
communications, and agent communications. You need to configure ACLs
<https://learn.hashicorp.com/consul/security-networking/production-acls> in
your Consul datacenter to secure it for production, however, on your
development agent they aren't enabled, so the there isn't much to see on your
"ACL" page at the moment.

You can secure the UI itself with ACLs, by limiting read, write, and update
permissions for the various pages in the UI. You do this by creating a token
with the appropriate permissions, and adding it to the UI under the ACL page
<https://learn.hashicorp.com/consul/security-networking/production-acls#consul-ui-token>.
To remove access, simply select "Stop using" from your tokens action menu in
the token list.

**Security Warning:** The browser can store tokens that you add to the UI.

### Manage Intentions

Click on the "Intentions" menu item to navigate to the intentions page in the
UI. There aren't any intentions there yet, but if you are still running the
same agent that you used for the previous guides, you can create an intention
to block communication between your web and socat services.

![Intentions
Page](https://d33wubrfki0l68.cloudfront.net/2e192ba4ab0e3d31831252853ddf5422c774afbd/46332/img/consul-intentions.png
"Intentions page")

**Try it:** Click on the blue "Create" button. On the creation page set the
source service to "web" and the destination to "socat". Make a deny intention.
Open a terminal window and try to connect to to the socat service with the
command `nc 127.0.0.1 9191`. It should exit immediately. Now on the main
intentions page, click on the "..." menu item at the right of the new
intention. Delete it and try to connect again. This time it should succeed.

### Adjust UI Settings

Click on "Settings" at the far-right of the menu bar. Here you can edit the
UI's settings.

If you have set up a metrics dashboard to monitor your services, you can add a
link on the settings page that will auto-populate placeholders for there
service name and datacenter, and link out to each service's metrics from its UI
page.

You can also choose whether or not you would like to set up a blocking query to
update the UI in real time, rather than upon refresh. This is off by default
because it can have performance implications.

### UI Task Table

As you may have noticed, some pages of the web UI are read-only, while others are interactive. Below is a table with the CRUD actions available for each page.

| Page        | Action
| ----        | ------
| Services    |  Read
| Nodes       |  Read
| Key/Value   |  Create, Read, Update, Delete
| Intentions  |  Create, Read, Update, Delete
| ACLs        |  Create, Read, Update, Delete

### Next Steps

Now that you are comfortable navigating the UI, try using the Consul CLI
<https://www.consul.io/docs/commands/index.html> to accomplish the same tasks
we listed here.

So far you have explored the core functionality of Consul, including service
discovery, securing services with a mesh, and using the key value store.
Continue to the next guide to learn how to set up a Consul datacenter by
joining multiple Consul agents together.

:warning: The next guide relies on VirtualBox <https://www.virtualbox.org/>,
and Vagrant <https://www.vagrantup.com/> to run multiple Consul agents on your
computer at once. 

## Create a Local Consul Datacenter

Now that you have practiced using Consul, it's time to learn a bit more about
how Consul operates. In this guide, you'll create your first datacenter with
multiple members.

:flashlight: When a new Consul agent starts, it doesn't know about other
agents; it is essentially a datacenter with one member. Agents learn about each
other in two ways. 

To add a new agent to an existing datacenter you give it the IP address of any
other agent in the datacenter (either a client or a server), which causes the
new agent to join the datacenter. 

Once the agent is a member of the new datacenter, it automatically learns about
the other agents via gossip.

### Set Up the Environment

:exclamation: Consul is a distributed application that is designed to have one agent per
machine. 

To run two agents on the same computer you will need to install VirtualBox
<https://www.virtualbox.org/>, and Vagrant <https://www.vagrantup.com/>, which
will run virtual machines to simulate a distributed environment.

:shipit: Make a directory to store Vagrant's configuration for this guide.
```bash
mkdir consul-getting-started-join
```

:shipit: Create a new file in the directory called `Vagrantfile` and paste the
content of Consul's demo Vagrant file
<https://github.com/hashicorp/consul/blob/master/demo/vagrant-cluster/Vagrantfile>
into it. 

:shipit: Boot your two virtual machines. 
```bash
vagrant up
```

:shipit: Once the environment is up, ssh into node 1 to begin configuring of your datacenter.
```bash
vagrant ssh n1
```

### Start the Agents

:shipit: Start 1st (Vagrant) Consul agent in server mode
```bash
consul agent \
      -server \
      -bootstrap-expect=1 \
      -node=agent-one \
      -bind=172.20.20.10 \
      -data-dir=/tmp/consul \
      -config-dir=/etc/consul.d
```

* `server` switch <https://www.consul.io/docs/agent/options.html#_server> -
  Providing this flag specifies that we want the agent to start in server mode.
* `-bootstrap-expect` flag
  <https://www.consul.io/docs/agent/options.html#_bootstrap_expect> - This
  tells the Consul server how many servers the datacenter should have in total.
  All the servers will wait for this number to join before bootstrapping the
  replicated log, which keeps data consistent across all the servers. Because
  you are setting up a one-server datacenter, you'll set this value to `1`. You
  can read more about this process in the bootstrapping guide
  <https://www.consul.io/docs/guides/bootstrapping.html>.
* `-node` name <https://www.consul.io/docs/agent/options.html#_node> - Each
  node in a datacenter must have a unique name. By default, Consul uses the
  hostname of the machine, but we'll manually override it, and set it to
  `agent-one`.
* `-bind` address <https://www.consul.io/docs/agent/options.html#_bind> - This
  is the address that this agent will listen on for communication from other
  cluster members. It must be accessible by all other nodes in the datacenter.
  If you don't set a bind address Consul will try to listen on all IPv4
  interfaces and will fail to start if it finds multiple private IPs. Since
  production servers often have multiple interfaces, you should always provide
  a bind address. In this case it is `172.20.20.10`, which you specified as the
  address of the first VM in your Vagrantfile.
* `data-dir` flag <https://www.consul.io/docs/agent/options.html#_data_dir> -
  This flag tells Consul agents where they should store their state, which can
  include sensitive data like ACL tokens for both servers and clients. In
  production deployments you should be careful about the permissions for this
  directory. Find more information in the documentation
  <https://www.consul.io/docs/agent/options.html#_data_dir>. You will set the
  data directory to a standard location: `/tmp/consul`.
* `config-dir` flag <https://www.consul.io/docs/agent/options.html#_config_dir>
  This flag tells consul where to look for its configuration. You will set it
  to a standard location: `/etc/consul.d`.
    
:shipit: Connect to 2nd agent
```bash
vagrant ssh n2
```

:shipit: Start 2nd agent in client mode
```bash
consul agent \
      -node=agent-two \
      -bind=172.20.20.11 \
      -enable-script-checks=true \
      -data-dir=/tmp/consul \
      -config-dir=/etc/consul.d
```
    

Now you have two Consul agents running: one server and one client. The two agents still don't know about each other and each comprise their own single-node datacenters.

:shipit: Verify 2nd agent does not know about 1st agent
```bash
vagrant ssh n2

consul members
```

:shipit: Check the membership of `agent-one`.
```bash
vagrant ssh n1

consul members
```

    Node       Address            Status  Type    Build  Protocol  DC   Segment
    agent-one  172.20.20.10:8301  alive   server  1.5.3  2         dc1  <all>
    

### Join the Agents

:shipit: In 1st vagrant, join the client
```bash
consul join 172.20.20.11
```

:shipit: Run `consul members` again and you will see both agents listed.
```bash
consul members
```

    Node       Address            Status  Type    Build  Protocol  DC   Segment
    agent-one  172.20.20.10:8301  alive   server  1.5.3  2         dc1  <all>
    agent-two  172.20.20.11:8301  alive   client  1.5.3  2         dc1  <default>
    
:exclamation: Consul clients can not function without a server. All datacenters
must have at least one agent running in server mode for Consul to function
correctly.

:exclamation: In datacenters with more than one server, more than half of the
servers must be in communication with each other at all times for the
datacenter to function correctly. This is called maintaining quorum.
<https://www.consul.io/docs/internals/consensus.html>.

:flashlight: To join a datacenter, a Consul agent only needs to learn about one
other existing member, which can be a client or a server. After joining the
datacenter, the agents automatically gossip with each other to propagate full
membership information.

### Notes on Auto-join

:exclamation: In production, new Consul agents should automatically join the
datacenter without human intervention. You can configure Consul to
automatically discover new agents in AWS, Google Cloud or Azure by adding the
relevant cloud auto join
<https://www.consul.io/docs/agent/cloud-auto-join.html> object to your Consul
configuration file. This will allow a new node to join the datacenter without
any hard-coded configuration.

Alternatively, you can provide hard-coded addresses of known Consul agents to
new agents using the `-join` flag
<https://www.consul.io/docs/agent/options.html#_join> or `start_join` setting
<https://www.consul.io/docs/agent/options.html#start_join>.

### Query a Node

You can query Consul agents using the DNS interface or HTTP API.

:exclamation: For the DNS API, the structure of the names is `NAME.node.consul`
or `NAME.node.DATACENTER.consul`. If the datacenter is omitted, Consul will
only search the local datacenter.

:shipit: From Vagrant 1, query the DNS interface for the address of agent-two.
```bash
dig @127.0.0.1 -p 8600 agent-two.node.consul
```

The ability to look up nodes in addition to services is useful for system
administration, in addition to service discovery. 

:flashlight: For example, knowing the address of the node to SSH into is as
easy as making the node a part of the Consul datacenter and querying it.

### Stop the Agents

:shipit: Stop agents from within the vagrant sessions
```bash
consul leave
```

### Clean Up the Environment

:shipit: Shut down vagrant sessions
```bash
vagrant destroy
```

## Next Steps 

- Day 1: Deploying Your First Datacenter ps://learn.hashicorp.com/consul?track=datacenter-deploy#datacenter-deploy>
  
- Documentation <https://www.consul.io/docs/index.html> 
  
- Community Forum <https://discuss.hashicorp.com/c/consul> 
