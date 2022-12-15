# Racepunk

[![Lua](https://img.shields.io/badge/lua-2C2D72?style=for-the-badge&logo=lua&logoColor=ffffff)](https://www.lua.org/)
[![LÖVE](https://img.shields.io/badge/LÖVE-EA316E?style=for-the-badge&logo=lua&logoColor=ffffff)](https://love2d.org/)
[![GitHub issues](https://img.shields.io/github/issues/buguno/racepunk?style=for-the-badge)](https://github.com/buguno/racepunk/issues)
[![GitHub closed issues](https://img.shields.io/github/issues-closed/buguno/racepunk?style=for-the-badge)](https://github.com/buguno/racepunk/issues?q=is%3Aissue+is%3Aclosed)
[![GitHub pull requests](https://img.shields.io/github/issues-pr/buguno/racepunk?style=for-the-badge)](https://github.com/buguno/racepunk/pulls)
[![GitHub closed pull requests](https://img.shields.io/github/issues-pr-closed/buguno/racepunk?style=for-the-badge)](https://github.com/buguno/racepunk/pulls?q=is%3Apr+is%3Aclosed)
[![GitHub contributors](https://img.shields.io/github/contributors/buguno/racepunk?style=for-the-badge)](https://github.com/buguno/racepunk/graphs/contributors)
[![Activity](https://img.shields.io/github/last-commit/buguno/racepunk?style=for-the-badge&label=most%20recent%20activity)](https://github.com/buguno/racepunk/pulse)

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
    │   │   ├── puddle.png
    │   │   └── strips.png
    │   └── sounds
    │       ├── effect
    │       │   └── splash.mp3
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
