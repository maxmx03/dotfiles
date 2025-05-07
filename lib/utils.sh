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

function ohman {
  local instruction='
    Descrição do projeto
    Gerar saída similar a man pages do Linux, em formato conciso.

    Estrutura da instrução

    - Nome do Comando: (comando) - Título principal, nome do seu gem.
    - Sinopse: (comando [OPÇÕES] [ARGUMENTOS]) - Uso básico do comando, indicando opções e argumentos.
    - Descrição: Breve explicação do que o comando faz.
    - Opções: -opção, --opção-longa - Descrição concisa da opção.
    Exemplos:
    comando -a arquivo - Demonstração de uso com opções e/ou argumentos.

    Formatação
    Deverá ser em formato de texto puro.
    Não utilizar ```txt content ```, mas apenas content

    Minha mensagem:
      '

  curl -sS "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=${GEMINI_API}" \
  -H 'Content-Type: application/json' \
  -X POST \
  -d '{
    "contents": [{
      "parts":[{"text": "'"$instruction $@"'"}]
      }]
     }' | jq -r '.candidates[0].content.parts[0].text' | less
}
