There are two methods to deploy traefik,one is deployed using hostNetwork,the other is deployed using clusterip.<br>
'2-scc.yaml' must be apply before '3-deployment-hostnetwork.yaml' can be deployed.<br>
'4-traefik-ui.yaml' should be deployed in the case of traefik is deployed using clusterip.

