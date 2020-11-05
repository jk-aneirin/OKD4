ceph-dashboard document: <br>
https://rook.io/docs/rook/v1.3/ceph-dashboard.html <br>
URL of our ceph cluster dashboard:<br>
https://1.2.3.4:32303/  (IP belonging to worker node is accessible)<br>
how to get login passwd?<br>
oc -n rook-ceph get secret rook-ceph-dashboard-password -o jsonpath="{['data']['password']}" | base64 --decode && echo
