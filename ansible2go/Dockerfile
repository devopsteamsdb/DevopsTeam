FROM ubuntu:20.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y vim wget curl jq git gnupg2 python3-pip sshpass openssh-client && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install krb5-user krb5-user libkrb5-dev gcc python-dev cifs-utils nfs-common && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN python3 -m pip install --upgrade pip cffi && \
    pip install ansible-core ansible && \
    pip install mitogen ansible-lint jmespath netapp-lib && \
    pip install --upgrade pywinrm && \
    pip install pywinrm[kerberos] requests-kerberos pyvmomi && \
    rm -rf /root/.cache/pip

RUN mkdir /ansible && \
    mkdir -p /etc/ansible && \
    echo 'localhost' > /etc/ansible/hosts

RUN ansible-galaxy collection install ansible.netcommon && \
    ansible-galaxy collection install ansible.utils && \
    ansible-galaxy collection install ansible.windows && \
    ansible-galaxy collection install cisco.aci && \
    ansible-galaxy collection install cisco.ios && \
    ansible-galaxy collection install community.crypto && \
    ansible-galaxy collection install community.docker && \
    ansible-galaxy collection install community.general && \
    ansible-galaxy collection install community.vmware && \
    ansible-galaxy collection install community.windows && \
    ansible-galaxy collection install check_point.mgmt && \
    ansible-galaxy collection install netapp.ontap

RUN wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install -y powershell && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN pwsh -c install-module vmware.powercli,importexcel,pscribo,dbatools,sqlserverdsc,sharepointdsc,cisco.imc,cisco.ucs.core,jenkins,polaris,pswindowsupdate,powershell-yaml -AcceptLicense -Force

WORKDIR /ansible

CMD [ "ansible-playbook", "--version" ]
