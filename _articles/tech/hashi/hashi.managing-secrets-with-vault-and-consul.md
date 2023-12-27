---
categories: tech
tags: hashi devops vault consul
source: https://testdriven.io/blog/managing-secrets-with-vault-and-consul/
author: Michael Herman
title: Managing Secrets with Vault and Consul
---




[:octocat: My
Code](https://github.com/arafatm/learn-managing-secrets-with-vault-and-consul)

[![vault and
consul](https://testdriven.io/static/images/blog/vault-consul-docker/managing_secrets_vault_consul.png)](https://testdriven.io/blog/managing-secrets-with-vault-and-consul/)

The following tutorial details how to set up and use Hashicorp's
[Vault](https://www.vaultproject.io/) and [Consul](https://www.consul.io/)
projects to securely store and manage secrets.

We'll start by spinning up a single instance of Vault within a Docker container
and then jump into managing both
[static](https://learn.hashicorp.com/vault/secrets-management/sm-static-secrets)
and
[dynamic](https://learn.hashicorp.com/vault/getting-started/dynamic-secrets)
secrets along with Vault's "encryption as a service" feature. Then, we'll add
Consul into the mix and look at how to scale Vault.

Main dependencies:
- Docker v19.03.8
- Docker-Compose v1.25.4
- Vault v1.4.0
- Consul v1.7.2

## Objectives

By the end of this tutorial, you should be able to:
1. Explain **what Vault is** and why you may want to use it
1. Describe the **basic Vault architecture** 
1. **dynamic and static secrets**
1. The various **backends** (storage, secret, auth, audit)
1. How Vault can be used as an **"encryption as a service"**
1. Configure and run Vault and Consul with **Docker**
1. Spin up Vault with the **Filesystem backend**
1. **Init** and **unseal** Vault
1. **Authenticate** against Vault
1. **Configure an Audit backend** to log all interactions with Vault
1. Work with static and dynamic secrets via the **CLI, HTTP API, and UI**
1. Create a **Vault policy** to limit access to a specific path
1. Use the **Transit backend** as an "encryption as a service"
1. Set up Consul to work with Vault as **Storage backend** for secrets
1. Define a **custom lease period** for a secret and revoke a secret before the
   end of that period

## What is Vault?

[Vault](https://www.vaultproject.io/) is an open-source tool used for securely
**storing and managing secrets**.

> **Secrets**, in the context of this tutorial, are securely-sensitive or
> personally identifiable info like database credentials, SSH keys, usernames
> and passwords, AWS IAM credentials, API tokens, Social Security Numbers,
> credit card numbers, just to name a few.

Take a moment to think about how your team currently manages and distributes
secrets:
1. Who has access to them?
2. Who manages them?
3. How do you control who has access to them?
4. How do your apps get them?
5. How are they updated?
6. How are they revoked?

Vault provides answers to those questions and helps to solve the following problems with regard to secret management:

| Problems                                           | Vault's Goals
| ---                                                | ---
| Secrets are everywhere.                            | Vault is the single source of truth for all secrets.
| They are generally unencrypted.                    | Vault manages encryption (during transit and at rest) 
| It's difficult to dynamically generate them.       | Secrets can be dynamically generated.
| It's even more difficult to lease and revoke them. | Secrets can be leased and revoked.
| There's no audit trail.                            | There's an audit trail for generating and using secrets.

Vault has a number of moving pieces so it can take some time to get up to speed
with the overall architecture. Take a moment to review the
[Architecture](https://www.vaultproject.io/docs/internals/architecture.html)
guide, taking note of the following backends:

| Backend                                                           | Use                                      | Examples
| ---                                                               | ---                                      | ---
| [Storage](https://www.vaultproject.io/docs/configuration/storage) | Where secrets are stored                 | Consul`*`, Filesystem`*`, In-Memory, PostgreSQL, S3
| [Secret](https://www.vaultproject.io/docs/secrets)                | Handles static or dynamic secrets        | AWS`*`, Databases, Key/Value`*`, RabbitMQ, SSH
| [Auth](https://www.vaultproject.io/docs/auth)                     | Handles authentication and authorization | AWS, Azure, Google Cloud, GitHub, Tokens`*`, Username & Password
| [Audit](https://www.vaultproject.io/docs/auth)                    | Logs all requests and responses          | File`*`, Syslog, Socket

`*` used in this tutorial

## Filesystem Backend

To get up and running quickly, we'll use the
[Filesystem](https://www.vaultproject.io/docs/configuration/storage/filesystem.html)
backend to store secrets at rest.

> The filesystem backend should only be used for local development or a
> single-server Vault deployment since it does not support high availability.

:shipit: Create a new project directory:
```bash
mkdir vault-consul-docker && cd vault-consul-docker
```

:shipit: Then add the following folders:
```
└── vault
    ├── config
    ├── data
    ├── logs
    └── policies
```

:shipit: Add a `Dockerfile` to the "vault" directory:
```docker
 # base image
FROM alpine:3.11

 # set vault version
ENV VAULT_VERSION 1.4.0

 # create a new directory
RUN mkdir /vault

 # download dependencies
RUN apk --no-cache add \
      bash \
      ca-certificates \
      wget

 # download and set up vault
RUN wget --quiet --output-document=/tmp/vault.zip https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && \
    unzip /tmp/vault.zip -d /vault && \
    rm -f /tmp/vault.zip && \
    chmod +x /vault

 # update PATH
ENV PATH="PATH=$PATH:$PWD/vault"

 # add the config file
COPY ./config/vault-config.json /vault/config/vault-config.json

 # expose port 8200
EXPOSE 8200

 # run vault
ENTRYPOINT ["vault"]
```

:shipit: Next, add a `docker-compose.yml` file to the project root:
```yml
version: '3.7'
services:
  vault:
    build:
      context: ./vault
      dockerfile: Dockerfile
    ports:
      - 8200:8200
    volumes:
      - ./vault/config:/vault/config
      - ./vault/policies:/vault/policies
      - ./vault/data:/vault/data
      - ./vault/logs:/vault/logs
    environment:
      - VAULT_ADDR=http://127.0.0.1:8200
      - VAULT_API_ADDR=http://127.0.0.1:8200
    command: server -config=/vault/config/vault-config.json
    cap_add:
      - IPC_LOCK
```

:shipit: Add a config file called `vault-config.json` to "vault/config":
```json
{
  "backend": {
    "file": {
      "path": "vault/data"
    }
  },
  "listener": {
    "tcp":{
      "address": "0.0.0.0:8200",
      "tls_disable": 1
    }
  },
  "ui": true
}
```

Here, we configured Vault to use the Filesystem backend, defined the
[listener](https://www.vaultproject.io/docs/configuration/listener/tcp.html) for Vault, 
[disabled TLS](https://www.vaultproject.io/docs/configuration/listener/tcp.html#tls_disable), and 
[enable Vault UI](https://www.vaultproject.io/docs/configuration/ui).

Review the [docs](https://www.vaultproject.io/docs/configuration) for
more info on configuring Vault.

:shipit: Now we can build the image and spin up the container:
```bash
docker-compose up -d --build
```

Pull up the Docker logs to make sure there were no errors in the build:
```bash
docker-compose logs
```

:flashlight: You should see something similar to:
```
Attaching to vault-consul-docker_vault_1
vault_1  | ==\> Vault server configuration:
vault_1  |
vault_1  |              Api Address: http://127.0.0.1:8200
vault_1  |                      Cgo: disabled
vault_1  |          Cluster Address: https://127.0.0.1:8201
vault_1  |               Listener 1: tcp (addr: "0.0.0.0:8200", cluster address: "0.0.0.0:8201", max_request_duration: "1m30s", max_request_size: "33554432", tls: "disabled")
vault_1  |                Log Level: info
vault_1  |                    Mlock: supported: true, enabled: true
vault_1  |            Recovery Mode: false
vault_1  |                  Storage: file
vault_1  |                  Version: Vault v1.4.0
vault_1  |
vault_1  | 2020-04-23T13:41:20.548Z [INFO]  proxy environment: http_proxy= https_proxy= no_proxy=
vault_1  | ==\> Vault server started! Log data will stream in below:
```

## Initializing and Unsealing

:shipit: Start a bash session within the running container:
```bash
docker-compose exec vault bash
```

:shipit: Within the shell, initialize Vault:
```bash
vault operator init
```

Take note of the unseal keys and the initial root token. You will need to
provide three of the unseal keys every time the Vault server is re-sealed
or restarted.

> Why 3 keys? Review [Shamir's Secret
> Sharing](https://en.wikipedia.org/wiki/Shamir's_Secret_Sharing).

:shipit: Now you can unseal Vault using three of the keys:
```bash
vault operator unseal
    # Unseal Key (will be hidden):
```

:shipit: Run this command two more times, using different keys each time.
Once done, make sure `Sealed` is `false`:

    Key             Value
    ---             -----
    Seal Type       shamir
    Initialized     true
    Sealed          false
    Total Shares    5
    Threshold       3
    Version         1.4.0
    Cluster Name    vault-cluster-4313f896
    Cluster ID      2de59cdb-6f78-a031-034e-855078f6ac37
    HA Enabled      false

:boom: `Sealed          false`

:shipit: Using the root token, you can now authenticate:
```bash
vault login
    # Token (will be hidden):
```

:flashlight: You should see something similar to:

    Success! You are now authenticated. The token information displayed
    below is already stored in the token helper. You do NOT need to run
    "vault login" again. Future Vault requests will automatically use
    this token.

    Key                  Value
    ---                  -----
    token                s.lAnvF5LsOqODvaWq1B9mOJi9
    token_accessor       FNoERnaKGDn9C4YuIUDzRiPW
    token_duration       ∞
    token_renewable      false
    token_policies       ["root"]
    identity_policies    []
    policies             ["root"]

> Keep in mind that this uses the root policy. In production you'll want
> to set up policies with different levels of access. We'll look at how
> to do this shortly.

![vault
init](https://testdriven.io/static/images/gifs/blog/vault-consul-docker/vault-init.gif)

Vault is now unsealed and ready for use.

## Auditing

:shipit: Before we test out the functionality, let's enable an [Audit
Device](https://www.vaultproject.io/docs/audit):
```bash
vault audit enable file file_path=/vault/logs/audit.log
```

    Success! Enabled the file audit device at: file/

:shipit: You should now be able to view the logs locally in "vault/logs".
To test, run the following command to view all enabled Audit Devices:
```bash
vault audit list
```

    Path     Type    Description
    ----     ----    -----------
    file/    file    n/a

:flashlight: The request and subsequent response should be logged in
`vault/logs/audit.log`. Take a look.

## Secrets

There are two types of secrets in Vault:
[static](https://learn.hashicorp.com/vault/secrets-management/sm-static-secrets)
and
[dynamic](https://learn.hashicorp.com/vault/getting-started/dynamic-secrets).

1. **Static** secrets (think encrypted Redis or Memcached) have refresh
   intervals but they do not expire unless explicitly revoked. They are
   defined ahead of time with the
   [Key/Value](https://www.vaultproject.io/docs/secrets/kv) backend
   (formerly the "generic" backend) and then shared. ![secure secret
   storage](https://testdriven.io/static/images/blog/vault-consul-docker/vault-secure_secret_storage.png)
2. **Dynamic** secrets are generated on demand. They have enforced leases
   and generally expire after a short period of time. Since they do not
   exist until they are accessed, there's less exposure -- so dynamic
   secrets are much more secure. Vault ships with a number of dynamic
   backends -- i.e., [AWS](https://www.vaultproject.io/docs/secrets/aws),
   [Databases](https://www.vaultproject.io/docs/secrets/databases),
   [Google Cloud](https://www.vaultproject.io/docs/secrets/gcp),
   [Consul](https://www.vaultproject.io/docs/secrets/consul), and
   [RabbitMQ](https://www.vaultproject.io/docs/secrets/rabbitmq).
    
> Review the [Why We Need Dynamic
> Secrets](https://www.hashicorp.com/blog/why-we-need-dynamic-secrets)
> blog post for more info on the advantages of using dynamic secrets.

## Static Secrets

Vault can be managed through the
[CLI](https://www.vaultproject.io/docs/commands), 
[HTTP API](https://www.vaultproject.io/api-docs), or
[UI](https://www.vaultproject.io/docs/configuration/ui).

### CLI

Still within the bash session in the container, we can create, read,
update, and delete secrets. We'll also look at how to version and roll
back secrets.

:shipit: Enable secrets with following command:
```bash
vault secrets enable kv
```

    Success! Enabled the kv secrets engine at: kv/

:shipit: Create a new secret with a key of `bar` and value of `precious`
within the `kv/foo` path:
```bash
vault kv put kv/foo bar=precious
```

    Success! Data written to: kv/foo

:shipit: Read:
```bash
vault kv get kv/foo
```

    === Data ===
    Key    Value
    ---    -----
    bar    precious

:shipit: To work with different versions of a specific key, we'll need to
upgrade to [v2](https://www.vaultproject.io/docs/secrets/kv/kv-v2.html)
of the [Key/Value](https://www.vaultproject.io/docs/secrets/kv) backend:
```bash
vault kv enable-versioning kv/
```

    Success! Tuned the secrets engine at: kv/

:shipit: Add version 2 by updating the value to `copper`:
```bash
vault kv put kv/foo bar=copper
```

    Key              Value
    ---              -----
    created_time     2020-04-23T13:59:41.4928751Z
    deletion_time    n/a
    destroyed        false
    version          2

:shipit: Read version 1:
```bash
vault kv get -version=1 kv/foo
```

    ====== Metadata ======
    Key              Value
    ---              -----
    created_time     2020-04-23T13:59:31.3575991Z
    deletion_time    n/a
    destroyed        false
    version          1

    === Data ===
    Key    Value
    ---    -----
    bar    precious

:shipit: Read version 2:
```bash
vault kv get -version=2 kv/foo
```

    ====== Metadata ======
    Key              Value
    ---              -----
    created_time     2020-04-23T13:59:41.4928751Z
    deletion_time    n/a
    destroyed        false
    version          2

    === Data ===
    Key    Value
    ---    -----
    bar    copper

:shipit: Delete the latest version (e.g., version 2):
```bash
vault kv delete kv/foo
```

    Success! Data deleted (if it existed) at: kv/foo

:shipit: Delete version 1:
```bash
vault kv delete -versions=1 kv/foo
```

    Success! Data deleted (if it existed) at: kv/foo

:shipit: You can undelete as well:
```bash
vault kv undelete -versions=1 kv/foo
```

    Success! Data written to: kv/undelete/foo

:shipit: Delete is akin to a soft delete. If you want to remove the
underlying metadata, you'll have to use the
[destroy command](https://www.vaultproject.io/api/secret/kv/kv-v2.html#destroy-secret-versions)
```bash
vault kv destroy -versions=1 kv/foo
```

    Success! Data written to: kv/destroy/foo

Review [v1](https://www.vaultproject.io/api/secret/kv/kv-v1.html) and
[v2](https://www.vaultproject.io/docs/secrets/kv) to view all the
available commands.

> Take note of the audit log. Each of the above requests were logged!

### API

You can also interact with Vault via the [HTTP
API](https://learn.hashicorp.com/vault/getting-started/apis). 

We'll make requests against
[v2](https://www.vaultproject.io/api/secret/kv/kv-v2.html) of the API.

:shipit: Open a new terminal tab, and then set the root token as an
environment variable:
```bash
export VAULT_TOKEN=your_token_goes_here
```

:shipit: Create a new secret called `foo` with a value of `world`:
```bash
curl \
    -H "X-Vault-Token: $VAULT_TOKEN" \
    -H "Content-Type: application/json" \
    -X POST \
    -d '{ "data": { "foo": "world" } }' \
    http://127.0.0.1:8200/v1/kv/data/hello
```

:shipit: Read the secret:
```bash
curl \
    -H "X-Vault-Token: $VAULT_TOKEN" \
    -X GET \
    http://127.0.0.1:8200/v1/kv/data/hello
```

The JSON response should contain a `data` key with a value similar to:

    "data":{
      "data":{
        "foo":"world"
      },
      "metadata":{
        "created_time":"2020-04-23T14:05:59.8426681Z",
        "deletion_time":"",
        "destroyed":false,
        "version":1
      }
    }

![vault
api](https://testdriven.io/static/images/gifs/blog/vault-consul-docker/vault-api-static-secrets.gif)

Try adding new versions, deleting, and destroying on your own.

### UI

The [UI](https://www.vaultproject.io/docs/configuration/ui) should be up
at running at
[http://localhost:8200/ui/vault](http://localhost:8200/ui/vault). 

:shipit: Use the root token to login. Then, explore the Key/Value backend on your own:

![vault ui](https://testdriven.io/static/images/blog/vault-consul-docker/vault-ui_new.png)

## Policies

Thus far we've been using the [root
policy](https://www.vaultproject.io/docs/concepts/policies.html#root-policy)
to interact with the API. 

:flashlight: Let's set up a policy that only has read access.

:shipit: Add a new config file `vault/policies/app-policy.json` 
```
{
  "path": {
    "kv/data/app/*": {
      "policy": "read"
    }
  }
}
```

:shipit:
Create [a new
policy](https://www.vaultproject.io/docs/concepts/policies.html#creating-policies)
back in the bash session:
```bash
vault policy write app /vault/policies/app-policy.json
```

    Success! Uploaded policy: app

:shipit: Then, create a new token:
```bash
vault token create -policy=app
```

    Key                  Value
    ---                  -----
    token                s.LiR0ARtAU5NGgwEWTFDrcUr3
    token_accessor       xHceqRcuCbBJQ3fGdTjydxQY
    token_duration       768h
    token_renewable      true
    token_policies       ["app" "default"]
    identity_policies    []
    policies             ["app" "default"]

:shipit: Within another new terminal tab (you should now have three), add
the `VAULT_TOKEN` environment variable with the new token:
```bash
export VAULT_TOKEN=your_token_goes_here
```

:shipit: Try to read the `foo` secret that we previously set:
```bash
curl \
    -H "X-Vault-Token: $VAULT_TOKEN" \
    -X GET \
    http://127.0.0.1:8200/v1/kv/data/hello
```

:warning: You should not have the correct permissions to view that
secret:

    {
      "errors":[
        "1 error occurred:\n\t* permission denied\n\n"
      ]
    }

Why can't we even read it? Jump back to the policy config in
`vault-config.json`. `kv/data/app/*` indicates that the policy can
only read from the `app` path.

> As you've probably already noticed, nearly everything in Vault is
> path-based.

:shipit: Back within the bash session in the container, add a new secret
to the `app/test` path:
```bash
vault kv put kv/app/test ping=pong
```

    Key              Value
    ---              -----
    created_time     2020-04-23T14:17:46.188168Z
    deletion_time    n/a
    destroyed        false
    version          1

:shipit: You should be able to view the secret using the token associated with the `app` policy:
```bash
curl \
    -H "X-Vault-Token: $VAULT_TOKEN" \
    -X GET \
    http://127.0.0.1:8200/v1/kv/data/app/test
```

Policies can be managed from the UI as well:

![vault ui](https://testdriven.io/static/images/blog/vault-consul-docker/vault-ui-policies_new.png)

## Encryption as a Service

Before we look at dynamic secrets, let's quickly review the
[Transit](https://www.vaultproject.io/docs/secrets/transit) backend,
which can be used as an "encryption as a service" for:
- Encrypting and decrypting data "in-transit" without storing it inside
  Vault
- Easily integrating encryption into your application workflow

:shipit: Back within the bash session in the container, enable Transit:
```bash
vault secrets enable transit
```

:shipit: Configure a named encryption key:
```bash
vault write -f transit/keys/foo
```

:shipit: Encrypt:
```bash
vault write transit/encrypt/foo plaintext=$(base64 <<< "my precious")
```

:shipit: Decrypt:
```bash
vault write transit/decrypt/foo ciphertext=vault:v1:WB8MSIFdlssLP1kK7BciQvdX3rSlYnLy+Q6R74wb61L5WVk6xGdUig==
```

:shipit: Decode:
```bash
base64 -d <<< "bXkgcHJlY2lvdXMK"
```

Test it out in the UI as well:

![vault ui](https://testdriven.io/static/images/gifs/blog/vault-consul-docker/vault-ui-transit.gif)

## Dynamic Secrets

As mentioned, Vault supports a number of dynamic secret backends for
generating secrets dynamically when needed. For example, with the
[AWS](https://www.vaultproject.io/docs/secrets/aws) and [Google
Cloud](https://www.vaultproject.io/docs/secrets/gcp) backends, you can
create access credentials based on IAM policies. 

The [Databases](https://www.vaultproject.io/docs/secrets/databases)
backend, meanwhile, generates database credentials based on configured
roles.

_Dynamic Secrets:_
- are generated on demand
- have limited access based on role
- are leased for a period of time
- can be revoked
- come with an audit trail

Let's look at how to generate AWS credentials using the AWS backend.

#### AWS Credentials

:shipit: Enable the AWS secrets backend:
```bash
vault secrets enable -path=aws aws
```

:shipit: Authenticate:
```bash
vault write aws/config/root access_key=foo secret_key=bar
```

> Make sure to replace `foo` and `bar` with your AWS access key id and
> secret key, respectively.

:shipit: Create role:
```bash
vault write aws/roles/ec2-read credential_type=iam_user policy_document=-<<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Sid": "Stmt1426528957000",
     "Effect": "Allow",
     "Action": [
       "ec2:*"
     ],
     "Resource": [
       "*"
     ]
   }
 ]
}
EOF
```

Here, we created a new role based on `AmazonEC2ReadOnlyAccess`, which is
an AWS-managed
[policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html).
As the name suggests, it give users read-only access to the EC2 console;
they cannot perform any actions or create new resources. You can also use
an inline policy to create a custom role based on your individual needs.
We'll look at an example of this shortly. Refer to the [AWS Secrets
Engine](https://www.vaultproject.io/docs/secrets/aws) docs for more info.

> **Remember**: Dynamic Secrets are generated only when they are
> requested (i.e., a web app requests access to S3). They are not
> available in the store before this.

:shipit: Create a new set of credentials:
```bash
vault read aws/creds/ec2-read
```

You should now be able to see the user within the "Users" section on the
[IAM console](https://console.aws.amazon.com/iam) on AWS:

![aws
iam](https://testdriven.io/static/images/blog/vault-consul-docker/iam_new.png)

## Leases and Revocation

In this section we'll take a quick look at how to define a custom lease
period and revoke a secret before the end of that period.

:shipit: Create a new AWS role:
```bash
vault write aws/roles/foo credential_type=iam_user policy_document=-<<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Sid": "Stmt1426528957000",
     "Effect": "Allow",
     "Action": [
       "ec2:*"
     ],
     "Resource": [
       "*"
     ]
   }
 ]
}
EOF
```

:shipit: Take note of the `lease_duration` when you create a new AWS
credential:
```bash
vault read aws/creds/foo
```

:shipit: What if you only wanted the lease period for all AWS IAM dynamic
secrets to be 30 minutes?
```bash
vault write aws/config/lease lease=1800s lease_max=1800s
```

In this example, since `lease_max` is the same as `lease`, you won't be
able to renew the token. If you set the `lease_max` to `3600s`, you'd be
able to renew the lease once. For more, review the [Tokens and
Leases](https://learn.hashicorp.com/vault/identity-access-management/tokens)
guide.

:shipit: Create a new credential:
```bash
vault read aws/creds/foo
```

:shipit: Want to quickly revoke this credential? Grab the `lease_id` and
then run:
```bash
vault lease revoke aws/creds/foo/xQlJpKDS1ljE9Awz0aywXgbB
```

:shipit: Want to revoke all AWS creds?
```bash
vault lease revoke -prefix aws/
```

Refer to the [Lease, Renew, and
Revoke](https://www.vaultproject.io/docs/concepts/lease.html) guide for
more info these concepts.

## Consul Backend

Thus far, we've been using the
[Filesystem](https://www.vaultproject.io/docs/configuration/storage/filesystem.html)
backend. This will not scale beyond a single server, so it does not take
advantage of Vault's high availability. 

Fortunately, there are a number of other
[Storage](https://www.vaultproject.io/docs/configuration/storage)
backends, like the
[Consul](https://www.vaultproject.io/docs/configuration/storage/consul.html)
backend, designed for distributed systems.

:shipit: To set up [Consul](https://www.consul.io/), start by updating
the `docker-compose.yml` file:
```yml
version: '3.7'

services:
  vault:
    build:
      context: ./vault
      dockerfile: Dockerfile
    ports:
      - 8200:8200
    volumes:
      - ./vault/config:/vault/config
      - ./vault/policies:/vault/policies
      - ./vault/data:/vault/data
      - ./vault/logs:/vault/logs
    environment:
      - VAULT_ADDR=http://127.0.0.1:8200
      - VAULT_API_ADDR=http://127.0.0.1:8200
    command: server -config=/vault/config/vault-config.json
    cap_add:
      - IPC_LOCK
    depends_on:
      - consul

  consul:
    build:
      context: ./consul
      dockerfile: Dockerfile
    ports:
      - 8500:8500
    command: agent -server -bind 0.0.0.0 -client 0.0.0.0 -bootstrap-expect 1 -config-file=/consul/config/config.json
    volumes:
      - ./consul/config/consul-config.json:/consul/config/config.json
      - ./consul/data:/consul/data
```

:shipit: Add a new directory in the project root called "consul", and then add a new `Dockerfile` to that newly created directory:
```
 # base image
FROM alpine:3.11

 # set consul version
ENV CONSUL_VERSION 1.7.2

 # create a new directory
RUN mkdir /consul

 # download dependencies
RUN apk --no-cache add \
      bash \
      ca-certificates \
      wget

 # download and set up consul
RUN wget --quiet --output-document=/tmp/consul.zip https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip && \
    unzip /tmp/consul.zip -d /consul && \
    rm -f /tmp/consul.zip && \
    chmod +x /consul/consul

 # update PATH
ENV PATH="PATH=$PATH:$PWD/consul"

 # add the config file
COPY ./config/consul-config.json /consul/config/config.json

 # expose ports
EXPOSE 8300 8400 8500 8600

 # run consul
ENTRYPOINT ["consul"]
```

:shipit: Next, within the "consul" directory add two new directories: "config" and "data". Then, within "config", add a config file called `consul-config.json`:
```
{
  "datacenter": "localhost",
  "data_dir": "/consul/data",
  "log_level": "DEBUG",
  "server": true,
  "ui": true,
  "ports": {
    "dns": 53
  }
}
```

> Be sure to review the
> [Configuration](https://www.consul.io/docs/agent/options.html) options
> from the Consul docs for more info on the above options.

:flashlight: The "consul" directory should now look like:
```
├── Dockerfile
├── config
│   └── consul-config.json
└── data
```

:shipit: Exit out of the bash session. Bring the container down, and then
update the Vault config file:
```
{
  "backend": {
    "consul": {
      "address": "consul:8500",
      "path": "vault/"
    }
  },
  "listener": {
    "tcp":{
      "address": "0.0.0.0:8200",
      "tls_disable": 1
    }
  },
  "ui": true
}
```

So, now we're using the
[Consul](https://www.vaultproject.io/docs/configuration/storage/consul.html)
backend instead of the Filesystem. We used the name of the service,
`consul`, as part of the address. The `path` key defines the path in
Consul's key/value store where the Vault data will be stored.

:shipit: Clear out all files and folders within the "vault/data" directory
to remove the Filesystem backend. Build the new images and spin up the
containers:
```bash
docker-compose down
docker-compose up -d --build
```

Ensure all is well by navigating in your browser to [http://localhost:8500/ui](http://localhost:8500/ui):

![consul ui](https://testdriven.io/static/images/blog/vault-consul-docker/consul-ui.png)

Test this out from the CLI or UI.

### CLI

:shipit: Create a new bash session in the Vault container:
```bash
docker-compose exec vault bash
```

:shipit: Then, run:
```
 # Init
bash-5.0# vault operator init

 # Unseal
bash-5.0# vault operator unseal

 # Authenticate
bash-5.0# vault login

 # Enable secrets
bash-5.0# vault secrets enable kv

 # Add a new static secret
bash-5.0# vault kv put kv/foo bar=precious

 # Read it back
bash-5.0# vault kv get kv/foo
```

### UI

![vault
consul](https://testdriven.io/static/images/gifs/blog/vault-consul-docker/vault-consul.gif)

> Notice how there's no files or folders within "vault/data". Why do you
> think this is?

:shipit: Want to add another Consul server into the mix? Add a new service
to `docker-compose.yml`:
```
consul-worker:
  build:
    context: ./consul
    dockerfile: Dockerfile
  command: agent -server -join consul -config-file=/consul/config/config.json
  volumes:
    - ./consul/config/consul-config.json:/consul/config/config.json
  depends_on:
    - consul
```

Here, we used the [join](https://www.consul.io/docs/commands/join.html)
command to connect this agent to an existing cluster. Notice how we simply
had to reference the service name: `consul`.

Then:
1. Exit from the bash session (if necessary)
2. Bring down the containers
3. Clear out the data directory in "consul/data" (Why?)
4. Spin the containers back up and test

![consul
ui](https://testdriven.io/static/images/blog/vault-consul-docker/consul-ui2_new.png)

## Conclusion

In this tutorial, we went over how to set up and run Vault and Consul
inside a Docker container. You should now have a clear understanding of
how to interact with Vault and perform basic operations.

Grab the final code from the
[vault-consul-docker](https://github.com/testdrivenio/vault-consul-docker)
repo. Check out the
[presentation](https://mherman.org/presentations/vault/) as well.

Looking for more? Take a look at the following posts:

1. [Deploying Vault and Consul](https://testdriven.io/blog/deploying-vault-and-consul/)
2. [Dynamic Secret Generation with Vault and Flask](https://testdriven.io/blog/dynamic-secret-generation-with-vault-and-flask/)

[Docker](chrome-extension://cjedbglnccaioiolemnfhjncicchinao/blog/topics/docker/)

[DevOps](chrome-extension://cjedbglnccaioiolemnfhjncicchinao/blog/topics/devops/)