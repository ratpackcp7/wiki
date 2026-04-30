---
source_url: https://simonwillison.net/2026/Jan/22/ssh-has-no-host-header/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-01-22-simon-willison-ssh-has-no-host-header
---

# SSH has no Host header

[SSH has no Host header](https://blog.exe.dev/ssh-host-header) ([via](https://lobste.rs/s/7oqiqi/ssh_has_no_host_header))

exe.dev is a new hosting service that, for $20/month, gives you up to 25 VMs "that share 2 CPUs and 8GB RAM". Everything happens over SSH, including creating new VMs. Once configured you can sign into your exe.dev VMs like this:

    ssh simon.exe.dev

Here's the clever bit: when you run the above command `exe.dev` signs you into your VM of that name... but they don't assign every VM its own IP address and SSH has no equivalent of the Host header, so how does their load balancer know _which_ of your VMs to forward you on to?

The answer is that while they don't assign a unique IP to every VM they _do_ have enough IPs that they can ensure each of your VMs has an IP that is unique to your account.

If I create two VMs they will each resolve to a separate IP address, each of which is shared with many other users. The underlying infrastructure then identifies my user account from my SSH public key and can determine which underlying VM to forward my SSH traffic to.

Posted 22nd January 2026 at 11:57 pm

Tags: dns, hosting, ssh

## Primary source: exe.dev blog

We have a challenge with ssh. Every VM has a standard URL that we use for both HTTPS and SSH, e.g. `undefined-behavior.exe.xyz`. Just as you can type the domain into a web browser (and have TLS and auth taken care of for you), you can run:

    ssh undefined-behavior.exe.xyz

To get a shell in your VM.

This is very straightforward to implement if you give each machine its own IP address, but exe.dev gives you many VMs on a flat rate subscription.

We cannot issue an IPv4 address to each machine without blowing out the cost of the subscription. We cannot use IPv6-only as that means some of the internet cannot reach the VM over the web. That means we have to share IPv4 addresses between VMs.

For the web, this is a long-solved problem. Many sites can and do have the same IP address. Web browsers send the domain they used to reach the server in the HTTP request as the `Host` header. The exe.dev proxy switches on this header and send requests to the appropriate VM.

SSH, on the other hand, has no equivalent of a Host header. If we reuse IPv4 addresses between VMs, we have no way to send SSH connections to the right VM.

### How we solved this: SSH IP sharing

Instead of using one IP address for all VMs, they have a pool of public IPv4 addresses. Each VM is assigned a unique address relative to its owner.

So instead of an A record, you will find:

    $ dig undefined-behavior.exe.xyz
    ;; ANSWER SECTION:
    undefined-behavior.exe.xyz. 230 IN      CNAME   s003.exe.xyz.
    s003.exe.xyz.           230     IN      A       16.145.102.7

_Relative to its owner_ means that while the IP represented by s003 is used by many VMs, it is only used by one VM owned by this user.

This is all the extra information they need to route SSH connections. When SSH connects, it presents a public key and comes in via a particular IP address. The public key tells them the user, and the `{user, IP}` tuple uniquely identifies the VM they are connecting to.

Building a proxy that does this requires some cross-system communication: when they create a VM they have to allocate it an IP carefully based on the user (or team) that owns it. Their ssh proxy has to be able to determine the local IP a request came in on, which is easy on bare metal, harder in a cloud environment where public IPs are NATed on to private VPC addresses.
