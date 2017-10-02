#!/bin/sh

TOKEN=`kubectl get csr | grep csr | grep -i pending | cut -f1 -d " " | head -n 1`
if [[ -n "$TOKEN" ]]; then
  kubectl certificate approve $TOKEN
  echo "CSR: $TOKEN had been approved." >> /var/log/auto_approval.log
else
  echo "CSR not found." >> /var/log/auto_approval.log
fi
