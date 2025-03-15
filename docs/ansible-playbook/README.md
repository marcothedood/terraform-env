Ansible Configuration and Deployment
------------------------------------
> Automating system setup and application deployment using Ansible.

The high-level procedure to configure a system using Ansible follows a structured approach:

1. Define the roles and their tasks in an organized manner.
2. Prepare an inventory file listing all the hosts and their details.
3. Configure Ansible to connect via SSH and execute playbooks.
4. Run the playbooks to automate system configuration and application deployment.

## Folder Structure

To keep our Ansible setup modular and reusable, we organize our repository as follows:

```
ansible/
└── matomo-env
    ├── ansible.cfg
    ├── handlers/
    │   └── main.yml
    ├── inventory.yml
    ├── matomoprovisioning/
    │   └── tasks/
    │       └── main.yaml
    ├── pkgs/
    │   └── tasks/
    │       └── main.yaml
    ├── site.yml
    ├── sysconfig/
    │   └── tasks/
    │       └── main.yaml
    ├── templates/
    │   ├── matomo_config.ini.j2
    │   └── matomo_nginx.conf.j2
    ├── tools/
    │   └── matomo.zip
    └── vars/
        └── secrets.yml
```

### Inventory Setup

The inventory file defines the hosts that Ansible will manage. It is located at `matomo-env/inventory.yml`.

Example: `matomo-env/inventory.yml`
```yaml
all:
  vars:
    secrets_file: vars/secrets.yml
  hosts:
    matomo_server:
      ansible_host: IPv4 or Hostname
      domain: domain for the NGINX config.
      admin_mail: Admin email needed to request certificate issuing (certbot)
      ansible_user: user on remote machine
      ansible_ssh_private_key_file: PATH to SSH pvt key
      ansible_become: true
      ansible_become_method: sudo
```

## Playbooks

#### Site Playbook (`site.yml`)
This playbook runs all tasks needed to set up the environment.
Here we explicitly say to bring the vault in and we persist it for all the roles.

```yaml

- name: Load secret variables
  hosts: matomo_server
  tasks:
    - name: Load secret variables
      include_vars:
        file: vars/secrets.yml
  tags:
    - always
[.......]
```

## Roles

#### System Configuration Role (`sysconfig`)
This role sets up the operating system, checks for the volumes and mounts them.

Tasks (`sysconfig/tasks/main.yaml`)


#### Package Installation Role (`pkgs`)
This role installs all required packages for Matomo.

Tasks (`pkgs/tasks/main.yaml`)

#### Matomo Provisioning Role (`matomoprovisioning`)
This role automates the installation and configuration of Matomo.

Tasks (`matomoprovisioning/tasks/main.yaml`)

## Templates

The `templates/` directory contains Jinja2 templates for Matomo configuration.

- `matomo_config.ini.j2`: Configuration file for Matomo.
- `matomo_nginx.conf.j2`: Nginx virtual host configuration.

### Running the Playbooks

To apply the system configuration and deploy Matomo:

cd into ansible/matomo-env/

```sh
ansible-playbook -i inventory.yml site.yml --add-vault-pass 
```
```Provide ansible vault pwd```

We've tagged every task in each playbook with a tag named as the corresponding role. For troubleshooting purposes, you could append ```-t "NAME OF ROLE``` to execute the targeted role.

For sysconfig role: ```ansible-playbook -i inventory.yml -t syscongfig site.yml --add-vault-pass ```

For pkgs role: ```ansible-playbook -i inventory.yml -t pkgs site.yml --add-vault-pass ```

For matomoprovisioning role: ```ansible-playbook -i inventory.yml -t matomoprovisioning site.yml --add-vault-pass ```

This structure ensures a clean and maintainable Ansible deployment, allowing easy management and scalability of the infrastructure.