#!/bin/bash

function loading {
  declare t msg
  t=$1
  msg=$2

  for i in {0..11}; do
    printf "\r${msg:-Loading}: [%-10s]" "$(seq -s "#" "$i" | tr -d '[:digit:]')"
    sleep "${t:-0.1}"
  done
  echo " Done!"
}

export -f loading

function open() {
  # to open directory
  # run: xdg-mime default thunar.desktop inode/directory
  xdg-open "$1"
}

function editorconfig {
  declare config
  config=".editorconfig"
  echo "# EditorConfig is awesome: https://editorconfig.org" >>$config
  echo "# top-most EditorConfig file" >>$config
  echo "root = true" >>$config
  echo "" >>$config
  echo "# Unix-style newlines with a newline ending every file" >>$config
  echo "[*]" >>$config
  echo "charset = utf-8" >>$config
  echo "end_of_line = lf" >>$config
  echo "indent_style = space" >>$config
  echo "insert_final_newline = true" >>$config
  echo "indent_size = 2" >>$config
  echo "quote_type = single" >>$config
}

function manpage {
  local browser=google-chrome-stable
  man -H$browser $1
}

function gemini {
  gum spin --spinner.foreground 4 --spinner dot --title "Gemini is cooking" -- curl -sS "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=${GEMINI_API}" \
    -H 'Content-Type: application/json' \
    -X POST \
    -d '{
      "contents": [{
        "parts":[{"text": "'"$1"'"}]
      }]
  }' | jq -r '.candidates[0].content.parts[0].text' | gum format | gum pager
}

if [[ -n $(command -v gum) ]]; then
  function ohman {
    local instruction='
    Descrição do projeto
    Gerar saída similar a man pages do Linux.

    Estrutura da instrução
    - Nome do Comando: (comando) - Título principal, nome do seu gem.
    - Sinopse: (comando [OPÇÕES] [ARGUMENTOS]) - Uso básico do comando, indicando opções e argumentos.
    - Descrição: Breve explicação do que o comando faz.
    - Opções: -opção, --opção-longa - Descrição concisa da opção.

    Exemplos:
    comando -a arquivo # Demonstração de uso com opções e/ou argumentos.
    '
    instruction+="minha mensagem: ${@}"
    gemini "$instruction"
  }

function table {
  local instruction='
  Descrição do projeto
  Gerar uma tabela com base no texto

  Formatação
  Deverá ser em formato markdown.
  Não utilizar ```markdown content ```, mas apenas content

  Minha mensagem:
  '
  local row=''
  while read -r data; do
    row+=$data
  done
  gemini "${instruction} ${row}"
}

function copilot {
  local instruction='
  Descrição do projeto
  A sua missão é ajudar-me com programação, atividades como escrever, corrigir e entender código.
  Eu digo-te quais são os meus objetivos e tu ajudas-me a criação código mais adequado.

  Objetivo
  * Criação de código: sempre que possível, escreve o código completo, de acordo com o objetivo.
  * Método educativo: explica as etapas da programação.
  * Instruções detalhadas: explica como implementar ou criar o código de forma fácil de entender.
  * Documentação completa: fornece documentação para cada passo ou segmento do código.

  Minha mensagem:
  '
  instruction+=$(gum write)
  gemini "${instruction} ${@}"
}
fi
