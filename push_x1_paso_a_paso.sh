#!/bin/bash

echo "========================================="
echo "🚀 SCRIPT INTERACTIVO PUSH GITHUB (x1)"
echo "========================================="
read -p "¿Deseas continuar? (s/n): " resp
[[ "$resp" != "s" ]] && echo "Cancelado." && exit 1

echo
echo "📌 PASO 1: Verificando rama actual"
git branch
read -p "¿Continuar? (s/n): " resp
[[ "$resp" != "s" ]] && exit 1

echo
echo "📌 PASO 2: Verificando estado del repositorio"
git status
read -p "¿El estado es limpio? (s/n): " resp
[[ "$resp" != "s" ]] && exit 1

echo
echo "📌 PASO 3: Configurando helper de credenciales (una sola vez)"
git config --global credential.helper store
echo "✔ Helper configurado"
read -p "¿Continuar? (s/n): " resp
[[ "$resp" != "s" ]] && exit 1

echo
echo "📌 PASO 4: Verificando remotos configurados"
git remote -v
read -p "¿Continuar con el push al remoto HTTPS? (s/n): " resp
[[ "$resp" != "s" ]] && exit 1

echo
echo "📌 PASO 5: PUSH A GITHUB"
echo "👉 Usuario: infraestructura-it"
echo "👉 Contraseña: PEGA EL TOKEN (no se verá nada)"
git push https://infraestructura-it@github.com/infraestructura-it/x1.git main

if [ $? -eq 0 ]; then
  echo
  echo "✅ PUSH COMPLETADO CORRECTAMENTE"
else
  echo
  echo "❌ ERROR EN EL PUSH"
  echo "Revisa el mensaje anterior"
  exit 1
fi

echo
echo "📌 PASO 6: Verificación final"
git log --oneline --decorate -3

echo
echo "🎉 Proceso finalizado con éxito"
