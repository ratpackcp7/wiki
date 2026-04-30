---
source_url: https://fly.io/blog/fks-beta-live/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-08-fly-io-fks-beta
---

# Fly Kubernetes does more now

Fly Kubernetes (FKS) Beta — managed K8s on Fly.io.

"No-Node" model using Virtual Kubelet: Pods → Fly Machines, runtime → flyd+Firecracker, networking → WireGuard 6PN, services → Fly Proxy, secrets → native Fly Secrets.

Create: `fly ext k8s create --name hello --org personal --region iad`
Deploy: standard kubectl commands.
Verify: `fly machine list` (pods are Machines).

Supported: Deployments, ReplicaSets, Pod communication, DNS, GPU.
Coming: HPA, emptyDir volumes, multi-container pods.
Not yet: StatefulSets, Network Policies, kubectl port-forward/exec (use flyctl).

Pricing: Free during beta, $75/month/cluster post-beta. Closed beta.
