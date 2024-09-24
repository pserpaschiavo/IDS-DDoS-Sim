# Guia para instalação do VirtualBox e do Vagrant.

> Esse guia tem como objetivo orientar usuários iniciantes.
> Os autores desse repositório recomenda o uso do VirtualBox junto com o Vagrant devido à facilidade de automatizar os processos de preparação do laboratório virtual[^1].

## Windows:

Para usuários de Windows, seguem os links necessários para a realização do download dos executáveis e da documentação com mais informações.

### VirtualBox:

> É recomendado a leitura prévia da documentação antes da instalação.

**Site Oficial**: https://www.virtualbox.org/

**Documentação**: https://www.virtualbox.org/wiki/Documentation

**Download**: https://www.virtualbox.org/wiki/Downloads


### Vagrant:

> É recomendado a leitura prévia da documentação antes da instalação.

**Site Oficial**: https://developer.hashicorp.com/vagrant

**Documentação**: https://developer.hashicorp.com/vagrant/docs

**Download**: https://developer.hashicorp.com/vagrant/install


## MacOS:

Para usuários de MacOS, seguem os links necessários para a realização do download dos executáveis e da documentação com mais informações.

### VirtualBox:

> É recomendado a leitura prévia da documentação antes da instalação.
> Antes de Realizar o dowload e a instalação, verifique a compatibilidade do seu hardware.

**Site Oficial**: https://www.virtualbox.org/

**Documentação**: https://www.virtualbox.org/wiki/Documentation

**Download**: https://www.virtualbox.org/wiki/Downloads


### Vagrant:

> É recomendado a leitura prévia da documentação antes da instalação.

**Site Oficial**: https://developer.hashicorp.com/vagrant

**Documentação**: https://developer.hashicorp.com/vagrant/docs

**Download (Binário)**: https://developer.hashicorp.com/vagrant/install 

**Download (Gerenciador de Pacotes)**:
```
brew tap hashicorp/tap
brew install hashicorp/tap/hashicorp-vagrant
```

## Linux

### VirtualBox:

> É recomendado a leitura prévia da documentação antes da instalação.
> Antes de realizar o download e a instalação, verifique a sua distribuição.

**Site Oficial**: https://www.virtualbox.org/

**Documentação**: https://www.virtualbox.org/wiki/Documentation

**Download**: https://www.virtualbox.org/wiki/Linux_Downloads

### Vagrant:

> É recomendado a leitura prévia da documentação antes da instalação.

**Site Oficial**: https://developer.hashicorp.com/vagrant

**Documentação**: https://developer.hashicorp.com/vagrant/docs

**Download (Binário)**: https://developer.hashicorp.com/vagrant/install

**Download (Ubuntu/Debian)**:

```
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant
```

**Download (CentOS/RHEL)**:

```
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install vagrant
```

**Download (Fedora)**:

```
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
sudo dnf -y install vagrant
```

[^1]: Os autores planejam para o futuro uma *Vagrant Box* pronta para uso.