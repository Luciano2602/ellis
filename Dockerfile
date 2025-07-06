FROM python:3.13.5-alpine3.22

# Definir variáveis de ambiente para otimizar o Python no Docker
# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1

# Definir o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copiar o arquivo de dependências e instalá-las
# Copiamos primeiro para aproveitar o cache do Docker.
# A instalação só será executada novamente se o requirements.txt mudar.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar o restante do código da aplicação
COPY . .

# Expor a porta que a aplicação vai usar
EXPOSE 8000

# Comando para iniciar a aplicação com Uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]