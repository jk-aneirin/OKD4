ceph-dashboard document:
https://rook.io/docs/rook/v1.3/ceph-dashboard.html
URL of our ceph cluster dashboard,
https://1.2.3.4:32303/  (IP belonging to worker node is accessible)
how to get login passwd?
oc -n rook-ceph get secret rook-ceph-dashboard-password -o jsonpath="{['data']['password']}" | base64 --decode && echo
