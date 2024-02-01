 #!/bin/bash
oc patch StorageCluster ocs-storagecluster -p '{"metadata":{"finalizers":[]}}' --type=merge
oc delete StorageCluster --all
oc patch StorageSystem ocs-storagecluster-storagesystem -p '{"metadata":{"finalizers":[]}}' --type=merge
oc delete StorageSytem --all
oc delete csv --all
oc patch cephobjectstore.ceph.rook.io ocs-storagecluster-cephobjectstore  -p '{"metadata":{"finalizers":[]}}' --type=merge
oc patch cephclusters.ceph.rook.io ocs-storagecluster-cephcluster  -p '{"metadata":{"finalizers":[]}}' --type=merge
oc patch cephfilesystems.ceph.rook.io ocs-storagecluster-cephfilesystem -p '{"metadata":{"finalizers":[]}}' --type=merge
oc patch cephobjectstoreusers.ceph.rook.io ocs-storagecluster-cephobjectstoreuser -p '{"metadata":{"finalizers":[]}}' --type=merge
oc patch noobaas.noobaa.io noobaa -p '{"metadata":{"finalizers":[]}}' --type=merge
oc patch cephblockpools.ceph.rook.io ocs-storagecluster-cephblockpool -p '{"metadata":{"finalizers":[]}}' --type=merge
oc patch cephobjectstoreuser.ceph.rook.io noobaa-ceph-objectstore-user -p '{"metadata":{"finalizers":[]}}' --type=merge
oc delete ns openshift-storage

