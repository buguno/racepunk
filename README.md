# Racepunk

Racepunk é um jogo de corrida escrito em lua e que usa o framework Love, a criação deste jogo tem como foco principal o trabalho final da disciplina de tópicos avançados em programação I (DCT4401) do curso de Bacharelado em Sistemas de Informação da UFRN, ministrada pelo docente Dr. João Paulo Medeiros.

## Como instalar o Love

Para rodar o jogo, você terá que ter o love instalado na sua máquina, o download poderá ser feito [aqui](https://love2d.org/).

### Debian

Para instalar o love no Debian basta rodar o comando.

```bash
sudo apt install love
```

## Como iniciar o jogo

Para iniciar o Racepunk, você terá que estar um nível acima do diretório do repositório.

```bash
. (Abra o seu bash aqui)
└── racepunk
    ├── LICENSE
    ├── main.lua
    ├── misc
    │   ├── images
    │   │   ├── background_test.png
    │   │   ├── car.png
    │   │   └── strips.png
    │   └── sounds
    │       ├── effect
    │       └── music
    │           ├── phase_01.mp3
    │           └── README.md
    └── README.md
```

Feito isso, basta rodar o comando abaixo.

```bash
love racepunk
```

## Controles

| Tecla | Ação |
| ----- | ---- |
| ↑     | Acelera o carro |
| ←     | Move o carro para a esquerda |
| →     | Move o carro para a direita |
| ↓     | Freia o carro |
