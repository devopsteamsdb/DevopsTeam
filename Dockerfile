FROM python:3

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y gnupg2 sshpass git openssh-client && \
    apt-get install -y gcc libkrb5-dev cifs-utils && \
    apt-get install -y default-jre && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN python -m pip install --upgrade pip
   
RUN pip install ansible && \
    pip install ansible-core && \
    pip install mitogen ansible-lint jmespath && \
    pip install --upgrade pywinrm && \
    pip install pywinrm[kerberos] requests-kerberos pyvmomi && \
    rm -rf /root/.cache/pip

RUN mkdir /ansible && \
    mkdir -p /etc/ansible && \
    echo 'localhost ansible_connection=local' > /etc/ansible/hosts

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
    ansible-galaxy collection install netapp.ontap

RUN wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
	apt-get update && \
	apt-get install -y powershell
	
RUN pwsh -c install-module vmware.powercli -Force

WORKDIR /ansible

CMD [ "ansible-playbook", "--version" ]
